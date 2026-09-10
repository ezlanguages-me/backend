-- ============================================================
-- Seed: A0 English Path – STEP 1000 – Dialogue – check that all instructions are understood (Gestión del Estudio)
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
        '{"character": "Lecturer", "text": "Diego, are the poster session instructions clear?", "es": "Diego, ¿están claras las instrucciones de la sesión de pósteres?", "pron": "/dié-go, ar da pós-ter sé-shon ins-trák-chons klir/", "de": "Diego, sind die Anweisungen für die Postersitzung klar?", "pron_de": "/dié-go, zint di an-váisun-gen für di pós-ter-zit-sung klar/"}'::jsonb,
        '{"character": "Student", "text": "I think so. We meet on Thursday, 27 March, at 10 AM in Hall B.", "es": "Creo que sí. Nos reunimos el jueves 27 de marzo a las 10 AM en el hall B.", "pron": "/ái tink sou. ui mit on térs-dei, tuén-ti sé-ven march, at ten éi-em in hol bi/", "de": "Ich glaube schon. Wir treffen uns am Donnerstag, dem 27. März, um 10 Uhr in Halle B.", "pron_de": "/ich gláu-be shon. vir tré-fen uns am dón-ners-tak, dem zíb-en-und-tsvántsig-sten mertz, um tsen ur in há-le be/"}'::jsonb,
        '{"character": "Lecturer", "text": "Correct. What do you bring?", "es": "Correcto. ¿Qué traes?", "pron": "/ko-rékt. uat du yu bring/", "de": "Richtig. Was bringst du mit?", "pron_de": "/rích-tig. vas bringst du mit/"}'::jsonb,
        '{"character": "Student", "text": "I bring my poster, tape, and name badge.", "es": "Traigo mi póster, cinta adhesiva y mi identificación con nombre.", "pron": "/ái bring mai pós-ter, teip, and neim bach/", "de": "Ich bringe mein Poster, Klebeband und mein Namensschild mit.", "pron_de": "/ich brín-ge main pós-ter, klé-be-band und main ná-mens-shilt mit/"}'::jsonb,
        '{"character": "Lecturer", "text": "Good. What do you do first?", "es": "Bien. ¿Qué haces primero?", "pron": "/gud. uat du yu du ferst/", "de": "Gut. Was machst du zuerst?", "pron_de": "/gut. vas machst du tsu-érst/"}'::jsonb,
        '{"character": "Student", "text": "I put the poster on Board 5 and stand next to it.", "es": "Pongo el póster en el panel 5 y me quedo a su lado.", "pron": "/ái put da pós-ter on bord faiv and stand nekst tu it/", "de": "Ich hänge das Poster an Tafel 5 und stelle mich daneben.", "pron_de": "/ich hén-ge das pós-ter an tá-fel fünf und shté-le mich da-né-ben/"}'::jsonb,
        '{"character": "Lecturer", "text": "Then what happens?", "es": "¿Qué pasa después?", "pron": "/den uat há-pens/", "de": "Was passiert dann?", "pron_de": "/vas pa-sírt dan/"}'::jsonb,
        '{"character": "Student", "text": "I answer two simple questions from classmates and complete the feedback sheet.", "es": "Respondo dos preguntas sencillas de mis compañeros y completo la hoja de comentarios.", "pron": "/ái án-ser tu sím-pol kwés-chons from klás-meits and kom-plít da fíd-bak shit/", "de": "Ich beantworte zwei einfache Fragen von Mitschülern und fülle den Rückmeldebogen aus.", "pron_de": "/ich be-ánt-vor-te tsvai áin-fa-che frá-gen fon mít-shü-lern und fü-le den rük-mél-de-bo-gen aus/"}'::jsonb,
        '{"character": "Lecturer", "text": "Excellent. What do you do before you leave?", "es": "Excelente. ¿Qué haces antes de irte?", "pron": "/ék-se-lent. uat du yu du bi-fór yu líiv/", "de": "Ausgezeichnet. Was machst du, bevor du gehst?", "pron_de": "/áus-ge-tsaich-net. vas machst du, be-fór du geist/"}'::jsonb,
        '{"character": "Student", "text": "I give the feedback sheet to you before 11 AM and send one photo before 6 PM.", "es": "Te doy la hoja de comentarios antes de las 11 AM y envío una foto antes de las 6 PM.", "pron": "/ái giv da fíd-bak shit tu yu bi-fór i-lé-ven éi-em and send uán fóu-tou bi-fór siks pí-em/", "de": "Ich gebe dir den Rückmeldebogen vor 11 Uhr und schicke vor 18 Uhr ein Foto.", "pron_de": "/ich gé-be dir den rük-mél-de-bo-gen for elf ur und shí-ke for ácht-tsen ur ain fó-to/"}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 1000 AND source_language = 'en';

  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 1000, 'en', 'dialogue', 'education', '[{"name": "Lecturer", "gender": "female", "avatarURL": "https://example.com/avatars/lecturer.png"}, {"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title)
  VALUES (v_dialogue_uuid, 'es', 'Revisión final de una sesión'), (v_dialogue_uuid, 'de', 'Letzte Überprüfung der Anweisungen');

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
