-- ============================================================
-- Seed: A0 English Path – STEP 3470 – Listening – weather report
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        $json${"p": "Hoy en el norte está nublado con lluvia ligera.", "p_de": "Heute ist es im Norden bewölkt mit leichtem Regen.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El centro alcanza veinte grados y se mantiene seco.", "p_de": "Die Mitte erreicht zwanzig Grad und bleibt trocken.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "En la costa el viento se para por completo por la tarde.", "p_de": "An der Küste hört der Wind am Nachmittag ganz auf.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "En la montaña hace más frío y nieva por encima de mil metros.", "p_de": "In den Bergen ist es kälter und es schneit über tausend Metern.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Esta noche la lluvia se mueve hacia el oeste.", "p_de": "Heute Nacht zieht der Regen nach Westen.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "En el oeste el cielo se despeja por la noche.", "p_de": "Im Westen klart der Himmel nachts auf.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Mañana por la mañana empieza brillante.", "p_de": "Morgen früh beginnt es hell.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Después de comer vuelven los chubascos en el sur.", "p_de": "Nach dem Mittagessen kommen im Süden wieder Schauer.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "¿Cómo está el norte hoy?", "p_de": "Wie ist es heute im Norden?", "s": {"type": "multiple_choice", "options": ["Cloudy with light rain", "Sunny and hot", "Dry with snow"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cuántos grados alcanza el centro?", "p_de": "Wie viele Grad erreicht die Mitte?", "s": {"type": "multiple_choice", "options": ["Twenty degrees", "Ten degrees", "Thirty degrees"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué pasa en la costa por la tarde?", "p_de": "Was passiert an der Küste am Nachmittag?", "s": {"type": "multiple_choice", "options": ["Strong wind continues", "Heavy snow begins", "The sea disappears"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde nieva?", "p_de": "Wo schneit es?", "s": {"type": "multiple_choice", "options": ["In the mountains above 1,000 metres", "In the city centre at noon", "Inside the café"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Hacia dónde se mueve la lluvia esta noche?", "p_de": "Wohin zieht der Regen heute Nacht?", "s": {"type": "multiple_choice", "options": ["East", "North", "Into the station"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué ocurre en el oeste por la noche?", "p_de": "Was passiert im Westen in der Nacht?", "s": {"type": "multiple_choice", "options": ["Skies clear", "A sandstorm starts", "The temperature reaches thirty"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cómo empieza mañana por la mañana?", "p_de": "Wie beginnt es morgen früh?", "s": {"type": "multiple_choice", "options": ["Bright", "Very foggy and icy", "With a storm at sea"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cuándo vuelven los chubascos al sur?", "p_de": "Wann kommen die Schauer im Süden zurück?", "s": {"type": "multiple_choice", "options": ["After lunch", "Before sunrise", "At midnight only"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3470 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 3470 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3470, 'en', 'listening', 'nature', $transcript$# AUDIO PROFILE: Radio weather presenter
## "Morning Weather Report"

## THE SCENE: A short regional bulletin on the morning radio.
The presenter explains conditions in the north, centre, coast, mountains, and south.

### DIRECTOR'S NOTES
Style:
* Clear, informative, and structured by region.
* Repeated place words and simple weather patterns.

Pace: Slow broadcast pace.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding a basic radio weather report with regions, temperatures, rain, wind, and snow.

#### TRANSCRIPT
[clear] Today, the north is cloudy with light rain.
[steady] The centre stays dry and reaches twenty degrees.
[warning] Strong wind continues on the coast this afternoon.
[informative] Mountain areas are colder, with snow above one thousand metres.
[update] Tonight, the rain moves east and skies clear in the west.
[forward-looking] Tomorrow morning starts bright, but showers return after lunch in the south.$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Escuchar un parte meteorológico', 'Escucha un boletín del tiempo con regiones, lluvia, viento, nieve y temperaturas.');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Einen Wetterbericht hören', 'Höre einen Wetterbericht mit Regionen, Regen, Wind, Schnee und Temperaturen.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
