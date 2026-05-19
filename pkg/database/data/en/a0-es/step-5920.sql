-- ============================================================
-- Seed: A0 English Path – STEP 5920 – Listening – Alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La huésped tiene reserva a nombre de Maria Ruiz.", "de": "Die Gästin hat eine Buchung auf den Namen Maria Ruiz.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La habitación está en la segunda planta.", "de": "Das Zimmer ist im zweiten Stock.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El desayuno empieza a las 6 AM.", "de": "Das Frühstück beginnt um 6 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El Wi-Fi es gratis en cada habitación.", "de": "Das WLAN ist in jedem Zimmer kostenlos.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La huésped puede dejar la maleta detrás del mostrador.", "de": "Die Gästin kann den Koffer hinter dem Schalter lassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El recepcionista dice que la reserva no existe.", "de": "Der Rezeptionist sagt, dass es keine Buchung gibt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La habitación está en la cuarta planta.", "de": "Das Zimmer ist im vierten Stock.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La huésped pregunta por el código del Wi-Fi.", "de": "Die Gästin fragt nach dem WLAN-Code.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿A nombre de quién está la reserva?", "de": "Auf welchen Namen lautet die Buchung?", "s_es": {"type": "multiple_choice", "options": ["Maria Ruiz", "James White", "Anna Smith"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Maria Ruiz", "James White", "Anna Smith"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué piso está la habitación?", "de": "In welchem Stock ist das Zimmer?", "s_es": {"type": "multiple_choice", "options": ["Second floor", "Ground floor", "Fifth floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweiter Stock", "Erdgeschoss", "Fünfter Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo es el desayuno?", "de": "Wann ist Frühstück?", "s_es": {"type": "multiple_choice", "options": ["7 AM to 10 AM", "6 AM to 8 AM", "8 AM to 11 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["7 bis 10 Uhr", "6 bis 8 Uhr", "8 bis 11 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué servicio es gratuito?", "de": "Welche Leistung ist kostenlos?", "s_es": {"type": "multiple_choice", "options": ["Wi-Fi", "Parking", "Laundry"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["WLAN", "Parken", "Wäscherei"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde dejarán la maleta?", "de": "Wo soll der Koffer bleiben?", "s_es": {"type": "multiple_choice", "options": ["Behind the desk", "In the restaurant", "In the car park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hinter dem Schalter", "Im Restaurant", "Auf dem Parkplatz"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué recibe la huésped al final?", "de": "Was bekommt die Gästin am Ende?", "s_es": {"type": "multiple_choice", "options": ["Room key", "Train ticket", "Meal voucher"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zimmerschlüssel", "Zugticket", "Essensgutschein"], "answer": 0}}'::jsonb,
        '{"es": "¿El recepcionista confirma la reserva?", "de": "Bestätigt der Rezeptionist die Buchung?", "s_es": {"type": "multiple_choice", "options": ["Yes", "No", "Only at night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur nachts"], "answer": 0}}'::jsonb,
        '{"es": "¿La huésped pregunta por el código de Wi-Fi?", "de": "Fragt die Gästin nach dem WLAN-Code?", "s_es": {"type": "multiple_choice", "options": ["Yes", "No", "Only later"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur später"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5920 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5920 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5920, 'en', 'listening', 'Alojamiento', $transcript$
# AUDIO PROFILE: James, a hotel receptionist
## "Checking In at Riverside Hotel"

## THE SCENE: A guest arrives after a long journey
The receptionist confirms the booking, gives the room key, and explains the hotel services.
James speaks clearly and repeats the time information.

### DIRECTOR'S NOTES
Style:
* Friendly front-desk voice with short, useful hotel phrases.
* Room numbers, times, and service names are repeated slowly.

Pace: Slow to medium, with pauses before the key details.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear a simple hotel check-in and basic questions about breakfast, Wi-Fi, and luggage.
The audio practises arrival, room keys, and service information.

#### TRANSCRIPT
[welcoming] Receptionist: Good afternoon. Welcome to Riverside Hotel.
[checking] Guest: Hello. I have a booking under Maria Ruiz.
[clear] Receptionist: Yes, I have your booking. Your room is on the second floor.
[practical] Guest: Is breakfast included?
[clear] Receptionist: Yes. Breakfast is from 7 AM to 10 AM.
[helpful] Guest: Do I need a code for the Wi-Fi?
[clear] Receptionist: No. The Wi-Fi is free in every room.
[practical] Guest: Can I leave my suitcase here for an hour?
[helpful] Receptionist: Yes, of course. We will keep it behind the desk.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha la conversación de check-in', 'Escucha una conversación de llegada al hotel con preguntas sobre reserva, desayuno y Wi-Fi.'),
        (v_listening_id, 'de', 'Höre das Check-in-Gespräch', 'Höre ein Ankunftsgespräch im Hotel mit Fragen zu Buchung, Frühstück und WLAN.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;

