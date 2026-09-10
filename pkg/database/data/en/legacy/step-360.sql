-- ============================================================
-- Seed: A0 English Path – STEP 360 – Dialogue – ask simple questions of a factual nature and understand the answers (Alojamiento)
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
        '{"c": "Receptionist", "t": "Good evening. Welcome back to Riverside Hotel.", "es": "Buenas tardes. Bienvenida de nuevo al Riverside Hotel.", "pron": "/gud í-vning. uél-kom bak tu rái-ver-said hou-tel./", "de": "Guten Abend. Willkommen zurück im Riverside Hotel.", "pron_de": "/GUU-tön AH-bent. WEL-köm tsu-RÜK im RAIV-ö-said HOU-tel./"}'::jsonb,
        '{"c": "Tourist", "t": "Hello. I have a reservation and a few questions about the hotel services.", "es": "Hola. Tengo una reserva y unas preguntas sobre los servicios del hotel.", "pron": "/he-lóu. ái hav a re-ser-véi-shon and a fiu kuésch-chons a-báut de hou-tel sér-vi-ses./", "de": "Hallo. Ich habe eine Reservierung und ein paar Fragen zu den Hoteldiensten.", "pron_de": "/HA-lou. ai HÄV ö re-sö-VEI-schön änd ö FJUU KWES-tschönz ö-BAUT dö HOU-tel SÖ-vi-siz./"}'::jsonb,
        '{"c": "Receptionist", "t": "Of course. What would you like to know?", "es": "Por supuesto. ¿Qué le gustaría saber?", "pron": "/of kors. uot uud iu láik tu nóu?/", "de": "Natürlich. Was möchten Sie wissen?", "pron_de": "/ov KOOS. WOT wud juu LAIK tö NOU?/"}'::jsonb,
        '{"c": "Tourist", "t": "Is there a gym in the hotel?", "es": "¿Hay gimnasio en el hotel?", "pron": "/is der a dyim in de hou-tel?/", "de": "Gibt es ein Fitnessstudio im Hotel?", "pron_de": "/is DEÖ ö DYIM in dö HOU-tel?/"}'::jsonb,
        '{"c": "Receptionist", "t": "Yes. The gym is on the second floor and it opens at six in the morning.", "es": "Sí. El gimnasio está en la segunda planta y abre a las seis de la mañana.", "pron": "/ies. de dyim is on de sé-kond flor and it óu-pens at siks in de mór-ning./", "de": "Ja. Das Fitnessstudio ist im zweiten Stock und öffnet um sechs Uhr morgens.", "pron_de": "/JAH. dö DYIM is on dö SEK-önt STOK änd it OU-pönz ät ZEKS uur MOO-göns./"}'::jsonb,
        '{"c": "Tourist", "t": "Great. And does the restaurant serve dinner?", "es": "Genial. ¿Y el restaurante sirve cenas?", "pron": "/gréit. and das de rés-to-rant serv dí-ner?/", "de": "Super. Und serviert das Restaurant Abendessen?", "pron_de": "/GREJT. änd DAZ dö RES-tö-rant SÖOV DI-nö?/"}'::jsonb,
        '{"c": "Receptionist", "t": "Yes, dinner is from six to ten in the evening.", "es": "Sí, la cena es de seis a diez de la tarde.", "pron": "/ies, dí-ner is from siks tu ten in de í-vning./", "de": "Ja, das Abendessen ist von sechs bis zehn Uhr abends.", "pron_de": "/JAH, DI-nö is from ZEKS tö TEN in dö IE-vning./"}'::jsonb,
        '{"c": "Tourist", "t": "Can I leave my suitcase after check-out, and is there a shuttle to the airport?", "es": "¿Puedo dejar mi maleta después del check-out y hay lanzadera al aeropuerto?", "pron": "/kan ái liv mai súit-keis áf-ter chek-áut, and is der a shá-tel tu de éir-port?/", "de": "Kann ich meinen Koffer nach dem Check-out lassen, und gibt es einen Shuttle zum Flughafen?", "pron_de": "/kän ai LIIV mai SJIUT-keis AF-tö TSCHEK-aut, änd is DEÖ ö SCHA-töl tö dö EÖ-poot?/"}'::jsonb,
        '{"c": "Receptionist", "t": "Yes. The luggage room is next to reception and it is free. The airport shuttle leaves at eight thirty in the morning.", "es": "Sí. La consigna está al lado de recepción y es gratis. La lanzadera al aeropuerto sale a las ocho y media de la mañana.", "pron": "/ies. de lá-gich rum is nekst tu ri-sép-shon and it is fri. de éir-port shá-tel livs at éit zér-ti in de mór-ning./", "de": "Ja. Der Gepäckraum ist neben der Rezeption und kostenlos. Der Flughafenshuttle fährt um acht Uhr dreißig morgens ab.", "pron_de": "/JAH. dö GE-pek-raum is NEE-bön dö re-tsep-TSION änd KOS-tön-los. dö FLUG-haa-fön-SCHA-töl fät uum ACHT uur DRAI-sig MOO-göns./"}'::jsonb,
        '{"c": "Tourist", "t": "Perfect. Do I need to book the shuttle now?", "es": "Perfecto. ¿Tengo que reservar la lanzadera ahora?", "pron": "/pér-fekt. du ái nid tu buk de shá-tel náu?/", "de": "Perfekt. Muss ich den Shuttle jetzt reservieren?", "pron_de": "/PÖ-fikt. mus ai den SCHA-töl JETZT re-sö-VIIR-ön?/"}'::jsonb,
        '{"c": "Receptionist", "t": "Please book it before nine this evening. I can do that for you now.", "es": "Por favor, resérvela antes de las nueve de esta noche. Puedo hacerlo ahora mismo.", "pron": "/plis buk it bi-fór náin dis í-vning. ái kan du dat for iu náu./", "de": "Bitte reservieren Sie ihn vor neun Uhr heute Abend. Ich kann das jetzt für Sie machen.", "pron_de": "/BI-tö re-sö-VIIR-ön ZIE IIN for NOIN uur HOI-tö AH-bent. ich kan das JETZT foor ZIE MA-chön./"}'::jsonb
    ];

BEGIN

SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM dialogue WHERE step_order = 360 AND path_uuid = v_path_id;

INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
VALUES (
    v_path_id,
    360,
    'en',
    'dialogue',
    'accommodation',
    '[
      {"name": "Receptionist", "gender": "male",   "avatarURL": "https://example.com/avatars/receptionist.png"},
      {"name": "Tourist",      "gender": "female", "avatarURL": "https://example.com/avatars/tourist.png"}
    ]'::jsonb
) RETURNING uuid INTO v_dialogue_id;

INSERT INTO dialogue_translation (dialogue_uuid, language, title)
VALUES (v_dialogue_id, 'es', 'Servicios del hotel');

INSERT INTO dialogue_translation (dialogue_uuid, language, title)
VALUES (v_dialogue_id, 'de', 'Hoteldienste');

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

