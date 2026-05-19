-- ============================================================
-- Seed: A0 English Path – STEP 3360 – Listening – discuss weather conditions
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        $json${"p": "La mañana está nublada y fresca.", "p_de": "Der Morgen ist bewölkt und kühl.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Por la mañana hacen veinte grados.", "p_de": "Am Morgen sind es zwanzig Grad.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "El viento es fuerte cerca del mar.", "p_de": "Der Wind ist in Meeresnähe stark.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Al mediodía el cielo se vuelve más oscuro.", "p_de": "Mittags wird der Himmel dunkler.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "La lluvia ligera empieza después de las cuatro.", "p_de": "Leichter Regen beginnt nach vier Uhr.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "La tarde y la noche estarán completamente secas.", "p_de": "Der Abend und die Nacht bleiben ganz trocken.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Las carreteras pueden estar resbaladizas por la noche.", "p_de": "Die Straßen können am Abend rutschig sein.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Mañana parece soleado y seco.", "p_de": "Morgen sieht es sonnig und trocken aus.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "¿Cuántos grados hace por la mañana?", "p_de": "Wie viele Grad sind es am Morgen?", "s": {"type": "multiple_choice", "options": ["Twelve degrees", "Eighteen degrees", "Twenty-five degrees"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde es fuerte el viento?", "p_de": "Wo ist der Wind stark?", "s": {"type": "multiple_choice", "options": ["Near the sea", "Inside the station", "In the forest only"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿A cuántos grados sube la temperatura al mediodía?", "p_de": "Auf wie viele Grad steigt die Temperatur mittags?", "s": {"type": "multiple_choice", "options": ["Eighteen degrees", "Twelve degrees", "Thirty degrees"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué empieza después de las cuatro?", "p_de": "Was beginnt nach vier Uhr?", "s": {"type": "multiple_choice", "options": ["Light rain", "Heavy snow", "A storm at sunrise"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cómo pueden estar las carreteras por la noche?", "p_de": "Wie können die Straßen am Abend sein?", "s": {"type": "multiple_choice", "options": ["Slippery", "Dusty", "Frozen solid"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué tiempo se espera para mañana?", "p_de": "Welches Wetter wird für morgen erwartet?", "s": {"type": "multiple_choice", "options": ["Sunny and dry", "Stormy and cold", "Foggy all day"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿De qué tema hablan los vecinos?", "p_de": "Worüber sprechen die Nachbarn?", "s": {"type": "multiple_choice", "options": ["The weather today", "A football match", "A train timetable"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Por qué se siente más frío?", "p_de": "Warum fühlt es sich kälter an?", "s": {"type": "multiple_choice", "options": ["Because the wind is strong", "Because it is snowing", "Because the café is closed"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3360 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 3360 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3360, 'en', 'listening', 'nature', $transcript$# AUDIO PROFILE: Neighbour at the café
## "Today's Weather Talk"

## THE SCENE: Two neighbours speak outside a small café near the sea.
They compare the weather now and later today before deciding what to do.

### DIRECTOR'S NOTES
Style:
* Friendly and practical.
* Clear numbers, easy weather words, and simple contrasts.

Pace: Slow and natural.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding basic weather conditions, temperatures, wind, and rain.

#### TRANSCRIPT
[friendly] This morning is cloudy and cool, about twelve degrees.
[clear] The wind is strong near the sea, so it feels colder.
[helpful] Around midday, the sky gets brighter and the temperature rises to eighteen degrees.
[practical] Light rain starts after four o'clock.
[cautious] The evening stays wet, and the roads may be slippery.
[optimistic] Tomorrow looks sunny and dry.$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Hablar del tiempo que hace', 'Escucha a dos vecinos comentar el tiempo, la temperatura, el viento y la lluvia.');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Über das Wetter sprechen', 'Höre zwei Nachbarn, die über Wetter, Temperatur, Wind und Regen sprechen.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
