-- ============================================================
-- Seed: A0 English Path – STEP 600 – Dialogue – express opinions in a limited way (Convivencia - Host Families)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_order SMALLINT := 1;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"c": "Friend", "t": "How is your host family now?", "es": "¿Cómo es tu familia anfitriona ahora?", "pron": "/háu is ior houst fámili náu?/", "de": "Wie ist deine Gastfamilie jetzt?", "pron_de": "/vi ist dái-ne gast-fa-mí-li yétst?/"}'::jsonb,
        '{"c": "Alex", "t": "I really like them. They are friendly and calm.", "es": "Me gustan mucho. Son amables y tranquilos.", "pron": "/ai ríali láik dem. déi ar fréndli and kam./", "de": "Ich mag sie wirklich. Sie sind freundlich und ruhig.", "pron_de": "/ij mak zi vírklij. zi zint frointlij und ru-ij./"}'::jsonb,
        '{"c": "Friend", "t": "What do you like best?", "es": "¿Qué es lo que más te gusta?", "pron": "/uat du iu láik best?/", "de": "Was magst du am liebsten?", "pron_de": "/vas makst du am líps-ten?/"}'::jsonb,
        '{"c": "Alex", "t": "I like the evening talks with Sarah. She always asks about my day.", "es": "Me gustan las charlas de la tarde con Sarah. Siempre pregunta por mi día.", "pron": "/ai láik de ívning toks uid séra. shi ólueis asks abáut mai déi./", "de": "Ich mag die Gespräche am Abend mit Sarah. Sie fragt immer nach meinem Tag.", "pron_de": "/ij mak di ge-shpré-je am á-bent mit zá-ra. zi fragt í-mer naj mái-nem taak./"}'::jsonb,
        '{"c": "Friend", "t": "And your room?", "es": "¿Y tu habitación?", "pron": "/and ior rum?/", "de": "Und dein Zimmer?", "pron_de": "/und dain tsí-mer?/"}'::jsonb,
        '{"c": "Alex", "t": "I think my room is bright and comfortable.", "es": "Creo que mi habitación es luminosa y cómoda.", "pron": "/ai zink mai rum is bráit and kámf-ter-bol./", "de": "Ich finde mein Zimmer hell und bequem.", "pron_de": "/ij fín-de main tsí-mer hel und be-kuem./"}'::jsonb,
        '{"c": "Friend", "t": "What do you do at the weekend?", "es": "¿Qué haces el fin de semana?", "pron": "/uat du iu du at de uikénd?/", "de": "Was machst du am Wochenende?", "pron_de": "/vas majst du am vojen-énde?/"}'::jsonb,
        '{"c": "Alex", "t": "We often walk the dog in the park, and I really enjoy that.", "es": "A menudo paseamos al perro por el parque y eso me gusta mucho.", "pron": "/ui ófen uok de dog in de park, and ai ríali enyói dat./", "de": "Wir gehen oft mit dem Hund im Park spazieren, und das mag ich sehr.", "pron_de": "/vir gé-en oft mit dem hunt im park shpa-tsí-ren, und das mak ij zer./"}'::jsonb,
        '{"c": "Friend", "t": "Is there anything you do not like?", "es": "¿Hay algo que no te guste?", "pron": "/is der énizing iu du not láik?/", "de": "Gibt es etwas, das du nicht magst?", "pron_de": "/gibt es ét-vas, das du nijt makst?/"}'::jsonb,
        '{"c": "Alex", "t": "I do not like waiting for the bathroom in the morning.", "es": "No me gusta esperar para usar el baño por la mañana.", "pron": "/ai du not láik uéiting for de bázrum in de mórning./", "de": "Ich mag es nicht, morgens auf das Bad zu warten.", "pron_de": "/ij mak es nijt, mór-gens auf das baad tsu vár-ten./"}'::jsonb,
        '{"c": "Friend", "t": "And the food?", "es": "¿Y la comida?", "pron": "/and de fud?/", "de": "Und das Essen?", "pron_de": "/und das é-sen?/"}'::jsonb,
        '{"c": "Alex", "t": "I love the food, but dinner is a little early for me.", "es": "Me encanta la comida, pero la cena es un poco temprano para mí.", "pron": "/ai lav de fud, bat díner is a lídel érli for mi./", "de": "Ich liebe das Essen, aber das Abendessen ist für mich etwas früh.", "pron_de": "/ij lí-be das é-sen, á-ber das á-bent-esen ist für mij ét-vas frí./"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM dialogue WHERE step_order = 600 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id,
        600,
        'en',
        'dialogue',
        'social',
        '[
          {"name":"Alex","gender":"male","avatarURL":"https://example.com/avatars/alex.png"},
          {"name":"Friend","gender":"female","avatarURL":"https://example.com/avatars/friend.png"}
        ]'::jsonb
    )RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'es', 'Opiniones sobre la familia anfitriona');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'de', 'Meinungen über die Gastfamilie');

    FOREACH ex IN ARRAY v_lines
    LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_order, ex->>'c', ex->>'t')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_object('translation', ex->>'es', 'pronunciation', ex->>'pron'));

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_object('translation', ex->>'de', 'pronunciation', ex->>'pron_de'));

        v_order := v_order + 1;
    END LOOP;
END;
$seed$;
