-- ============================================================
-- Seed: A0 English Path – STEP 685 – Deck – Teléfono, Correo y Comunicaciones
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        -- Dispositivos y medios
        '{"term":"phone","meaning":"teléfono","de":"Telefon","ex":"She picked up the phone and called her mother.","pron":"/foun/","pron_de":"/te-le-FOUN/"}'::jsonb,
        '{"term":"cell phone / mobile phone","meaning":"teléfono celular / móvil","de":"Handy / Mobiltelefon","ex":"I left my cell phone at home.","pron":"/sel foun/","pron_de":"/HEN-di/"}'::jsonb,
        '{"term":"smartphone","meaning":"teléfono inteligente","de":"Smartphone","ex":"He uses his smartphone for everything.","pron":"/smárt-foun/","pron_de":"/SMART-foun/"}'::jsonb,
        '{"term":"landline","meaning":"teléfono fijo","de":"Festnetztelefon","ex":"They still have a landline at their home.","pron":"/lánd-lain/","pron_de":"/FEST-nets-te-le-foun/"}'::jsonb,
        '{"term":"tablet","meaning":"tableta","de":"Tablet","ex":"She reads books on her tablet.","pron":"/táb-let/","pron_de":"/TAB-löt/"}'::jsonb,
        '{"term":"laptop","meaning":"portátil / laptop","de":"Laptop","ex":"He does all his work on a laptop.","pron":"/láp-top/","pron_de":"/LAP-top/"}'::jsonb,
        '{"term":"computer","meaning":"ordenador / computadora","de":"Computer","ex":"The school provides computers for students.","pron":"/kom-piú-ter/","pron_de":"/kom-PJUU-tö/"}'::jsonb,

        -- Comunicación por voz y mensaje
        '{"term":"call","meaning":"llamada / llamar","de":"Anruf / anrufen","ex":"I will give you a call tonight.","pron":"/kol/","pron_de":"/AN-ruf/"}'::jsonb,
        '{"term":"text message / SMS","meaning":"mensaje de texto","de":"SMS / Textnachricht","ex":"She sent him a text message to confirm the meeting.","pron":"/tekst mé-sach/","pron_de":"/SMS / TEKST-nach-richt/"}'::jsonb,
        '{"term":"voicemail","meaning":"buzón de voz / mensaje de voz","de":"Voicemail / Sprachnachricht","ex":"Please leave a voicemail after the beep.","pron":"/vóis-meil/","pron_de":"/WOISS-mejl/"}'::jsonb,
        '{"term":"missed call","meaning":"llamada perdida","de":"verpasster Anruf","ex":"I had three missed calls from my boss.","pron":"/mist kol/","pron_de":"/fö-PAS-tö AN-ruf/"}'::jsonb,
        '{"term":"hang up","meaning":"colgar (el teléfono)","de":"auflegen","ex":"She hung up before I could explain.","pron":"/hang áp/","pron_de":"/AUF-ley-gön/"}'::jsonb,
        '{"term":"put on hold","meaning":"poner en espera","de":"in die Warteschleife legen","ex":"The operator put me on hold for ten minutes.","pron":"/put on hould/","pron_de":"/WAA-tö-schlai-fö/"}'::jsonb,

        -- Correo y postal
        '{"term":"email","meaning":"correo electrónico / email","de":"E-Mail","ex":"Send me the document by email.","pron":"/í-meil/","pron_de":"/IE-mejl/"}'::jsonb,
        '{"term":"inbox","meaning":"bandeja de entrada","de":"Posteingang","ex":"I have 50 unread messages in my inbox.","pron":"/ín-boks/","pron_de":"/POST-ain-gang/"}'::jsonb,
        '{"term":"attachment","meaning":"archivo adjunto","de":"Anhang","ex":"Please open the attachment I sent.","pron":"/a-tách-ment/","pron_de":"/AN-hang/"}'::jsonb,
        '{"term":"letter","meaning":"carta","de":"Brief","ex":"She wrote a letter to her grandmother.","pron":"/lé-ter/","pron_de":"/BRIEF/"}'::jsonb,
        '{"term":"envelope","meaning":"sobre","de":"Umschlag / Briefumschlag","ex":"Put the letter in the envelope and seal it.","pron":"/én-ve-loup/","pron_de":"/UM-schlaak/"}'::jsonb,
        '{"term":"stamp","meaning":"sello / estampilla","de":"Briefmarke","ex":"You need a stamp to send a letter abroad.","pron":"/stamp/","pron_de":"/BRIEF-maar-kö/"}'::jsonb,
        '{"term":"postcard","meaning":"postal / tarjeta postal","de":"Postkarte","ex":"He sent me a postcard from Paris.","pron":"/póust-kard/","pron_de":"/POST-kaar-tö/"}'::jsonb,
        '{"term":"package / parcel","meaning":"paquete","de":"Paket","ex":"There is a package for you at the reception.","pron":"/pá-kach/","pron_de":"/pö-KET/"}'::jsonb,
        '{"term":"mailbox","meaning":"buzón","de":"Briefkasten","ex":"Check the mailbox for any mail.","pron":"/méil-boks/","pron_de":"/BRIEF-kas-tön/"}'::jsonb,
        '{"term":"postman / mail carrier","meaning":"cartero","de":"Briefträger / Postbote","ex":"The postman delivers mail every morning.","pron":"/póust-man/","pron_de":"/BRIEF-trä-gö/"}'::jsonb,
        '{"term":"post office","meaning":"oficina de correos","de":"Post / Postamt","ex":"I need to go to the post office to send this package.","pron":"/poust ó-fis/","pron_de":"/POST-amt/"}'::jsonb,

        -- Redes e internet
        '{"term":"internet","meaning":"internet","de":"Internet","ex":"Do you have internet access here?","pron":"/ín-ter-net/","pron_de":"/IN-tö-net/"}'::jsonb,
        '{"term":"Wi-Fi","meaning":"wifi","de":"WLAN / Wi-Fi","ex":"What is the Wi-Fi password?","pron":"/uái-fai/","pron_de":"/WAI-fai/"}'::jsonb,
        '{"term":"password","meaning":"contraseña","de":"Passwort","ex":"Do not share your password with anyone.","pron":"/pás-word/","pron_de":"/PASS-wort/"}'::jsonb,
        '{"term":"social media","meaning":"redes sociales","de":"soziale Medien","ex":"She spends too much time on social media.","pron":"/sóu-shal mí-dia/","pron_de":"/SO-tsia-le ME-di-en/"}'::jsonb,
        '{"term":"video call","meaning":"videollamada","de":"Videoanruf","ex":"We had a video call with the whole team.","pron":"/ví-di-ou kol/","pron_de":"/WI-de-o-an-ruf/"}'::jsonb,
        '{"term":"app","meaning":"aplicación / app","de":"App","ex":"There is an app for that.","pron":"/ap/","pron_de":"/ÄP/"}'::jsonb,
        '{"term":"notification","meaning":"notificación","de":"Benachrichtigung","ex":"I turned off notifications to focus on work.","pron":"/no-ti-fi-kéi-shon/","pron_de":"/bö-NACH-rich-ti-gung/"}'::jsonb,
        '{"term":"charge / recharge","meaning":"cargar / recargar (batería)","de":"aufladen","ex":"I need to charge my phone, the battery is low.","pron":"/charch/","pron_de":"/AUF-laa-dön/"}'::jsonb,
        '{"term":"battery","meaning":"batería","de":"Akku / Batterie","ex":"My phone battery is almost dead.","pron":"/bá-te-ri/","pron_de":"/ÄK-ku/"}'::jsonb,
        '{"term":"signal","meaning":"señal","de":"Signal / Empfang","ex":"There is no signal in the mountains.","pron":"/síg-nal/","pron_de":"/ZIG-naal/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 685 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 685, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'es', 'Teléfono, Correo y Comunicaciones', 'Vocabulario para hablar por teléfono, enviar correos electrónicos y cartas, y usar internet y redes sociales.');

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'de', 'Telefon, Post und Kommunikation', '');

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
