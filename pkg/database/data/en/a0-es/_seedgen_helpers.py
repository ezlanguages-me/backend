from pathlib import Path
import json, textwrap

BASE = Path(__file__).resolve().parent

TOPICS = {}
for s in (2010, 2020, 2030):
    TOPICS[s] = "ask simple questions about the menu and understand simple answers"
for s in (2040, 2050, 2060, 2070):
    TOPICS[s] = "express an opinion about food"
for s in (2080, 2090, 2100, 2110):
    TOPICS[s] = "make simple complaints, for example, 'The food is cold'"
for s in (2120, 2130, 2140, 2150):
    TOPICS[s] = "order a meal in a restaurant"
for s in (2160, 2170, 2180, 2190):
    TOPICS[s] = "ask basic questions about the food in relation to the menu, and about the services available"
for s in (2200, 2210, 2220, 2230):
    TOPICS[s] = "ask basic questions about the food and understand most explanations (e.g. dietary restrictions)"
for s in (2240, 2250, 2260, 2270):
    TOPICS[s] = "make a complaint about straightforward matters, for example, the service or the bill"
for s in (2280, 2290, 2300, 2310):
    TOPICS[s] = "order a meal and ask for clarification about dishes on the menu"
for s in (2320, 2330, 2340, 2350):
    TOPICS[s] = "maintain an interaction related to the nature and quality of the food"
for s in (2360, 2370, 2380, 2390):
    TOPICS[s] = "understand most explanations of what is on the menu, but will require a dictionary for culinary terms"
for s in (2400, 2410, 2420, 2430):
    TOPICS[s] = "complain effectively about most situations that are likely to arise in a restaurant"
TOPICS[2440] = "understand most descriptions of common dishes in self-service/fast food establishments"
TOPICS[2450] = "understand most of what is on a standard menu in predictable restaurants"
TOPICS[2460] = "understand bills, e.g. whether service is included"
TOPICS[2470] = "understand a fairly wide range of items on a standard restaurant menu"
TOPICS[2480] = "understand a restaurant menu including a wide range of culinary terms"

def js(obj):
    return json.dumps(obj, ensure_ascii=False).replace("'", "''")

def tf(es, de, ans):
    return {'p': es, 'p_de': de, 's': {'type': 'true_false', 'answer': ans}}

def mc(es, de, options):
    return {'p': es, 'p_de': de, 's': {'type': 'multiple_choice', 'options': options, 'answer': 0}}

def format_jsonb_array(items, indent=8):
    pad = ' ' * indent
    return '\n'.join(
        f"{pad}'{js(item)}'::jsonb" + (',' if i < len(items) - 1 else '')
        for i, item in enumerate(items)
    )

def reading_sql(step, es_title, de_title, content, exercises):
    topic = TOPICS[step]
    return f"""-- ============================================================
-- Seed: A0 English Path – STEP {step} – Reading – {topic} (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
{format_jsonb_array(exercises)}
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = {step} AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = {step} AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, {step}, 'en', 'reading', 'Restauración', $reading$
{textwrap.dedent(content).strip()}
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', '{es_title}');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', '{de_title}');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
"""

def listening_sql(step, es_title, de_title, transcript, exercises):
    topic = TOPICS[step]
    return f"""-- ============================================================
-- Seed: A0 English Path – STEP {step} – Listening – {topic} (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
{format_jsonb_array(exercises)}
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = {step} AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = {step} AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, {step}, 'en', 'listening', 'Restauración', $transcript$
{textwrap.dedent(transcript).strip()}
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', '{es_title}', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', '{de_title}', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
"""

def dialogue_sql(step, es_title, de_title, characters, lines, exercises):
    topic = TOPICS[step]
    return f"""-- ============================================================
-- Seed: A0 English Path – STEP {step} – Dialogue – {topic} (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
{format_jsonb_array(lines)}
    ];
    v_exercises JSONB[] := ARRAY[
{format_jsonb_array(exercises)}
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = {step} AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = {step} AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, {step}, 'en', 'dialogue', 'Restauración', '{js(characters)}'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', '{es_title}', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', '{de_title}', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));
        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
"""

def speaking_sql(step, es_title, de_title, scenario_es, tasks_es, scenario_de, tasks_de):
    topic = TOPICS[step]
    prompt_es = {'scenario': scenario_es, 'tasks': tasks_es}
    prompt_de = {'scenario': scenario_de, 'tasks': tasks_de}
    return f"""-- ============================================================
-- Seed: A0 English Path – STEP {step} – Speaking – {topic} (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = {step} AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, {step}, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', '{es_title}', '', '{js(prompt_es)}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', '{de_title}', '', '{js(prompt_de)}'::jsonb);
END;
$seed$;
"""

def write_files(files):
    for name, content in files.items():
        (BASE / name).write_text(content, encoding='utf-8')
