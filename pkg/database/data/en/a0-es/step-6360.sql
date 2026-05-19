-- ============================================================
-- Seed: A0 English Path – STEP 6360 – Dialogue – habla sobre costumbres culturales (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Iris","text": "In your home, do people take off their shoes?","es": "En tu casa, ¿la gente se quita los zapatos?","de": "Zieht man bei euch zu Hause die Schuhe aus?"}'::jsonb,
        '{"character": "Marco","text": "Yes, usually we do. It feels cleaner.","es": "Sí, normalmente sí. Se siente más limpio.","de": "Ja, normalerweise schon. Das fühlt sich sauberer an."}'::jsonb,
        '{"character": "Iris","text": "That makes sense. We do that in my family too.","es": "Tiene sentido. En mi familia también lo hacemos.","de": "Das ergibt Sinn. Das machen wir in meiner Familie auch."}'::jsonb,
        '{"character": "Marco","text": "Do you greet guests with a kiss or just a hello?","es": "¿Saludáis a los invitados con un beso o solo con un hola?","de": "Begrüßt ihr Gäste mit einem Kuss oder nur mit einem Hallo?"}'::jsonb,
        '{"character": "Iris","text": "Usually just hello, unless we know them very well.","es": "Normalmente solo con hola, a menos que los conozcamos mucho.","de": "Normalerweise nur mit Hallo, außer wir kennen sie sehr gut."}'::jsonb,
        '{"character": "Marco","text": "Interesting. We also speak quite directly at home.","es": "Interesante. En mi casa también hablamos bastante directamente.","de": "Interessant. Bei uns zu Hause sprechen wir auch recht direkt."}'::jsonb,
        '{"character": "Iris","text": "I think that helps avoid confusion.","es": "Creo que eso ayuda a evitar confusiones.","de": "Ich denke, das hilft, Verwirrung zu vermeiden."}'::jsonb,
        '{"character": "Marco","text": "Yes. Different customs, but the same respect.","es": "Sí. Costumbres distintas, pero el mismo respeto.","de": "Ja. Unterschiedliche Gepflogenheiten, aber derselbe Respekt."}'::jsonb,
        '{"character": "Iris","text": "Exactly. That''s what matters.","es": "Exacto. Eso es lo que importa.","de": "Genau. Das ist das Wichtige."}'::jsonb,
        '{"character": "Marco","text": "Thanks for talking about it.","es": "Gracias por hablar de ello.","de": "Danke, dass wir darüber gesprochen haben."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Iris y Marco comparan costumbres en casa.","de": "Iris und Marco vergleichen Gepflogenheiten zu Hause.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Marco dice que quitarse los zapatos se siente menos limpio.","de": "Marco sagt, dass Schuhe ausziehen sich weniger sauber anfühlt.","s_es": {"type": "true_false","answer": false},"s_de": {"type": "true_false","answer": false}}'::jsonb,
        '{"es": "Iris saluda normalmente solo con hola.","de": "Iris begrüßt normalerweise nur mit Hallo.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Ambos creen que el respeto es importante.","de": "Beide denken, dass Respekt wichtig ist.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Hablan de costumbres diferentes pero del mismo valor.","de": "Sie sprechen über unterschiedliche Gepflogenheiten, aber denselben Wert.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué hábito de casa mencionan primero?","de": "Welche Gewohnheit zu Hause erwähnen sie zuerst?","s_es": {"type": "multiple_choice","options": ["Taking off shoes","Eating dessert","Using a taxi"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Die Schuhe ausziehen","Dessert essen","Ein Taxi benutzen"],"answer": 0}}'::jsonb,
        '{"es": "¿Cómo saludan normalmente a los invitados?","de": "Wie begrüßen sie Gäste normalerweise?","s_es": {"type": "multiple_choice","options": ["With a hello","With a letter","With no words"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Mit einem Hallo","Mit einem Brief","Ohne Worte"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué ayuda a evitar confusión?","de": "Was hilft, Verwirrung zu vermeiden?","s_es": {"type": "multiple_choice","options": ["Speaking directly","Speaking only in songs","Never answering"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Direkt sprechen","Nur in Liedern sprechen","Nie antworten"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué idea final comparten?","de": "Welche Schlussidee teilen sie?","s_es": {"type": "multiple_choice","options": ["Different customs can still show respect","Only one culture is correct","Customs do not matter at all"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Unterschiedliche Gepflogenheiten können trotzdem Respekt zeigen","Nur eine Kultur ist richtig","Gepflogenheiten sind völlig egal"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué tono tiene la conversación?","de": "Welchen Ton hat das Gespräch?","s_es": {"type": "multiple_choice","options": ["Respectful and curious","Angry and loud","Bored and rude"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Respektvoll und neugierig","Wütend und laut","Langeweilig und unhöflich"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 6360 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 6360 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 6360, 'en', 'dialogue', 'Convivencia', '[{"name": "Iris","gender": "female","avatarURL": "https://example.com/avatars/student-7.png"},{"name": "Marco","gender": "male","avatarURL": "https://example.com/avatars/student-8.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'habla sobre costumbres culturales', 'Practica un diálogo respetuoso para comparar hábitos de casa, saludos y maneras de hablar.'),
        (v_dialogue_id, 'de', 'sprich über kulturelle Gepflogenheiten', 'Übe einen respektvollen Dialog, um Gewohnheiten zu Hause, Begrüßungen und Sprechweisen zu vergleichen.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
        v_line_order := v_line_order + 1;
    END LOOP;
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
