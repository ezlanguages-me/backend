-- ============================================================
-- Seed: A0 English Path – STEP 840 – Dialogue – make an outgoing call and pass on simple, prepared messages (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    ex JSONB;
    v_order SMALLINT := 1;

    v_lines JSONB[] := ARRAY[
        '{"c":"Nina","t":"Good morning, River Bank Offices. Nina speaking.","es":"Buenos días, River Bank Offices. Habla Nina.","pron":"/gud mór-ning, rí-ver bank ó-fi-ses. ní-na spí-king./","de":"Guten Morgen, River Bank Offices. Nina am Apparat.","pron_de":"/GU-ten MOR-gen, RÍ-ver bank Ó-fi-ses. NÍ-na am A-pa-RÁT./"}'::jsonb,
        '{"c":"Ben","t":"Hello. This is Ben from South Park Travel. Can I speak to Ms Klein?","es":"Hola. Soy Ben de South Park Travel. ¿Puedo hablar con la señora Klein?","pron":"/je-ló. dis is ben from saud park trá-vel. kan ai spíik tu mis kláin?/","de":"Hallo. Hier ist Ben von South Park Travel. Kann ich mit Frau Klein sprechen?","pron_de":"/JA-lo. jíir ist ben fon sáud park TRÁ-vel. kan ij mit fráu kláin SHPRÉ-jen?/"}'::jsonb,
        '{"c":"Nina","t":"She is out of the office this morning.","es":"Esta mañana está fuera de la oficina.","pron":"/shi is áut of de ó-fis dis mór-ning./","de":"Sie ist heute Morgen nicht im Büro.","pron_de":"/si ist HOI-te MOR-gen nijt im bü-RÓO./"}'::jsonb,
        '{"c":"Ben","t":"Okay. Can I leave a message for her?","es":"De acuerdo. ¿Puedo dejarle un mensaje?","pron":"/ou-kéi. kan ai líiv a mé-sa-ch for jer?/","de":"Okay. Kann ich eine Nachricht für sie hinterlassen?","pron_de":"/o-KÉI. kan ij ÁI-ne NAJT-richt für si HIN-ter-la-sen?/"}'::jsonb,
        '{"c":"Nina","t":"Yes, please.","es":"Sí, por favor.","pron":"/yes, plíis./","de":"Ja, bitte.","pron_de":"/yaa, BI-te./"}'::jsonb,
        '{"c":"Ben","t":"Please tell her the airport car is booked for Friday at 6 AM.","es":"Por favor, dígale que el coche para el aeropuerto está reservado para el viernes a las 6 AM.","pron":"/plíis tel jer de éir-port kar is bukt for fráid-ei at siks éi-em./","de":"Bitte sagen Sie ihr, dass das Auto zum Flughafen für Freitag um 6 Uhr gebucht ist.","pron_de":"/BI-te ZÁA-gen si iiir, das das Á-uto tsum FLÚUK-haa-fen für FRÁI-taak um ZEKS uur ge-BÚUJT ist./"}'::jsonb,
        '{"c":"Nina","t":"Friday at 6 AM. The airport car is booked.","es":"Viernes a las 6 AM. El coche para el aeropuerto está reservado.","pron":"/fráid-ei at siks éi-em. de éir-port kar is bukt./","de":"Freitag um 6 Uhr. Das Auto zum Flughafen ist gebucht.","pron_de":"/FRÁI-taak um ZEKS uur. das Á-uto tsum FLÚUK-haa-fen ist ge-BÚUJT./"}'::jsonb,
        '{"c":"Ben","t":"Great. Also ask her to send the passenger list before 3 PM.","es":"Muy bien. Además, pídale que envíe la lista de pasajeros antes de las 3 PM.","pron":"/gréit. ól-so ask jer tu send de pá-sen-cher list bi-fór zri pí-em./","de":"Gut. Bitten Sie sie außerdem, die Passagierliste vor 15 Uhr zu schicken.","pron_de":"/gut. BI-ten si si ÁUSS-er-dem, di pa-sa-SCHÍIR-lis-te fór FÜNF-tsen uur tsu SHI-ken./"}'::jsonb,
        '{"c":"Nina","t":"Sure. I will pass on the message.","es":"Claro. Le pasaré el mensaje.","pron":"/shur. ai uil pas on de mé-sa-ch./","de":"Gerne. Ich gebe die Nachricht weiter.","pron_de":"/GER-ne. ij GÉE-be di NAJT-richt VÁIT-er./"}'::jsonb,
        '{"c":"Ben","t":"Thanks very much.","es":"Muchas gracias.","pron":"/zanks vé-ri mach./","de":"Vielen Dank.","pron_de":"/FÍI-len dank./"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO STRICT v_path_id
    FROM path
    WHERE source_language = 'en'
    LIMIT 1;

    DELETE FROM dialogue_lines_translation
    WHERE dialogue_line_uuid IN (
        SELECT dl.uuid FROM dialogue_lines dl
        JOIN dialogue d ON dl.dialogue_uuid = d.uuid
        WHERE d.step_order = 840 AND d.path_uuid = v_path_id AND d.source_language = 'en'
    );
    DELETE FROM dialogue_lines
    WHERE dialogue_uuid IN (
        SELECT uuid FROM dialogue
        WHERE step_order = 840 AND path_uuid = v_path_id AND source_language = 'en'
    );
    DELETE FROM dialogue_translation
    WHERE dialogue_uuid IN (
        SELECT uuid FROM dialogue
        WHERE step_order = 840 AND path_uuid = v_path_id AND source_language = 'en'
    );
    DELETE FROM dialogue
    WHERE step_order = 840 AND path_uuid = v_path_id AND source_language = 'en';

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id, 840, 'en', 'dialogue', 'professional',
        '[{"name":"Nina","gender":"female","avatarURL":"https://example.com/avatars/nina.png"},{"name":"Ben","gender":"male","avatarURL":"https://example.com/avatars/ben.png"}]'::jsonb
    ) RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'es', 'Pasar un mensaje preparado');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'de', 'Vorbereitete Nachricht weitergeben');

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
