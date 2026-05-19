-- ============================================================
-- Seed: A0 English Path – STEP 1000 – Dialogue – check that all instructions are understood (Gestión del Estudio)
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
        '{"character": "Lecturer", "text": "Diego, are the poster session instructions clear?", "es": "Diego, ¿están claras las instrucciones de la sesión de pósteres?", "de": "Diego, sind die Anweisungen für die Postersitzung klar?"}'::jsonb,
        '{"character": "Student", "text": "I think so. We meet on Thursday, 27 March, at 10 AM in Hall B.", "es": "Creo que sí. Nos reunimos el jueves 27 de marzo a las 10 AM en el hall B.", "de": "Ich glaube schon. Wir treffen uns am Donnerstag, dem 27. März, um 10 Uhr in Halle B."}'::jsonb,
        '{"character": "Lecturer", "text": "Correct. What do you bring?", "es": "Correcto. ¿Qué traes?", "de": "Richtig. Was bringst du mit?"}'::jsonb,
        '{"character": "Student", "text": "I bring my poster, tape, and name badge.", "es": "Traigo mi póster, cinta adhesiva y mi identificación con nombre.", "de": "Ich bringe mein Poster, Klebeband und mein Namensschild mit."}'::jsonb,
        '{"character": "Lecturer", "text": "Good. What do you do first?", "es": "Bien. ¿Qué haces primero?", "de": "Gut. Was machst du zuerst?"}'::jsonb,
        '{"character": "Student", "text": "I put the poster on Board 5 and stand next to it.", "es": "Pongo el póster en el panel 5 y me quedo a su lado.", "de": "Ich hänge das Poster an Tafel 5 und stelle mich daneben."}'::jsonb,
        '{"character": "Lecturer", "text": "Then what happens?", "es": "¿Qué pasa después?", "de": "Was passiert dann?"}'::jsonb,
        '{"character": "Student", "text": "I answer two simple questions from classmates and complete the feedback sheet.", "es": "Respondo dos preguntas sencillas de mis compañeros y completo la hoja de comentarios.", "de": "Ich beantworte zwei einfache Fragen von Mitschülern und fülle den Rückmeldebogen aus."}'::jsonb,
        '{"character": "Lecturer", "text": "Excellent. What do you do before you leave?", "es": "Excelente. ¿Qué haces antes de irte?", "de": "Ausgezeichnet. Was machst du, bevor du gehst?"}'::jsonb,
        '{"character": "Student", "text": "I give the feedback sheet to you before 11 AM and send one photo before 6 PM.", "es": "Te doy la hoja de comentarios antes de las 11 AM y envío una foto antes de las 6 PM.", "de": "Ich gebe dir den Rückmeldebogen vor 11 Uhr und schicke vor 18 Uhr ein Foto."}'::jsonb
    ];
  v_exercises JSONB[] := ARRAY[
        '{"es": "Diego confirma una sesión de pósteres en el hall B.", "de": "Diego bestätigt eine Postersitzung in Halle B.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La sesión es el jueves 27 de marzo a las 10 AM.", "de": "Die Sitzung ist am Donnerstag, dem 27. März, um 10 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Diego lleva su portátil y auriculares.", "de": "Diego bringt seinen Laptop und Kopfhörer mit.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Primero coloca el póster en el panel 5.", "de": "Zuerst hängt Diego das Poster an Tafel 5.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Después responde dos preguntas sencillas.", "de": "Danach beantwortet Diego zwei einfache Fragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Debe entregar la hoja antes de las 11 AM.", "de": "Er soll den Bogen vor 11 Uhr abgeben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Dónde pone Diego el póster?", "de": "Wo hängt Diego das Poster auf?", "s_es": {"type": "multiple_choice", "options": ["En el panel 5", "En la puerta principal", "En la biblioteca"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An Tafel 5", "An die Haupttür", "In die Bibliothek"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué envía Diego antes de las 6 PM?", "de": "Was schickt Diego vor 18 Uhr?", "s_es": {"type": "multiple_choice", "options": ["Una foto", "Una carta", "Un vídeo largo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Foto", "Einen Brief", "Ein langes Video"], "answer": 0}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN dialogue d ON d.uuid = e.target_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en');
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en';

  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 1000, 'en', 'dialogue', 'education', '[{"name": "Lecturer", "gender": "female", "avatarURL": "https://example.com/avatars/lecturer.png"}, {"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Revisión final de una sesión de pósteres', 'Lee un diálogo final donde un estudiante repite instrucciones para una sesión de pósteres y entrega de comentarios.'),
         (v_dialogue_uuid, 'de', 'Letzte Überprüfung einer Postersitzung', 'Lies einen letzten Dialog, in dem ein Student Anweisungen für eine Postersitzung und die Abgabe von Rückmeldungen wiederholt.');

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

