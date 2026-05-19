-- ============================================================
-- Seed: A0 English Path – STEP 7440 – Reading – understand a presentation outline (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El objetivo es una nueva mesa de bienvenida.", "de": "Das Ziel ist ein neuer Empfangstisch.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los visitantes esperan en la cocina.", "de": "Die Besucher warten in der Küche.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El plan incluye dos sillas.", "de": "Der Plan enthält zwei Stühle.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El coste es de 300 euros.", "de": "Die Kosten betragen 300 Euro.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El montaje será el próximo lunes por la mañana.", "de": "Der Aufbau ist nächsten Montagmorgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La diapositiva 1 trata de la historia de la empresa.", "de": "Folie 1 handelt von der Firmengeschichte.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El plan incluye un cartel y un mapa.", "de": "Der Plan enthält ein Schild und eine Karte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El esquema tiene seis diapositivas.", "de": "Die Gliederung hat sechs Folien.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Dónde estará la nueva mesa?", "de": "Wo wird der neue Tisch sein?", "s_es": {"type": "multiple_choice", "options": ["Near the front door", "In the kitchen", "Next to the car park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nahe der Eingangstür", "In der Küche", "Neben dem Parkplatz"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el problema en la diapositiva 2?", "de": "Was ist das Problem auf Folie 2?", "s_es": {"type": "multiple_choice", "options": ["Visitors wait in the hall", "The printer is broken", "The coffee is cold"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Besucher warten im Flur", "Der Drucker ist kaputt", "Der Kaffee ist kalt"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta el plan?", "de": "Wie viel kostet der Plan?", "s_es": {"type": "multiple_choice", "options": ["300 euros", "30 euros", "500 euros"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["300 Euro", "30 Euro", "500 Euro"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hay en la diapositiva 3?", "de": "Was ist auf Folie 3?", "s_es": {"type": "multiple_choice", "options": ["One small desk", "A large sofa", "A new computer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein kleiner Tisch", "Ein großes Sofa", "Ein neuer Computer"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo será el montaje?", "de": "Wann ist der Aufbau?", "s_es": {"type": "multiple_choice", "options": ["Next Monday morning", "Next Friday evening", "Tomorrow night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nächsten Montagmorgen", "Nächsten Freitagabend", "Morgen Nacht"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hay en la diapositiva 6?", "de": "Was ist auf Folie 6?", "s_es": {"type": "multiple_choice", "options": ["Questions from the team", "Lunch for the guests", "A long video"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fragen aus dem Team", "Mittagessen für die Gäste", "Ein langes Video"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué material impreso forma parte del plan?", "de": "Welches gedruckte Material ist Teil des Plans?", "s_es": {"type": "multiple_choice", "options": ["A map", "A passport", "A ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Karte", "Ein Ausweis", "Ein Ticket"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el objetivo general?", "de": "Was ist das allgemeine Ziel?", "s_es": {"type": "multiple_choice", "options": ["A new welcome desk", "A larger meeting room", "A new website"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein neuer Empfangstisch", "Ein größerer Meetingraum", "Eine neue Website"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7440 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7440 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7440, 'en', 'reading', 'meetings', 'Presentation Outline: New Welcome Desk\n\nSlide 1: Name and goal - a new desk for visitors near the front door.
Slide 2: Problem - visitors wait in the hall and ask many simple questions.
Slide 3: Plan - one small desk, two chairs, a sign, and a map.
Slide 4: Cost - 300 euros for furniture and print materials.
Slide 5: Time - set up next Monday morning.
Slide 6: Questions from the team.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee el esquema de una presentación', 'Lee un esquema breve de presentación con problema, plan, coste y siguiente paso.'),
        (v_reading_id, 'de', 'Lies die Gliederung einer Präsentation', 'Lies eine kurze Präsentationsgliederung mit Problem, Plan, Kosten und nächstem Schritt.');

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
