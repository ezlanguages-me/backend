-- ============================================================
-- Seed: A0 English Path – STEP 960 – Dialogue – understand instructions on classes and assignments given by teacher or lecturer (Gestión del Estudio)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_dialogue_uuid UUID;
  v_line_uuid UUID;
  v_exercise_uuid UUID;
  v_order SMALLINT := 1;
  line JSONB;
  ex JSONB;
  v_lines JSONB[] := ARRAY[
        '{"character": "Lecturer", "text": "Hi Ana. Do you have a question about the short presentation?", "es": "Hola, Ana. ¿Tienes una pregunta sobre la presentación corta?", "de": "Hallo Ana. Hast du eine Frage zur kurzen Präsentation?"}'::jsonb,
        '{"character": "Student", "text": "Yes, please. Is it on Tuesday, 4 March, at 1:30 PM in Room 6?", "es": "Sí, por favor. ¿Es el martes 4 de marzo a la 1:30 PM en el aula 6?", "de": "Ja, bitte. Ist sie am Dienstag, dem 4. März, um 13:30 Uhr in Raum 6?"}'::jsonb,
        '{"character": "Lecturer", "text": "Yes. Please come at 1:20 with one photo and one cue card.", "es": "Sí. Por favor, llega a la 1:20 con una foto y una tarjeta de apoyo.", "de": "Ja. Bitte komm um 13:20 mit einem Foto und einer Stichwortkarte."}'::jsonb,
        '{"character": "Student", "text": "What do I say?", "es": "¿Qué digo?", "de": "Was soll ich sagen?"}'::jsonb,
        '{"character": "Lecturer", "text": "Speak for one minute about your favourite place.", "es": "Habla durante un minuto sobre tu lugar favorito.", "de": "Sprich eine Minute über deinen Lieblingsort."}'::jsonb,
        '{"character": "Student", "text": "What do I do before I speak?", "es": "¿Qué hago antes de hablar?", "de": "Was mache ich, bevor ich spreche?"}'::jsonb,
        '{"character": "Lecturer", "text": "Write your name on the card, practise alone for two minutes, and then present to your partner.", "es": "Escribe tu nombre en la tarjeta, practica sola durante dos minutos y después presenta a tu pareja.", "de": "Schreib deinen Namen auf die Karte, übe zwei Minuten allein und präsentiere dann deinem Partner."}'::jsonb,
        '{"character": "Student", "text": "And after class?", "es": "¿Y después de clase?", "de": "Und nach dem Unterricht?"}'::jsonb,
        '{"character": "Lecturer", "text": "Email the photo before 8 PM.", "es": "Envía la foto por correo antes de las 8 PM.", "de": "Schick das Foto vor 20 Uhr per E-Mail."}'::jsonb,
        '{"character": "Student", "text": "Great. Thank you.", "es": "Perfecto. Gracias.", "de": "Super. Danke."}'::jsonb
    ];
  v_exercises JSONB[] := ARRAY[
        '{"es": "Ana pregunta por una presentación corta.", "de": "Ana fragt nach einer kurzen Präsentation.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La presentación es el martes 4 de marzo a la 1:30 PM en el aula 6.", "de": "Die Präsentation ist am Dienstag, dem 4. März, um 13:30 Uhr in Raum 6.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ana debe hablar dos minutos sobre su comida favorita.", "de": "Ana soll zwei Minuten über ihr Lieblingsessen sprechen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Antes de presentar, practica sola dos minutos.", "de": "Vor der Präsentation übt Ana zwei Minuten allein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Después de clase debe enviar la foto por correo antes de las 8 PM.", "de": "Nach dem Unterricht soll sie das Foto vor 20 Uhr per E-Mail schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué lleva Ana?", "de": "Was bringt Ana mit?", "s_es": {"type": "multiple_choice", "options": ["Una foto y una tarjeta de apoyo", "Un diccionario y una regla", "Solo el portátil"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Foto und eine Stichwortkarte", "Ein Wörterbuch und ein Lineal", "Nur den Laptop"], "answer": 0}}'::jsonb,
        '{"es": "¿Sobre qué habla Ana?", "de": "Worüber spricht Ana?", "s_es": {"type": "multiple_choice", "options": ["Sobre su lugar favorito", "Sobre un experimento", "Sobre su horario"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Über ihren Lieblingsort", "Über ein Experiment", "Über ihren Stundenplan"], "answer": 0}}'::jsonb,
        '{"es": "¿A quién presenta después de practicar?", "de": "Wem präsentiert Ana nach dem Üben?", "s_es": {"type": "multiple_choice", "options": ["A su pareja", "Al director", "A toda la escuela"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihrem Partner", "Dem Direktor", "Der ganzen Schule"], "answer": 0}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN dialogue d ON d.uuid = e.target_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en');
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en';

  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 960, 'en', 'dialogue', 'education', '[{"name": "Lecturer", "gender": "female", "avatarURL": "https://example.com/avatars/lecturer.png"}, {"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Pregunta por una presentación corta', 'Lee un diálogo donde una estudiante confirma una breve presentación oral con foto y tarjeta de apoyo.'),
         (v_dialogue_uuid, 'de', 'Frage zu einer kurzen Präsentation', 'Lies einen Dialog, in dem eine Studentin eine kurze mündliche Präsentation mit Foto und Stichwortkarte bestätigt.');

  FOREACH line IN ARRAY v_lines LOOP
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_uuid, v_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
           (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
    v_order := v_order + 1;
  END LOOP;

  FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_uuid, NULL) RETURNING uuid INTO v_exercise_uuid;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
           (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;

