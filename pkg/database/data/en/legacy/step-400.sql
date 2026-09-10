-- ============================================================
-- Seed: A0 English Path – STEP 400 – Dialogue – make simple complaints, for example 'The water is cold' (Alojamiento)
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
        '{"c": "Guest", "t": "Hello. I am in room 208. My key card does not open the door.", "es": "Hola. Estoy en la habitación 208. Mi tarjeta llave no abre la puerta.", "pron": "/he-lóu. ái am in rum tu-ou-éit. mai ki kard das not óu-pen de dor./", "de": "Hallo. Ich bin in Zimmer 208. Meine Schlüsselkarte öffnet die Tür nicht.", "pron_de": "/HA-lou. ai äm in RUUM tuu-ou-EIT. mai KII KAARD däs not OU-pön dö DOO./"}'::jsonb,
        '{"c": "Receptionist", "t": "I am sorry. I can make a new card right now.", "es": "Lo siento. Puedo hacer una tarjeta nueva ahora mismo.", "pron": "/ái am só-ri. ái kan méik a niu kard ráit náu./", "de": "Es tut mir leid. Ich kann sofort eine neue Karte machen.", "pron_de": "/ai äm SO-ri. ai kän MEJK ö NJUU KAARD RAIT NAU./"}'::jsonb,
        '{"c": "Guest", "t": "Thank you. The safe in my room does not open either.", "es": "Gracias. La caja fuerte de mi habitación tampoco se abre.", "pron": "/zank iu. de séif in mai rum das not óu-pen í-der./", "de": "Danke. Der Safe in meinem Zimmer geht auch nicht auf.", "pron_de": "/SSÄNK juu. dö SEJF in mai RUUM DAZ not OU-pön II-dö./"}'::jsonb,
        '{"c": "Receptionist", "t": "I understand. Security can help with the safe.", "es": "Entiendo. Seguridad puede ayudar con la caja fuerte.", "pron": "/ái an-der-stánd. si-kiú-ri-ti kan help uid de séif./", "de": "Ich verstehe. Der Sicherheitsdienst kann mit dem Safe helfen.", "pron_de": "/ai an-dö-STÄND. si-KJUU-ri-ti kän HELP wid dö SEJF./"}'::jsonb,
        '{"c": "Guest", "t": "How long does that take? I need my passport from the safe.", "es": "¿Cuánto tarda eso? Necesito mi pasaporte de la caja fuerte.", "pron": "/háu long das dat téik? ái nid mai pás-port from de séif./", "de": "Wie lange dauert das? Ich brauche meinen Pass aus dem Safe.", "pron_de": "/HAU LONG DAZ DÄT TEJK? ai NIID mai PÄS-poot from dö SEJF./"}'::jsonb,
        '{"c": "Receptionist", "t": "About ten minutes. Please try this new card first.", "es": "Unos diez minutos. Pruebe primero esta tarjeta nueva.", "pron": "/a-báut ten mí-nets. plis trái dis niu kard ferst./", "de": "Ungefähr zehn Minuten. Probieren Sie zuerst diese neue Karte.", "pron_de": "/ö-BAUT TEN MI-nöts. PLIIZ TRAI dis NJUU KAARD FÖST./"}'::jsonb,
        '{"c": "Guest", "t": "The new card works. Thank you. Where can I wait?", "es": "La tarjeta nueva funciona. Gracias. ¿Dónde puedo esperar?", "pron": "/de niu kard uerks. zank iu. uér kan ái uéit?/", "de": "Die neue Karte funktioniert. Danke. Wo kann ich warten?", "pron_de": "/dö NJUU KAARD WÖKS. SSÄNK juu. WEÖ kän ai WEJT?/"}'::jsonb,
        '{"c": "Receptionist", "t": "You can wait in the lobby. Security will come to room 208 in ten minutes.", "es": "Puede esperar en el vestíbulo. Seguridad irá a la habitación 208 en diez minutos.", "pron": "/iu kan uéit in de ló-bi. si-kiú-ri-ti uil kom tu rum tu-ou-éit in ten mí-nets./", "de": "Sie können in der Lobby warten. Der Sicherheitsdienst kommt in zehn Minuten zu Zimmer 208.", "pron_de": "/juu kän WEJT in dö LO-bi. si-KJUU-ri-ti wil KOM tö RUUM tuu-ou-EIT in TEN MI-nöts./"}'::jsonb,
        '{"c": "Guest", "t": "One more thing. The water in my shower is cold. It is not hot.", "es": "Una cosa más. El agua de mi ducha está fría. No está caliente.", "pron": "/uán mor zing. de uó-ter in mai sháu-er is kold. it is not hot./", "de": "Noch etwas. Das Wasser in meiner Dusche ist kalt. Es ist nicht heiß.", "pron_de": "/WAN MO SSING. dö WO-tö in mai SHAU-ö iz KOLD. it iz not HOT./"}'::jsonb,
        '{"c": "Receptionist", "t": "I am sorry about that. I will call the maintenance team right now.", "es": "Lo siento por eso. Llamaré al equipo de mantenimiento ahora mismo.", "pron": "/ái am só-ri a-báut dat. ái uil kol de méin-te-nens tim ráit náu./", "de": "Das tut mir leid. Ich rufe jetzt sofort den Wartungsdienst an.", "pron_de": "/ai äm SO-ri ö-BAUT DÄT. ai wil KOL dö MEIN-tö-nöns TIIM RAIT NAU./"}'::jsonb,
        '{"c": "Guest", "t": "Also, the TV in my room does not work. The screen is black.", "es": "Además, el televisor de mi habitación no funciona. La pantalla está en negro.", "pron": "/ól-sou, de tí-vi in mai rum das not uerk. de skrin is blak./", "de": "Außerdem funktioniert der Fernseher in meinem Zimmer nicht. Der Bildschirm ist schwarz.", "pron_de": "/OL-sou, dö TII-VII in mai RUUM DAZ not WÖÖK. dö SKRIN iz BLÄK./"}'::jsonb,
        '{"c": "Receptionist", "t": "I understand. I will send someone to fix the TV and the hot water. I apologize for all the problems.", "es": "Entiendo. Enviaré a alguien a arreglar el televisor y el agua caliente. Me disculpo por todos los problemas.", "pron": "/ái an-der-stánd. ái uil send sóm-uán tu fiks de tí-vi and de hot uó-ter. ái a-pó-lo-dchais for ol de pró-blems./", "de": "Ich verstehe. Ich schicke jemanden, um den Fernseher und das heiße Wasser zu reparieren. Ich entschuldige mich für all die Probleme.", "pron_de": "/ai an-dö-STÄND. ai wil SEND SOM-wän tö FIKS dö TII-VII änd dö HOT WO-tö. ai ö-PO-lö-dyais for OL dö PRO-blöms./"}'::jsonb
    ];

BEGIN

SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM dialogue WHERE step_order = 400 AND path_uuid = v_path_id;

INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
VALUES (
    v_path_id,
    400,
    'en',
    'dialogue',
    'accommodation',
    '[
      {"name": "Guest",        "gender": "male",   "avatarURL": "https://example.com/avatars/guest.png"},
      {"name": "Receptionist", "gender": "female", "avatarURL": "https://example.com/avatars/receptionist.png"}
    ]'::jsonb
) RETURNING uuid INTO v_dialogue_id;

INSERT INTO dialogue_translation (dialogue_uuid, language, title)
VALUES (v_dialogue_id, 'es', 'Problemas con la tarjeta');

INSERT INTO dialogue_translation (dialogue_uuid, language, title)
VALUES (v_dialogue_id, 'de', 'Probleme mit Karte und Safe');

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
