-- ============================================================
-- Seed: A0 English Path – STEP 880 – Dialogue – understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_dialogue_uuid UUID;
  v_line_uuid UUID;
  v_order SMALLINT := 1;
  line JSONB;
  ex JSONB;
  v_lines JSONB[] := ARRAY[
        '{"character": "Teacher", "text": "Hi Leo. The maths make-up class is on Monday, 8 July, at 10 AM in Room 12.", "es": "Hola, Leo. La clase de recuperación de matemáticas es el lunes 8 de julio a las 10 AM en el aula 12.", "de": "Hallo Leo. Der Mathe-Nachholunterricht ist am Montag, dem 8. Juli, um 10 Uhr in Raum 12.", "pron": "/jái léo. de mazs méik-ap klas is on mán-dei, eit chú-lai, at ten éi-em in rum tuélv./", "pron_de": "/JÁI LÉ-o. der MATH NACH-hol-kurs ist am MON-taak, AJT-ten YÚU-li, um TSEEN uur in RAUM TSVÁLF./"}'::jsonb,
        '{"character": "Student", "text": "Monday, 8 July, at ten in Room 12. Should I come early?", "es": "Lunes 8 de julio, a las diez, en el aula 12. ¿Debo llegar antes?", "de": "Montag, 8. Juli, um zehn Uhr in Raum 12. Soll ich früher kommen?", "pron": "/mán-dei, eit chú-lai, at ten in rum tuélv. shud ai kam éir-li?/", "pron_de": "/MON-taak, AJT-ten YÚU-li, um TSEEN uur in RAUM TSVÁLF. solt ij FRÜÜ-er KO-men?/"}'::jsonb,
        '{"character": "Teacher", "text": "Yes. Please come at 9:50 with your calculator, squared notebook, and pencil.", "es": "Sí. Por favor, llega a las 9:50 con tu calculadora, cuaderno cuadriculado y lápiz.", "de": "Ja. Bitte komm um 9:50 mit deinem Taschenrechner, karierten Heft und Bleistift.", "pron": "/yes. plíis kam at náin fíf-ti uid yur kál-kyu-lei-tor, skuérd nout-buk, and pén-sil./", "pron_de": "/yaa. BI-te komm um NOIN FÜNF-tsig mit DAI-nem TA-shen-REJ-ner, ka-RÍIR-tem HEFT und BLAI-shtift./"}'::jsonb,
        '{"character": "Student", "text": "What do we do first?", "es": "¿Qué hacemos primero?", "de": "Was machen wir zuerst?", "pron": "/uot du ui du ferst?/", "pron_de": "/uas MA-jen uiir TSUERST?/"}'::jsonb,
        '{"character": "Teacher", "text": "First write your name, then open page 32 and solve sums 1 to 4.", "es": "Primero escribe tu nombre, luego abre la página 32 y resuelve las operaciones 1 a 4.", "de": "Schreib zuerst deinen Namen, öffne dann Seite 32 und löse die Aufgaben 1 bis 4.", "pron": "/ferst rait yur néim, den óu-pen péich zér-ti-tu and solv sams uan tu for./", "pron_de": "/TSUUERST SHRAIP dai-nen NA-men, dann öff-ne SAI-te DRAI-tsig-TSVAI und LÖS die AUF-ga-ben AINS bis FÍIR./"}'::jsonb,
        '{"character": "Student", "text": "Do I work alone first?", "es": "¿Trabajo solo al principio?", "de": "Arbeite ich am Anfang allein?", "pron": "/du ai uerk a-lóun ferst?/", "pron_de": "/ar-BAI-te ij AM AN-fang al-LÁIN?/"}'::jsonb,
        '{"character": "Teacher", "text": "Yes. After eight minutes, check the answers with Omar.", "es": "Sí. Después de ocho minutos, revisa las respuestas con Omar.", "de": "Ja. Nach acht Minuten kontrollierst du die Antworten mit Omar.", "pron": "/yes. áf-ter eit mí-nits, chek de áns-ers uid ó-mar./", "pron_de": "/yaa. NACH AJT MI-nu-ten, prüüf di ANT-uor-ten MIT O-mar./"}'::jsonb,
        '{"character": "Student", "text": "And the homework?", "es": "¿Y la tarea?", "de": "Und die Hausaufgabe?", "pron": "/and de jóum-uerk?/", "pron_de": "/und di HAUS-auf-ga-be?/"}'::jsonb,
        '{"character": "Teacher", "text": "Finish the graph on the worksheet and upload one photo before Tuesday at 5 PM.", "es": "Termina la gráfica de la hoja y sube una foto antes del martes a las 5 PM.", "de": "Mach das Diagramm auf dem Arbeitsblatt fertig und lade vor Dienstag um 17 Uhr ein Foto hoch.", "pron": "/fí-nish de graf on de uérk-shet and ap-lóud uan fóu-to bi-fór tyus-dei at faiv pí-em./", "pron_de": "/MACH das DIA-gramm auf dem AR-baits-blatt FER-tig und LÁA-de vor DÍINS-taak um SIIB-tsen uur EIN FÓO-to HOCH./"}'::jsonb,
        '{"character": "Student", "text": "Great. Thank you.", "es": "Genial. Gracias.", "de": "Super. Danke.", "pron": "/gréit. zank yu./", "pron_de": "/GREIT. DAN-ke./"}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 880 AND source_language = 'en';

  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 880, 'en', 'dialogue', 'education', '[{"name": "Teacher", "gender": "female", "avatarURL": "https://example.com/avatars/teacher.png"}, {"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title)
  VALUES (v_dialogue_uuid, 'es', 'Recuperación de matemáticas'), (v_dialogue_uuid, 'de', 'Mathe-Nachholunterricht');

  FOREACH line IN ARRAY v_lines LOOP
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_uuid, v_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es', 'pronunciation', line->>'pron'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de', 'pronunciation', line->>'pron_de'));
    v_order := v_order + 1;
  END LOOP;
END;
$seed$;

