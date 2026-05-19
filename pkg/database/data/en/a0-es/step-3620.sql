-- ============================================================
-- Seed: A0 English Path – STEP 3620 – Listening – handle hotel check-in/check-out (Alojamiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El huésped se queda dos noches.", "p_de": "Der Gast bleibt zwei Nächte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La habitación es la 512.", "p_de": "Das Zimmer ist 512.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La habitación está en la cuarta planta.", "p_de": "Das Zimmer ist im vierten Stock.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El desayuno es de 7 AM a 10 AM.", "p_de": "Das Frühstück ist von 7 Uhr bis 10 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clave wifi es BlueStay25.", "p_de": "Der WLAN-Code ist BlueStay25.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El check-out es después de las 11 AM.", "p_de": "Der Check-out ist nach 11 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se puede dejar la maleta después del check-out.", "p_de": "Man kann das Gepäck nach dem Check-out abgeben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sala de equipaje está junto al restaurante.", "p_de": "Der Gepäckraum ist neben dem Restaurant.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué documento pide la recepcionista?", "p_de": "Welches Dokument fragt die Rezeptionistin?", "s_es": {"type": "multiple_choice", "options": ["Passport", "Train ticket", "Driving licence"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Reisepass", "Zugticket", "Führerschein"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas noches es la reserva?", "p_de": "Für wie viele Nächte ist die Buchung?", "s_es": {"type": "multiple_choice", "options": ["Two nights", "One night", "Three nights"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Nächte", "Eine Nacht", "Drei Nächte"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué planta está la habitación?", "p_de": "In welchem Stock ist das Zimmer?", "s_es": {"type": "multiple_choice", "options": ["Fifth floor", "Second floor", "Ground floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünfter Stock", "Zweiter Stock", "Erdgeschoss"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se sirve el desayuno?", "p_de": "Wo wird das Frühstück serviert?", "s_es": {"type": "multiple_choice", "options": ["In the dining room", "At reception", "On the roof"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Speisesaal", "An der Rezeption", "Auf dem Dach"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la clave wifi?", "p_de": "Wie lautet der WLAN-Code?", "s_es": {"type": "multiple_choice", "options": ["BlueStay25", "North512", "RoomFive"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["BlueStay25", "North512", "RoomFive"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es el check-out?", "p_de": "Wann ist der Check-out?", "s_es": {"type": "multiple_choice", "options": ["Before 11 AM on Sunday", "At 3 PM on Saturday", "After breakfast every day"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor 11 Uhr am Sonntag", "Um 15 Uhr am Samstag", "Jeden Tag nach dem Frühstück"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace el huésped?", "p_de": "Welche Frage stellt der Gast?", "s_es": {"type": "multiple_choice", "options": ["Can I leave my bag after check-out?", "Can I change to a suite?", "Can I smoke in the room?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kann ich mein Gepäck nach dem Check-out dort lassen?", "Kann ich in eine Suite wechseln?", "Kann ich im Zimmer rauchen?"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la sala de equipaje?", "p_de": "Wo ist der Gepäckraum?", "s_es": {"type": "multiple_choice", "options": ["Next to reception", "In the car park", "Near the pool"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neben der Rezeption", "Auf dem Parkplatz", "Beim Pool"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid FROM listening WHERE step_order = 3620 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening'
        );
        DELETE FROM listening WHERE step_order = 3620 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3620, 'en', 'listening', 'accommodation', $transcript$
# AUDIO PROFILE: Maya, a hotel receptionist speaking to a guest
## "Welcome to North Bay Hotel"

## THE SCENE: A guest arrives and asks one question about departure
The receptionist gives the essential information slowly and clearly.

### DIRECTOR'S NOTES
Style:
* Warm reception voice with simple hotel phrases.
* Important times and numbers are repeated naturally.

Pace: Slow and friendly.

Accent: Neutral accent.

#### TRANSCRIPT
[welcoming] Receptionist: Welcome to North Bay Hotel. Can I have your passport, please?
[polite] Guest: Yes. I have a reservation for two nights.
[clear] Receptionist: Thank you. You are in room 512 on the fifth floor.
[helpful] Receptionist: Breakfast is in the dining room from 7 AM to 10 AM.
[practical] Receptionist: The Wi-Fi code is BlueStay25.
[clear] Receptionist: Check-out is before 11 AM on Sunday.
[asking] Guest: Can I leave my bag after check-out?
[reassuring] Receptionist: Yes, the luggage room is next to reception.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha un check-in y check-out de hotel', 'Escucha una conversación de recepción con número de habitación, desayuno, wifi y salida.'),
            (v_listening_id, 'de', 'Höre Hotel-Check-in und Check-out', 'Höre ein Gespräch an der Rezeption mit Zimmernummer, Frühstück, WLAN und Abreise.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
