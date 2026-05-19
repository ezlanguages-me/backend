-- ============================================================
-- Seed: A0 English Path – STEP 1690 – Reading – go to a travel information centre at, for example, a railway/bus station and ask for information as to how to get from A to B (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La opción A usa el autobús 12 desde la parada C.", "p_de": "Option A benutzt Bus 12 von Haltestelle C.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La opción A tarda 25 minutos.", "p_de": "Option A dauert 25 Minuten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "En la opción A te bajas en Lake Square.", "p_de": "Bei Option A steigst du am Lake Square aus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La opción B es tren L2 y luego autobús 5.", "p_de": "Option B ist Zug L2 und dann Bus 5.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La opción B necesita dos billetes separados.", "p_de": "Für Option B braucht man zwei getrennte Tickets.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El centro de información abre de 06:30 a 20:00.", "p_de": "Das Informationszentrum ist von 06:30 bis 20:00 geöffnet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los mapas están disponibles en el Desk 2.", "p_de": "Karten sind am Schalter 2 verfügbar.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La opción más rápida es la opción B.", "p_de": "Die schnellere Möglichkeit ist Option B.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué autobús toma la opción A?", "p_de": "Welchen Bus nimmt Option A?", "s": {"type": "multiple_choice", "options": ["Bus 12", "Bus 5", "Bus 20"], "answer": 0}}'::jsonb,
        '{"p": "¿Desde qué parada sale la opción A?", "p_de": "Von welcher Haltestelle fährt Option A ab?", "s": {"type": "multiple_choice", "options": ["Stop C", "Stop B", "Stop A"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura la opción A?", "p_de": "Wie lange dauert Option A?", "s": {"type": "multiple_choice", "options": ["15 minutes", "25 minutes", "30 minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde te bajas con la opción A?", "p_de": "Wo steigst du bei Option A aus?", "s": {"type": "multiple_choice", "options": ["At Lake Square", "At Riverside", "At Desk 2"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tren usa la opción B?", "p_de": "Welchen Zug benutzt Option B?", "s": {"type": "multiple_choice", "options": ["Train L2", "Train B5", "Train C12"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué compras para la opción B?", "p_de": "Was kaufst du für Option B?", "s": {"type": "multiple_choice", "options": ["One combined ticket", "A bus-only ticket", "A return map"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el horario del centro de información?", "p_de": "Wie sind die Öffnungszeiten des Informationszentrums?", "s": {"type": "multiple_choice", "options": ["06:30-20:00", "08:00-18:00", "24 hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde hay mapas y horarios impresos?", "p_de": "Wo gibt es Karten und gedruckte Fahrpläne?", "s": {"type": "multiple_choice", "options": ["At Desk 2", "At Stop C", "On Bus 12"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1690 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1690 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1690, 'en', 'reading', 'Viajes y Transporte', $reading$
TRAVEL INFORMATION BOARD
From North Station to Lake Bus Terminal:
Option A: Bus 12 from Stop C every 20 minutes. Journey time: 15 minutes. Get off at Lake Square.

Option B: Train L2 to Riverside, then Bus 5 to Lake Bus Terminal. Total time: 25 minutes. Buy one combined ticket at the machine.

Information Centre opening hours: 06:30-20:00. Maps and printed timetables are available at Desk 2.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Panel de información de viajes en la estación');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Reiseinformationstafel im Bahnhof');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
