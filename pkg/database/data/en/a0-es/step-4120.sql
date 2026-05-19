-- ============================================================
-- Seed: A0 English Path – STEP 4120 – Dialogue – offer assistance to a visitor or client (Servicios Laborales)
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
        '{"character": "Receptionist", "text": "Good morning. Welcome to ProServ. How can I help you?", "es": "Buenos días. Bienvenido a ProServ. ¿En qué puedo ayudarle?", "de": "Guten Morgen. Willkommen bei ProServ. Wie kann ich Ihnen helfen?"}'::jsonb,
    '{"character": "Visitor", "text": "Hello. I have an appointment with Ms Clark at 10 o''clock.", "es": "Hola. Tengo una cita con la señora Clark a las 10.", "de": "Hallo. Ich habe um 10 Uhr einen Termin mit Frau Clark."}'::jsonb,
    '{"character": "Receptionist", "text": "Of course. Can I take your name, please?", "es": "Por supuesto. ¿Puede darme su nombre, por favor?", "de": "Natürlich. Darf ich Ihren Namen haben, bitte?"}'::jsonb,
    '{"character": "Visitor", "text": "My name is Paulo Fonseca, from Global Tech.", "es": "Me llamo Paulo Fonseca, de Global Tech.", "de": "Ich heiße Paulo Fonseca, von Global Tech."}'::jsonb,
    '{"character": "Receptionist", "text": "Thank you, Mr Fonseca. I will let Ms Clark know you are here. Please take a seat.", "es": "Gracias, señor Fonseca. Le aviso a la señora Clark de que está aquí. Por favor, tome asiento.", "de": "Danke, Herr Fonseca. Ich informiere Frau Clark, dass Sie da sind. Bitte nehmen Sie Platz."}'::jsonb,
    '{"character": "Visitor", "text": "Thank you. Could I also have a glass of water?", "es": "Gracias. ¿Podría tener también un vaso de agua?", "de": "Danke. Könnte ich auch ein Glas Wasser haben?"}'::jsonb,
    '{"character": "Receptionist", "text": "Of course. I will bring it right away. Can I help with anything else?", "es": "Claro. Lo traigo enseguida. ¿Puedo ayudarle con algo más?", "de": "Natürlich. Ich bringe es sofort. Kann ich Ihnen noch mit etwas helfen?"}'::jsonb,
    '{"character": "Visitor", "text": "Could you tell me where the meeting room is?", "es": "¿Podría decirme dónde está la sala de reuniones?", "de": "Könnten Sie mir sagen, wo der Besprechungsraum ist?"}'::jsonb,
    '{"character": "Receptionist", "text": "The meeting room is on the second floor. I can take you up when Ms Clark is ready.", "es": "La sala de reuniones está en el segundo piso. Puedo llevarle cuando la señora Clark esté lista.", "de": "Der Besprechungsraum ist im zweiten Stock. Ich kann Sie hochbegleiten, wenn Frau Clark bereit ist."}'::jsonb,
    '{"character": "Visitor", "text": "That is very helpful. Thank you.", "es": "Es de gran ayuda. Gracias.", "de": "Das ist sehr hilfreich. Danke."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El visitante tiene una cita a las 10.", "p_de": "Der Besucher hat um 10 Uhr einen Termin.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El visitante trabaja para ProServ.", "p_de": "Der Besucher arbeitet für ProServ.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La recepcionista lleva al visitante directamente a la sala de reuniones.", "p_de": "Die Rezeptionistin bringt den Besucher direkt in den Besprechungsraum.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La sala de reuniones está en el segundo piso.", "p_de": "Der Besprechungsraum ist im zweiten Stock.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La recepcionista ofrece traer agua al visitante.", "p_de": "Die Rezeptionistin bietet dem Besucher Wasser an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Con quién tiene cita el visitante?", "p_de": "Mit wem hat der Besucher einen Termin?", "s_es": {"type": "multiple_choice", "options": ["Ms Clark", "Mr Davies", "Claire"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Frau Clark", "Herr Davies", "Claire"], "answer": 0}}'::jsonb,
    '{"p": "¿De qué empresa es el visitante?", "p_de": "Von welchem Unternehmen ist der Besucher?", "s_es": {"type": "multiple_choice", "options": ["Global Tech", "ProServ Solutions", "City Logistics"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Global Tech", "ProServ Solutions", "City Logistics"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué pide el visitante además de agua?", "p_de": "Was bittet der Besucher außer Wasser?", "s_es": {"type": "multiple_choice", "options": ["The location of the meeting room", "A parking space", "A copy of the agenda"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Standort des Besprechungsraums", "Einen Parkplatz", "Eine Kopie der Tagesordnung"], "answer": 0}}'::jsonb,
    '{"p": "¿Dónde está la sala de reuniones?", "p_de": "Wo ist der Besprechungsraum?", "s_es": {"type": "multiple_choice", "options": ["On the second floor", "On the ground floor", "In the basement"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im zweiten Stock", "Im Erdgeschoss", "Im Keller"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuándo lleva la recepcionista al visitante arriba?", "p_de": "Wann bringt die Rezeptionistin den Besucher nach oben?", "s_es": {"type": "multiple_choice", "options": ["When Ms Clark is ready", "Immediately", "After lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wenn Frau Clark bereit ist", "Sofort", "Nach dem Mittagessen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4120 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 4120 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4120, 'en', 'dialogue', 'professional', '[{"name": "Receptionist", "gender": "female", "avatarURL": "https://example.com/avatars/receptionist.png"}, {"name": "Visitor", "gender": "male", "avatarURL": "https://example.com/avatars/visitor.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Ofrece ayuda a un visitante o cliente', 'Practica dar la bienvenida a un visitante, avisar al anfitrión y ofrecer asistencia básica.'),
        (v_dialogue_id, 'de', 'Biete einem Besucher oder Kunden Hilfe an', 'Übe, einen Besucher zu begrüßen, den Gastgeber zu informieren und grundlegende Hilfe anzubieten.');
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
