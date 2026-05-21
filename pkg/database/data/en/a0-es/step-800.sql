-- ============================================================
-- Seed: A0 English Path – STEP 800 – Dialogue – receive simple messages (Teléfono Profesional)
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
        '{"c":"Eva","t":"Good morning, West Lake Design. Eva speaking.","es":"Buenos días, West Lake Design. Habla Eva.","pron":"/gud mór-ning, uest léik di-sáin. é-va spí-king./","de":"Guten Morgen, West Lake Design. Eva am Apparat.","pron_de":"/GU-ten MOR-gen, uest léik di-SÁIN. É-va am A-pa-RÁT./"}'::jsonb,
        '{"c":"Mark","t":"Hello. This is Mark from PrintPoint. Is Mr Reed there, please?","es":"Hola. Soy Mark de PrintPoint. ¿Está el señor Reed, por favor?","pron":"/je-ló. soi mark from print-point. is mís-ter ríd der, plíis?/","de":"Hallo. Hier ist Mark von PrintPoint. Ist Herr Reed da, bitte?","pron_de":"/JA-lo. jíir ist mark fon PRINT-point. ist her ríid daa, BI-te?/"}'::jsonb,
        '{"c":"Eva","t":"He is with a client right now.","es":"Ahora mismo está con un cliente.","pron":"/ji is uid a klái-ent ráit náu./","de":"Er ist gerade bei einem Kunden.","pron_de":"/er ist ge-RÁ-de bai Á-nem KUN-den./"}'::jsonb,
        '{"c":"Mark","t":"Okay. Can you take a message?","es":"De acuerdo. ¿Puede tomar un mensaje?","pron":"/ou-kéi. kan yu téik a mé-sa-ch?/","de":"Okay. Können Sie eine Nachricht aufnehmen?","pron_de":"/o-KÉI. KÖ-nen si ÁI-ne NAJT aufnéemen?/"}'::jsonb,
        '{"c":"Eva","t":"Yes, of course.","es":"Sí, claro.","pron":"/yes, of kórs./","de":"Ja, natürlich.","pron_de":"/yaa, na-TÜR-lich./"}'::jsonb,
        '{"c":"Mark","t":"Please tell him the printer is ready for pickup today.","es":"Por favor, dígale que la impresora está lista para recoger hoy.","pron":"/plíis tel jim de prín-ter is ré-di for pík-ap tu-déi./","de":"Bitte sagen Sie ihm, dass der Drucker heute abholbereit ist.","pron_de":"/BI-te ZÁA-gen si iim, das der DRU-ker HOI-te AP-hol-be-rait ist./"}'::jsonb,
        '{"c":"Eva","t":"The printer is ready for pickup today. Got it.","es":"La impresora está lista para recoger hoy. Entendido.","pron":"/de prín-ter is ré-di for pík-ap tu-déi. got it./","de":"Der Drucker ist heute abholbereit. Verstanden.","pron_de":"/der DRU-ker ist HOI-te AP-hol-be-rait. fer-SHTAN-den./"}'::jsonb,
        '{"c":"Mark","t":"And please ask him to call me before 4 PM at 555-0132.","es":"Y por favor pídale que me llame antes de las 4 PM al 555-0132.","pron":"/and plíis ask jim tu kol mi bi-fór for pí-em at faiv-faiv-faiv-si-ro-uan-tri-tu./","de":"Und bitte bitten Sie ihn, mich vor 16 Uhr unter 555-0132 anzurufen.","pron_de":"/und BI-te BI-ten si iin, mij fór ZEKS-tseen uur UN-ter FAIF-FAIF-FAIF-nul-ains-drai-tsvai AN-tsu-ruu-fen./"}'::jsonb,
        '{"c":"Eva","t":"Before 4 PM at 555-0132. I will pass on the message.","es":"Antes de las 4 PM al 555-0132. Le pasaré el mensaje.","pron":"/bi-fór for pí-em at faiv-faiv-faiv-si-ro-uan-tri-tu. ai uil pas on de mé-sa-ch./","de":"Vor 16 Uhr unter 555-0132. Ich gebe die Nachricht weiter.","pron_de":"/fór ZEKS-tseen uur UN-ter FAIF-FAIF-FAIF-nul-ains-drai-tsvai. ij GÉE-be di NAJT-richt VÁIT-er./"}'::jsonb,
        '{"c":"Mark","t":"Thank you very much.","es":"Muchas gracias.","pron":"/zank yu vé-ri mach./","de":"Vielen Dank.","pron_de":"/FÍI-len dank./"}'::jsonb
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
        WHERE d.step_order = 800 AND d.path_uuid = v_path_id AND d.source_language = 'en'
    );
    DELETE FROM dialogue_lines
    WHERE dialogue_uuid IN (
        SELECT uuid FROM dialogue
        WHERE step_order = 800 AND path_uuid = v_path_id AND source_language = 'en'
    );
    DELETE FROM dialogue_translation
    WHERE dialogue_uuid IN (
        SELECT uuid FROM dialogue
        WHERE step_order = 800 AND path_uuid = v_path_id AND source_language = 'en'
    );
    DELETE FROM dialogue
    WHERE step_order = 800 AND path_uuid = v_path_id AND source_language = 'en';

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id, 800, 'en', 'dialogue', 'professional',
        '[{"name":"Eva","gender":"female","avatarURL":"https://example.com/avatars/eva.png"},{"name":"Mark","gender":"male","avatarURL":"https://example.com/avatars/mark.png"}]'::jsonb
    ) RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'es', 'Mensaje para un compañero');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'de', 'Nachricht für einen Kollegen');

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
