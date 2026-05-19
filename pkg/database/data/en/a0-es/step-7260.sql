        -- ============================================================
        -- Seed: A0 English Path – STEP 7260 – Listening – listen to a personal email exchange (Comunicación Telefónica y Correspondencia Personal)
        -- Source language: Spanish
        -- ============================================================
        DO $seed$
        DECLARE
            v_path_id UUID;
            v_listening_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"es": "Maya puede ir al picnic del sábado a las once.", "de": "Maya kann am Samstag um elf Uhr zum Picknick kommen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Maya llevará fruta y agua.", "de": "Maya bringt Obst und Wasser mit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Emma se unirá al picnic.", "de": "Emma wird beim Picknick dabei sein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "Leo esperará junto al puente principal.", "de": "Leo wartet an der Hauptbrücke.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Leo llevará bocadillos y una manta pequeña.", "de": "Leo bringt Sandwiches und eine kleine Decke mit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Leo puede quedarse hasta muy tarde.", "de": "Leo kann sehr lange bleiben.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "Después del picnic quieren enviar una foto a Emma.", "de": "Nach dem Picknick wollen sie Emma ein Foto schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Los mensajes son sobre una visita personal el fin de semana.", "de": "Die Nachrichten handeln von einem persönlichen Wochenendbesuch.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "¿Cuál es el asunto del primer correo?", "de": "Was ist der Betreff der ersten E-Mail?", "s_es": {"type": "multiple_choice", "options": ["Saturday visit", "Office meeting", "Train delay"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Saturday visit", "Bürobesprechung", "Zugverspätung"], "answer": 0}}'::jsonb,
                '{"es": "¿A qué hora puede ir Maya al parque?", "de": "Um wie viel Uhr kann Maya in den Park kommen?", "s_es": {"type": "multiple_choice", "options": ["At eleven", "At nine", "At one"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um elf Uhr", "Um neun Uhr", "Um ein Uhr"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué llevará Maya?", "de": "Was bringt Maya mit?", "s_es": {"type": "multiple_choice", "options": ["Fruit and water", "Coffee and cake", "Maps and tickets"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Obst und Wasser", "Kaffee und Kuchen", "Karten und Fahrkarten"], "answer": 0}}'::jsonb,
                '{"es": "¿Por qué no puede ir Emma?", "de": "Warum kann Emma nicht kommen?", "s_es": {"type": "multiple_choice", "options": ["She has a music lesson", "She is on holiday", "She works at the bridge"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie hat Musikunterricht", "Sie ist im Urlaub", "Sie arbeitet an der Brücke"], "answer": 0}}'::jsonb,
                '{"es": "¿Dónde esperará Leo?", "de": "Wo wird Leo warten?", "s_es": {"type": "multiple_choice", "options": ["By the main bridge", "At the bus stop", "Inside the café"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An der Hauptbrücke", "An der Bushaltestelle", "Im Café"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué llevará Leo?", "de": "Was bringt Leo mit?", "s_es": {"type": "multiple_choice", "options": ["Sandwiches and a small blanket", "A guitar and a chair", "A camera and a laptop"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sandwiches und eine kleine Decke", "Eine Gitarre und einen Stuhl", "Eine Kamera und einen Laptop"], "answer": 0}}'::jsonb,
                '{"es": "¿A qué hora empieza la cena familiar de Leo?", "de": "Um wie viel Uhr beginnt Leos Familienessen?", "s_es": {"type": "multiple_choice", "options": ["At six", "At four", "At eight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um sechs Uhr", "Um vier Uhr", "Um acht Uhr"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué debe enviar Maya a Emma después del picnic?", "de": "Was soll Maya Emma nach dem Picknick schicken?", "s_es": {"type": "multiple_choice", "options": ["One photo", "A sandwich", "A bus card"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Foto", "Ein Sandwich", "Eine Buskarte"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
            DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7260 AND path_uuid = v_path_id);
            DELETE FROM listening WHERE step_order = 7260 AND path_uuid = v_path_id;

            INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
            VALUES (v_path_id, 7260, 'en', 'listening', 'communication', $transcript$
# AUDIO PROFILE: Two friends reading short personal emails aloud
## Weekend Picnic Emails

## THE SCENE: Maya and Leo read a friendly email exchange about a weekend picnic.
The messages are personal, practical, and easy to follow.
The listener hears a plan, a reason for one absence, and a simple request.

### DIRECTOR'S NOTES
Style:
* Read the emails with a warm, natural tone, like friends sharing plans.
* Keep the details clear so dates, items, and places are easy to catch.

Pace: Slow to medium pace, with a light pause between each email line.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how personal emails can organise a visit, share details, and ask for a small favour.
The audio helps learners notice useful language for time, place, and friendly planning.

#### TRANSCRIPT
[light] Maya: Subject: Saturday visit.
[cheerful] Maya: Hi Leo, thanks for your message. I can come to River Park on Saturday at eleven.
[practical] Maya: I will bring fruit and a bottle of water for our picnic.
[friendly] Maya: My cousin Emma cannot join us because she has a music lesson.
[replying] Leo: Hi Maya, great. I will wait for you by the main bridge.
[calm] Leo: I can bring sandwiches and a small blanket.
[apologetic] Leo: I cannot stay late because my family dinner starts at six.
[helpful] Leo: Please send one photo to Emma after the picnic.
[warm] Maya: No problem. See you on Saturday.
[closing] Leo: See you then.
$transcript$)
            RETURNING uuid INTO v_listening_id;

            INSERT INTO listening_translation (listening_uuid, language, title, description)
            VALUES
                (v_listening_id, 'es', 'Escucha un intercambio de correos personales', 'Escucha a dos amigos leer en voz alta mensajes personales sobre un picnic y sus detalles.'),
                (v_listening_id, 'de', 'Höre einen Austausch persönlicher E-Mails', 'Höre zwei Freunde, die persönliche Nachrichten über ein Picknick und seine Details vorlesen.');

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
