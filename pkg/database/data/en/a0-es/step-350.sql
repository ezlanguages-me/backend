-- ============================================================
-- Seed: A0 English Path – STEP 350 – Listening – ask simple questions of a factual nature at a hotel (Alojamiento)
-- Source language: Spanish
-- ============================================================


DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- TRUE / FALSE (8 exercises)
        '{"p":"El huésped tiene una reserva de hotel.","p_de":"Der Gast hat eine Hotelreservierung.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El desayuno es de 7 a 10 de la mañana.","p_de":"Das Frühstück ist von 7 bis 10 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El desayuno se sirve en el segundo piso.","p_de":"Das Frühstück wird im zweiten Stock serviert.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El WiFi es gratis.","p_de":"Das WLAN ist kostenlos.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La contraseña del WiFi está en la tarjeta llave.","p_de":"Das WLAN-Passwort steht auf der Schlüsselkarte.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El aparcamiento está detrás del hotel.","p_de":"Der Parkplatz ist hinter dem Hotel.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El aparcamiento cuesta 8 libras al día.","p_de":"Der Parkplatz kostet 8 Pfund pro Tag.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El ascensor está al lado de las escaleras a la izquierda.","p_de":"Der Aufzug ist links neben der Treppe.","s":{"type":"true_false","answer":true}}'::jsonb,

        -- MULTIPLE CHOICE (8 exercises)
        '{"p":"¿Qué pregunta hace primero el huésped?","p_de":"Was fragt der Gast zuerst?","s":{"type":"multiple_choice","options":["La hora del desayuno","El precio del parking","La ubicación del ascensor"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde se sirve el desayuno?","p_de":"Wo wird das Frühstück serviert?","s":{"type":"multiple_choice","options":["En la planta baja","En el tercer piso","En la azotea"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde está la contraseña del WiFi?","p_de":"Wo steht das WLAN-Passwort?","s":{"type":"multiple_choice","options":["En la tarjeta llave","En la recepción","En la televisión"],"answer":0}}'::jsonb,
        '{"p":"¿Cuánto cuesta el aparcamiento?","p_de":"Wie viel kostet der Parkplatz?","s":{"type":"multiple_choice","options":["8 libras al día","5 libras al día","Es gratis"],"answer":0}}'::jsonb,
        '{"p":"¿A qué hora es el check-out?","p_de":"Um wie viel Uhr ist der Check-out?","s":{"type":"multiple_choice","options":["A las 11 AM","A las 10 AM","A las 12 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde está el ascensor?","p_de":"Wo ist der Aufzug?","s":{"type":"multiple_choice","options":["Junto a las escaleras a la izquierda","Detrás del hotel","Dentro del comedor"],"answer":0}}'::jsonb,
        '{"p":"¿Qué le da la recepcionista al huésped?","p_de":"Was gibt die Rezeptionistin dem Gast?","s":{"type":"multiple_choice","options":["Una tarjeta llave","Un mapa de la ciudad","Un ticket de desayuno"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde está el aparcamiento del hotel?","p_de":"Wo ist der Hotelparkplatz?","s":{"type":"multiple_choice","options":["Detrás del hotel","Frente al hotel","Bajo el edificio"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 350 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 350 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 350, 'en', 'listening', 'accommodation', $transcript$
# AUDIO PROFILE: Anna and Daniel, receptionist and hotel guest
## "Checking In at City Hotel"

## THE SCENE: Reception at City Hotel
A guest has just arrived with a small suitcase, and the reception area is
calm but busy with late-afternoon arrivals. Anna checks the booking,
hands over the key card, and answers Daniel's practical questions with a
professional, patient tone.

### DIRECTOR'S NOTES
Style:
* Natural hotel front-desk conversation with polite back-and-forth.
* Extra clear delivery for times, locations, and simple service details.

Pace: Calm and efficient, like a normal check-in with short pauses.

Accent: Neutral accent.

### SAMPLE CONTEXT
This kind of audio helps learners understand common hotel questions about
facilities, schedules, and directions inside the building.

#### TRANSCRIPT
Receptionist [professionally] Good afternoon. Welcome to City Hotel. You must be Daniel Perez.
Guest [politely] Yes, that's right. I have a reservation for two nights.
Receptionist [helpfully] Perfect. Here is your key card for room 204.
Guest [curious] Thank you. Before I go upstairs, what time is breakfast?
Receptionist [clearly] Breakfast is from 7 to 10 AM on the ground floor, just past the lounge.
Guest [appreciatively] Great. And is the WiFi free?
Receptionist [matter-of-factly] Yes, it is free in all rooms. The password is printed on your key card.
Guest [checking] Good to know. Is there parking here?
Receptionist [clearly] Yes. The car park is behind the hotel, and it costs £8 per day.
Guest [politely] Thanks. One last thing: what time is check-out?
Receptionist [warmly] Check-out is at 11 AM. The elevator is next to the stairs on the left if you need it.
Guest [gratefully] Perfect. Thanks for your help.
    $transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Preguntas en el check-in del hotel', '');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Fragen beim Hotel-Check-in', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
