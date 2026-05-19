-- ============================================================
-- Seed: A0 English Path – STEP 1300 – Dialogue – understand where the shopkeeper explains the difference between two or more products (Compras y Transacciones)
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
        '{"character": "Sales assistant", "text": "Hello. Are you choosing between these two backpacks?", "es": "Hola. ¿Está eligiendo entre estas dos mochilas?", "de": "Hallo. Wählen Sie zwischen diesen beiden Rucksäcken?"}'::jsonb,
        '{"character": "Customer", "text": "Yes, please. What is the difference?", "es": "Sí, por favor. ¿Cuál es la diferencia?", "de": "Ja, bitte. Was ist der Unterschied?"}'::jsonb,
        '{"character": "Sales assistant", "text": "This black backpack is smaller and lighter.", "es": "Esta mochila negra es más pequeña y más ligera.", "de": "Dieser schwarze Rucksack ist kleiner und leichter."}'::jsonb,
        '{"character": "Sales assistant", "text": "This grey backpack is bigger and has three pockets.", "es": "Esta mochila gris es más grande y tiene tres bolsillos.", "de": "Dieser graue Rucksack ist größer und hat drei Taschen."}'::jsonb,
        '{"character": "Customer", "text": "I carry books and sports clothes every day.", "es": "Llevo libros y ropa de deporte todos los días.", "de": "Ich trage jeden Tag Bücher und Sportsachen."}'::jsonb,
        '{"character": "Sales assistant", "text": "Then the grey backpack is better for you.", "es": "Entonces la mochila gris es mejor para usted.", "de": "Dann ist der graue Rucksack besser für Sie."}'::jsonb,
        '{"character": "Customer", "text": "Is it much more expensive?", "es": "¿Es mucho más cara?", "de": "Ist er viel teurer?"}'::jsonb,
        '{"character": "Sales assistant", "text": "Not much. The black one is eighteen pounds, and the grey one is twenty-six.", "es": "No mucho. La negra cuesta dieciocho libras y la gris veintiséis.", "de": "Nicht viel. Der schwarze kostet achtzehn Pfund und der graue sechsundzwanzig."}'::jsonb,
        '{"character": "Customer", "text": "I see. I think the grey backpack is the best option.", "es": "Ya veo. Creo que la mochila gris es la mejor opción.", "de": "Ich verstehe. Ich denke, der graue Rucksack ist die beste Option."}'::jsonb,
        '{"character": "Sales assistant", "text": "Good choice. It is stronger too.", "es": "Buena elección. Además es más resistente.", "de": "Gute Wahl. Er ist auch stabiler."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El cliente compara dos mochilas.", "de": "Der Kunde vergleicht zwei Rucksäcke.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La mochila negra es más pequeña y más ligera.", "de": "Der schwarze Rucksack ist kleiner und leichter.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La mochila gris tiene un solo bolsillo.", "de": "Der graue Rucksack hat nur eine Tasche.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El cliente lleva libros y ropa de deporte cada día.", "de": "Der Kunde trägt jeden Tag Bücher und Sportsachen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La dependienta dice que la mochila gris también es más resistente.", "de": "Die Verkäuferin sagt, dass der graue Rucksack auch stabiler ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué color tiene la mochila pequeña?", "de": "Welche Farbe hat der kleine Rucksack?", "s_es": {"type": "multiple_choice", "options": ["Black", "Grey", "Blue"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Schwarz", "Grau", "Blau"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos bolsillos tiene la mochila gris?", "de": "Wie viele Taschen hat der graue Rucksack?", "s_es": {"type": "multiple_choice", "options": ["Three", "One", "Two"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Eins", "Zwei"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué lleva el cliente cada día?", "de": "Was trägt der Kunde jeden Tag?", "s_es": {"type": "multiple_choice", "options": ["Books and sports clothes", "Only a wallet", "Food and flowers"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bücher und Sportsachen", "Nur eine Geldbörse", "Essen und Blumen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la mochila negra?", "de": "Wie viel kostet der schwarze Rucksack?", "s_es": {"type": "multiple_choice", "options": ["Eighteen pounds", "Twenty-six pounds", "Twelve pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Achtzehn Pfund", "Sechsundzwanzig Pfund", "Zwölf Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué mochila elige el cliente al final?", "de": "Welchen Rucksack wählt der Kunde am Ende?", "s_es": {"type": "multiple_choice", "options": ["The grey backpack", "The black backpack", "Neither backpack"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den grauen Rucksack", "Den schwarzen Rucksack", "Keinen Rucksack"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1300 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1300 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1300, 'en', 'dialogue', 'shopping', '[{"name": "Sales assistant", "gender": "female", "avatarURL": "https://example.com/avatars/sales-assistant.png"}, {"name": "Customer", "gender": "male", "avatarURL": "https://example.com/avatars/customer.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Compara dos mochilas con el dependiente', 'Lee un diálogo en el que una dependienta explica la diferencia entre dos mochilas.'),
        (v_dialogue_id, 'de', 'Vergleiche zwei Rucksäcke mit dem Verkäufer', 'Lies einen Dialog, in dem eine Verkäuferin den Unterschied zwischen zwei Rucksäcken erklärt.');

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
