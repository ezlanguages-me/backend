-- ============================================================
-- Seed: A0 English Path – STEP 2160 – Reading – ask basic questions about the food in relation to the menu, and about the services available (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El almuerzo es de 12 a 3.", "p_de": "Das Mittagessen ist von 12 bis 3.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay comida para llevar.", "p_de": "Es gibt kein Essen zum Mitnehmen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El restaurante tiene tronas para niños.", "p_de": "Das Restaurant hat Hochstühle für Kinder.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay terraza.", "p_de": "Es gibt keine Terrasse.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El pescado de hoy es salmón con patatas.", "p_de": "Der Fisch des Tages ist Lachs mit Kartoffeln.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sopa vegetariana está en la carta sin preguntar.", "p_de": "Die vegetarische Suppe steht ohne Nachfrage auf der Karte.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El agua es gratis en el mostrador.", "p_de": "Das Wasser ist kostenlos an der Theke.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto es un folleto de información del restaurante.", "p_de": "Der Text ist ein Informationsblatt des Restaurants.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A qué hora es el almuerzo?", "p_de": "Wann ist das Mittagessen?", "s": {"type": "multiple_choice", "options": ["From 12 to 3", "From 9 to 12", "From 6 to 10"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué servicio está disponible cada día?", "p_de": "Welcher Service ist jeden Tag verfügbar?", "s": {"type": "multiple_choice", "options": ["Takeaway", "Live music", "Hotel rooms"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tienen para niños?", "p_de": "Was haben sie für Kinder?", "s": {"type": "multiple_choice", "options": ["High chairs", "A cinema", "A playground"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué espacio exterior tienen?", "p_de": "Welchen Außenbereich haben sie?", "s": {"type": "multiple_choice", "options": ["A small terrace", "A big garden", "A roof pool"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el pescado de hoy?", "p_de": "Was ist der Fisch des Tages?", "s": {"type": "multiple_choice", "options": ["Salmon with potatoes", "Tuna with rice", "Cod with beans"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo pides la sopa vegetariana?", "p_de": "Wie bestellst du die vegetarische Suppe?", "s": {"type": "multiple_choice", "options": ["Ask staff", "Take it from the counter", "Call tomorrow"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está el agua gratis?", "p_de": "Wo ist das kostenlose Wasser?", "s": {"type": "multiple_choice", "options": ["At the counter", "At the door", "In the kitchen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es este?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["Restaurant information leaflet", "Private letter", "Train ticket"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2160 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2160 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2160, 'en', 'reading', 'Restauración', $reading$
BLUE DOOR BISTRO
Lunch is from 12 to 3. Takeaway is available every day.
We have high chairs for children and a small terrace.

Today's fish is salmon with potatoes. Ask staff for the vegetarian soup.
Free water is at the counter.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Información escrita sobre platos y servicios');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Schriftliche Infos zu Gerichten und Service');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
