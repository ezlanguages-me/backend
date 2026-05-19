-- ============================================================
-- Seed: A0 English Path – STEP 7950 – Reading – read common question types (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La guía incluye preguntas sobre el tiempo.", "de": "Der Leitfaden enthält Fragen zur Zeit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las preguntas de lugar preguntan por la sala y los folletos.", "de": "Die Ortsfragen fragen nach dem Raum und den Handzetteln.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las preguntas sobre personas preguntan por el precio.", "de": "Die Fragen zu Personen fragen nach dem Preis.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Las respuestas cortas ayudan.", "de": "Kurze Antworten helfen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las preguntas de detalle incluyen el siguiente paso.", "de": "Die Detailfragen enthalten den nächsten Schritt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La guía recomienda respuestas muy largas.", "de": "Der Leitfaden empfiehlt sehr lange Antworten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Las preguntas de propósito preguntan por qué algo es útil.", "de": "Die Zweckfragen fragen, warum etwas nützlich ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los folletos aparecen en las preguntas de lugar.", "de": "Handzettel erscheinen bei den Ortsfragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué tipo pregunta When does it start?", "de": "Welcher Typ fragt When does it start?", "s_es": {"type": "multiple_choice", "options": ["Time questions", "Place questions", "People questions"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zeitfragen", "Ortsfragen", "Personenfragen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo pregunta Where is the room?", "de": "Welcher Typ fragt Where is the room?", "s_es": {"type": "multiple_choice", "options": ["Place questions", "Purpose questions", "Detail questions"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ortsfragen", "Zweckfragen", "Detailfragen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo pregunta Who is the speaker?", "de": "Welcher Typ fragt Who is the speaker?", "s_es": {"type": "multiple_choice", "options": ["People questions", "Time questions", "Food questions"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Personenfragen", "Zeitfragen", "Fragen zum Essen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo pregunta Why is this useful?", "de": "Welcher Typ fragt Why is this useful?", "s_es": {"type": "multiple_choice", "options": ["Purpose questions", "Place questions", "Ticket questions"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweckfragen", "Ortsfragen", "Ticketfragen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo pregunta What is the next step?", "de": "Welcher Typ fragt What is the next step?", "s_es": {"type": "multiple_choice", "options": ["Detail questions", "People questions", "Weather questions"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Detailfragen", "Personenfragen", "Wetterfragen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué sala aparece en la respuesta corta de ejemplo?", "de": "Welcher Raum erscheint in der kurzen Beispielantwort?", "s_es": {"type": "multiple_choice", "options": ["Room B", "Room Z", "Hall H"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Raum B", "Raum Z", "Halle H"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas diapositivas aparecen en la respuesta corta de ejemplo?", "de": "Wie viele Folien erscheinen in der kurzen Beispielantwort?", "s_es": {"type": "multiple_choice", "options": ["Five slides", "Two slides", "Ten slides"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünf Folien", "Zwei Folien", "Zehn Folien"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo se mandan las notas en la respuesta corta de ejemplo?", "de": "Wann werden die Notizen in der kurzen Beispielantwort gesendet?", "s_es": {"type": "multiple_choice", "options": ["Tomorrow", "Last week", "At midnight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Morgen", "Letzte Woche", "Um Mitternacht"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7950 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7950 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7950, 'en', 'reading', 'meetings', 'Guide: Common Question Types After a Short Talk\n\nTime questions: When does it start? How long is it?
Place questions: Where is the room? Where are the handouts?
People questions: Who is the speaker? Who is the audience?
Purpose questions: Why is this useful? Why now?
Detail questions: How many slides? What is the next step?
Short answers help: Monday at 10, Room B, five slides, students, and send notes tomorrow.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee tipos comunes de preguntas', 'Lee una guía breve sobre tipos de preguntas habituales después de una presentación corta.'),
        (v_reading_id, 'de', 'Lies häufige Fragetypen', 'Lies einen kurzen Leitfaden zu typischen Fragetypen nach einer kurzen Präsentation.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
