-- ============================================================
-- Seed: A0 English Path – STEP 920 – Dialogue – check instructions with teacher or lecturer by virtually repeating them (Gestión del Estudio)
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
        '{"character": "Student", "text": "Hello Ms Fox. Can I check the science lab instructions?", "es": "Hola, señora Fox. ¿Puedo comprobar las instrucciones del laboratorio de ciencias?", "pron": "/he-lóu mis foks. kan ái chek da sáiens lab ins-trák-chons/", "de": "Hallo Frau Fox. Kann ich die Anweisungen für das Wissenschaftslabor prüfen?", "pron_de": "/já-lo frau foks. kan ich di an-váisun-gen für das vis-en-shafts-la-bor prü-fen/"}'::jsonb,
        '{"character": "Teacher", "text": "Of course. Tell me what you understand.", "es": "Claro. Dime qué has entendido.", "pron": "/of kors. tel mi uat yu an-der-stand/", "de": "Natürlich. Sag mir, was du verstanden hast.", "pron_de": "/na-türlich. sak mir, vas du fer-shtan-den hast/"}'::jsonb,
        '{"character": "Student", "text": "The lab is on Wednesday, 20 November, at 11 AM in Lab 2. Right?", "es": "El laboratorio es el miércoles 20 de noviembre a las 11 AM en el laboratorio 2. ¿Correcto?", "pron": "/da lab is on uéns-dei, tuén-ti no-vém-ber, at i-lé-ven éi-em in lab tu. rait/", "de": "Das Labor ist am Mittwoch, dem 20. November, um 11 Uhr in Labor 2. Richtig?", "pron_de": "/das la-bor ist am mít-woch, dem tsvántsig-sten no-vém-ber, um elf ur in la-bor tsvai. rích-tig/"}'::jsonb,
        '{"character": "Teacher", "text": "Yes, and please come at 10:50 with your lab coat, notebook, and goggles.", "es": "Sí, y por favor llega a las 10:50 con tu bata, cuaderno y gafas de protección.", "pron": "/yes, and plís kom at ten fíf-ti uid jur lab kout, nout-buk, and gó-gols/", "de": "Ja, und bitte komm um 10:50 mit deinem Laborkittel, Heft und Schutzbrille.", "pron_de": "/ya, und bí-te kom um tsen für fünf-tsich mit dái-nem la-bor-kí-tel, heft und shuts-brí-le/"}'::jsonb,
        '{"character": "Student", "text": "First I put my bag under the bench, write the date, and read the safety card.", "es": "Primero pongo la mochila debajo de la mesa, escribo la fecha y leo la tarjeta de seguridad.", "pron": "/ferst ái put mai bag an-der da bench, rait da deit, and rid da séif-ti kard/", "de": "Zuerst stelle ich meine Tasche unter die Bank, schreibe das Datum und lese die Sicherheitskarte.", "pron_de": "/tsu-érst shte-le ich mái-ne ta-she un-ter di bank, shrái-be das dá-tum und lé-se di zi-cher-haits-kar-te/"}'::jsonb,
        '{"character": "Teacher", "text": "Exactly.", "es": "Exacto.", "pron": "/ig-sákt-li/", "de": "Genau.", "pron_de": "/ge-náu/"}'::jsonb,
        '{"character": "Student", "text": "Then I measure one hundred millilitres of water in the beaker.", "es": "Luego mido cien mililitros de agua en el vaso de precipitados.", "pron": "/den ái mé-sher uán hán-dred mí-li-li-ters of uó-ter in da bí-ker/", "de": "Dann messe ich hundert Milliliter Wasser im Becherglas.", "pron_de": "/dan mé-se ich hún-dert mi-li-lí-ter vá-ser im bé-cher-glas/"}'::jsonb,
        '{"character": "Teacher", "text": "Correct. Work alone first, then compare your notes with Nina.", "es": "Correcto. Trabaja solo al principio y luego compara tus notas con Nina.", "pron": "/ko-rékt. uerk a-lón ferst, den kom-pér jur nouts uid ní-na/", "de": "Richtig. Arbeite zuerst allein und vergleiche dann deine Notizen mit Nina.", "pron_de": "/rích-tig. ár-bai-te tsu-érst a-láin und fer-gláich-e dan dái-ne no-tí-tsen mit ní-na/"}'::jsonb,
        '{"character": "Student", "text": "For homework, I label the diagram and upload it before 6 PM.", "es": "Para casa etiqueto el diagrama y lo subo antes de las 6 PM.", "pron": "/for hóum-uerk, ái léi-bol da dái-a-gram and ap-lóud it bi-fór siks pí-em/", "de": "Für zu Hause beschrifte ich das Diagramm und lade es vor 18 Uhr hoch.", "pron_de": "/für tsu háu-se be-shríf-te ich das di-a-gram und lá-de es for ácht-tsen ur hoch/"}'::jsonb,
        '{"character": "Teacher", "text": "Perfect. You understood the lab instructions.", "es": "Perfecto. Has entendido las instrucciones del laboratorio.", "pron": "/pér-fekt. yu an-der-stud da lab ins-trák-chons/", "de": "Perfekt. Du hast die Laboranweisungen verstanden.", "pron_de": "/per-fékt. du hast di la-bor-an-váisun-gen fer-shtan-den/"}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 920 AND source_language = 'en';

  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 920, 'en', 'dialogue', 'education', '[{"name": "Teacher", "gender": "female", "avatarURL": "https://example.com/avatars/teacher.png"}, {"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title)
  VALUES (v_dialogue_uuid, 'es', 'Instrucciones del laboratorio'), (v_dialogue_uuid, 'de', 'Wiederhole die Anweisungen');

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
