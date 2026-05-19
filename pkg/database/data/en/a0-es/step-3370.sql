-- ============================================================
-- Seed: A0 English Path – STEP 3370 – Dialogue – talk about nature and weather
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
        $json${"character": "Paula", "text": "The lake looks beautiful today.", "es": "El lago se ve precioso hoy.", "de": "Der See sieht heute wunderschön aus."}$json$::jsonb,
        $json${"character": "Nico", "text": "Yes, and the sky is very clear this morning.", "es": "Sí, y el cielo está muy despejado esta mañana.", "de": "Ja, und der Himmel ist heute Morgen sehr klar."}$json$::jsonb,
        $json${"character": "Paula", "text": "I like the green hills after the rain.", "es": "Me gustan las colinas verdes después de la lluvia.", "de": "Ich mag die grünen Hügel nach dem Regen."}$json$::jsonb,
        $json${"character": "Nico", "text": "Me too, but the wind is still a little cold.", "es": "A mí también, pero el viento todavía está un poco frío.", "de": "Ich auch, aber der Wind ist noch etwas kalt."}$json$::jsonb,
        $json${"character": "Paula", "text": "Do you think it will rain again this afternoon?", "es": "¿Crees que volverá a llover esta tarde?", "de": "Glaubst du, dass es heute Nachmittag wieder regnet?"}$json$::jsonb,
        $json${"character": "Nico", "text": "The app says no, only some clouds later.", "es": "La aplicación dice que no, solo algunas nubes más tarde.", "de": "Die App sagt nein, nur später ein paar Wolken."}$json$::jsonb,
        $json${"character": "Paula", "text": "Great. Then we can walk to the waterfall.", "es": "Genial. Entonces podemos caminar hasta la cascada.", "de": "Super. Dann können wir bis zum Wasserfall laufen."}$json$::jsonb,
        $json${"character": "Nico", "text": "Good idea. We can watch the birds near the trees.", "es": "Buena idea. Podemos ver los pájaros cerca de los árboles.", "de": "Gute Idee. Wir können die Vögel bei den Bäumen beobachten."}$json$::jsonb,
        $json${"character": "Paula", "text": "Let's take water and a light jacket.", "es": "Llevemos agua y una chaqueta ligera.", "de": "Lass uns Wasser und eine leichte Jacke mitnehmen."}$json$::jsonb,
        $json${"character": "Nico", "text": "Perfect. Nature is lovely in this weather.", "es": "Perfecto. La naturaleza está preciosa con este tiempo.", "de": "Perfekt. Die Natur ist bei diesem Wetter wunderschön."}$json$::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        $json${"p": "Paula y Nico creen que el lago está muy bonito hoy.", "p_de": "Paula und Nico finden, dass der See heute sehr schön aussieht.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El viento se siente muy cálido.", "p_de": "Der Wind fühlt sich sehr warm an.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "La aplicación dice que después habrá algunas nubes.", "p_de": "Die App sagt, dass später einige Wolken kommen.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Quieren caminar hasta la cascada.", "p_de": "Sie wollen bis zum Wasserfall laufen.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Deciden llevar solo un paraguas y nada de agua.", "p_de": "Sie beschließen, nur einen Regenschirm und kein Wasser mitzunehmen.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "¿Qué lugar observan al principio?", "p_de": "Welchen Ort sehen sie am Anfang?", "s": {"type": "multiple_choice", "options": ["The lake", "The desert", "The station"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cómo están las colinas después de la lluvia?", "p_de": "Wie sind die Hügel nach dem Regen?", "s": {"type": "multiple_choice", "options": ["Green", "Dry and brown", "Covered in snow"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué pregunta hace Paula sobre la tarde?", "p_de": "Welche Frage stellt Paula über den Nachmittag?", "s": {"type": "multiple_choice", "options": ["If it will rain again", "If the café will open", "If the bus is late"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué animales quieren mirar?", "p_de": "Welche Tiere wollen sie beobachten?", "s": {"type": "multiple_choice", "options": ["Birds", "Horses", "Fish in an aquarium"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué llevan con ellos?", "p_de": "Was nehmen sie mit?", "s": {"type": "multiple_choice", "options": ["Water and a light jacket", "A tent and a lamp", "Only heavy boots"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3370 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 3370 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3370, 'en', 'dialogue', 'nature', $json$[{"name": "Paula", "gender": "female", "avatarURL": "https://example.com/avatars/paula.png"}, {"name": "Nico", "gender": "male", "avatarURL": "https://example.com/avatars/nico.png"}]$json$::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Hablar de la naturaleza y el tiempo', 'Lee un diálogo sencillo sobre un lago, el cielo, el viento y un paseo por la naturaleza.');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Über Natur und Wetter sprechen', 'Lies einen einfachen Dialog über einen See, den Himmel, den Wind und einen Spaziergang in der Natur.');

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
