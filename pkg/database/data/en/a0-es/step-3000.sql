-- ============================================================
-- Seed: A0 English Path – STEP 3000 – Listening – understand cost per hour or day
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La bicicleta estándar cuesta 5 libras por hora.", "de": "Das Standardfahrrad kostet 5 Pfund pro Stunde.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La bicicleta estándar cuesta 15 libras por día.", "de": "Das Standardfahrrad kostet 15 Pfund pro Tag.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La bicicleta eléctrica cuesta 9 libras por hora.", "de": "Das Elektrofahrrad kostet 9 Pfund pro Stunde.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El casco está incluido.", "de": "Der Helm ist inbegriffen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El candado es gratis.", "de": "Das Schloss ist kostenlos.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El cliente quiere una bicicleta eléctrica.", "de": "Der Kunde möchte ein Elektrofahrrad.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El cliente quiere la bicicleta para todo el día.", "de": "Der Kunde möchte das Fahrrad für den ganzen Tag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay que devolver la bicicleta antes de las 7 PM.", "de": "Das Fahrrad muss vor 19 Uhr zurückgebracht werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuánto cuesta la bicicleta estándar por hora?", "de": "Wie viel kostet das Standardfahrrad pro Stunde?", "s_es": {"type": "multiple_choice", "options": ["5 libras", "9 libras", "18 libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["5 Pfund", "9 Pfund", "18 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la bicicleta estándar por día?", "de": "Wie viel kostet das Standardfahrrad pro Tag?", "s_es": {"type": "multiple_choice", "options": ["18 libras", "15 libras", "30 libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["18 Pfund", "15 Pfund", "30 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la bicicleta eléctrica por hora?", "de": "Wie viel kostet das Elektrofahrrad pro Stunde?", "s_es": {"type": "multiple_choice", "options": ["9 libras", "5 libras", "12 libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["9 Pfund", "5 Pfund", "12 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la bicicleta eléctrica por día?", "de": "Wie viel kostet das Elektrofahrrad pro Tag?", "s_es": {"type": "multiple_choice", "options": ["30 libras", "18 libras", "25 libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["30 Pfund", "18 Pfund", "25 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué está incluido?", "de": "Was ist inbegriffen?", "s_es": {"type": "multiple_choice", "options": ["El casco", "El candado", "Una mochila"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Helm", "Das Schloss", "Ein Rucksack"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta el candado por día?", "de": "Wie viel kostet das Schloss pro Tag?", "s_es": {"type": "multiple_choice", "options": ["2 libras", "1 libra", "Gratis"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2 Pfund", "1 Pfund", "Kostenlos"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué bicicleta elige el cliente?", "de": "Welches Fahrrad wählt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["Una bicicleta estándar", "Una bicicleta eléctrica", "Dos bicicletas pequeñas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Standardfahrrad", "Ein Elektrofahrrad", "Zwei kleine Fahrräder"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo hay que devolver la bicicleta?", "de": "Wann muss das Fahrrad zurück sein?", "s_es": {"type": "multiple_choice", "options": ["Antes de las 7 PM", "A las 10 PM", "Mañana por la mañana"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor 19 Uhr", "Um 22 Uhr", "Morgen früh"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3000 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 3000 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3000, 'en', 'listening', 'transport', $transcript$
# AUDIO PROFILE: Bike hire assistant
## "Prices for One Hour or One Day"

## THE SCENE: A bike rental desk near a train station
A customer asks about simple prices for a standard bike and an electric bike.
The assistant explains hourly and daily prices, what is included, and return time.

### DIRECTOR'S NOTES
Style:
* Friendly rental-desk exchange with repeated prices and very short answers.
* Numbers and time limits are easy to hear and compare.

Pace: Slow and careful, with clear stress on prices and return time.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding cost per hour and cost per day.
The recording also includes one extra item and a simple return rule.

#### TRANSCRIPT
[friendly] Assistant: Welcome to City Bike Hire.
[curious] Customer: Hi. How much is a standard bike?
[clear] Assistant: It is five pounds per hour or eighteen pounds per day.
[interested] Customer: And an electric bike?
[informative] Assistant: That is nine pounds per hour or thirty pounds per day.
[checking] Customer: Is a helmet included?
[helpful] Assistant: Yes, a helmet is included. A lock is two pounds per day.
[deciding] Customer: Great. I want one standard bike for the whole day.
[practical] Assistant: Fine. Please bring it back before 7 PM.

$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha precios por hora y por día en un alquiler de bicis', 'Escucha una conversación simple sobre precios de alquiler por hora o por día.'),
        (v_listening_id, 'de', 'Höre Preise pro Stunde und pro Tag beim Fahrradverleih', 'Höre ein einfaches Gespräch über Mietpreise pro Stunde oder pro Tag.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
