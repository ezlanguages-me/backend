    -- ============================================================
    -- Seed: A0 English Path – STEP 7310 – Listening – follow extended casual conversation
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"es": "Mia se queda a tomar té después de la cena.", "de": "Mia bleibt nach dem Abendessen noch auf einen Tee.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "En la casa de Mia la gente suele levantarse rápido después de comer.", "de": "Bei Mia stehen die Leute nach dem Essen meist schnell auf.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Pablo pregunta por los resultados de un partido.", "de": "Pablo fragt nach den Ergebnissen eines Spiels.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Mia dice que en su familia hablan de películas, política y de jóvenes que se mudan a otras ciudades.", "de": "Mia sagt, dass ihre Familie über Filme, Politik und junge Leute spricht, die in andere Städte ziehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ana dice que su padre quiere hablar de festivales del barrio.", "de": "Ana sagt, dass ihr Vater über Nachbarschaftsfeste sprechen möchte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Mia nota que la gente aquí interrumpe más que en su ciudad.", "de": "Mia bemerkt, dass die Leute hier mehr unterbrechen als in ihrer Stadt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Ana explica que el silencio puede significar que alguien está pensando.", "de": "Ana erklärt, dass Schweigen bedeuten kann, dass jemand nachdenkt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Pablo dice que en el extranjero parecía tímido porque todos respondían muy rápido.", "de": "Pablo sagt, dass er im Ausland schüchtern wirkte, weil alle sehr schnell antworteten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Por qué le gusta a Mia la situación?", "de": "Warum gefällt Mia die Situation?", "s_es": {"type": "multiple_choice", "options": ["Because long conversations feel special", "Because she wants to go home", "Because the table is empty"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil lange Gespräche sich besonders anfühlen", "Weil sie nach Hause will", "Weil der Tisch leer ist"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta hace Pablo?", "de": "Welche Frage stellt Pablo?", "s_es": {"type": "multiple_choice", "options": ["What people talk about after dinner", "Where the bus stop is", "How to make tea"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Worüber man nach dem Essen spricht", "Wo die Bushaltestelle ist", "Wie man Tee macht"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué temas menciona Mia de su familia?", "de": "Welche Themen erwähnt Mia aus ihrer Familie?", "s_es": {"type": "multiple_choice", "options": ["Films, politics, and moving to other cities", "Gardening, rent, and shopping", "Weather, exams, and sports"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Filme, Politik und Umzüge in andere Städte", "Gartenarbeit, Miete und Einkaufen", "Wetter, Prüfungen und Sport"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué quiere comentar el padre de Ana?", "de": "Was möchte Anas Vater besprechen?", "s_es": {"type": "multiple_choice", "options": ["Neighborhood festivals", "A train delay", "A new recipe"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nachbarschaftsfeste", "Eine Zugverspätung", "Ein neues Rezept"], "answer": 0}}'::jsonb,
        '{"es": "Según Pablo, ¿qué muestran los festivales?", "de": "Was zeigen Feste laut Pablo?", "s_es": {"type": "multiple_choice", "options": ["What a community values", "How late people sleep", "What the weather will be"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Was einer Gemeinschaft wichtig ist", "Wie lange Leute schlafen", "Wie das Wetter wird"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué diferencia nota Mia?", "de": "Welchen Unterschied bemerkt Mia?", "s_es": {"type": "multiple_choice", "options": ["People interrupt less here", "People eat faster here", "People never ask questions here"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Leute unterbrechen hier weniger", "Die Leute essen hier schneller", "Die Leute stellen hier nie Fragen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué significa a veces el silencio para Ana?", "de": "Was bedeutet Schweigen für Ana manchmal?", "s_es": {"type": "multiple_choice", "options": ["Someone is thinking", "The topic is boring", "The room is noisy"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Jemand denkt nach", "Das Thema ist langweilig", "Der Raum ist laut"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo parecía Pablo cuando la gente respondía muy rápido?", "de": "Wie wirkte Pablo, wenn die Leute sehr schnell antworteten?", "s_es": {"type": "multiple_choice", "options": ["Shy", "Angry", "Confused"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Schüchtern", "Verärgert", "Verwirrt"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7310 AND path_uuid = v_path_id);
        DELETE FROM listening WHERE step_order = 7310 AND path_uuid = v_path_id;

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 7310, 'en', 'listening', 'social', $transcript$
    # AUDIO PROFILE: Ana, Pablo, and Mia, three people talking after dinner
## "A Long Table Talk"

## THE SCENE: A host family kitchen after a long Sunday meal
Three people stay at the table with tea and fruit. The talk moves from family habits to festivals and communication styles.

### DIRECTOR'S NOTES
Style:
* Warm and reflective conversation with natural turn-taking.
* The speakers move from daily topics to broader cultural ideas without sounding formal.

Pace: Medium and relaxed, like people continuing a friendly dinner conversation.

Accent: Neutral international English.

### SAMPLE CONTEXT
Learners hear how people keep a casual conversation going for a longer time, react to opinions, and compare habits from different places.

#### TRANSCRIPT
[welcoming] Ana: I am glad you could stay for tea, Mia. Dinner is over, but nobody is ready to leave the table.
[relaxed] Mia: I like that. In my home people often stand up quickly, so long conversations feel special.
[curious] Pablo: What do people usually talk about after dinner in your family?
[reflective] Mia: We often talk about films, politics, and why younger people move to other cities.
[light laugh] Ana: Here we do that too, but tonight my father wants to discuss neighborhood festivals.
[interested] Pablo: He says festivals show what a community values.
[thoughtful] Mia: That is true. I also notice that people here interrupt less than in my city.
[calm] Ana: Yes, silence is normal for us. It means someone is thinking, not that the topic is finished.
[friendly] Pablo: I had the opposite problem when I lived abroad. Everyone answered so fast that I looked shy.
[understanding] Mia: These differences are funny once you talk about them openly.
    $transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una conversación casual larga', 'Escucha una sobremesa con familia anfitriona donde se habla de costumbres, festivales y diferencias al conversar.'),
            (v_listening_id, 'de', 'Höre ein längeres lockeres Gespräch', 'Höre ein Tischgespräch in einer Gastfamilie über Gewohnheiten, Feste und Gesprächsunterschiede.');

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
