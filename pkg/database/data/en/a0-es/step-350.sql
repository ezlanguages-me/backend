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
        -- TRUE / FALSE (10 exercises)
        '{"p":"El huésped tiene una reserva para dos noches.","p_de":"Der Gast hat eine Reservierung für zwei Nächte.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La contraseña del WiFi está en la tarjeta llave.","p_de":"Das WLAN-Passwort steht auf der Schlüsselkarte.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El desayuno termina a las 11 de la mañana.","p_de":"Das Frühstück endet um 11 Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El aparcamiento está detrás del hotel.","p_de":"Der Parkplatz befindet sich hinter dem Hotel.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El WiFi tiene un coste adicional.","p_de":"Das WLAN kostet extra.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El gimnasio está en la segunda planta.","p_de":"Das Fitnessstudio befindet sich im zweiten Stock.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El restaurante sirve cena hasta las 11 de la noche.","p_de":"Das Restaurant serviert das Abendessen bis 23 Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El check-out tardío hay que solicitarlo antes de las 9 AM.","p_de":"Ein später Check-out muss vor 9 Uhr angefragt werden.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El aparcamiento cuesta 5 libras al día.","p_de":"Der Parkplatz kostet 5 Pfund pro Tag.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La recepción está disponible las 24 horas.","p_de":"Die Rezeption ist rund um die Uhr erreichbar.","s":{"type":"true_false","answer":true}}'::jsonb,

        -- MULTIPLE CHOICE (10 exercises) – answers distributed across positions 0, 1 and 2
        '{"p":"¿Cuántas noches va a quedarse Daniel?","p_de":"Wie viele Nächte bleibt Daniel?","s":{"type":"multiple_choice","options":["Una noche","Dos noches","Tres noches"],"answer":1}}'::jsonb,
        '{"p":"¿Dónde se sirve el desayuno?","p_de":"Wo wird das Frühstück serviert?","s":{"type":"multiple_choice","options":["En la planta baja","En el segundo piso","En la azotea"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde está la contraseña del WiFi?","p_de":"Wo steht das WLAN-Passwort?","s":{"type":"multiple_choice","options":["En la tarjeta llave","En la televisión","En recepción"],"answer":0}}'::jsonb,
        '{"p":"¿Cuánto cuesta el aparcamiento al día?","p_de":"Was kostet der Parkplatz pro Tag?","s":{"type":"multiple_choice","options":["5 libras","10 libras","8 libras"],"answer":2}}'::jsonb,
        '{"p":"¿A qué hora termina el desayuno?","p_de":"Um wie viel Uhr endet das Frühstück?","s":{"type":"multiple_choice","options":["A las 9 AM","A las 10 AM","A las 11 AM"],"answer":1}}'::jsonb,
        '{"p":"¿En qué planta está el gimnasio?","p_de":"In welchem Stockwerk befindet sich das Fitnessstudio?","s":{"type":"multiple_choice","options":["En la primera","En la tercera","En la segunda"],"answer":2}}'::jsonb,
        '{"p":"¿Hasta qué hora está abierto el restaurante por la noche?","p_de":"Bis wie viel Uhr ist das Restaurant abends geöffnet?","s":{"type":"multiple_choice","options":["Hasta las 9 PM","Hasta las 10 PM","Hasta las 11 PM"],"answer":1}}'::jsonb,
        '{"p":"¿A qué hora es el check-out?","p_de":"Um wie viel Uhr ist der Check-out?","s":{"type":"multiple_choice","options":["A las 10 AM","A las 12 PM","A las 11 AM"],"answer":2}}'::jsonb,
        '{"p":"Si necesitas toallas extra, ¿a quién llamas?","p_de":"Wen rufst du an, wenn du extra Handtücher brauchst?","s":{"type":"multiple_choice","options":["A recepción","Al restaurante","Al servicio de limpieza"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde está el ascensor?","p_de":"Wo befindet sich der Aufzug?","s":{"type":"multiple_choice","options":["Al fondo del pasillo","En el comedor","Junto a las escaleras a la izquierda"],"answer":2}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 350 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 350 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    350,
    'en',
    'listening',
    'accommodation',
    $transcript$
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
This audio helps learners understand common hotel questions about
facilities, schedules, prices, and directions inside the building.

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
Guest [politely] And what time is check-out?
Receptionist [helpfully] Check-out is at 11 AM. If you need a late check-out, please ask us by 9 AM.
Guest [interested] Does the hotel have a gym?
Receptionist [positively] Yes, the gym is on the second floor. It opens at 6 AM and closes at 10 PM.
Guest [interested] What about dinner? Is the restaurant open tonight?
Receptionist [helpfully] Yes, the restaurant is open for dinner from 7 PM to 10 PM. It is on the ground floor, next to the lounge.
Guest [nodding] Good. And if I need extra towels, who do I call?
Receptionist [warmly] Just call reception from your room. We are available 24 hours a day.
Guest [grateful] Perfect. The elevator is next to the stairs on the left, right?
Receptionist [confirming] That is correct. Have a wonderful stay, Mr Perez.
Guest [gratefully] Thank you very much.
    $transcript$
)RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title)
    VALUES (v_listening_id, 'es', 'Preguntas en el check-in');

    INSERT INTO listening_translation (listening_uuid, language, title)
    VALUES (v_listening_id, 'de', 'Fragen beim Hotel-Check-in');

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
