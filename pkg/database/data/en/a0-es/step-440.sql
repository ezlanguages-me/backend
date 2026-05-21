-- ============================================================
-- Seed: A0 English Path – STEP 440 – Dialogue – make a complaint about simple matters, for example 'The light in my room doesn’t work.' (Alojamiento)
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
        '{"c": "Guest", "t": "Good morning. I am in room 402. The light in my room does not work.", "es": "Buenos días. Estoy en la habitación 402. La luz de mi habitación no funciona.", "pron": "/gud mór-ning. ái am in rum for-ou-tu. de láit in mai rum das not uerk./", "de": "Guten Morgen. Ich bin in Zimmer 402. Das Licht in meinem Zimmer funktioniert nicht.", "pron_de": "/GUU-tön MOR-gön. ai bin in TSI-mö for-ou-TUUU. däs LIXT in MAI-nöm TSI-mö funk-tsio-NIIT nixt./"}'::jsonb,
        '{"c": "Receptionist", "t": "I am sorry. We will send maintenance right away.", "es": "Lo siento. Enviaremos mantenimiento enseguida.", "pron": "/ái am só-ri. ui uil send méin-te-nens ráit a-uéi./", "de": "Es tut mir leid. Wir schicken sofort den Hausdienst.", "pron_de": "/es TUUT miö LEIT. wiö SHI-kön zo-FORT dön HAUS-diinst./"}'::jsonb,
        '{"c": "Guest", "t": "The shower is broken, and there is no towel in the bathroom.", "es": "La ducha está rota y no hay toalla en el baño.", "pron": "/de sháu-er is bróu-ken, and der is nou táu-el in de báz-rum./", "de": "Die Dusche ist kaputt, und im Bad gibt es kein Handtuch.", "pron_de": "/dii DUSH-ö ist ka-PUT, unt im BAAD gibt es KAIN HANT-tux./"}'::jsonb,
        '{"c": "Receptionist", "t": "Thank you for telling me. I can send towels now.", "es": "Gracias por decírmelo. Puedo enviar toallas ahora mismo.", "pron": "/zánk iu for té-ling mi. ái kan send táu-els náu./", "de": "Danke, dass Sie es sagen. Ich kann jetzt Handtücher schicken.", "pron_de": "/DÄN-kö, däs ZII es ZAA-gön. ai kän YETST HANT-tü-xö SHI-kön./"}'::jsonb,
        '{"c": "Guest", "t": "When can someone fix the shower?", "es": "¿Cuándo puede alguien arreglar la ducha?", "pron": "/uén kan sóm-uán fiks de sháu-er?/", "de": "Wann kann jemand die Dusche reparieren?", "pron_de": "/WAN kän JEE-mant dii DUSH-ö re-pa-RII-rön?/"}'::jsonb,
        '{"c": "Receptionist", "t": "A technician can come in about twenty minutes.", "es": "Un técnico puede venir en unos veinte minutos.", "pron": "/a tek-ní-shen kan kom in a-báut tuén-ti mí-nets./", "de": "Ein Techniker kann in etwa zwanzig Minuten kommen.", "pron_de": "/ain TEX-ni-kö kän in ET-wa TSWAN-tsig mi-NUU-tön KO-mön./"}'::jsonb,
        '{"c": "Guest", "t": "Do I need a new room?", "es": "¿Necesito una habitación nueva?", "pron": "/du ái nid a niu rum?/", "de": "Brauche ich ein neues Zimmer?", "pron_de": "/BRAU-xö ai ain NOI-ös TSI-mö?/"}'::jsonb,
        '{"c": "Receptionist", "t": "Not now. Let us check the room first.", "es": "Ahora no. Vamos a revisar la habitación primero.", "pron": "/not náu. let as chek de rum ferst./", "de": "Jetzt noch nicht. Lassen Sie uns zuerst das Zimmer prüfen.", "pron_de": "/YETST nox nixt. LA-sön ZII uns tsuu-EÖST däs TSI-mö PRÜÜ-fön./"}'::jsonb,
        '{"c": "Guest", "t": "The window in my room does not close either.", "es": "La ventana de mi habitación tampoco cierra.", "pron": "/de uín-dou in mai rum das not klóus í-der./", "de": "Das Fenster in meinem Zimmer schließt auch nicht.", "pron_de": "/däs FENS-tö in MAI-nöm TSI-mö SHLIIST aux nixt./"}'::jsonb,
        '{"c": "Receptionist", "t": "I understand. I will note that too. Is there anything else?", "es": "Entiendo. Lo anotaré también. ¿Hay algo más?", "pron": "/ái an-der-stánd. ái uil nout dat tu. is der é-ni-zing els?/", "de": "Ich verstehe. Das notiere ich auch. Gibt es noch etwas?", "pron_de": "/ai fö-SHTEE-ö. däs no-TII-rö ai aux. gibt es nox ET-was?/"}'::jsonb,
        '{"c": "Guest", "t": "No, that is all. Thank you for your help.", "es": "No, eso es todo. Gracias por su ayuda.", "pron": "/nou, dat is ol. zánk iu for ior help./", "de": "Nein, das ist alles. Danke für Ihre Hilfe.", "pron_de": "/NAIN, däs ist A-lös. DÄN-kö für II-rö HIL-fö./"}'::jsonb,
        '{"c": "Receptionist", "t": "You are welcome. We will fix everything. I am sorry for the problems.", "es": "De nada. Arreglaremos todo. Lo siento por los problemas.", "pron": "/iu ar uél-kom. ui uil fiks é-vri-zing. ái am só-ri for de pró-blems./", "de": "Gern geschehen. Wir werden alles reparieren. Entschuldigen Sie die Unannehmlichkeiten.", "pron_de": "/GERN gö-SHEE-ön. wiö WER-dön A-lös re-pa-RII-rön. ent-SHUL-di-gön ZII dii UN-an-eem-lix-kai-tön./"}'::jsonb
    ];

BEGIN

SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM dialogue WHERE step_order = 440 AND path_uuid = v_path_id;

INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
VALUES (
    v_path_id,
    440,
    'en',
    'dialogue',
    'accommodation',
    '[
      {"name": "Guest",        "gender": "female", "avatarURL": "https://example.com/avatars/guest.png"},
      {"name": "Receptionist", "gender": "male",   "avatarURL": "https://example.com/avatars/receptionist.png"}
    ]'::jsonb
) RETURNING uuid INTO v_dialogue_id;

INSERT INTO dialogue_translation (dialogue_uuid, language, title)
VALUES (v_dialogue_id, 'es', 'Problemas en la habitación');

INSERT INTO dialogue_translation (dialogue_uuid, language, title)
VALUES (v_dialogue_id, 'de', 'Probleme im Zimmer');

FOREACH ex IN ARRAY v_lines
LOOP
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_order, ex->>'c', ex->>'t')
    RETURNING uuid INTO v_line_id;

    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (
        v_line_id,
        'es',
        jsonb_build_object(
            'translation',   ex->>'es',
            'pronunciation', ex->>'pron'
        )
    );

    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (
        v_line_id,
        'de',
        jsonb_build_object(
            'translation',   ex->>'de',
            'pronunciation', ex->>'pron_de'
        )
    );

    v_order := v_order + 1;
END LOOP;

END;
$seed$;
