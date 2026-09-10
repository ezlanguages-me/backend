-- ============================================================
-- Seed: A0 English Path – STEP 960 – Dialogue – understand instructions on classes and assignments given by teacher or lecturer (Gestión del Estudio)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_dialogue_uuid UUID;
  v_line_uuid UUID;
  v_order SMALLINT := 1;
  line JSONB;
  v_lines JSONB[] := ARRAY[
        '{"character": "Lecturer", "text": "Hi Ana. Do you have a question about the short presentation?", "es": "Hola, Ana. ¿Tienes una pregunta sobre la presentación corta?", "pron": "/hái á-na. du yu hav a kwés-chon a-báut da short pre-sen-téi-shon/", "de": "Hallo Ana. Hast du eine Frage zur kurzen Präsentation?", "pron_de": "/já-lo á-na. hast du ái-ne frá-ge tsur kúr-tsen pre-sen-ta-tsión/"}'::jsonb,
        '{"character": "Student", "text": "Yes, please. Is it on Tuesday, 4 March, at 1:30 PM in Room 6?", "es": "Sí, por favor. ¿Es el martes 4 de marzo a la 1:30 PM en el aula 6?", "pron": "/yes, plís. is it on tús-dei, fort march, at uán ther-ti pí-em in rum siks/", "de": "Ja, bitte. Ist sie am Dienstag, dem 4. März, um 13:30 Uhr in Raum 6?", "pron_de": "/ya, bí-te. ist zi am díns-tak, dem fíer-ten mertz, um drái-tsen ur dráisich in raum sechs/"}'::jsonb,
        '{"character": "Lecturer", "text": "Yes. Please come at 1:20 with one photo and one cue card.", "es": "Sí. Por favor, llega a la 1:20 con una foto y una tarjeta de apoyo.", "pron": "/yes. plís kom at uán tuén-ti uid uán fóu-tou and uán kyu kard/", "de": "Ja. Bitte komm um 13:20 mit einem Foto und einer Stichwortkarte.", "pron_de": "/ya. bí-te kom um drái-tsen tsvántsich mit ái-nem fó-to und ái-ner shtích-vort-kar-te/"}'::jsonb,
        '{"character": "Student", "text": "What do I say?", "es": "¿Qué digo?", "pron": "/uat du ái sei/", "de": "Was soll ich sagen?", "pron_de": "/vas zol ich sá-gen/"}'::jsonb,
        '{"character": "Lecturer", "text": "Speak for one minute about your favourite place.", "es": "Habla durante un minuto sobre tu lugar favorito.", "pron": "/spík for uán mí-nit a-báut jur féi-vo-rit pleis/", "de": "Sprich eine Minute über deinen Lieblingsort.", "pron_de": "/shprich ái-ne mi-nú-te ü-ber dái-nen líbs-lings-ort/"}'::jsonb,
        '{"character": "Student", "text": "What do I do before I speak?", "es": "¿Qué hago antes de hablar?", "pron": "/uat du ái du bi-fór ái spík/", "de": "Was mache ich, bevor ich spreche?", "pron_de": "/vas má-che ich, be-fór ich shpré-che/"}'::jsonb,
        '{"character": "Lecturer", "text": "Write your name on the card, practise alone for two minutes, and then present to your partner.", "es": "Escribe tu nombre en la tarjeta, practica sola durante dos minutos y después presenta a tu pareja.", "pron": "/rait jur neim on da kard, prák-tis a-lón for tu mí-nits, and den pri-sént tu jur párt-ner/", "de": "Schreib deinen Namen auf die Karte, übe zwei Minuten allein und präsentiere dann deinem Partner.", "pron_de": "/shraib dái-nen ná-men auf di kar-te, ü-be tsvai mi-nú-ten a-láin und pre-sen-tí-re dan dái-nem párt-ner/"}'::jsonb,
        '{"character": "Student", "text": "And after class?", "es": "¿Y después de clase?", "pron": "/and áf-ter klas/", "de": "Und nach dem Unterricht?", "pron_de": "/und nach dem ún-ter-richt/"}'::jsonb,
        '{"character": "Lecturer", "text": "Email the photo before 8 PM.", "es": "Envía la foto por correo antes de las 8 PM.", "pron": "/í-meil da fóu-tou bi-fór eit pí-em/", "de": "Schick das Foto vor 20 Uhr per E-Mail.", "pron_de": "/shik das fó-to for tsvántsich ur per é-mail/"}'::jsonb,
        '{"character": "Student", "text": "Great. Thank you.", "es": "Perfecto. Gracias.", "pron": "/greit. tank yu/", "de": "Super. Danke.", "pron_de": "/sú-per. dán-ke/"}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 960 AND source_language = 'en';

  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 960, 'en', 'dialogue', 'education', '[{"name": "Lecturer", "gender": "female", "avatarURL": "https://example.com/avatars/lecturer.png"}, {"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title)
  VALUES (v_dialogue_uuid, 'es', 'Pregunta por una presentación'), (v_dialogue_uuid, 'de', 'Fragen zur Präsentation');

  FOREACH line IN ARRAY v_lines LOOP
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_uuid, v_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es', 'pronunciation', line->>'pron')),
           (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de', 'pronunciation', line->>'pron_de'));
    v_order := v_order + 1;
  END LOOP;
END;
$seed$;
