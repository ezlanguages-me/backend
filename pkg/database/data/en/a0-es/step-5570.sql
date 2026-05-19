-- ============================================================
-- Seed: A0 English Path – STEP 5570 – Reading – read quickly enough to cope with the demands of an academic course (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El extracto dice que el ruido del tráfico reduce la concentración al leer.", "p_de": "Der Auszug sagt, dass Verkehrslärm die Konzentration beim Lesen verringert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El ruido repentino puede interrumpir más la memoria.", "p_de": "Plötzlicher Lärm kann das Gedächtnis stärker unterbrechen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Solo hay una estrategia para afrontar el problema.", "p_de": "Es gibt nur eine Strategie gegen das Problem.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Una estrategia es elegir horas con menos ruido.", "p_de": "Eine Strategie ist, Zeiten mit weniger Lärm zu wählen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Otra estrategia es usar salas silenciosas para lecturas largas.", "p_de": "Eine weitere Strategie ist, ruhige Räume für langes Lesen zu nutzen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tercera estrategia propone leer sin pausas hasta el final.", "p_de": "Die dritte Strategie schlägt vor, ohne Pausen bis zum Ende zu lesen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El último párrafo recomienda mirar primero títulos y frases temáticas.", "p_de": "Der letzte Absatz empfiehlt, zuerst Überschriften und Themensätze anzusehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto ayuda a leer de forma más rápida y estratégica.", "p_de": "Der Text hilft, schneller und strategischer zu lesen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué reduce el ruido del tráfico?", "p_de": "Was verringert Verkehrslärm?", "s": {"type": "multiple_choice", "options": ["Concentration during reading", "The number of books", "Library opening hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ruido interrumpe más la memoria?", "p_de": "Welcher Lärm unterbricht das Gedächtnis stärker?", "s": {"type": "multiple_choice", "options": ["Irregular sudden noise", "Soft music", "A quiet room"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas estrategias presenta el texto?", "p_de": "Wie viele Strategien stellt der Text vor?", "s": {"type": "multiple_choice", "options": ["Three strategies", "One strategy", "Five strategies"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puedes elegir para estudiar mejor?", "p_de": "Was kann man wählen, um besser zu lernen?", "s": {"type": "multiple_choice", "options": ["Study times with less noise", "A louder cafe", "More phone messages"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué espacio recomienda para lecturas largas?", "p_de": "Welchen Raum empfiehlt der Text für langes Lesen?", "s": {"type": "multiple_choice", "options": ["Quiet rooms", "The parking area", "The reception desk"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo sugiere organizar un texto largo?", "p_de": "Wie schlägt der Text vor, einen langen Text zu organisieren?", "s": {"type": "multiple_choice", "options": ["In short sections with short pauses", "In one reading without pauses", "Only by listening to it"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes mirar primero al leer?", "p_de": "Was soll man beim Lesen zuerst ansehen?", "s": {"type": "multiple_choice", "options": ["Headings, topic sentences, and repeated ideas", "Only the footnotes", "Only the final page number"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve este extracto?", "p_de": "Wofür dient dieser Auszug?", "s": {"type": "multiple_choice", "options": ["To help with fast academic reading", "To explain conference badges", "To train voicemail skills"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5570 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5570 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5570, 'en', 'reading', 'academic', 'Course reader extract: City noise affects study in different ways. Traffic noise mainly reduces concentration during reading tasks, while irregular sudden noise can interrupt memory more strongly.

The extract explains three coping strategies. First, students can choose study times with less background noise. Second, they can use quiet rooms for longer reading. Third, they can break a long text into short sections with short review pauses.

The final paragraph says that academic reading often becomes easier when students look first for headings, topic sentences, and repeated ideas before reading every detail.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Leer con suficiente rapidez para un curso académico', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Schnell genug für einen akademischen Kurs lesen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
