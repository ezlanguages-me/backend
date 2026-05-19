-- ============================================================
-- Seed: A0 English Path – STEP 3430 – Listening – nature documentary style audio
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        $json${"p": "Al amanecer hay niebla ligera sobre el humedal.", "p_de": "Bei Sonnenaufgang liegt leichter Nebel über dem Feuchtgebiet.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Los juncos se mueven con un viento muy fuerte.", "p_de": "Die Schilfpflanzen bewegen sich in sehr starkem Wind.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Una garza gris espera peces junto al agua.", "p_de": "Ein grauer Reiher wartet am Wasser auf Fische.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Las ranas cantan desde una orilla fangosa.", "p_de": "Frösche rufen von einem schlammigen Ufer.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Cuando sube el sol, los insectos bajan al barro.", "p_de": "Wenn die Sonne höher steigt, sinken die Insekten in den Schlamm.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Los pájaros pequeños comen insectos.", "p_de": "Die kleinen Vögel fressen Insekten.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El humedal da comida y refugio a muchos animales.", "p_de": "Das Feuchtgebiet bietet vielen Tieren Nahrung und Schutz.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Las zonas protegidas no ayudan a la naturaleza.", "p_de": "Geschützte Gebiete helfen der Natur nicht.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "¿Qué hay sobre el humedal al amanecer?", "p_de": "Was liegt bei Sonnenaufgang über dem Feuchtgebiet?", "s": {"type": "multiple_choice", "options": ["Light mist", "Heavy snow", "Black smoke"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué plantas altas se mueven con el viento?", "p_de": "Welche hohen Pflanzen bewegen sich im Wind?", "s": {"type": "multiple_choice", "options": ["Reeds", "Palm trees", "Roses"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué ave espera peces?", "p_de": "Welcher Vogel wartet auf Fische?", "s": {"type": "multiple_choice", "options": ["A grey heron", "A penguin", "A parrot"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde llaman las ranas?", "p_de": "Wo rufen die Frösche?", "s": {"type": "multiple_choice", "options": ["From the muddy bank", "From the station roof", "From the road"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué pasa cuando el sol sube?", "p_de": "Was passiert, wenn die Sonne höher steigt?", "s": {"type": "multiple_choice", "options": ["Insects rise above the water", "The lake freezes", "The birds go to sleep"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué comen las aves pequeñas?", "p_de": "Was fressen die kleinen Vögel?", "s": {"type": "multiple_choice", "options": ["Insects", "Stone bridges", "Maps"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué da el humedal a los animales?", "p_de": "Was gibt das Feuchtgebiet den Tieren?", "s": {"type": "multiple_choice", "options": ["Food and shelter", "Train tickets", "New houses"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Para qué sirven las áreas protegidas?", "p_de": "Wofür sind geschützte Gebiete gut?", "s": {"type": "multiple_choice", "options": ["They help nature stay healthy", "They stop all rain", "They make the day longer"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3430 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 3430 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3430, 'en', 'listening', 'nature', $transcript$# AUDIO PROFILE: Documentary narrator
## "Morning in the Wetland"

## THE SCENE: Sunrise over a protected wetland.
The narrator describes what happens there as the day begins.

### DIRECTOR'S NOTES
Style:
* Calm, visual, and descriptive.
* Short sentences with clear animal and nature vocabulary.

Pace: Slow documentary pace.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding a simple nature documentary with animals, plants, and habitat words.

#### TRANSCRIPT
[softly] At sunrise, light mist lies over the wetland.
[descriptive] Tall reeds move slowly in the light wind.
[focused] A grey heron stands near the water and waits for fish.
[natural] Frogs call from the muddy bank.
[clear] As the sun gets higher, insects rise above the water.
[lively] Small birds fly low and eat the insects.
[informative] The wetland gives food and shelter to many animals.
[positive] Protected areas like this help nature stay healthy.$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Escuchar un audio estilo documental de naturaleza', 'Escucha una narración sencilla sobre un humedal, animales y hábitats naturales.');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Naturdokumentation im Hörtext verstehen', 'Höre eine einfache Erzählung über ein Feuchtgebiet, Tiere und natürliche Lebensräume.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
