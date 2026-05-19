-- ============================================================
-- Seed: A0 English Path – STEP 3730 – Dialogue – ask for tourist information (Turismo y Entretenimiento)
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
        '{"character": "Tourist", "text": "Hello. Can you help me with some tourist information?", "es": "Hola. ¿Puede ayudarme con información turística?", "de": "Hallo. Können Sie mir mit Touristeninformationen helfen?"}'::jsonb,
    '{"character": "Officer", "text": "Of course. What do you need?", "es": "Claro. ¿Qué necesita?", "de": "Natürlich. Was brauchen Sie?"}'::jsonb,
    '{"character": "Tourist", "text": "How do I get to Stone Castle?", "es": "¿Cómo llego a Stone Castle?", "de": "Wie komme ich zum Stone Castle?"}'::jsonb,
    '{"character": "Officer", "text": "Take bus 12 from King Street. It leaves every thirty minutes.", "es": "Tome el autobús 12 desde King Street. Sale cada treinta minutos.", "de": "Nehmen Sie den Bus 12 von der King Street. Er fährt alle dreißig Minuten."}'::jsonb,
    '{"character": "Tourist", "text": "What time does the castle open?", "es": "¿A qué hora abre el castillo?", "de": "Um wie viel Uhr öffnet das Schloss?"}'::jsonb,
    '{"character": "Officer", "text": "It opens at 10 AM and closes at 5 PM.", "es": "Abre a las 10 AM y cierra a las 5 PM.", "de": "Es öffnet um 10 Uhr und schließt um 17 Uhr."}'::jsonb,
    '{"character": "Tourist", "text": "How much is the ticket?", "es": "¿Cuánto cuesta la entrada?", "de": "Wie viel kostet das Ticket?"}'::jsonb,
    '{"character": "Officer", "text": "It is £9 for adults. Here is a free map too.", "es": "Cuesta £9 para adultos. Aquí tiene también un mapa gratis.", "de": "Es kostet £9 für Erwachsene. Hier ist auch ein kostenloser Stadtplan."}'::jsonb,
    '{"character": "Tourist", "text": "Thank you very much.", "es": "Muchas gracias.", "de": "Vielen Dank."}'::jsonb,
    '{"character": "Officer", "text": "You are welcome. Enjoy your visit.", "es": "De nada. Disfrute su visita.", "de": "Gern geschehen. Viel Spaß bei Ihrem Besuch."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El officer recomienda el bus 12.", "p_de": "Der Mitarbeiter empfiehlt Bus 12.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El bus sale cada diez minutos.", "p_de": "Der Bus fährt alle zehn Minuten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El castillo abre a las 10 AM.", "p_de": "Das Schloss öffnet um 10 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La entrada cuesta £9 para adultos.", "p_de": "Das Ticket kostet £9 für Erwachsene.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El mapa cuesta £2.", "p_de": "Die Karte kostet £2.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "¿Desde dónde sale el bus 12?", "p_de": "Von wo fährt Bus 12?", "s_es": {"type": "multiple_choice", "options": ["From King Street", "From Hill Park", "From the airport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Von der King Street", "Vom Hill Park", "Vom Flughafen"], "answer": 0}}'::jsonb,
    '{"p": "¿Cada cuánto sale el bus?", "p_de": "Wie oft fährt der Bus?", "s_es": {"type": "multiple_choice", "options": ["Every thirty minutes", "Every ten minutes", "Every hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alle dreißig Minuten", "Alle zehn Minuten", "Jede Stunde"], "answer": 0}}'::jsonb,
    '{"p": "¿Hasta qué hora abre el castillo?", "p_de": "Bis wann ist das Schloss geöffnet?", "s_es": {"type": "multiple_choice", "options": ["5 PM", "10 PM", "3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["17 Uhr", "22 Uhr", "15 Uhr"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué da gratis el officer?", "p_de": "Was gibt der Mitarbeiter kostenlos?", "s_es": {"type": "multiple_choice", "options": ["A map", "A museum ticket", "A bus pass"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Stadtplan", "Ein Museumsticket", "Einen Buspass"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué quiere saber la tourist?", "p_de": "Was möchte die Touristin wissen?", "s_es": {"type": "multiple_choice", "options": ["Transport, opening times and price", "Only the weather", "Only the hotel address"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Transport, Öffnungszeiten und Preis", "Nur das Wetter", "Nur die Hoteladresse"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3730 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 3730 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3730, 'en', 'dialogue', 'tourism', '[{"name": "Tourist", "gender": "female", "avatarURL": "https://example.com/avatars/tourist.png"}, {"name": "Officer", "gender": "male", "avatarURL": "https://example.com/avatars/officer.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pide información turística', 'Practica un diálogo corto en una oficina de turismo con horarios, precios y transporte.'),
        (v_dialogue_id, 'de', 'Bitte um Touristeninformation', 'Übe einen kurzen Dialog im Touristenbüro mit Zeiten, Preisen und Verkehr.');
    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
        v_line_order := v_line_order + 1;
    END LOOP;
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
