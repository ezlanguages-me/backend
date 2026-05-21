#!/usr/bin/env python3
from __future__ import annotations

import argparse
import random
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable

BASE_DIR = Path(__file__).resolve().parent
MAX_TITLE_LEN = 30

TRANSLATION_TABLES = {
    "deck_translation": "deck",
    "grammar_translation": "grammar",
    "dialogue_translation": "dialogue",
    "speaking_translation": "speaking",
    "reading_translation": "reading",
    "writing_translation": "writing",
    "listening_translation": "listening",
}

CATEGORY_TABLES = {"dialogue", "speaking", "reading", "writing", "listening"}

CATEGORY_MAP = {
    "Restauración": "dining",
    "Alquileres": "accommodation",
    "Convivencia": "social",
    "Compras y Transacciones": "shopping",
    "Viajes y Transporte": "transport",
    "Comunicación Telefónica y Correspondencia Personal": "phone_correspondence",
    "Comunicación Telefónica": "phone_correspondence",
    "Gestión del Estudio y Trámites": "academic",
    "Gestión del Estudio": "academic",
    "Entretenimiento": "entertainment",
    "Tecnología": "technology",
    "Tiempo libre": "leisure",
    "Host Family": "social",
    "Convivencia (Host Families y Vida Social)": "social",
    "Textos, Ensayos e Investigación": "academic_essay",
}

PREFIXES = {
    ("es", "reading"): [
        "Lee cómo ",
        "Lee de qué manera ",
        "Lee sobre ",
        "Lee para ",
        "Lee ",
    ],
    ("de", "reading"): [
        "Lies, wie ",
        "Lies wie ",
        "Lies über ",
        "Lies für ",
        "Lies ",
    ],
    ("es", "listening"): [
        "Escucha cómo ",
        "Escucha de qué manera ",
        "Escucha sobre ",
        "Escucha para ",
        "Escucha ",
    ],
    ("de", "listening"): [
        "Höre, wie ",
        "Höre wie ",
        "Höre über ",
        "Höre für ",
        "Höre ",
    ],
    ("es", "speaking"): [
        "Habla en ",
        "Habla para ",
        "Habla sobre ",
        "Habla con ",
        "Habla de ",
        "Habla ",
    ],
    ("de", "speaking"): [
        "Sprich, um ",
        "Sprich um ",
        "Sprich über ",
        "Sprich mit ",
        "Sprich für ",
        "Sprich in ",
        "Sprich ",
    ],
    ("es", "writing"): [
        "Escribe sobre ",
        "Escribe para ",
        "Escribe cómo ",
        "Escribe ",
        "Copia ",
        "Toma nota de ",
        "Anota ",
        "Redacta ",
    ],
    ("de", "writing"): [
        "Schreibe über ",
        "Schreibe für ",
        "Schreibe wie ",
        "Schreibe ",
        "Kopiere ",
        "Notiere ",
    ],
    ("es", "dialogue"): [
        "Hablar sobre ",
        "Hablar de ",
        "Discutir ",
        "Comentar ",
        "Conversar sobre ",
    ],
    ("de", "dialogue"): [],
}

ARTICLE_PREFIXES = {
    "es": ["el ", "la ", "los ", "las ", "un ", "una ", "unos ", "unas "],
    "de": ["der ", "die ", "das ", "den ", "dem ", "des ", "ein ", "eine ", "einen ", "einem ", "einer "],
}

STOPWORDS = {
    "es": {
        "a", "al", "con", "como", "cómo", "de", "del", "e", "el", "en", "la", "las", "lo", "los", "o",
        "para", "por", "que", "sobre", "u", "un", "una", "unos", "unas", "y"
    },
    "de": {
        "am", "an", "auf", "aus", "bei", "das", "dem", "den", "der", "des", "die", "ein", "eine",
        "einem", "einen", "einer", "für", "im", "in", "mit", "oder", "über", "um", "und", "von", "zu", "zum", "zur"
    },
}

SEPARATOR_RE = re.compile(r"\s*(?:[:–—-])\s*")
DO_BLOCK_RE = re.compile(r"(DO\s+)(\$[A-Za-z0-9_]*\$)(.*?)(\2\s*;)", re.S)
INSERT_RE = re.compile(r"^(\s*INSERT\s+INTO\s+)([A-Za-z_][\w]*)(\s*\()(.*?)(\)\s*VALUES\s*)(.*)$", re.S)
GRAMMAR_INSERT_RE = re.compile(r"\bINSERT\s+INTO\s+grammar\b", re.I)
GRAMMAR_RULE_RE = re.compile(r"\bINSERT\s+INTO\s+grammar_rule\b", re.I)
EXERCISE_LINK_RE = re.compile(r"\bINSERT\s+INTO\s+exercise\s*\(\s*target_uuid\s*,\s*grammar_rule_uuid\s*\)\s*VALUES\s*\([^;]*?,\s*(?!NULL\b)[^)]+\)", re.I | re.S)
NON_ASCII_OR_SPACE_RE = re.compile(r"[^a-z0-9_]")
WORD_RE = re.compile(r"\S+")


@dataclass
class FileStats:
    description_values_removed: int = 0
    titles_shortened: int = 0
    categories_fixed: int = 0
    modified: bool = False
    issues: list[str] = field(default_factory=list)
    grammar_missing_rules: bool = False
    grammar_missing_exercises: bool = False
    unknown_categories: set[str] = field(default_factory=set)
    title_changes: list[tuple[str, str]] = field(default_factory=list)


@dataclass
class RunStats:
    processed_files: int = 0
    modified_files: int = 0
    description_values_removed: int = 0
    titles_shortened: int = 0
    categories_fixed: int = 0
    skipped_files: list[str] = field(default_factory=list)
    grammar_missing_rules: list[str] = field(default_factory=list)
    grammar_missing_exercises: list[str] = field(default_factory=list)
    unknown_categories: dict[str, set[str]] = field(default_factory=dict)


class ParseError(RuntimeError):
    pass


def escape_sql_string(value: str) -> str:
    return value.replace("'", "''")


def parse_sql_string(expr: str) -> str | None:
    stripped = expr.strip()
    if not stripped.startswith("'"):
        return None
    i = 1
    out: list[str] = []
    while i < len(stripped):
        ch = stripped[i]
        if ch == "'":
            if i + 1 < len(stripped) and stripped[i + 1] == "'":
                out.append("'")
                i += 2
                continue
            if stripped[i + 1 :].strip():
                return None
            return "".join(out)
        out.append(ch)
        i += 1
    return None


def replace_sql_string(expr: str, new_value: str) -> str:
    leading = expr[: len(expr) - len(expr.lstrip())]
    trailing = expr[len(expr.rstrip()) :]
    return f"{leading}'{escape_sql_string(new_value)}'{trailing}"


def split_statements(body: str) -> list[str]:
    statements: list[str] = []
    start = 0
    i = 0
    in_single = False
    in_line_comment = False
    in_block_comment = False
    dollar_tag: str | None = None
    while i < len(body):
        if in_line_comment:
            if body[i] == "\n":
                in_line_comment = False
            i += 1
            continue
        if in_block_comment:
            if body.startswith("*/", i):
                in_block_comment = False
                i += 2
            else:
                i += 1
            continue
        if dollar_tag is not None:
            if body.startswith(dollar_tag, i):
                tag = dollar_tag
                dollar_tag = None
                i += len(tag)
            else:
                i += 1
            continue
        if in_single:
            if body[i] == "'":
                if i + 1 < len(body) and body[i + 1] == "'":
                    i += 2
                else:
                    in_single = False
                    i += 1
            else:
                i += 1
            continue
        if body.startswith("--", i):
            in_line_comment = True
            i += 2
            continue
        if body.startswith("/*", i):
            in_block_comment = True
            i += 2
            continue
        if body[i] == "'":
            in_single = True
            i += 1
            continue
        if body[i] == "$":
            match = re.match(r"\$[A-Za-z0-9_]*\$", body[i:])
            if match:
                dollar_tag = match.group(0)
                i += len(dollar_tag)
                continue
        if body[i] == ";":
            statements.append(body[start : i + 1])
            start = i + 1
        i += 1
    if start < len(body):
        statements.append(body[start:])
    return statements


def split_top_level(text: str, separator: str = ",") -> list[str]:
    parts: list[str] = []
    start = 0
    depth = 0
    i = 0
    in_single = False
    in_line_comment = False
    in_block_comment = False
    dollar_tag: str | None = None
    while i < len(text):
        if in_line_comment:
            if text[i] == "\n":
                in_line_comment = False
            i += 1
            continue
        if in_block_comment:
            if text.startswith("*/", i):
                in_block_comment = False
                i += 2
            else:
                i += 1
            continue
        if dollar_tag is not None:
            if text.startswith(dollar_tag, i):
                i += len(dollar_tag)
                dollar_tag = None
            else:
                i += 1
            continue
        if in_single:
            if text[i] == "'":
                if i + 1 < len(text) and text[i + 1] == "'":
                    i += 2
                else:
                    in_single = False
                    i += 1
            else:
                i += 1
            continue
        if text.startswith("--", i):
            in_line_comment = True
            i += 2
            continue
        if text.startswith("/*", i):
            in_block_comment = True
            i += 2
            continue
        if text[i] == "'":
            in_single = True
            i += 1
            continue
        if text[i] == "$":
            match = re.match(r"\$[A-Za-z0-9_]*\$", text[i:])
            if match:
                dollar_tag = match.group(0)
                i += len(dollar_tag)
                continue
        if text[i] in "([":
            depth += 1
        elif text[i] in ")]":
            depth -= 1
        elif text[i] == separator and depth == 0:
            parts.append(text[start:i])
            start = i + 1
        i += 1
    parts.append(text[start:])
    return parts


def parse_values_section(rest: str) -> tuple[list[str], str]:
    tuples: list[str] = []
    i = 0
    length = len(rest)
    while i < length and rest[i].isspace():
        i += 1
    while i < length and rest[i] == '(':
        start = i
        depth = 0
        in_single = False
        in_line_comment = False
        in_block_comment = False
        dollar_tag: str | None = None
        while i < length:
            if in_line_comment:
                if rest[i] == "\n":
                    in_line_comment = False
                i += 1
                continue
            if in_block_comment:
                if rest.startswith("*/", i):
                    in_block_comment = False
                    i += 2
                else:
                    i += 1
                continue
            if dollar_tag is not None:
                if rest.startswith(dollar_tag, i):
                    i += len(dollar_tag)
                    dollar_tag = None
                else:
                    i += 1
                continue
            if in_single:
                if rest[i] == "'":
                    if i + 1 < length and rest[i + 1] == "'":
                        i += 2
                    else:
                        in_single = False
                        i += 1
                else:
                    i += 1
                continue
            if rest.startswith("--", i):
                in_line_comment = True
                i += 2
                continue
            if rest.startswith("/*", i):
                in_block_comment = True
                i += 2
                continue
            if rest[i] == "'":
                in_single = True
                i += 1
                continue
            if rest[i] == "$":
                match = re.match(r"\$[A-Za-z0-9_]*\$", rest[i:])
                if match:
                    dollar_tag = match.group(0)
                    i += len(dollar_tag)
                    continue
            if rest[i] == '(':
                depth += 1
            elif rest[i] == ')':
                depth -= 1
                if depth == 0:
                    i += 1
                    tuples.append(rest[start:i])
                    break
            i += 1
        else:
            raise ParseError("Unbalanced VALUES tuple")
        while i < length and rest[i].isspace():
            i += 1
        if i < length and rest[i] == ',':
            i += 1
            while i < length and rest[i].isspace():
                i += 1
            continue
        break
    return tuples, rest[i:]


def render_tuple(items: list[str], original_tuple: str) -> str:
    if "\n" not in original_tuple:
        return "(" + ", ".join(item.strip() for item in items) + ")"
    item_indent_match = re.search(r"\n([ \t]+)\S", original_tuple)
    closing_indent_match = re.search(r"\n([ \t]*)\)\s*$", original_tuple)
    item_indent = item_indent_match.group(1) if item_indent_match else "    "
    closing_indent = closing_indent_match.group(1) if closing_indent_match else ""
    rendered = [f"{item_indent}{item.strip()}" for item in items]
    return "(\n" + ",\n".join(rendered) + f"\n{closing_indent})"


def render_values(tuples: list[str], originals: list[str], trailing: str) -> str:
    multiline = any("\n" in t for t in originals)
    separator = ",\n" if multiline else ", "
    return separator.join(tuples) + trailing


def choose_candidate(title: str, candidates: Iterable[str]) -> str:
    best = title
    for candidate in candidates:
        candidate = normalize_spaces(candidate)
        if candidate and len(candidate) <= MAX_TITLE_LEN:
            if len(candidate) > len(best) or len(best) > MAX_TITLE_LEN:
                best = candidate
    return best


def normalize_spaces(text: str) -> str:
    return re.sub(r"\s+", " ", text).strip(" ,:-")


def token_key(word: str) -> str:
    return re.sub(r"^[^\wÀ-ÿ]+|[^\wÀ-ÿ]+$", "", word).casefold()


def trim_edge_stopwords(text: str, lang: str) -> str:
    words = WORD_RE.findall(text)
    stopwords = STOPWORDS.get(lang, set())
    while words and token_key(words[0]) in stopwords:
        words.pop(0)
    while words and token_key(words[-1]) in stopwords:
        words.pop()
    return " ".join(words)


def shorten_to_limit(text: str, lang: str) -> str:
    text = normalize_spaces(text)
    if len(text) <= MAX_TITLE_LEN:
        return text
    words = WORD_RE.findall(text)
    current = ""
    for word in words:
        candidate = f"{current} {word}".strip()
        if len(candidate) > MAX_TITLE_LEN:
            break
        current = candidate
    if current:
        current = trim_edge_stopwords(current, lang) or current
        return current
    return trim_edge_stopwords(text[:MAX_TITLE_LEN].rstrip(" ,:-"), lang) or text[:MAX_TITLE_LEN].rstrip(" ,:-")


def best_subphrase_under_limit(text: str, lang: str) -> str:
    words = WORD_RE.findall(normalize_spaces(text))
    stopwords = STOPWORDS.get(lang, set())
    best = ""
    for start in range(len(words)):
        for end in range(start + 1, len(words) + 1):
            phrase = " ".join(words[start:end])
            if len(phrase) > MAX_TITLE_LEN:
                break
            if token_key(words[start]) in stopwords or token_key(words[end - 1]) in stopwords:
                continue
            if len(phrase) > len(best):
                best = phrase
    return best


def strip_prefix(title: str, lang: str, table_kind: str) -> str:
    lowered = title.casefold()
    for prefix in PREFIXES.get((lang, table_kind), []):
        if lowered.startswith(prefix.casefold()):
            return title[len(prefix) :].strip(" ,:-")
    return title


def capitalize_title(text: str) -> str:
    if not text:
        return text
    return text[0].upper() + text[1:]


def shorten_title(title: str, lang: str, table_kind: str) -> str:
    title = normalize_spaces(title)
    if len(title) <= MAX_TITLE_LEN:
        return title

    parenthetical_match = re.search(r"\(([^()]*)\)\s*$", title)
    if table_kind == "deck" and parenthetical_match:
        inner = normalize_spaces(parenthetical_match.group(1))
        if inner and len(inner) <= MAX_TITLE_LEN:
            return capitalize_title(inner)

    working = title
    if table_kind == "grammar":
        working = normalize_spaces(re.sub(r"\s*\([^)]*\)\s*$", "", working))
        if len(working) <= MAX_TITLE_LEN:
            return capitalize_title(working)

    stripped = strip_prefix(working, lang, table_kind)
    if stripped != working:
        working = stripped
        if len(working) <= MAX_TITLE_LEN:
            return capitalize_title(working)

    if table_kind == "deck":
        without_parens = normalize_spaces(re.sub(r"\s*\([^)]*\)\s*$", "", title))
        without_roman = normalize_spaces(re.sub(r"\b[IVX]+\b\s*$", "", without_parens))
        for candidate in [without_roman, without_parens]:
            if candidate and len(candidate) <= MAX_TITLE_LEN:
                return capitalize_title(candidate)
        working = without_roman or working

    if len(working) > MAX_TITLE_LEN and parenthetical_match:
        without_parens = normalize_spaces(re.sub(r"\s*\([^)]*\)\s*$", "", working))
        if without_parens and len(without_parens) <= MAX_TITLE_LEN:
            return capitalize_title(without_parens)
        working = without_parens or working

    segments = [normalize_spaces(segment) for segment in SEPARATOR_RE.split(working) if normalize_spaces(segment)]
    for segment in sorted(segments, key=len, reverse=True):
        if len(segment) <= MAX_TITLE_LEN:
            return capitalize_title(segment)

    article_candidates = []
    lowered = working.casefold()
    for article in ARTICLE_PREFIXES.get(lang, []):
        if lowered.startswith(article.casefold()):
            article_candidates.append(working[len(article) :])
    for candidate in article_candidates:
        candidate = normalize_spaces(candidate)
        if candidate and len(candidate) <= MAX_TITLE_LEN:
            return capitalize_title(candidate)

    subphrase = best_subphrase_under_limit(working, lang)
    trimmed = shorten_to_limit(working, lang)
    result = subphrase if len(subphrase) > len(trimmed) else (trimmed if trimmed else title[:MAX_TITLE_LEN])
    return capitalize_title(result)


def standardize_category(category: str) -> tuple[str, bool]:
    if category in CATEGORY_MAP:
        return CATEGORY_MAP[category], True
    if category == category.lower() and not NON_ASCII_OR_SPACE_RE.search(category):
        return category, False
    snake = category.strip().lower().replace("-", "_").replace(" ", "_")
    snake = NON_ASCII_OR_SPACE_RE.sub("_", snake)
    snake = re.sub(r"_+", "_", snake).strip("_")
    if snake == category:
        return category, False
    if re.fullmatch(r"[a-z0-9_]+", snake) and not any(ord(ch) > 127 for ch in category):
        return snake, True
    return category, False


def split_leading_preamble(statement: str) -> tuple[str, str]:
    i = 0
    length = len(statement)
    while i < length:
        if statement[i].isspace():
            i += 1
            continue
        if statement.startswith('--', i):
            newline = statement.find('\n', i)
            if newline == -1:
                return statement, ''
            i = newline + 1
            continue
        if statement.startswith('/*', i):
            end = statement.find('*/', i + 2)
            if end == -1:
                return statement, ''
            i = end + 2
            continue
        break
    return statement[:i], statement[i:]


def process_insert_statement(statement: str, stats: FileStats) -> str:
    preamble, candidate = split_leading_preamble(statement)
    if not candidate.lstrip().upper().startswith("INSERT INTO"):
        return statement
    stripped = candidate.rstrip()
    suffix_ws = candidate[len(stripped) :]
    if not stripped.endswith(";"):
        return statement
    core = stripped[:-1]
    match = INSERT_RE.match(core)
    if not match:
        return statement

    prefix, table, open_paren, columns_blob, values_prefix, rest = match.groups()
    columns = [column.strip() for column in split_top_level(columns_blob)]
    tuples, trailing = parse_values_section(rest)
    if not tuples:
        return statement

    original_columns = list(columns)
    new_columns = list(columns)
    originals = list(tuples)
    rendered_tuples: list[str] = []

    if table in TRANSLATION_TABLES and "title" in columns and "language" in columns:
        table_kind = TRANSLATION_TABLES[table]
        title_idx = columns.index("title")
        lang_idx = columns.index("language")
        desc_idx = columns.index("description") if "description" in columns else None
        if desc_idx is not None:
            new_columns.pop(desc_idx)
        for tuple_text in tuples:
            items = split_top_level(tuple_text[1:-1])
            if desc_idx is not None and len(items) > desc_idx:
                items.pop(desc_idx)
                stats.description_values_removed += 1
            new_title_idx = title_idx if desc_idx is None or title_idx < desc_idx else title_idx - 1
            new_lang_idx = lang_idx if desc_idx is None or lang_idx < desc_idx else lang_idx - 1
            lang_value = parse_sql_string(items[new_lang_idx])
            title_value = parse_sql_string(items[new_title_idx])
            if lang_value and title_value:
                shortened = shorten_title(title_value, lang_value, table_kind)
                if shortened != title_value:
                    items[new_title_idx] = replace_sql_string(items[new_title_idx], shortened)
                    stats.titles_shortened += 1
                    stats.title_changes.append((title_value, shortened))
            rendered_tuples.append(render_tuple(items, tuple_text))
    elif table in CATEGORY_TABLES and "category" in columns:
        category_idx = columns.index("category")
        for tuple_text in tuples:
            items = split_top_level(tuple_text[1:-1])
            category_value = parse_sql_string(items[category_idx]) if category_idx < len(items) else None
            if category_value is not None:
                mapped, changed = standardize_category(category_value)
                if mapped == category_value and changed:
                    changed = False
                elif changed:
                    items[category_idx] = replace_sql_string(items[category_idx], mapped)
                    stats.categories_fixed += 1
                elif any(ord(ch) > 127 for ch in category_value) or any(ch.isupper() for ch in category_value) or " " in category_value:
                    stats.unknown_categories.add(category_value)
            rendered_tuples.append(render_tuple(items, tuple_text))
    else:
        return statement

    new_statement = (
        preamble
        + prefix
        + table
        + open_paren
        + ", ".join(new_columns)
        + values_prefix
        + render_values(rendered_tuples, originals, trailing)
        + ";"
        + suffix_ws
    )
    if new_statement != statement:
        stats.modified = True
    return new_statement


def process_file(path: Path, write: bool) -> FileStats:
    text = path.read_text(encoding="utf-8")
    stats = FileStats()

    if GRAMMAR_INSERT_RE.search(text):
        if not GRAMMAR_RULE_RE.search(text):
            stats.grammar_missing_rules = True
        if not EXERCISE_LINK_RE.search(text):
            stats.grammar_missing_exercises = True

    match = DO_BLOCK_RE.search(text)
    if not match:
        raise ParseError("Could not locate DO $$ block")

    body = match.group(3)
    begin_match = re.search(r"\bBEGIN\b", body)
    if not begin_match:
        raise ParseError("Could not locate BEGIN in DO block")
    executable = body[begin_match.start() :]
    statements = split_statements(executable)
    new_statements = [process_insert_statement(statement, stats) for statement in statements]
    new_body = body[: begin_match.start()] + "".join(new_statements)
    new_text = text[: match.start(3)] + new_body + text[match.end(3) :]

    if new_text != text:
        stats.modified = True
        if write:
            path.write_text(new_text, encoding="utf-8")

    return stats


def aggregate(run_stats: RunStats, path: Path, file_stats: FileStats) -> None:
    run_stats.processed_files += 1
    if file_stats.modified:
        run_stats.modified_files += 1
    run_stats.description_values_removed += file_stats.description_values_removed
    run_stats.titles_shortened += file_stats.titles_shortened
    run_stats.categories_fixed += file_stats.categories_fixed
    if file_stats.grammar_missing_rules:
        run_stats.grammar_missing_rules.append(path.name)
    if file_stats.grammar_missing_exercises:
        run_stats.grammar_missing_exercises.append(path.name)
    if file_stats.unknown_categories:
        run_stats.unknown_categories[path.name] = set(sorted(file_stats.unknown_categories))


def run(base_dir: Path, write: bool) -> RunStats:
    run_stats = RunStats()
    for path in sorted(base_dir.glob("step-*.sql")):
        try:
            file_stats = process_file(path, write=write)
        except Exception as exc:  # noqa: BLE001
            run_stats.processed_files += 1
            run_stats.skipped_files.append(f"{path.name}: {exc}")
            continue
        aggregate(run_stats, path, file_stats)
    return run_stats


def main() -> int:
    parser = argparse.ArgumentParser(description="Refactor A0 ES SQL step files")
    parser.add_argument("--base-dir", type=Path, default=BASE_DIR)
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--sample-size", type=int, default=10)
    parser.add_argument("--seed", type=int, default=42)
    args = parser.parse_args()

    run_stats = run(args.base_dir, write=not args.dry_run)

    print(f"Processed files: {run_stats.processed_files}")
    print(f"Modified files: {run_stats.modified_files}")
    print(f"Description values removed: {run_stats.description_values_removed}")
    print(f"Titles shortened: {run_stats.titles_shortened}")
    print(f"Categories fixed: {run_stats.categories_fixed}")
    print(f"Skipped files: {len(run_stats.skipped_files)}")
    if run_stats.skipped_files:
        for item in run_stats.skipped_files:
            print(f"  - {item}")
    print(f"Grammar files missing rules: {len(run_stats.grammar_missing_rules)}")
    for item in run_stats.grammar_missing_rules:
        print(f"  - {item}")
    print(f"Grammar files missing exercise links: {len(run_stats.grammar_missing_exercises)}")
    for item in run_stats.grammar_missing_exercises:
        print(f"  - {item}")
    print(f"Files with unknown categories: {len(run_stats.unknown_categories)}")
    for file_name, categories in sorted(run_stats.unknown_categories.items()):
        print(f"  - {file_name}: {', '.join(sorted(categories))}")

    sample_candidates = sorted(args.base_dir.glob("step-*.sql"))
    if sample_candidates:
        sample_size = min(args.sample_size, len(sample_candidates))
        rng = random.Random(args.seed)
        sample = sorted(path.name for path in rng.sample(sample_candidates, sample_size))
        print(f"Verification sample ({sample_size}): {', '.join(sample)}")

    return 0 if not run_stats.skipped_files else 1


if __name__ == "__main__":
    raise SystemExit(main())
