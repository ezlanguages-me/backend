#!/usr/bin/env python3
"""
Detects exercise_translation rows with empty prompts in step-*.sql files.
Run before and after any bulk prompt edits to catch issues early.

Usage:
    python3 check_empty_prompts.py              # check all step files
    python3 check_empty_prompts.py step-010.sql # check specific file(s)
"""

import re
import sys
import glob
import os

# Patterns that indicate an empty or near-empty prompt
EMPTY_PROMPT_RE = re.compile(
    r"exercise_translation\s*\([^)]+\)\s*VALUES\s*\([^,]+,\s*'(?:es|de)',\s*''\s*,",
    re.IGNORECASE,
)

# Also catch the JSON inline format: "p":""
EMPTY_P_RE = re.compile(r'"p"\s*:\s*""')
EMPTY_P_DE_RE = re.compile(r'"p_de"\s*:\s*""')


def check_file(path):
    issues = []
    with open(path, "r") as f:
        for lineno, line in enumerate(f, 1):
            if EMPTY_PROMPT_RE.search(line):
                issues.append((lineno, line.strip()[:120]))
            elif EMPTY_P_RE.search(line) or EMPTY_P_DE_RE.search(line):
                issues.append((lineno, line.strip()[:120]))
    return issues


def main():
    if len(sys.argv) > 1:
        files = sys.argv[1:]
    else:
        base = os.path.dirname(os.path.abspath(__file__))
        files = sorted(glob.glob(os.path.join(base, "step-*.sql")))

    total_issues = 0
    for path in files:
        issues = check_file(path)
        if issues:
            print(f"\n⚠️  {os.path.basename(path)}: {len(issues)} empty prompt(s)")
            for lineno, snippet in issues:
                print(f"   line {lineno}: {snippet}")
            total_issues += len(issues)

    if total_issues == 0:
        print("✅ No empty prompts found.")
    else:
        print(f"\n❌ Total: {total_issues} empty prompt(s) found.")
        sys.exit(1)


if __name__ == "__main__":
    main()
