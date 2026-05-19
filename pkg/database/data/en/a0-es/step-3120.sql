-- ============================================================
-- Seed: A0 English Path – STEP 3120 – Listening – understand radio travel updates (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La radio da la informacion a las siete y media.", "de": "Das Radio gibt die Informationen um halb acht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La North Ring Road va lenta por obras.", "de": "Die North Ring Road ist wegen Bauarbeiten langsam.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los conductores que van al aeropuerto deben usar River Road.", "de": "Fahrer zum Flughafen sollen River Road benutzen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El autobús del aeropuerto sale de la parada 4.", "de": "Der Flughafenbus fährt von Haltestelle 4 ab.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El autobús del aeropuerto pasa cada treinta minutos.", "de": "Der Flughafenbus kommt alle dreißig Minuten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El tren a Central Station lleva diez minutos de retraso.", "de": "Der Zug zum Central Station hat zehn Minuten Verspätung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El ferry a South Port está cancelado.", "de": "Die Fähre nach South Port ist abgesagt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay lluvia fuerte cerca de Bridge Road.", "de": "Es gibt starken Regen bei Bridge Road.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué carretera va lenta?", "de": "Welche Straße ist langsam?", "s_es": {"type": "multiple_choice", "options": ["The North Ring Road", "The Green Coast Road", "The Old Market Street"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die North Ring Road", "Die Green Coast Road", "Die Old Market Street"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué va lenta?", "de": "Warum ist sie langsam?", "s_es": {"type": "multiple_choice", "options": ["Because of a small accident", "Because of snow", "Because of a parade"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wegen eines kleinen Unfalls", "Wegen Schnee", "Wegen einer Parade"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué carretera deben usar los conductores al aeropuerto?", "de": "Welche Straße sollen Fahrer zum Flughafen nehmen?", "s_es": {"type": "multiple_choice", "options": ["River Road", "Station Lane", "Hill Street"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["River Road", "Station Lane", "Hill Street"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué parada sale el autobús del aeropuerto?", "de": "Von welcher Haltestelle fährt der Flughafenbus ab?", "s_es": {"type": "multiple_choice", "options": ["Stop 4", "Stop 7", "Stop 1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Haltestelle 4", "Haltestelle 7", "Haltestelle 1"], "answer": 0}}'::jsonb,
        '{"es": "¿Cada cuánto sale el autobús del aeropuerto?", "de": "Wie oft fährt der Flughafenbus?", "s_es": {"type": "multiple_choice", "options": ["Every twenty minutes", "Every thirty minutes", "Every hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alle zwanzig Minuten", "Alle dreißig Minuten", "Jede Stunde"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto retraso tiene el tren a Central Station?", "de": "Wie viel Verspätung hat der Zug zum Central Station?", "s_es": {"type": "multiple_choice", "options": ["Ten minutes", "Twenty minutes", "Five minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zehn Minuten", "Zwanzig Minuten", "Fünf Minuten"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué servicio sale a tiempo?", "de": "Welcher Service fährt pünktlich?", "s_es": {"type": "multiple_choice", "options": ["The ferry to South Port", "The train to Central Station", "The North Ring bus"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Fähre nach South Port", "Der Zug zum Central Station", "Der Bus North Ring"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué deben revisar los viajeros antes de salir de casa?", "de": "Was sollen Reisende vor dem Verlassen des Hauses prüfen?", "s_es": {"type": "multiple_choice", "options": ["Their ticket and travel time", "Their swimming shoes", "Their lunch box only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihr Ticket und ihre Reisezeit", "Ihre Badeschuhe", "Nur ihre Lunchbox"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3120 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 3120 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3120, 'en', 'listening', 'transport', $transcript$
# AUDIO PROFILE: Travel radio host
## "Morning Travel Update"

## THE SCENE: A short live bulletin for people going to the airport, station, and ferry port
The presenter gives simple traffic and transport news for the morning.

### DIRECTOR'S NOTES
Style:
* Clear public travel information with short sentences.
* Numbers, places, and delays are repeated slowly.

Pace: Calm and steady.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding a simple radio update about roads, buses, trains, and ferries.
The recording focuses on time, place, delay, and advice.

#### TRANSCRIPT
[calm] This is City Travel Radio at seven thirty.
[clear] The North Ring Road is slow after a small accident near Junction 8.
[helpful] Drivers to the airport should use River Road this morning.
[informative] The airport bus leaves from Stop 4 every twenty minutes.
[practical] The train to Central Station is ten minutes late because of signal work.
[positive] The ferry to South Port leaves on time.
[warning] There is heavy rain near Bridge Road, so please drive slowly.
[friendly] Check your ticket and your travel time before you leave home.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha actualizaciones de viaje por radio', 'Escucha un boletin de radio con trafico, retrasos y consejos simples para viajar.'),
        (v_listening_id, 'de', 'Höre Reiseinformationen im Radio', 'Höre ein kurzes Radioupdate mit Verkehr, Verspätungen und einfachen Reisetipps.');

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
