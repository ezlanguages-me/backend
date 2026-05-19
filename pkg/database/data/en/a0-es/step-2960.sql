-- ============================================================
-- Seed: A0 English Path – STEP 2960 – Listening – find out train times
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Los trenes a Airport Central salen cada treinta minutos por la tarde.", "de": "Die Züge nach Airport Central fahren heute Nachmittag alle dreißig Minuten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El siguiente tren es a las 12:30.", "de": "Der nächste Zug fährt um 12:30 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El tren de la 1:30 es el rápido.", "de": "Der Zug um 1:30 ist der Schnellzug.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El tren rápido sale del andén 4.", "de": "Der Schnellzug fährt von Bahnsteig 4 ab.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los trenes locales salen del andén 4.", "de": "Die Regionalzüge fahren von Bahnsteig 4 ab.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El tren de las 2:00 está cancelado.", "de": "Der Zug um 2:00 fällt aus.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los trenes locales paran en tres estaciones.", "de": "Die Regionalzüge halten an drei Stationen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Si necesitas ayuda, puedes usar el tren de las 2:30 o preguntar en información.", "de": "Wenn du Hilfe brauchst, kannst du den Zug um 2:30 nehmen oder am Informationsschalter fragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuál es el destino de estos trenes?", "de": "Was ist das Ziel dieser Züge?", "s_es": {"type": "multiple_choice", "options": ["Airport Central", "Blue Island", "Greenhill"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Airport Central", "Blue Island", "Greenhill"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el primer tren mencionado?", "de": "Welcher Zug wird als erster genannt?", "s_es": {"type": "multiple_choice", "options": ["El de la 1:00", "El de la 12:30", "El de la 2:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der um 1:00 Uhr", "Der um 12:30 Uhr", "Der um 2:00 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el tren rápido?", "de": "Welcher Zug ist der Schnellzug?", "s_es": {"type": "multiple_choice", "options": ["El de la 1:30", "El de la 1:00", "El de la 2:30"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der um 1:30 Uhr", "Der um 1:00 Uhr", "Der um 2:30 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Desde qué andén sale el tren rápido?", "de": "Von welchem Bahnsteig fährt der Schnellzug?", "s_es": {"type": "multiple_choice", "options": ["Andén 6", "Andén 4", "Andén 2"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bahnsteig 6", "Bahnsteig 4", "Bahnsteig 2"], "answer": 0}}'::jsonb,
        '{"es": "¿Desde qué andén salen los trenes locales?", "de": "Von welchem Bahnsteig fahren die Regionalzüge?", "s_es": {"type": "multiple_choice", "options": ["Andén 4", "Andén 6", "Andén 1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bahnsteig 4", "Bahnsteig 6", "Bahnsteig 1"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tren está cancelado hoy?", "de": "Welcher Zug fällt heute aus?", "s_es": {"type": "multiple_choice", "options": ["El de las 2:00", "El de la 1:30", "El de las 2:30"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der um 2:00 Uhr", "Der um 1:30 Uhr", "Der um 2:30 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto tarda el tren rápido?", "de": "Wie lange braucht der Schnellzug?", "s_es": {"type": "multiple_choice", "options": ["Veinticinco minutos", "Cuarenta minutos", "Una hora"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünfundzwanzig Minuten", "Vierzig Minuten", "Eine Stunde"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde puedes pedir más ayuda?", "de": "Wo kannst du mehr Hilfe bekommen?", "s_es": {"type": "multiple_choice", "options": ["En el mostrador de información", "En la cafetería", "En el aparcamiento"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Informationsschalter", "Im Café", "Auf dem Parkplatz"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2960 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2960 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2960, 'en', 'listening', 'transport', $transcript$
# AUDIO PROFILE: Automated station phone service
## "Trains to Airport Central"

## THE SCENE: A recorded phone message from a station information line
The message gives afternoon train times and explains which trains are fast or local.
It also tells listeners what to do when one train is cancelled.

### DIRECTOR'S NOTES
Style:
* Calm recorded voice with repeated times and platforms.
* Important information comes in short blocks so beginners can follow it.

Pace: Slow and regular, with extra stress on time and platform numbers.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding routine train times from an automated service.
The recording helps with departures, platforms, cancellations, and journey length.

#### TRANSCRIPT
[clear] Hello. This is the Lakeside Station phone service.
[informative] Trains to Airport Central leave every thirty minutes this afternoon.
[steady] The next trains are at 1:00, 1:30, 2:00, and 2:30.
[helpful] The 1:30 train is the fast train, and it arrives in twenty five minutes.
[precise] The fast train leaves from platform 6.
[clear] The local trains leave from platform 4 and stop at three stations.
[important] Today the 2:00 train is cancelled.
[guiding] Please use the 2:30 train or ask at the information desk.

$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha un servicio telefónico de horarios de tren', 'Escucha un mensaje grabado con salidas, andenes y una cancelación.'),
        (v_listening_id, 'de', 'Höre einen telefonischen Zugfahrplan-Service', 'Höre eine aufgezeichnete Nachricht mit Abfahrten, Bahnsteigen und einer Ausfallmeldung.');

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
