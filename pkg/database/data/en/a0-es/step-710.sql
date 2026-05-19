-- ============================================================
-- Seed: A0 English Path – STEP 710 – Dialogue – understand simple phone messages (Comunicación Telefónica)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay un paquete para Emma en recepción.", "p_de": "Es gibt ein Paket für Emma an der Rezeption.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Emma puede recoger el paquete antes de las 4.", "p_de": "Emma kann das Paket vor vier Uhr abholen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Emma debe llevar un documento de identidad.", "p_de": "Emma soll einen Ausweis mitbringen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La recepción cierra a las 11 PM.", "p_de": "Die Rezeption schließt um 23 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué hay para Emma en recepción?", "p_de": "Was ist für Emma an der Rezeption?", "s": {"type": "multiple_choice", "options": ["Un paquete", "Un taxi", "Una maleta"], "answer": 0}}'::jsonb,
        '{"p": "¿A partir de qué hora puede recogerlo?", "p_de": "Ab wann kann sie es abholen?", "s": {"type": "multiple_choice", "options": ["A partir de las 6 PM", "A partir de las 4 PM", "A partir de las 10 AM"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe enseñar Emma?", "p_de": "Was muss Emma zeigen?", "s": {"type": "multiple_choice", "options": ["Su identificación", "Su billete de tren", "Su cuaderno"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa si Emma llega tarde?", "p_de": "Was passiert, wenn Emma zu spät kommt?", "s": {"type": "multiple_choice", "options": ["Guardan el paquete hasta mañana", "Devuelven el paquete al remitente", "Lo dejan fuera"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM dialogue WHERE step_order = 710 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 710, 'en', 'dialogue', 'communication', '[{"name": "Emma", "gender": "female", "avatarURL": "https://example.com/avatars/emma.png"}, {"name": "Receptionist", "gender": "female", "avatarURL": "https://example.com/avatars/receptionist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Llamada sobre un paquete en recepción', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Anruf über ein Paket an der Rezeption', '');

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 0, 'Receptionist', 'Hello, Emma. This is the front desk at Green Residence.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola, Emma. Habla la recepción de Green Residence."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo, Emma. Hier ist die Rezeption von Green Residence."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 1, 'Emma', 'Hello. Is everything okay?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola. ¿Está todo bien?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo. Ist alles in Ordnung?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 2, 'Receptionist', 'Yes. There is a parcel for you at reception from your aunt.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. Hay un paquete para ti en recepción de parte de tu tía."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Es gibt ein Paket für dich an der Rezeption von deiner Tante."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 3, 'Emma', 'Great. When can I collect it?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Genial. ¿Cuándo puedo recogerlo?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Super. Wann kann ich es abholen?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 4, 'Receptionist', 'You can collect it after six this evening. Please bring your ID card.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Puedes recogerlo después de las seis de esta tarde. Por favor, trae tu documento de identidad."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Du kannst es heute Abend nach sechs Uhr abholen. Bitte bring deinen Ausweis mit."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 5, 'Emma', 'That is fine. I finish class at seven fifteen.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Está bien. Termino clase a las siete y cuarto."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Das ist gut. Ich bin um Viertel nach sieben mit dem Unterricht fertig."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 6, 'Receptionist', 'No problem. Reception is open until eleven, and you need to sign one form.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "No hay problema. La recepción está abierta hasta las once y tienes que firmar un formulario."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Kein Problem. Die Rezeption ist bis elf Uhr geöffnet, und du musst ein Formular unterschreiben."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 7, 'Emma', 'Perfect. And if I am late?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Perfecto. ¿Y si llego tarde?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Perfekt. Und wenn ich zu spät komme?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 8, 'Receptionist', 'We keep the parcel for you until tomorrow morning.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Guardamos el paquete para ti hasta mañana por la mañana."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Wir bewahren das Paket bis morgen früh für dich auf."}]}]'::jsonb);

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;

