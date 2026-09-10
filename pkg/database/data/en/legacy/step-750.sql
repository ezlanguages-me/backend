-- ============================================================
-- Seed: A0 English Path – STEP 750 – Dialogue – understand a simple phone message and confirm details of the message (Comunicación Telefónica)
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
        '{"c":"Alex","t":"Hello, is this Nina?","es":"Hola, ¿eres Nina?","pron":"/jé-lo, is dis NÍI-na?/","de":"Hallo, bist du Nina?","pron_de":"/HÁ-lo, bist du NÍI-na?/"}'::jsonb,
        '{"c":"Nina","t":"Yes, this is Nina.","es":"Sí, soy Nina.","pron":"/yes, dis is NÍI-na./","de":"Ja, hier ist Nina.","pron_de":"/ya, hiö ist NÍI-na./"}'::jsonb,
        '{"c":"Alex","t":"Hi, I got your message.","es":"Hola, he recibido tu mensaje.","pron":"/jai, ai got ior MÉ-sej./","de":"Hallo, ich habe deine Nachricht bekommen.","pron_de":"/HÁ-lo, iç HÁ-be DÁI-ne NAX-riçt be-KÓ-men./"}'::jsonb,
        '{"c":"Alex","t":"You arrive on Friday at 4:30 PM, right?","es":"Llegas el viernes a las 4:30 PM, ¿verdad?","pron":"/iu a-RÁIV on FRÁi-dei at for TÉR-ti pii-em, rait?/","de":"Du kommst am Freitag um 16:30 Uhr an, richtig?","pron_de":"/du KOMST am FRÁi-tak um SECHS-TSEEN-Ur an, RÍÇ-tiç?/"}'::jsonb,
        '{"c":"Nina","t":"Yes, that is right.","es":"Sí, es correcto.","pron":"/yes, dat is rait./","de":"Ja, das stimmt.","pron_de":"/ya, das STIMT./"}'::jsonb,
        '{"c":"Alex","t":"And you are at Central Station, by the ticket office?","es":"¿Y estás en Central Station, junto a la taquilla?","pron":"/and iu ar at SEN-tral STEI-shon, bai de TÍ-ket Ó-fis?/","de":"Und du bist am Central Station, beim Fahrkartenschalter?","pron_de":"/und du bist am TSEN-tral-sta-TSIÓN, baim FAR-kar-ten-SÁL-teö?/"}'::jsonb,
        '{"c":"Nina","t":"Yes, by the ticket office.","es":"Sí, junto a la taquilla.","pron":"/yes, bai de TÍ-ket Ó-fis./","de":"Ja, beim Fahrkartenschalter.","pron_de":"/ya, baim FAR-kar-ten-SÁL-teö./"}'::jsonb,
        '{"c":"Alex","t":"Great. You have a yellow jacket and one black bag?","es":"Perfecto. ¿Llevas una chaqueta amarilla y una bolsa negra?","pron":"/gréit. iu jav a YÉ-lo JÁ-ket and uan blak bag?/","de":"Super. Du hast eine gelbe Jacke und eine schwarze Tasche?","pron_de":"/SU-peö. du hast ÁI-ne GEL-be YÁ-ke und ÁI-ne SVAR-tse TÁ-she?/"}'::jsonb,
        '{"c":"Nina","t":"Yes. See you there.","es":"Sí. Nos vemos allí.","pron":"/yes. sii iu der./","de":"Ja. Wir sehen uns dort.","pron_de":"/ya. viö ZÉI-en uns dort./"}'::jsonb,
        '{"c":"Alex","t":"Perfect. See you on Friday.","es":"Perfecto. Nos vemos el viernes.","pron":"/pér-fekt. sii iu on FRÁi-dei./","de":"Perfekt. Bis Freitag.","pron_de":"/pér-fekt. bis FRÁi-tak./"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM dialogue WHERE step_order = 750 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 750 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id,
        750,
        'en',
        'dialogue',
        'communication',
        '[{"name":"Nina","gender":"female","avatarURL":"https://example.com/avatars/nina.png"},{"name":"Alex","gender":"male","avatarURL":"https://example.com/avatars/alex.png"}]'::jsonb
    ) RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES
        (v_dialogue_id, 'es', 'Llamada para confirmar'),
        (v_dialogue_id, 'de', 'Bestätigung einer Nachricht');

    FOREACH ex IN ARRAY v_lines LOOP
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
