-- ============================================================
-- Seed: A0 English Path – STEP 855 – Deck – La Escuela y la Universidad
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        -- Lugares y espacios
        '{"term":"school","meaning":"escuela / colegio","de":"Schule","ex":"My children go to school at 8 a.m.","pron":"/skul/","pron_de":"/SCHUU-lö/"}'::jsonb,
        '{"term":"university","meaning":"universidad","de":"Universität","ex":"She studied medicine at the university.","pron":"/iu-ni-vér-si-ti/","pron_de":"/u-ni-wöö-si-TÄT/"}'::jsonb,
        '{"term":"college","meaning":"universidad / facultad / colegio mayor","de":"Hochschule / College","ex":"He attended college in New York.","pron":"/kó-lich/","pron_de":"/KO-lödsch/"}'::jsonb,
        '{"term":"classroom","meaning":"aula / sala de clase","de":"Klassenzimmer","ex":"The classroom has 30 students.","pron":"/klás-rum/","pron_de":"/KLA-sön-tsim-mö/"}'::jsonb,
        '{"term":"library","meaning":"biblioteca","de":"Bibliothek","ex":"She went to the library to study for the exam.","pron":"/lái-bra-ri/","pron_de":"/bib-lio-TEK/"}'::jsonb,
        '{"term":"laboratory (lab)","meaning":"laboratorio","de":"Labor","ex":"They did an experiment in the chemistry lab.","pron":"/lá-bo-ra-to-ri/","pron_de":"/lö-BOO/"}'::jsonb,
        '{"term":"gymnasium (gym)","meaning":"gimnasio escolar","de":"Sporthalle","ex":"They had PE class in the gymnasium.","pron":"/dyim-néi-zi-om/","pron_de":"/SCHPORT-ha-lö/"}'::jsonb,
        '{"term":"cafeteria","meaning":"cafetería / comedor escolar","de":"Mensa / Cafeteria","ex":"Students eat lunch in the cafeteria.","pron":"/ka-fi-tí-ria/","pron_de":"/MEN-sa/"}'::jsonb,
        '{"term":"playground","meaning":"patio de recreo","de":"Schulhof / Spielplatz","ex":"Children play in the playground during break.","pron":"/pléi-graund/","pron_de":"/SCHPIEL-plats/"}'::jsonb,

        -- Personas
        '{"term":"student","meaning":"estudiante / alumno","de":"Schüler(in) / Student(in)","ex":"She is a very dedicated student.","pron":"/stú-dent/","pron_de":"/SCHÜÜ-lö/"}'::jsonb,
        '{"term":"teacher","meaning":"profesor / maestra (escuela)","de":"Lehrer(in)","ex":"Our teacher explained the lesson clearly.","pron":"/tí-cher/","pron_de":"/LEE-rö/"}'::jsonb,
        '{"term":"professor","meaning":"profesor universitario / catedrático","de":"Professor(in)","ex":"The professor published a new book.","pron":"/pro-fé-sor/","pron_de":"/pro-FE-sö/"}'::jsonb,
        '{"term":"principal","meaning":"director / directora de escuela","de":"Schulleiter(in)","ex":"The principal addressed the students at assembly.","pron":"/prín-si-pal/","pron_de":"/SCHUL-lai-tö/"}'::jsonb,
        '{"term":"classmate","meaning":"compañero/a de clase","de":"Klassenkamerad(in)","ex":"She is one of my classmates.","pron":"/klás-meit/","pron_de":"/KLA-sön-kö-raat/"}'::jsonb,
        '{"term":"tutor","meaning":"tutor / profesor particular","de":"Tutor(in) / Nachhilfelehrer(in)","ex":"He hired a tutor to help him with maths.","pron":"/tú-tor/","pron_de":"/TUU-tö/"}'::jsonb,

        -- Materiales y objetos
        '{"term":"textbook","meaning":"libro de texto","de":"Lehrbuch","ex":"Open your textbook to page 45.","pron":"/tékst-buk/","pron_de":"/LEJR-buch/"}'::jsonb,
        '{"term":"notebook","meaning":"cuaderno","de":"Heft / Notizbuch","ex":"She took notes in her notebook.","pron":"/nóut-buk/","pron_de":"/NO-tits-buch/"}'::jsonb,
        '{"term":"pencil","meaning":"lápiz","de":"Bleistift","ex":"Can I borrow your pencil?","pron":"/pén-sel/","pron_de":"/BLAI-schtift/"}'::jsonb,
        '{"term":"pen","meaning":"bolígrafo / pluma","de":"Kugelschreiber / Stift","ex":"Sign the form with a pen.","pron":"/pen/","pron_de":"/KUU-göl-schrai-bö/"}'::jsonb,
        '{"term":"eraser","meaning":"borrador / goma de borrar","de":"Radiergummi","ex":"Do you have an eraser I can use?","pron":"/i-réi-sor/","pron_de":"/ra-DIR-gu-mi/"}'::jsonb,
        '{"term":"ruler","meaning":"regla","de":"Lineal","ex":"Use a ruler to draw a straight line.","pron":"/rú-ler/","pron_de":"/li-ne-AL/"}'::jsonb,
        '{"term":"backpack","meaning":"mochila","de":"Rucksack","ex":"He carries all his books in his backpack.","pron":"/bák-pak/","pron_de":"/RUK-sak/"}'::jsonb,
        '{"term":"whiteboard","meaning":"pizarra blanca","de":"Whiteboard / Tafel","ex":"The teacher wrote on the whiteboard.","pron":"/uáit-bord/","pron_de":"/WAIT-bood/"}'::jsonb,

        -- Actividades y procesos
        '{"term":"homework","meaning":"tarea / deberes","de":"Hausaufgaben","ex":"Did you finish your homework?","pron":"/hóum-work/","pron_de":"/HAUS-auf-gaa-bön/"}'::jsonb,
        '{"term":"exam / test","meaning":"examen / prueba","de":"Prüfung / Test","ex":"We have a maths exam tomorrow.","pron":"/ig-zám/","pron_de":"/PRÜÜ-fung/"}'::jsonb,
        '{"term":"grade / mark","meaning":"nota / calificación","de":"Note / Benotung","ex":"She got a good grade on her essay.","pron":"/greid/","pron_de":"/NOO-tö/"}'::jsonb,
        '{"term":"pass","meaning":"aprobar","de":"bestehen","ex":"He passed all his exams.","pron":"/pas/","pron_de":"/bö-SCHTE-hen/"}'::jsonb,
        '{"term":"fail","meaning":"suspender / reprobar","de":"nicht bestehen / durchfallen","ex":"She failed the driving test twice.","pron":"/feil/","pron_de":"/DURCH-fa-lön/"}'::jsonb,
        '{"term":"lesson","meaning":"lección / clase","de":"Stunde / Unterricht","ex":"Today''s lesson is about fractions.","pron":"/lé-son/","pron_de":"/SCHUUN-dö/"}'::jsonb,
        '{"term":"subject","meaning":"asignatura / materia","de":"Schulfach / Fach","ex":"What is your favourite subject?","pron":"/sáb-dyekt/","pron_de":"/SCHUL-fach/"}'::jsonb,
        '{"term":"degree","meaning":"título universitario / grado","de":"Studienabschluss / Abschluss","ex":"She has a degree in economics.","pron":"/di-grí/","pron_de":"/SCHTU-di-en-ab-schluss/"}'::jsonb,
        '{"term":"scholarship","meaning":"beca","de":"Stipendium","ex":"He received a scholarship to study abroad.","pron":"/skó-lar-ship/","pron_de":"/schi-PEN-di-um/"}'::jsonb,
        '{"term":"graduation","meaning":"graduación","de":"Abschlussfeier / Graduierung","ex":"Her graduation ceremony was very emotional.","pron":"/gra-dyu-éi-shon/","pron_de":"/AB-schluss-fai-ö/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 855 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 855, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'es', 'La Escuela y la Universidad', 'Vocabulario esencial sobre el entorno educativo: espacios, personas, materiales, asignaturas y procesos académicos.');

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'de', 'Schule und Universität', '');

    FOREACH card IN ARRAY v_cards
    LOOP
        INSERT INTO word (term, is_root, source_language, example)
        VALUES (card->>'term', TRUE, 'en', card->>'ex')
        RETURNING uuid INTO v_word_id;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron');

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');

        INSERT INTO deck_words (deck_uuid, word_uuid)
        VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;
