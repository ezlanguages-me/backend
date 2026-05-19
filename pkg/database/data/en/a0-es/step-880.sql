-- ============================================================
-- Seed: A0 English Path – STEP 880 – Dialogue – understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio)
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
        '{"character": "Teacher", "text": "Hi Leo. The maths make-up class is on Monday, 8 July, at 10 AM in Room 12.", "es": "Hola, Leo. La clase de recuperación de matemáticas es el lunes 8 de julio a las 10 AM en el aula 12.", "de": "Hallo Leo. Der Mathe-Nachholunterricht ist am Montag, dem 8. Juli, um 10 Uhr in Raum 12."}'::jsonb,
        '{"character": "Student", "text": "Monday, 8 July, at ten in Room 12. Should I come early?", "es": "Lunes 8 de julio, a las diez, en el aula 12. ¿Debo llegar antes?", "de": "Montag, 8. Juli, um zehn Uhr in Raum 12. Soll ich früher kommen?"}'::jsonb,
        '{"character": "Teacher", "text": "Yes. Please come at 9:50 with your calculator, squared notebook, and pencil.", "es": "Sí. Por favor, llega a las 9:50 con tu calculadora, cuaderno cuadriculado y lápiz.", "de": "Ja. Bitte komm um 9:50 mit deinem Taschenrechner, karierten Heft und Bleistift."}'::jsonb,
        '{"character": "Student", "text": "What do we do first?", "es": "¿Qué hacemos primero?", "de": "Was machen wir zuerst?"}'::jsonb,
        '{"character": "Teacher", "text": "First write your name, then open page 32 and solve sums 1 to 4.", "es": "Primero escribe tu nombre, luego abre la página 32 y resuelve las operaciones 1 a 4.", "de": "Schreib zuerst deinen Namen, öffne dann Seite 32 und löse die Aufgaben 1 bis 4."}'::jsonb,
        '{"character": "Student", "text": "Do I work alone first?", "es": "¿Trabajo solo al principio?", "de": "Arbeite ich am Anfang allein?"}'::jsonb,
        '{"character": "Teacher", "text": "Yes. After eight minutes, check the answers with Omar.", "es": "Sí. Después de ocho minutos, revisa las respuestas con Omar.", "de": "Ja. Nach acht Minuten kontrollierst du die Antworten mit Omar."}'::jsonb,
        '{"character": "Student", "text": "And the homework?", "es": "¿Y la tarea?", "de": "Und die Hausaufgabe?"}'::jsonb,
        '{"character": "Teacher", "text": "Finish the graph on the worksheet and upload one photo before Tuesday at 5 PM.", "es": "Termina la gráfica de la hoja y sube una foto antes del martes a las 5 PM.", "de": "Mach das Diagramm auf dem Arbeitsblatt fertig und lade vor Dienstag um 17 Uhr ein Foto hoch."}'::jsonb,
        '{"character": "Student", "text": "Great. Thank you.", "es": "Genial. Gracias.", "de": "Super. Danke."}'::jsonb
    ];
  v_exercises JSONB[] := ARRAY[
        '{"es": "La clase de recuperación es de matemáticas.", "de": "Der Nachholunterricht ist in Mathematik.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La clase es el lunes 8 de julio a las 10 AM en el aula 12.", "de": "Der Unterricht ist am Montag, dem 8. Juli, um 10 Uhr in Raum 12.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Leo debe llevar una regla roja.", "de": "Leo soll ein rotes Lineal mitbringen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Después de ocho minutos, Leo revisa con Omar.", "de": "Nach acht Minuten kontrolliert Leo mit Omar.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tarea es terminar una gráfica y subir una foto antes del martes a las 5 PM.", "de": "Die Hausaufgabe ist, ein Diagramm fertig zu machen und vor Dienstag um 17 Uhr ein Foto hochzuladen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué debe llevar Leo?", "de": "Was soll Leo mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Calculadora, cuaderno cuadriculado y lápiz", "Solo el teléfono", "Pinturas y tijeras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Taschenrechner, kariertes Heft und Bleistift", "Nur das Handy", "Farben und Schere"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace Leo después de abrir la página 32?", "de": "Was macht Leo nach dem Öffnen von Seite 32?", "s_es": {"type": "multiple_choice", "options": ["Resolver las operaciones 1 a 4", "Cambiar de aula", "Escribir un correo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Aufgaben 1 bis 4 lösen", "Den Raum wechseln", "Eine E-Mail schreiben"], "answer": 0}}'::jsonb,
        '{"es": "¿Con quién revisa Leo?", "de": "Mit wem kontrolliert Leo?", "s_es": {"type": "multiple_choice", "options": ["Con Omar", "Con Sara", "Con el director"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Omar", "Mit Sara", "Mit dem Direktor"], "answer": 0}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN dialogue d ON d.uuid = e.target_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en');
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en';

  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 880, 'en', 'dialogue', 'education', '[{"name": "Teacher", "gender": "female", "avatarURL": "https://example.com/avatars/teacher.png"}, {"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Confirma la clase de recuperación de matemáticas', 'Lee un diálogo corto sobre una clase extra de matemáticas, materiales y una tarea concreta.'),
         (v_dialogue_uuid, 'de', 'Bestätige den Mathe-Nachholunterricht', 'Lies einen kurzen Dialog über einen zusätzlichen Mathematikunterricht, Materialien und eine konkrete Hausaufgabe.');

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

