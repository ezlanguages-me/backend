-- ============================================================
-- Seed: A0 English Path – STEP 6250 – Listening – escucha una conversación sobre planes sociales (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Sam no tiene planes por el momento.","de": "Sam has no plans yet.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Nora propone ir al cine por la tarde.","de": "Nora suggests going to the cinema in the afternoon.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Sam también quiere pasear por el parque si hace buen tiempo.","de": "Sam also wants to walk in the park if the weather is good.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Mia está libre.","de": "Mia is free.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Pueden elegir el domingo si el sábado está ocupado.","de": "They can choose Sunday if Saturday is too busy.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Sam quiere visitar a su primo por la mañana.","de": "Sam möchte morgens seinen Cousin besuchen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Nora propone ir al cine por la tarde.","de": "Nora schlägt vor, am Nachmittag ins Kino zu gehen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Mia está libre para unirse.","de": "Mia hat Zeit, mitzukommen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué día está hablando Sam?","de": "¿Qué día está hablando Sam?","s_es": {"type": "multiple_choice","options": ["Friday","Tuesday","Saturday"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Viernes","Martes","Sábado"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué actividad propone Nora?","de": "¿Qué actividad propone Nora?","s_es": {"type": "multiple_choice","options": ["The cinema","A museum","A supermarket"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["El cine","Un museo","Un supermercado"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué quiere hacer Sam si hace buen tiempo?","de": "¿Qué quiere hacer Sam si hace buen tiempo?","s_es": {"type": "multiple_choice","options": ["A walk in the park","A dentist appointment","A cooking class"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Un paseo por el parque","Una cita con el dentista","Una clase de cocina"],"answer": 0}}'::jsonb,
        '{"es": "¿Quién más está libre?","de": "¿Quién más está libre?","s_es": {"type": "multiple_choice","options": ["Mia","The bus driver","The teacher"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Mia","El conductor del autobús","El profesor"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué día podrían elegir si el sábado no funciona?","de": "¿Qué día podrían elegir si el sábado no funciona?","s_es": {"type": "multiple_choice","options": ["Sunday","Monday","Friday"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["El domingo","El lunes","El viernes"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué sugiere Nora después?","de": "¿Qué sugiere Nora después?","s_es": {"type": "multiple_choice","options": ["Ask Mia to join them","Buy tickets now","Pack a suitcase"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Invitar a Mia","Comprar entradas ya","Hacer la maleta"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué hará Nora al final?","de": "¿Qué hará Nora al final?","s_es": {"type": "multiple_choice","options": ["Message Mia","Go shopping","Take a nap"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Escribir a Mia","Ir de compras","Dormir un rato"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué tiempo se menciona?","de": "¿Qué tiempo se menciona?","s_es": {"type": "multiple_choice","options": ["Good weather","Snow","Fog"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Buen tiempo","Nieve","Niebla"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 6250 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 6250 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 6250, 'en', 'listening', 'Convivencia', $transcript$
# AUDIO PROFILE: Nora and Sam, friends planning the weekend
## "Maybe Saturday or Sunday"

## THE SCENE: Two friends chat on a sofa after class
They compare a cinema visit, a walk, and a meal with another friend.

### DIRECTOR''S NOTES
Style:
* Simple planning conversation with clear agreement and disagreement.
* Make the options distinct and easy to track.

Pace: Medium-slow, with natural pauses between ideas.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear people choosing between a few social plans.
The audio focuses on days, times, people, and activities.

#### TRANSCRIPT
[opening] Nora: Do you have plans for Saturday?
[checking] Sam: Not yet. I might visit my cousin in the morning.
[idea] Nora: We could go to the cinema in the afternoon.
[thinking] Sam: Maybe. I also want to walk in the park if the weather is good.
[practical] Nora: We can do both if we start early.
[adding] Sam: That is true. Mia said she is free too.
[planning] Nora: Great. We can ask her to join us for dinner.
[confirming] Sam: Yes, and we can choose Sunday if Saturday is too busy.
[closing] Nora: Perfect. I will message her now.
[final] Sam: Nice. Let me know what she says.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'escucha una conversación sobre planes sociales', 'Escucha cómo dos amigos comparan opciones para el fin de semana y deciden qué hacer.'),
        (v_listening_id, 'de', 'höre ein Gespräch über soziale Pläne', 'Höre, wie zwei Freunde Wochenendpläne vergleichen und entscheiden, was sie machen.');

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
