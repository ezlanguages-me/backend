-- ============================================================
-- Seed: A0 English Path – STEP 6220 – Listening – escucha una charla informal entre compañeros (Convivencia)
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
        '{"es": "Hana y Ben hablan después de clase.","de": "Hana und Ben sprechen nach dem Unterricht.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La parte oral les resultó fácil.","de": "Der Sprechteil war für sie einfach.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "A Hana le gustó más la actividad de lectura.","de": "Hana mochte die Leseaufgabe lieber.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Sigue lloviendo.","de": "Es regnet immer noch.","s_es": {"type": "true_false","answer": false},"s_de": {"type": "true_false","answer": false}}'::jsonb,
        '{"es": "Hana quiere comprar una bebida antes de irse.","de": "Hana möchte vor dem Gehen noch etwas trinken kaufen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Dónde están Hana y Ben?","de": "Wo sind Hana und Ben?","s_es": {"type": "multiple_choice","options": ["Outside the school gate","In the library","On a train"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Außerhalb des Schultors","In der Bibliothek","In einem Zug"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué parte de la clase le pareció fácil a Ben?","de": "Welcher Teil des Unterrichts war für Ben einfach?","s_es": {"type": "multiple_choice","options": ["The speaking part","The homework","The lunch break"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Der Sprechteil","Die Hausaufgaben","Die Mittagspause"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué actividad prefirió Hana?","de": "Welche Aktivität bevorzugte Hana?","s_es": {"type": "multiple_choice","options": ["The reading activity","The canteen food","The football game"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Die Leseaufgabe","Das Essen in der Mensa","Das Fußballspiel"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué pasó con la lluvia?","de": "Was passierte mit dem Regen?","s_es": {"type": "multiple_choice","options": ["The rain stopped","It got heavier","It started again"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Der Regen hörte auf","Er wurde stärker","Er fing wieder an"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué quiere hacer Hana antes de irse?","de": "Was möchte Hana vor dem Gehen machen?","s_es": {"type": "multiple_choice","options": ["Buy a drink","Call a taxi","Borrow a book"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Ein Getränk kaufen","Ein Taxi rufen","Ein Buch ausleihen"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué ofrece Ben?","de": "Was bietet Ben an?","s_es": {"type": "multiple_choice","options": ["To wait with her","To drive home","To do her homework"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Bei ihr zu warten","Sie nach Hause zu fahren","Ihre Hausaufgaben zu machen"],"answer": 0}}'::jsonb,
        '{"es": "Ben dice que pueden hablar otra vez mañana.","de": "Ben sagt, dass sie morgen wieder sprechen können.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Hana va directamente a casa sin comprar nada.","de": "Hana geht direkt nach Hause, ohne etwas zu kaufen.","s_es": {"type": "true_false","answer": false},"s_de": {"type": "true_false","answer": false}}'::jsonb,
        '{"es": "La conversación termina de forma amistosa.","de": "Die Unterhaltung endet freundlich.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué esperan por el camino?","de": "Worauf warten sie unterwegs?","s_es": {"type": "multiple_choice","options": ["The bus","A taxi","A train"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Den Bus","Ein Taxi","Einen Zug"],"answer": 0}}'::jsonb,
        '{"es": "¿Con quién habla Ben?","de": "Mit wem spricht Ben?","s_es": {"type": "multiple_choice","options": ["Hana","His brother","The guide"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Hana","Seinem Bruder","Dem Guide"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 6220 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 6220 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 6220, 'en', 'listening', 'Convivencia', $transcript$
# AUDIO PROFILE: Hana, a student after class
## "A Quick Chat Before the Bus"

## THE SCENE: Outside the school gate on a mild afternoon
Hana and Ben chat while waiting for the bus and mention the lesson, the weather, and small plans for the evening.

### DIRECTOR''S NOTES
Style:
* Light, everyday conversation with short turns.
* Keep the mood friendly and relaxed.

Pace: Easy and clear, with natural pauses.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners follow a simple chat between peers after class.
The audio focuses on brief opinions, weather, transport, and plans.

#### TRANSCRIPT
[opening] Hana: Hi Ben, did you like the lesson today?
[casual] Ben: Yes, it was fine. The speaking part was easy.
[light] Hana: Good. I liked the reading activity better.
[comment] Ben: Me too. And at least the rain stopped.
[practical] Hana: Yes, the bus stop is much nicer when it is dry.
[checking] Ben: Are you going straight home?
[relaxed] Hana: Not yet. I want to buy a drink first.
[helpful] Ben: I can wait with you if you want.
[grateful] Hana: Thanks. Maybe we can talk again tomorrow.
[closing] Ben: Sure. See you in class.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'escucha una charla informal entre compañeros', 'Escucha una conversación corta y natural sobre clase, tiempo y pequeños planes.'),
        (v_listening_id, 'de', 'höre ein lockeres Gespräch zwischen Mitschülern', 'Höre ein kurzes, natürliches Gespräch über den Unterricht, das Wetter und kleine Pläne.');

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
