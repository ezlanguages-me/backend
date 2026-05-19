-- ============================================================
-- Seed: A0 English Path – STEP 3440 – Dialogue – discuss environmental topics
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        $json${"character": "Sara", "text": "I take a bottle to school every day.", "es": "Llevo una botella al colegio todos los días.", "de": "Ich nehme jeden Tag eine Flasche mit in die Schule."}$json$::jsonb,
        $json${"character": "Luis", "text": "Good idea. I also recycle paper and glass at home.", "es": "Buena idea. Yo también reciclo papel y vidrio en casa.", "de": "Gute Idee. Ich recycle zu Hause auch Papier und Glas."}$json$::jsonb,
        $json${"character": "Sara", "text": "My family turns off the lights when we leave a room.", "es": "Mi familia apaga las luces cuando salimos de una habitación.", "de": "Meine Familie macht das Licht aus, wenn wir einen Raum verlassen."}$json$::jsonb,
        $json${"character": "Luis", "text": "We do that too, and we use less water in the shower.", "es": "Nosotros también, y usamos menos agua en la ducha.", "de": "Das machen wir auch, und wir verbrauchen weniger Wasser beim Duschen."}$json$::jsonb,
        $json${"character": "Sara", "text": "Our class wants to plant trees in the park.", "es": "Nuestra clase quiere plantar árboles en el parque.", "de": "Unsere Klasse möchte Bäume im Park pflanzen."}$json$::jsonb,
        $json${"character": "Luis", "text": "Nice. Trees give shade and clean the air.", "es": "Qué bien. Los árboles dan sombra y limpian el aire.", "de": "Schön. Bäume spenden Schatten und reinigen die Luft."}$json$::jsonb,
        $json${"character": "Sara", "text": "Do you go to school by bus or on foot?", "es": "¿Vas al colegio en autobús o a pie?", "de": "Gehst du mit dem Bus oder zu Fuß zur Schule?"}$json$::jsonb,
        $json${"character": "Luis", "text": "I usually walk. It is healthy and better for the environment.", "es": "Normalmente voy andando. Es saludable y mejor para el medio ambiente.", "de": "Ich gehe normalerweise zu Fuß. Das ist gesund und besser für die Umwelt."}$json$::jsonb,
        $json${"character": "Sara", "text": "Small actions can help a lot.", "es": "Las acciones pequeñas pueden ayudar mucho.", "de": "Kleine Handlungen können viel helfen."}$json$::jsonb,
        $json${"character": "Luis", "text": "Yes, we cannot do everything, but we can start today.", "es": "Sí, no podemos hacerlo todo, pero podemos empezar hoy.", "de": "Ja, wir können nicht alles tun, aber wir können heute anfangen."}$json$::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        $json${"p": "Sara lleva una botella al colegio cada día.", "p_de": "Sara nimmt jeden Tag eine Flasche mit in die Schule.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Luis dice que no recicla nada en casa.", "p_de": "Luis sagt, dass er zu Hause nichts recycelt.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "La clase quiere plantar árboles en el parque.", "p_de": "Die Klasse möchte Bäume im Park pflanzen.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Luis suele ir al colegio en coche.", "p_de": "Luis fährt normalerweise mit dem Auto zur Schule.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Los dos creen que las acciones pequeñas pueden ayudar.", "p_de": "Beide glauben, dass kleine Handlungen helfen können.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "¿Qué recicla Luis en casa?", "p_de": "Was recycelt Luis zu Hause?", "s": {"type": "multiple_choice", "options": ["Paper and glass", "Only metal", "Nothing at all"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué hacen en casa de Sara al salir de una habitación?", "p_de": "Was macht Saras Familie, wenn sie einen Raum verlässt?", "s": {"type": "multiple_choice", "options": ["They turn off the lights", "They open all the windows", "They play music"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué dan los árboles según Luis?", "p_de": "Was geben Bäume laut Luis?", "s": {"type": "multiple_choice", "options": ["Shade and clean air", "Bus tickets and maps", "Snow and ice"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cómo suele ir Luis al colegio?", "p_de": "Wie geht Luis normalerweise zur Schule?", "s": {"type": "multiple_choice", "options": ["On foot", "By plane", "By car"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Por qué es buena esa forma de ir?", "p_de": "Warum ist diese Art gut?", "s": {"type": "multiple_choice", "options": ["It is healthy and better for the environment", "It is louder and slower", "It needs more plastic"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3440 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 3440 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3440, 'en', 'dialogue', 'nature', $json$[{"name": "Sara", "gender": "female", "avatarURL": "https://example.com/avatars/sara.png"}, {"name": "Luis", "gender": "male", "avatarURL": "https://example.com/avatars/luis.png"}]$json$::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Hablar de temas medioambientales', 'Lee un diálogo fácil sobre reciclar, ahorrar agua, caminar y plantar árboles.');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Über Umweltthemen sprechen', 'Lies einen einfachen Dialog über Recycling, Wassersparen, zu Fuß gehen und Bäume pflanzen.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "__ES__"}]}]'::jsonb);
        UPDATE dialogue_lines_translation
        SET meaning = jsonb_set(meaning, '{0,translations,0,translation}', to_jsonb(line->>'es'))
        WHERE dialogue_line_uuid = v_line_uuid AND language = 'es';

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "__DE__"}]}]'::jsonb);
        UPDATE dialogue_lines_translation
        SET meaning = jsonb_set(meaning, '{0,translations,0,translation}', to_jsonb(line->>'de'))
        WHERE dialogue_line_uuid = v_line_uuid AND language = 'de';

        v_order := v_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
