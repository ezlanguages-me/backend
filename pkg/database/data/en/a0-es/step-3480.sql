-- ============================================================
-- Seed: A0 English Path – STEP 3480 – Dialogue – talk about climate change basics
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
        $json${"character": "Eva", "text": "Summers in our town feel hotter now.", "es": "Los veranos en nuestro pueblo se sienten más calurosos ahora.", "de": "Die Sommer in unserer Stadt fühlen sich jetzt heißer an."}$json$::jsonb,
        $json${"character": "Mark", "text": "Yes, and last year we had less rain in spring.", "es": "Sí, y el año pasado tuvimos menos lluvia en primavera.", "de": "Ja, und letztes Jahr hatten wir im Frühling weniger Regen."}$json$::jsonb,
        $json${"character": "Eva", "text": "My grandfather says the river is lower than before.", "es": "Mi abuelo dice que el río está más bajo que antes.", "de": "Mein Großvater sagt, dass der Fluss niedriger ist als früher."}$json$::jsonb,
        $json${"character": "Mark", "text": "In other places, people also get more floods and storms.", "es": "En otros lugares, la gente también tiene más inundaciones y tormentas.", "de": "An anderen Orten gibt es auch mehr Überschwemmungen und Stürme."}$json$::jsonb,
        $json${"character": "Eva", "text": "Climate change means the weather pattern changes over many years.", "es": "El cambio climático significa que el patrón del tiempo cambia durante muchos años.", "de": "Klimawandel bedeutet, dass sich das Wettermuster über viele Jahre verändert."}$json$::jsonb,
        $json${"character": "Mark", "text": "Right, it is not only one hot day.", "es": "Exacto, no es solo un día caluroso.", "de": "Genau, es ist nicht nur ein heißer Tag."}$json$::jsonb,
        $json${"character": "Eva", "text": "Can people do something to help?", "es": "¿Puede la gente hacer algo para ayudar?", "de": "Können Menschen etwas tun, um zu helfen?"}$json$::jsonb,
        $json${"character": "Mark", "text": "We can save energy, use buses, and waste less food.", "es": "Podemos ahorrar energía, usar autobuses y desperdiciar menos comida.", "de": "Wir können Energie sparen, Busse benutzen und weniger Essen verschwenden."}$json$::jsonb,
        $json${"character": "Eva", "text": "Big changes are also important from cities and countries.", "es": "Los grandes cambios también son importantes por parte de las ciudades y los países.", "de": "Große Veränderungen von Städten und Ländern sind auch wichtig."}$json$::jsonb,
        $json${"character": "Mark", "text": "Yes, but simple daily actions still matter.", "es": "Sí, pero las acciones sencillas de cada día siguen importando.", "de": "Ja, aber einfache tägliche Handlungen sind trotzdem wichtig."}$json$::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        $json${"p": "Eva dice que los veranos ahora parecen más calurosos.", "p_de": "Eva sagt, dass die Sommer jetzt heißer wirken.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El año pasado tuvieron más lluvia en primavera.", "p_de": "Letztes Jahr hatten sie mehr Regen im Frühling.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Según el abuelo de Eva, el río está más bajo que antes.", "p_de": "Laut Evas Großvater ist der Fluss niedriger als früher.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Mark dice que la gente no puede hacer nada para ayudar.", "p_de": "Mark sagt, dass Menschen nichts tun können, um zu helfen.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Ambos creen que las acciones diarias sencillas siguen importando.", "p_de": "Beide glauben, dass einfache tägliche Handlungen weiterhin wichtig sind.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "¿Quién dice que el río está más bajo?", "p_de": "Wer sagt, dass der Fluss niedriger ist?", "s": {"type": "multiple_choice", "options": ["Eva's grandfather", "The bus driver", "The science teacher on TV"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué problemas menciona Mark en otros lugares?", "p_de": "Welche Probleme nennt Mark an anderen Orten?", "s": {"type": "multiple_choice", "options": ["Floods and storms", "Only snow and ice", "No wind at all"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué significa el cambio climático en el diálogo?", "p_de": "Was bedeutet Klimawandel im Dialog?", "s": {"type": "multiple_choice", "options": ["The weather pattern changes over many years", "One hot afternoon only", "A train arriving late"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué pueden hacer las personas?", "p_de": "Was können Menschen tun?", "s": {"type": "multiple_choice", "options": ["Save energy, use buses, and waste less food", "Use more plastic every day", "Cut down more trees"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Quién más debe hacer cambios importantes?", "p_de": "Wer muss noch wichtige Veränderungen machen?", "s": {"type": "multiple_choice", "options": ["Cities and countries", "Only children at school", "Only tourists"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3480 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 3480 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3480, 'en', 'dialogue', 'nature', $json$[{"name": "Eva", "gender": "female", "avatarURL": "https://example.com/avatars/eva.png"}, {"name": "Mark", "gender": "male", "avatarURL": "https://example.com/avatars/mark.png"}]$json$::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Hablar de lo básico del cambio climático', 'Lee un diálogo simple sobre veranos más calurosos, menos lluvia y acciones posibles.');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Über die Grundlagen des Klimawandels sprechen', 'Lies einen einfachen Dialog über heißere Sommer, weniger Regen und mögliche Handlungen.');

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
