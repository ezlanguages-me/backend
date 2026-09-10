-- ============================================================
-- Seed: A0 English Path – STEP 520 – Dialogue – make a simple complaint, for example "The cooker is broken. Can you replace it?" (Alquileres)
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
        '{"c": "Tenant", "t": "Hello, Mr Green. I have a problem with the cooker in flat 2A.", "es": "Hola, señor Green. Tengo un problema con la cocina del piso 2A.", "pron": "/helóu, míster grín. ai hav a próblem uid de kúker in flat tu ei./", "de": "Hallo, Herr Green. Ich habe ein Problem mit dem Herd in Wohnung 2A.", "pron_de": "/há-lo, her grín. ij há-be ain pro-blém mit dem hert in vó-nung tsu a./"}'::jsonb,
        '{"c": "Landlord", "t": "Oh no. What is wrong with it?", "es": "Oh, no. ¿Qué le pasa?", "pron": "/ou nóu. uat is rong uid it?/", "de": "Oh nein. Was ist damit los?", "pron_de": "/ou nain. vas ist da-mit los?/"}'::jsonb,
        '{"c": "Tenant", "t": "It does not turn on, and I cannot make dinner.", "es": "No se enciende y no puedo preparar la cena.", "pron": "/it das not tern on, and ai kánot méik díner./", "de": "Es geht nicht an, und ich kann kein Abendessen machen.", "pron_de": "/es geit nijt an, und ij kan kain á-bent-esen má-jen./"}'::jsonb,
        '{"c": "Landlord", "t": "I understand. Since when is it broken?", "es": "Entiendo. ¿Desde cuándo está rota?", "pron": "/ai anderstánd. sins uen is it bróuken?/", "de": "Ich verstehe. Seit wann ist er kaputt?", "pron_de": "/ij fershtée. zait van ist er ka-pút?/"}'::jsonb,
        '{"c": "Tenant", "t": "Since last night. I tried again this morning, but it still does not work.", "es": "Desde anoche. Lo intenté otra vez esta mañana, pero todavía no funciona.", "pron": "/sins last náit. ai tráid agén dis mórning, bat it stil das not uerk./", "de": "Seit gestern Abend. Ich habe es heute Morgen noch einmal versucht, aber es funktioniert immer noch nicht.", "pron_de": "/zait gés-tern á-bent. ij há-be es hói-te mór-gen noj ain-mal fer-zújt, á-ber es funk-tsio-nírt ímer noj nijt./"}'::jsonb,
        '{"c": "Landlord", "t": "Can a technician come tomorrow afternoon?", "es": "¿Puede venir un técnico mañana por la tarde?", "pron": "/kan a tekníshan kam tumórou afternún?/", "de": "Kann morgen Nachmittag ein Techniker kommen?", "pron_de": "/kan mór-gen náj-mi-tag ain téjni-ker kó-men?/"}'::jsonb,
        '{"c": "Tenant", "t": "Tomorrow is difficult. Can someone come on Thursday morning?", "es": "Mañana es difícil. ¿Puede venir alguien el jueves por la mañana?", "pron": "/tumórou is dífikelt. kan sámuan kam on zérsdei mórning?/", "de": "Morgen ist schwierig. Kann jemand am Donnerstagmorgen kommen?", "pron_de": "/mór-gen ist shví-rig. kan yé-mant am dónershtag-mórgen kó-men?/"}'::jsonb,
        '{"c": "Landlord", "t": "Yes, Thursday morning is possible.", "es": "Sí, el jueves por la mañana es posible.", "pron": "/ies, zérsdei mórning is pósibel./", "de": "Ja, Donnerstagmorgen ist möglich.", "pron_de": "/ia, dónershtag-mórgen ist méuglij./"}'::jsonb,
        '{"c": "Tenant", "t": "Thank you. And if they cannot repair it, can you replace it?", "es": "Gracias. Y si no pueden repararla, ¿puede sustituirla?", "pron": "/zank iu. and if déi kánot ripér it, kan iu ripléis it?/", "de": "Danke. Und wenn man ihn nicht reparieren kann, können Sie ihn ersetzen?", "pron_de": "/dán-ke. und ven man in nijt re-pa-rí-ren kan, kó-nen zi in er-zétsen?/"}'::jsonb,
        '{"c": "Landlord", "t": "Yes. If it is too old or too damaged, I can replace it.", "es": "Sí. Si es demasiado vieja o está demasiado dañada, puedo sustituirla.", "pron": "/ies. if it is tu óuld or tu dámachd, ai kan ripléis it./", "de": "Ja. Wenn er zu alt oder zu stark beschädigt ist, kann ich ihn ersetzen.", "pron_de": "/ia. ven er tsu alt ó-der tsu shtark be-shé-digt ist, kan ij in er-zétsen./"}'::jsonb,
        '{"c": "Tenant", "t": "That sounds good. Please send me a message before the visit.", "es": "Eso suena bien. Por favor, mándeme un mensaje antes de la visita.", "pron": "/dat sáunds gud. plís send mi a mésich bifór de vízit./", "de": "Das klingt gut. Bitte schicken Sie mir vor dem Termin eine Nachricht.", "pron_de": "/das klingt gut. bí-te shí-ken zi mir for dem ter-mín ai-ne náj-rijt./"}'::jsonb,
        '{"c": "Landlord", "t": "Of course. I will text you on Wednesday evening.", "es": "Por supuesto. Le escribiré el miércoles por la tarde.", "pron": "/ov kors. ai uil tekst iu on uénsdei ívning./", "de": "Natürlich. Ich schreibe Ihnen am Mittwochabend.", "pron_de": "/na-tür-lij. ij shrái-be í-nen am mítvoj-á-bent./"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM dialogue WHERE step_order = 520 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id,
        520,
        'en',
        'dialogue',
        'accommodation',
        '[
          {"name":"Tenant","gender":"female","avatarURL":"https://example.com/avatars/tenant.png"},
          {"name":"Landlord","gender":"male","avatarURL":"https://example.com/avatars/landlord.png"}
        ]'::jsonb
    )RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'es', 'Queja por la cocina rota');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'de', 'Beschwerde über den kaputten Herd');

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
