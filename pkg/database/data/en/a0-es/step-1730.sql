-- ============================================================
-- Seed: A0 English Path – STEP 1730 – Reading – understand public signs (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Las entradas y las audioguías están en la entrada principal.", "p_de": "Tickets und Audioguides gibt es am Haupteingang.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede hacer fotos con flash dentro de la torre.", "p_de": "Man darf mit Blitz im Turm fotografieren.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "No se permite comida ni bebida dentro de la torre.", "p_de": "Essen und Trinken sind im Turm nicht erlaubt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En el mirador hay que tener cuidado con los escalones.", "p_de": "Am Aussichtspunkt muss man auf die Stufen achten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La última entrada es a las 6 PM.", "p_de": "Der letzte Einlass ist um 18 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tienda de recuerdos abre todos los días.", "p_de": "Der Souvenirladen ist jeden Tag geöffnet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las visitas guiadas salen desde el patio.", "p_de": "Die Führungen starten im Innenhof.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tienda de recuerdos abre a las 9 AM.", "p_de": "Der Souvenirladen öffnet um 9 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde consigues entradas y audioguías?", "p_de": "Wo bekommt man Tickets und Audioguides?", "s": {"type": "multiple_choice", "options": ["At the main entrance", "At the viewpoint", "In the tower café"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se puede hacer fotos?", "p_de": "Wie darf man fotografieren?", "s": {"type": "multiple_choice", "options": ["Without flash", "Only with flash", "Not at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no está permitido dentro de la torre?", "p_de": "Was ist im Turm nicht erlaubt?", "s": {"type": "multiple_choice", "options": ["Food or drink", "Tickets", "Children"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes vigilar en el mirador?", "p_de": "Worauf muss man am Aussichtspunkt achten?", "s": {"type": "multiple_choice", "options": ["The steps", "The bridge", "The lift"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la última entrada?", "p_de": "Um wie viel Uhr ist der letzte Einlass?", "s": {"type": "multiple_choice", "options": ["5:30 PM", "6 PM", "4:30 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo abre la tienda de recuerdos?", "p_de": "Wann ist der Souvenirladen geöffnet?", "s": {"type": "multiple_choice", "options": ["Daily from 10 AM to 6 PM", "Only on weekends", "From 9 AM to 5 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Cada cuánto salen las visitas guiadas?", "p_de": "Wie oft beginnen die Führungen?", "s": {"type": "multiple_choice", "options": ["Every hour", "Every two hours", "Twice a day"], "answer": 0}}'::jsonb,
        '{"p": "¿Desde dónde salen las visitas guiadas?", "p_de": "Von wo starten die Führungen?", "s": {"type": "multiple_choice", "options": ["From the courtyard", "From the tower", "From the gift shop"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1730 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1730 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1730, 'en', 'reading', 'Turismo y Entretenimiento', $reading$
CASTLE HILL VISITOR AREA
Tickets and audio guides at the main entrance. Photography allowed without flash. No food or drink inside the tower.

VIEWPOINT
Mind the steps. Keep children with you. Last entry 5:30 PM.

SOUVENIR SHOP
Open daily 10 AM-6 PM. Guided tours start every hour from the courtyard.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Señales públicas en un sitio turístico');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Öffentliche Schilder an einem touristischen Ort');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
