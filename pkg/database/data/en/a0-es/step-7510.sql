-- ============================================================
-- Seed: A0 English Path – STEP 7510 – Reading – understand a project proposal (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El objetivo es crear un rincón de espera cerca de recepción.", "de": "Das Ziel ist es, eine kleine Warteecke nahe am Empfang zu schaffen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El coste es de 210 euros.", "de": "Die Kosten betragen 210 Euro.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los materiales incluyen dos sillas.", "de": "Die Materialien enthalten zwei Stühle.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El plan de trabajo compra los materiales el viernes.", "de": "Der Arbeitsplan kauft die Materialien am Freitag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El montaje será el lunes por la mañana.", "de": "Der Aufbau ist am Montagmorgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Un beneficio es que los visitantes esperan en un lugar claro.", "de": "Ein Vorteil ist, dass Besucher an einem klaren Ort warten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El equipo debe aprobar el plan el próximo mes.", "de": "Das Team soll den Plan nächsten Monat genehmigen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La propuesta incluye tres revistas.", "de": "Der Vorschlag enthält drei Zeitschriften.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Dónde estará el rincón?", "de": "Wo wird die Ecke sein?", "s_es": {"type": "multiple_choice", "options": ["Near reception", "In the meeting room", "Outside the building"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nahe am Empfang", "Im Meetingraum", "Außerhalb des Gebäudes"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta el proyecto?", "de": "Wie viel kostet das Projekt?", "s_es": {"type": "multiple_choice", "options": ["120 euros", "220 euros", "20 euros"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["120 Euro", "220 Euro", "20 Euro"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo se compran los materiales?", "de": "Wann werden die Materialien gekauft?", "s_es": {"type": "multiple_choice", "options": ["On Friday", "On Monday", "On Wednesday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Freitag", "Am Montag", "Am Mittwoch"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué material forma parte del proyecto?", "de": "Welches Material gehört zum Projekt?", "s_es": {"type": "multiple_choice", "options": ["One small table", "A big screen", "Four lamps"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein kleiner Tisch", "Ein großer Bildschirm", "Vier Lampen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas revistas hay?", "de": "Wie viele Zeitschriften gibt es?", "s_es": {"type": "multiple_choice", "options": ["Three", "Two", "Five"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Zwei", "Fünf"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo se monta?", "de": "Wann wird es aufgebaut?", "s_es": {"type": "multiple_choice", "options": ["On Monday morning", "On Friday night", "Tomorrow afternoon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Montagmorgen", "Am Freitagabend", "Morgen Nachmittag"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es un beneficio?", "de": "Was ist ein Vorteil?", "s_es": {"type": "multiple_choice", "options": ["Staff can help visitors easily", "The office gets a new car", "Meetings are two hours longer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Personal kann Besuchern leicht helfen", "Das Büro bekommt ein neues Auto", "Meetings sind zwei Stunden länger"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe hacer el equipo esta semana?", "de": "Was soll das Team diese Woche tun?", "s_es": {"type": "multiple_choice", "options": ["Approve the plan", "Paint the room", "Close reception"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Plan genehmigen", "Den Raum streichen", "Den Empfang schließen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7510 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7510 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7510, 'en', 'reading', 'meetings', 'Project Proposal: Quiet Corner for Visitors\n\nGoal: Make a small waiting corner near reception.
Materials: two chairs, one small table, three magazines, and a plant.
Cost: 120 euros.
Work plan: buy the items on Friday and set them up on Monday morning.
Benefit: visitors wait in one clear place and staff can help them easily.
Team request: approve the plan this week.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee una propuesta de proyecto sencilla', 'Lee una propuesta breve con objetivo, materiales, coste, plan y beneficio para el equipo.'),
        (v_reading_id, 'de', 'Lies einen einfachen Projektvorschlag', 'Lies einen kurzen Vorschlag mit Ziel, Material, Kosten, Plan und Nutzen für das Team.');

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
