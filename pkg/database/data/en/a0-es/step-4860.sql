-- ============================================================
-- Seed: A0 English Path – STEP 4860 – Dialogue – respond to a voicemail (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Nina", "text": "Hello, Oliver. This is Nina from Westgate Office. I am returning your voicemail.", "es": "Hola, Oliver. Soy Nina de Westgate Office. Te devuelvo la llamada por tu mensaje de voz.", "de": "Hallo Oliver, hier ist Nina von Westgate Office. Ich rufe wegen deiner Voicemail zurück."}'::jsonb,
        '{"character": "Oliver", "text": "Thank you for calling back. Did you get the new time for the training session?", "es": "Gracias por devolver la llamada. ¿Recibiste la nueva hora de la sesión de formación?", "de": "Danke für den Rückruf. Hast du die neue Uhrzeit für die Schulung bekommen?"}'::jsonb,
        '{"character": "Nina", "text": "Yes. I noted nine fifteen in Room B.", "es": "Sí. He anotado las nueve y cuarto en la sala B.", "de": "Ja. Ich habe neun Uhr fünfzehn in Raum B notiert."}'::jsonb,
        '{"character": "Oliver", "text": "Great. Can your team prepare the projector before the group arrives?", "es": "Perfecto. ¿Puede tu equipo preparar el proyector antes de que llegue el grupo?", "de": "Super. Kann dein Team den Projektor vorbereiten, bevor die Gruppe kommt?"}'::jsonb,
        '{"character": "Nina", "text": "Yes, that is fine. We will test it at nine o''clock.", "es": "Sí, no hay problema. Lo probaremos a las nueve.", "de": "Ja, das ist in Ordnung. Wir testen ihn um neun Uhr."}'::jsonb,
        '{"character": "Oliver", "text": "Excellent. We also need twelve visitor badges at reception.", "es": "Excelente. También necesitamos doce acreditaciones en recepción.", "de": "Ausgezeichnet. Wir brauchen auch zwölf Besucherausweise am Empfang."}'::jsonb,
        '{"character": "Nina", "text": "I can arrange that. Do you still want me to call 555-0172 if there is a problem?", "es": "Puedo organizarlo. ¿Quieres que siga llamando al 555-0172 si hay algún problema?", "de": "Das kann ich organisieren. Soll ich bei Problemen weiter 555-0172 anrufen?"}'::jsonb,
        '{"character": "Oliver", "text": "Yes, please. That is my direct number until five.", "es": "Sí, por favor. Ese es mi número directo hasta las cinco.", "de": "Ja, bitte. Das ist bis fünf Uhr meine direkte Nummer."}'::jsonb,
        '{"character": "Nina", "text": "Perfect. I will send you a short confirmation email now.", "es": "Perfecto. Te enviaré ahora un breve correo de confirmación.", "de": "Perfekt. Ich schicke dir jetzt eine kurze Bestätigungs-E-Mail."}'::jsonb,
        '{"character": "Oliver", "text": "Thank you, Nina. That helps a lot.", "es": "Gracias, Nina. Eso ayuda mucho.", "de": "Danke, Nina. Das hilft sehr."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Nina devuelve la llamada a Oliver.", "p_de": "Nina ruft Oliver zurück.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Nina anota la sesión a las nueve y cuarto en la sala B.", "p_de": "Nina notiert die Sitzung um neun Uhr fünfzehn in Raum B.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El equipo no puede preparar el proyector.", "p_de": "Das Team kann den Projektor nicht vorbereiten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se probará el proyector a las nueve.", "p_de": "Der Projektor wird um neun Uhr getestet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Oliver confirma que 555-0172 es su número directo hasta las cinco.", "p_de": "Oliver bestätigt, dass 555-0172 bis fünf Uhr seine direkte Nummer ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Por qué llama Nina?", "p_de": "Warum ruft Nina an?", "s": {"type": "multiple_choice", "options": ["She is returning a voicemail", "She wants to cancel the training", "She needs a taxi"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hora confirma Nina?", "p_de": "Welche Uhrzeit bestätigt Nina?", "s": {"type": "multiple_choice", "options": ["9:15", "8:15", "10:15"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará el equipo a las nueve?", "p_de": "Was macht das Team um neun Uhr?", "s": {"type": "multiple_choice", "options": ["Test the projector", "Print badges", "Open the cafe"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué más necesita Oliver en recepción?", "p_de": "Was braucht Oliver noch am Empfang?", "s": {"type": "multiple_choice", "options": ["Twelve visitor badges", "Two laptops", "A new whiteboard"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará Nina al final?", "p_de": "Was macht Nina am Ende?", "s": {"type": "multiple_choice", "options": ["Send a short confirmation email", "Change the room again", "Call the driver"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4860 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 4860 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4860, 'en', 'dialogue', 'professional', '[{"name": "Nina", "gender": "female", "avatarURL": "https://example.com/avatars/nina.png"}, {"name": "Oliver", "gender": "male", "avatarURL": "https://example.com/avatars/oliver.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Responder a un mensaje de voz', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Auf eine Voicemail antworten', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
