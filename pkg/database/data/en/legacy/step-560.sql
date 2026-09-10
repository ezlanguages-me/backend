-- ============================================================
-- Seed: A0 English Path – STEP 560 – Dialogue – understand, and ask questions about, house rules/conventions, such as the time of meals (Convivencia)
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
        '{"c": "Alex", "t": "Sarah, can I ask a few questions about the house rules?", "es": "Sarah, ¿puedo hacer unas preguntas sobre las normas de la casa?", "pron": "/séra, kan ai ask a fiú kuéstchons abáut de háus rúls?/", "de": "Sarah, kann ich ein paar Fragen zu den Hausregeln stellen?", "pron_de": "/zá-ra, kan ij ain paar frá-gen tsu den haus-ré-geln shté-len?/"}'::jsonb,
        '{"c": "Sarah", "t": "Of course. What do you want to know?", "es": "Claro. ¿Qué quieres saber?", "pron": "/ov kors. uat du iu uant tu nóu?/", "de": "Natürlich. Was möchtest du wissen?", "pron_de": "/na-tür-lij. vas méj-test du ví-sen?/"}'::jsonb,
        '{"c": "Alex", "t": "What time is breakfast on school days?", "es": "¿A qué hora es el desayuno los días de colegio?", "pron": "/uat táim is brékfast on skul déis?/", "de": "Um wie viel Uhr ist das Frühstück an Schultagen?", "pron_de": "/um vi fil uur ist das fríh-shtük an shul-tá-gen?/"}'::jsonb,
        '{"c": "Sarah", "t": "Breakfast is at seven thirty in the kitchen.", "es": "El desayuno es a las siete y media en la cocina.", "pron": "/brékfast is at séven zérti in de kíchen./", "de": "Das Frühstück ist um sieben Uhr dreißig in der Küche.", "pron_de": "/das fríh-shtük ist um zí-ben uur drái-sig in der kü-je./"}'::jsonb,
        '{"c": "Alex", "t": "And dinner? Do I need to say something if I am late?", "es": "¿Y la cena? ¿Tengo que decir algo si llego tarde?", "pron": "/and díner? du ai nid tu séi sámzing if ai am léit?/", "de": "Und das Abendessen? Muss ich etwas sagen, wenn ich spät bin?", "pron_de": "/und das á-bent-esen? mus ij ét-vas zá-gen, ven ij shpét bin?/"}'::jsonb,
        '{"c": "Sarah", "t": "Dinner is at seven. Please send me a message if you are late.", "es": "La cena es a las siete. Por favor, envíame un mensaje si llegas tarde.", "pron": "/díner is at séven. plís send mi a mésich if iu ar léit./", "de": "Das Abendessen ist um sieben. Bitte schicken Sie mir eine Nachricht, wenn Sie spät sind.", "pron_de": "/das á-bent-esen ist um zí-ben. bí-te shí-ken zi mir ai-ne náj-rijt, ven zi shpét zint./"}'::jsonb,
        '{"c": "Alex", "t": "Can I use the kitchen after school?", "es": "¿Puedo usar la cocina después del colegio?", "pron": "/kan ai iús de kíchen áfter skul?/", "de": "Kann ich die Küche nach der Schule benutzen?", "pron_de": "/kan ij di kü-je naj der shú-le be-nú-tsen?/"}'::jsonb,
        '{"c": "Sarah", "t": "Yes, until nine at night. Please clean the table after you eat.", "es": "Sí, hasta las nueve de la noche. Por favor, limpia la mesa después de comer.", "pron": "/ies, antil nain at náit. plís klín de méisa áfter iu ít./", "de": "Ja, bis neun Uhr abends. Bitte machen Sie den Tisch sauber, nachdem Sie gegessen haben.", "pron_de": "/ia, bis noin uur á-bents. bí-te má-jen zi den tish záu-ber, naj-dem zi ge-gé-sen há-ben./"}'::jsonb,
        '{"c": "Alex", "t": "What time are the quiet hours?", "es": "¿A qué hora empiezan las horas de silencio?", "pron": "/uat táim ar de kuái-et áuers?/", "de": "Wann beginnt die Ruhezeit?", "pron_de": "/van be-gínt di rú-e-tsait?/"}'::jsonb,
        '{"c": "Sarah", "t": "They start at ten. After that, please be quiet in the bathroom and hallway.", "es": "Empiezan a las diez. Después de esa hora, por favor, haz poco ruido en el baño y en el pasillo.", "pron": "/déi start at ten. áfter dat, plís bi kuái-et in de bázrum and hóluei./", "de": "Sie beginnt um zehn. Danach seien Sie bitte im Bad und im Flur leise.", "pron_de": "/zi be-gínt um tsein. da-náj zái-en zi bí-te im baad und im flur lái-ze./"}'::jsonb,
        '{"c": "Alex", "t": "Can a friend visit me one afternoon?", "es": "¿Puede visitarme un amigo una tarde?", "pron": "/kan a frend vízit mi uan afternún?/", "de": "Kann mich ein Freund eines Nachmittags besuchen?", "pron_de": "/kan mij ain froint ai-nes náj-mi-tags be-zú-jen?/"}'::jsonb,
        '{"c": "Sarah", "t": "Yes, but ask me first. That is our usual rule.", "es": "Sí, pero pregúntame primero. Esa es nuestra norma habitual.", "pron": "/ies, bat ask mi ferst. dat is áuer iúsual rul./", "de": "Ja, aber fragen Sie mich zuerst. Das ist unsere normale Regel.", "pron_de": "/ia, á-ber frá-gen zi mij tsu-érst. das ist un-ze-re nor-má-le ré-gel./"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM dialogue WHERE step_order = 560 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id,
        560,
        'en',
        'dialogue',
        'social',
        '[
          {"name":"Alex","gender":"male","avatarURL":"https://example.com/avatars/alex.png"},
          {"name":"Sarah","gender":"female","avatarURL":"https://example.com/avatars/sarah.png"}
        ]'::jsonb
    )RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'es', 'Preguntas sobre horarios y normas');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'de', 'Fragen zu Essenszeiten und Hausregeln');

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
