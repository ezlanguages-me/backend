        -- ============================================================
        -- Seed: A0 English Path – STEP 7220 – Listening – listen to a personal letter being read (Comunicación Telefónica y Correspondencia Personal)
        -- Source language: Spanish
        -- ============================================================
        DO $seed$
        DECLARE
            v_path_id UUID;
            v_listening_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"es": "La carta está dirigida a la tía Nora.", "de": "Der Brief ist an Tante Nora gerichtet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Oliver está en Brighton para un curso corto de arte.", "de": "Oliver ist für einen kurzen Kunstkurs in Brighton.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Oliver estudia historia junto al mar.", "de": "Oliver studiert Geschichte am Meer.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "Las clases empiezan a las nueve.", "de": "Der Unterricht beginnt um neun Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "El concierto es el viernes por la tarde-noche.", "de": "Das Konzert ist am Freitagabend.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "La bufanda para Nora es roja.", "de": "Der Schal für Nora ist rot.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "Oliver volverá a casa el 22 de junio.", "de": "Oliver kommt am 22. Juni nach Hause zurück.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Oliver quiere saber cómo va el trabajo nuevo de Nora.", "de": "Oliver möchte wissen, wie Noras neuer Job läuft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "¿A quién da las gracias Oliver al principio?", "de": "Wem dankt Oliver am Anfang?", "s_es": {"type": "multiple_choice", "options": ["Aunt Nora for her postcard", "Ben for the concert ticket", "Grandma for the cake"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Tante Nora für ihre Postkarte", "Ben für die Konzertkarte", "Oma für den Kuchen"], "answer": 0}}'::jsonb,
                '{"es": "¿Dónde está Oliver?", "de": "Wo ist Oliver?", "s_es": {"type": "multiple_choice", "options": ["In Brighton", "In Bristol", "In London"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In Brighton", "In Bristol", "In London"], "answer": 0}}'::jsonb,
                '{"es": "¿Con quién camina Oliver a clase?", "de": "Mit wem geht Oliver zum Unterricht?", "s_es": {"type": "multiple_choice", "options": ["With his new roommate, Ben", "With his aunt, Nora", "With his art teacher"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit seinem neuen Mitbewohner Ben", "Mit seiner Tante Nora", "Mit seinem Kunstlehrer"], "answer": 0}}'::jsonb,
                '{"es": "¿Dónde es el concierto?", "de": "Wo ist das Konzert?", "s_es": {"type": "multiple_choice", "options": ["In the town hall", "At the train station", "On the beach"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Rathaus", "Am Bahnhof", "Am Strand"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué regalo compró Oliver?", "de": "Welches Geschenk hat Oliver gekauft?", "s_es": {"type": "multiple_choice", "options": ["A blue scarf", "A green notebook", "A silver mug"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen blauen Schal", "Ein grünes Notizbuch", "Einen silbernen Becher"], "answer": 0}}'::jsonb,
                '{"es": "¿Cuándo vuelve Oliver a casa?", "de": "Wann kommt Oliver nach Hause zurück?", "s_es": {"type": "multiple_choice", "options": ["On 22 June", "On 12 June", "On 22 July"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am 22. Juni", "Am 12. Juni", "Am 22. Juli"], "answer": 0}}'::jsonb,
                '{"es": "¿De quién es la receta de tarta de manzana?", "de": "Wessen Apfelkuchenrezept ist es?", "s_es": {"type": "multiple_choice", "options": ["Grandma''s", "Ben''s", "Nora''s"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Von der Oma", "Von Ben", "Von Nora"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué le pide Oliver a Nora al final?", "de": "Worum bittet Oliver Nora am Ende?", "s_es": {"type": "multiple_choice", "options": ["Write soon and talk about her new job", "Send money for the train", "Visit Brighton next week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bald zu schreiben und von ihrem neuen Job zu erzählen", "Geld für den Zug zu schicken", "Nächste Woche Brighton zu besuchen"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
            DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7220 AND path_uuid = v_path_id);
            DELETE FROM listening WHERE step_order = 7220 AND path_uuid = v_path_id;

            INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
            VALUES (v_path_id, 7220, 'en', 'listening', 'communication', $transcript$
# AUDIO PROFILE: A calm reader sharing a family letter aloud
## A Letter From the Coast

## THE SCENE: Nora sits in a quiet living room and reads a letter from her nephew.
The letter is warm, personal, and full of simple family news.
The listener hears daily routines, a small gift, and a return plan.

### DIRECTOR'S NOTES
Style:
* Warm family letter read clearly, with a short pause after each idea.
* The voice should sound personal, calm, and easy for beginners to follow.

Pace: Slow and steady, like someone reading a letter at home.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how personal letters share news, plans, thanks, and small questions.
The audio helps learners notice dates, places, and polite family language.

#### TRANSCRIPT
[gentle] Reader: Dear Aunt Nora, thank you for your lovely postcard.
[bright] Reader: I am staying in Brighton for a short art course near the sea.
[steady] Reader: My classes start at nine, and I walk to school with my new roommate, Ben.
[happy] Reader: On Friday evening, we are going to a small concert in the town hall.
[thoughtful] Reader: I bought a blue scarf for you at the weekend market.
[calm] Reader: I will come home on 22 June by the afternoon train.
[warm] Reader: Please tell Grandma that I still use her apple cake recipe here.
[friendly] Reader: Write soon and tell me how your new job is going.
[soft] Reader: With love, Oliver.
$transcript$)
            RETURNING uuid INTO v_listening_id;

            INSERT INTO listening_translation (listening_uuid, language, title, description)
            VALUES
                (v_listening_id, 'es', 'Escucha una carta personal leída en voz alta', 'Escucha la lectura de una carta familiar con noticias, planes y un tono cercano.'),
                (v_listening_id, 'de', 'Höre einen persönlichen Brief, der vorgelesen wird', 'Höre das Vorlesen eines Familienbriefs mit Neuigkeiten, Plänen und einem warmen Ton.');

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
