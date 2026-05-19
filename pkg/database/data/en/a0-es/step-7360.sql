-- ============================================================
-- Seed: A0 English Path – STEP 7360 – Dialogue – discuss abstract cultural topics
-- Source language: Spanish
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
        '{"character": "Nora", "text": "After the workshop, I keep thinking about direct and indirect speech.", "es": "Después del taller, sigo pensando en el habla directa e indirecta.", "de": "Nach dem Workshop denke ich immer noch über direkte und indirekte Sprache nach."}'::jsonb,
    '{"character": "Omar", "text": "Me too. In my family, direct words show honesty.", "es": "Yo también. En mi familia, las palabras directas muestran honestidad.", "de": "Ich auch. In meiner Familie zeigen direkte Worte Ehrlichkeit."}'::jsonb,
    '{"character": "Nora", "text": "In mine, people often soften criticism so the other person does not lose face.", "es": "En la mía, la gente suele suavizar la crítica para que la otra persona no pierda la cara.", "de": "In meiner Familie wird Kritik oft abgeschwächt, damit die andere Person nicht das Gesicht verliert."}'::jsonb,
    '{"character": "Omar", "text": "That makes sense. I also noticed different ideas about eye contact.", "es": "Tiene sentido. Yo también noté ideas diferentes sobre el contacto visual.", "de": "Das ergibt Sinn. Ich habe auch unterschiedliche Vorstellungen über Blickkontakt bemerkt."}'::jsonb,
    '{"character": "Nora", "text": "Yes. Some of my relatives look away to show respect to older people.", "es": "Sí. Algunos de mis familiares apartan la mirada para mostrar respeto a las personas mayores.", "de": "Ja. Einige meiner Verwandten schauen weg, um älteren Menschen Respekt zu zeigen."}'::jsonb,
    '{"character": "Omar", "text": "My grandfather is the opposite. He thinks looking away means you are not listening.", "es": "Mi abuelo es lo contrario. Él piensa que apartar la mirada significa que no estás escuchando.", "de": "Mein Großvater ist das Gegenteil. Er denkt, Wegschauen bedeutet, dass man nicht zuhört."}'::jsonb,
    '{"character": "Nora", "text": "Personal questions are tricky too. Asking about family can feel warm or too private.", "es": "Las preguntas personales también son delicadas. Preguntar por la familia puede parecer cercano o demasiado privado.", "de": "Persönliche Fragen sind auch heikel. Nach der Familie zu fragen kann warm oder zu privat wirken."}'::jsonb,
    '{"character": "Omar", "text": "That is why I usually wait and see what the other person is comfortable with.", "es": "Por eso suelo esperar y ver con qué se siente cómoda la otra persona.", "de": "Darum warte ich meistens ab und schaue, womit sich die andere Person wohlfühlt."}'::jsonb,
    '{"character": "Nora", "text": "I like that approach. It gives space without becoming cold.", "es": "Me gusta ese enfoque. Da espacio sin volverse frío.", "de": "Mir gefällt dieser Ansatz. Er gibt Raum, ohne kühl zu werden."}'::jsonb,
    '{"character": "Omar", "text": "Exactly, and it helps us talk honestly without assuming everybody follows the same rules.", "es": "Exacto, y nos ayuda a hablar con sinceridad sin suponer que todo el mundo sigue las mismas reglas.", "de": "Genau, und es hilft uns, ehrlich zu sprechen, ohne anzunehmen, dass alle denselben Regeln folgen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Omar dice que en su familia las palabras directas muestran honestidad.", "de": "Omar sagt, dass direkte Worte in seiner Familie Ehrlichkeit zeigen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Nora dice que en su familia suavizan la crítica.", "de": "Nora sagt, dass man in ihrer Familie Kritik abschwächt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Nora piensa que el contacto visual significa siempre lo mismo.", "de": "Nora denkt, dass Blickkontakt immer dasselbe bedeutet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "Omar cree que las preguntas personales siempre son fáciles.", "de": "Omar findet, dass persönliche Fragen immer einfach sind.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "Los dos coinciden en que no todo el mundo sigue las mismas reglas.", "de": "Beide sind sich einig, dass nicht alle denselben Regeln folgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿En qué tema sigue pensando Nora?", "de": "Über welches Thema denkt Nora weiter nach?", "s_es": {"type": "multiple_choice", "options": ["Direct and indirect speech", "Cooking and shopping", "Bus routes and tickets"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Direkte und indirekte Sprache", "Kochen und Einkaufen", "Buslinien und Fahrkarten"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué protege la familia de Nora al suavizar la crítica?", "de": "Was schützt Noras Familie, wenn sie Kritik abschwächt?", "s_es": {"type": "multiple_choice", "options": ["The other person from losing face", "The price of dinner", "The order of the meeting"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dass die andere Person nicht das Gesicht verliert", "Den Preis des Abendessens", "Die Reihenfolge des Treffens"], "answer": 0}}'::jsonb,
    '{"es": "¿Cómo muestran respeto algunos familiares de Nora a las personas mayores?", "de": "Wie zeigen einige von Noras Verwandten älteren Menschen Respekt?", "s_es": {"type": "multiple_choice", "options": ["They look away", "They speak faster", "They stand up immediately"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie schauen weg", "Sie sprechen schneller", "Sie stehen sofort auf"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué hace Omar cuando un tema es personal?", "de": "Was macht Omar, wenn ein Thema persönlich ist?", "s_es": {"type": "multiple_choice", "options": ["He waits to see what the other person is comfortable with", "He changes the city", "He ends the conversation"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er wartet ab, womit sich die andere Person wohlfühlt", "Er wechselt die Stadt", "Er beendet das Gespräch"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué conclusión comparten al final?", "de": "Welche Schlussfolgerung teilen sie am Ende?", "s_es": {"type": "multiple_choice", "options": ["Not everybody follows the same rules", "Silence is always negative", "Direct speech is always best"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nicht alle folgen denselben Regeln", "Schweigen ist immer negativ", "Direkte Sprache ist immer am besten"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7360 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7360 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7360, 'en', 'dialogue', 'social', '[{"name": "Nora", "gender": "female", "avatarURL": "https://example.com/avatars/nora.png"}, {"name": "Omar", "gender": "male", "avatarURL": "https://example.com/avatars/omar.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla sobre temas culturales abstractos', 'Lee un diálogo donde dos amigos comparan franqueza, contacto visual y preguntas personales.'),
        (v_dialogue_id, 'de', 'Sprich über abstrakte kulturelle Themen', 'Lies einen Dialog, in dem zwei Freunde Direktheit, Blickkontakt und persönliche Fragen vergleichen.');

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
