-- ============================================================
-- Seed: A0 English Path – STEP 920 – Dialogue – check instructions with teacher or lecturer by virtually repeating them (Gestión del Estudio)
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
        '{"character": "Student", "text": "Hello Ms Fox. Can I check the science lab instructions?", "es": "Hola, señora Fox. ¿Puedo comprobar las instrucciones del laboratorio de ciencias?", "de": "Hallo Frau Fox. Kann ich die Anweisungen für das Wissenschaftslabor prüfen?"}'::jsonb,
        '{"character": "Teacher", "text": "Of course. Tell me what you understand.", "es": "Claro. Dime qué has entendido.", "de": "Natürlich. Sag mir, was du verstanden hast."}'::jsonb,
        '{"character": "Student", "text": "The lab is on Wednesday, 20 November, at 11 AM in Lab 2. Right?", "es": "El laboratorio es el miércoles 20 de noviembre a las 11 AM en el laboratorio 2. ¿Correcto?", "de": "Das Labor ist am Mittwoch, dem 20. November, um 11 Uhr in Labor 2. Richtig?"}'::jsonb,
        '{"character": "Teacher", "text": "Yes, and please come at 10:50 with your lab coat, notebook, and goggles.", "es": "Sí, y por favor llega a las 10:50 con tu bata, cuaderno y gafas de protección.", "de": "Ja, und bitte komm um 10:50 mit deinem Laborkittel, Heft und Schutzbrille."}'::jsonb,
        '{"character": "Student", "text": "First I put my bag under the bench, write the date, and read the safety card.", "es": "Primero pongo la mochila debajo de la mesa, escribo la fecha y leo la tarjeta de seguridad.", "de": "Zuerst stelle ich meine Tasche unter die Bank, schreibe das Datum und lese die Sicherheitskarte."}'::jsonb,
        '{"character": "Teacher", "text": "Exactly.", "es": "Exacto.", "de": "Genau."}'::jsonb,
        '{"character": "Student", "text": "Then I measure one hundred millilitres of water in the beaker.", "es": "Luego mido cien mililitros de agua en el vaso de precipitados.", "de": "Dann messe ich hundert Milliliter Wasser im Becherglas."}'::jsonb,
        '{"character": "Teacher", "text": "Correct. Work alone first, then compare your notes with Nina.", "es": "Correcto. Trabaja solo al principio y luego compara tus notas con Nina.", "de": "Richtig. Arbeite zuerst allein und vergleiche dann deine Notizen mit Nina."}'::jsonb,
        '{"character": "Student", "text": "For homework, I label the diagram and upload it before 6 PM.", "es": "Para casa etiqueto el diagrama y lo subo antes de las 6 PM.", "de": "Für zu Hause beschrifte ich das Diagramm und lade es vor 18 Uhr hoch."}'::jsonb,
        '{"character": "Teacher", "text": "Perfect. You understood the lab instructions.", "es": "Perfecto. Has entendido las instrucciones del laboratorio.", "de": "Perfekt. Du hast die Laboranweisungen verstanden."}'::jsonb
    ];
  v_exercises JSONB[] := ARRAY[
        '{"es": "El estudiante comprueba instrucciones de un laboratorio de ciencias.", "de": "Der Lernende prüft Anweisungen für ein Wissenschaftslabor.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El laboratorio es el miércoles 20 de noviembre a las 11 AM en el laboratorio 2.", "de": "Das Labor ist am Mittwoch, dem 20. November, um 11 Uhr in Labor 2.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El estudiante debe llevar pinturas de colores.", "de": "Der Lernende soll Farbstifte mitbringen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Antes del experimento lee una tarjeta de seguridad.", "de": "Vor dem Experiment liest der Lernende eine Sicherheitskarte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Después compara las notas con Nina.", "de": "Danach vergleicht der Lernende die Notizen mit Nina.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué coloca el estudiante debajo de la mesa?", "de": "Was stellt der Lernende unter die Bank?", "s_es": {"type": "multiple_choice", "options": ["La mochila", "La regla", "El vaso"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Tasche", "Das Lineal", "Das Glas"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué mide en el vaso de precipitados?", "de": "Was misst der Lernende im Becherglas?", "s_es": {"type": "multiple_choice", "options": ["Cien mililitros de agua", "Dos litros de leche", "Cinco gramos de sal"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hundert Milliliter Wasser", "Zwei Liter Milch", "Fünf Gramm Salz"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace para casa?", "de": "Was macht der Lernende zu Hause?", "s_es": {"type": "multiple_choice", "options": ["Etiquetar el diagrama y subirlo", "Comprar gafas nuevas", "Repetir el experimento"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Diagramm beschriften und hochladen", "Neue Schutzbrillen kaufen", "Das Experiment wiederholen"], "answer": 0}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN dialogue d ON d.uuid = e.target_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en');
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en';

  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 920, 'en', 'dialogue', 'education', '[{"name": "Teacher", "gender": "female", "avatarURL": "https://example.com/avatars/teacher.png"}, {"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Repite instrucciones del laboratorio de ciencias', 'Lee un diálogo donde un estudiante confirma hora, material y pasos de un laboratorio de ciencias.'),
         (v_dialogue_uuid, 'de', 'Wiederhole die Anweisungen für das Wissenschaftslabor', 'Lies einen Dialog, in dem ein Lernender Uhrzeit, Material und Schritte für ein Wissenschaftslabor bestätigt.');

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

