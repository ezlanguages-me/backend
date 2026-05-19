-- ============================================================
-- Seed: A0 English Path – STEP 7460 – Dialogue – take turns contributing at a meeting (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Julia", "text": "I can start with the visitor bags.", "es": "Puedo empezar con las bolsas para visitantes.", "de": "Ich kann mit den Besuchertaschen anfangen."}'::jsonb,
        '{"character": "Ken", "text": "Okay. After you, I want to mention the chairs.", "es": "Vale. Después de ti, quiero mencionar las sillas.", "de": "Okay. Nach dir möchte ich die Stühle erwähnen."}'::jsonb,
        '{"character": "Julia", "text": "We have six bags ready.", "es": "Tenemos seis bolsas preparadas.", "de": "Wir haben sechs Taschen fertig."}'::jsonb,
        '{"character": "Ken", "text": "Good. We also need two more chairs.", "es": "Bien. También necesitamos dos sillas más.", "de": "Gut. Wir brauchen auch noch zwei weitere Stühle."}'::jsonb,
        '{"character": "Julia", "text": "I agree. The room looks full.", "es": "Estoy de acuerdo. La sala parece llena.", "de": "Ich stimme zu. Der Raum sieht voll aus."}'::jsonb,
        '{"character": "Ken", "text": "Can I add one more point?", "es": "¿Puedo añadir un punto más?", "de": "Kann ich noch einen Punkt hinzufügen?"}'::jsonb,
        '{"character": "Julia", "text": "Yes, please go ahead.", "es": "Sí, adelante, por favor.", "de": "Ja, bitte mach weiter."}'::jsonb,
        '{"character": "Ken", "text": "We need water on the table.", "es": "Necesitamos agua en la mesa.", "de": "Wir brauchen Wasser auf dem Tisch."}'::jsonb,
        '{"character": "Julia", "text": "Good point. I can buy it this afternoon.", "es": "Buena idea. Puedo comprarla esta tarde.", "de": "Guter Punkt. Ich kann es heute Nachmittag kaufen."}'::jsonb,
        '{"character": "Ken", "text": "Thank you. Then we both shared our items.", "es": "Gracias. Entonces los dos ya hemos compartido nuestros puntos.", "de": "Danke. Dann haben wir beide unsere Punkte genannt."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Julia empieza con las bolsas para visitantes.", "de": "Julia beginnt mit den Besuchertaschen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay seis bolsas preparadas.", "de": "Es sind sechs Taschen fertig.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ken dice que la sala parece vacía.", "de": "Ken sagt, dass der Raum leer aussieht.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Ken pregunta si puede añadir un punto más.", "de": "Ken fragt, ob er noch einen Punkt hinzufügen kann.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Julia puede comprar el agua esta tarde.", "de": "Julia kann das Wasser heute Nachmittag kaufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuál es el tema de Julia?", "de": "Was ist Julias Thema?", "s_es": {"type": "multiple_choice", "options": ["Visitor bags", "The lunch menu", "The projector cable"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Besuchertaschen", "Das Mittagsmenü", "Das Projektorkabel"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas bolsas están preparadas?", "de": "Wie viele Taschen sind fertig?", "s_es": {"type": "multiple_choice", "options": ["Six", "Four", "Eight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sechs", "Vier", "Acht"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué necesita Ken además?", "de": "Was braucht Ken zusätzlich?", "s_es": {"type": "multiple_choice", "options": ["Two more chairs", "A new desk", "Three maps"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei weitere Stühle", "Einen neuen Tisch", "Drei Karten"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué falta en la mesa?", "de": "Was fehlt auf dem Tisch?", "s_es": {"type": "multiple_choice", "options": ["Water", "Coffee", "A laptop"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wasser", "Kaffee", "Ein Laptop"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo compra Julia el agua?", "de": "Wann kauft Julia das Wasser?", "s_es": {"type": "multiple_choice", "options": ["This afternoon", "Tomorrow morning", "Next week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Heute Nachmittag", "Morgen früh", "Nächste Woche"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7460 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7460 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7460, 'en', 'dialogue', 'meetings', '[{"name": "Julia", "gender": "female", "avatarURL": "https://example.com/avatars/julia.png"}, {"name": "Ken", "gender": "male", "avatarURL": "https://example.com/avatars/ken.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Participa por turnos en una reunión', 'Lee un diálogo corto donde dos personas se reparten turnos para aportar información práctica.'),
        (v_dialogue_id, 'de', 'Sprich reihum in einem Meeting', 'Lies einen kurzen Dialog, in dem zwei Personen abwechselnd praktische Punkte beitragen.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
