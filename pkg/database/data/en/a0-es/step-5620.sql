-- ============================================================
-- Seed: A0 English Path – STEP 5620 – Listening – essay writing advice from a tutor (Textos, Ensayos e Investigación)
-- Source language: English
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La tutora aconseja comenzar el borrador con la introducción.", "p_de": "Die Tutorin rät, den Entwurf mit der Einleitung zu beginnen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tutora dice que está bien cometer errores en el primer borrador.", "p_de": "Die Tutorin sagt, es sei in Ordnung, im ersten Entwurf Fehler zu machen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tutora recomienda escribir los párrafos del cuerpo antes de la introducción.", "p_de": "Die Tutorin empfiehlt, die Absätze des Hauptteils vor der Einleitung zu schreiben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tutora dice que nunca se debe revisar el ensayo después de escribirlo.", "p_de": "Die Tutorin sagt, man solle den Aufsatz nach dem Schreiben nie überarbeiten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tutora menciona que las frases de transición ayudan al flujo del texto.", "p_de": "Die Tutorin erwähnt, dass Übergangssätze dem Textfluss helfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tutora aconseja no preocuparse por la gramática en el primer borrador.", "p_de": "Die Tutorin rät, sich beim ersten Entwurf nicht um Grammatik zu kümmern.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según la tutora, la revisión se hace solo una vez.", "p_de": "Laut der Tutorin wird die Überarbeitung nur einmal gemacht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tutora sugiere leer el ensayo en voz alta para detectar problemas.", "p_de": "Die Tutorin empfiehlt, den Aufsatz laut vorzulesen, um Probleme zu erkennen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Por qué aconseja la tutora escribir primero los párrafos del cuerpo?", "p_de": "Warum rät die Tutorin, zuerst die Hauptabsätze zu schreiben?", "s": {"type": "multiple_choice", "options": ["Because the body contains the main arguments and shapes the whole essay", "Because the introduction is always very short", "Because the conclusion is not important"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace que el primer borrador sea útil aunque esté imperfecto?", "p_de": "Was macht den ersten Entwurf nützlich, auch wenn er unvollkommen ist?", "s": {"type": "multiple_choice", "options": ["It gets ideas on paper so they can be refined later", "It replaces the need for research", "It becomes the final version immediately"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la función de las frases de transición según la tutora?", "p_de": "Welche Funktion haben Übergangssätze laut der Tutorin?", "s": {"type": "multiple_choice", "options": ["They connect ideas and improve essay flow", "They replace evidence", "They shorten the essay"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas etapas de revisión recomienda la tutora?", "p_de": "Wie viele Überarbeitungsstufen empfiehlt die Tutorin?", "s": {"type": "multiple_choice", "options": ["Multiple rounds focusing on different aspects", "Only one round at the end", "No revision is needed"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ventaja tiene leer el ensayo en voz alta?", "p_de": "Welchen Vorteil hat das laute Vorlesen des Aufsatzes?", "s": {"type": "multiple_choice", "options": ["You notice awkward phrasing and missing logic", "It replaces proofreading", "It impresses the professor immediately"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo recomienda la tutora escribir la introducción?", "p_de": "Wann empfiehlt die Tutorin, die Einleitung zu schreiben?", "s": {"type": "multiple_choice", "options": ["After drafting the body paragraphs", "Before doing any research", "At the same time as the conclusion"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué aspecto de la gramática debe el estudiante atender en la etapa de revisión?", "p_de": "Welchen Grammatikaspekt soll der Studierende in der Überarbeitungsphase beachten?", "s": {"type": "multiple_choice", "options": ["Sentence structure, verb tense consistency, and punctuation", "Only spelling", "Only word count"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el consejo más importante de la tutora para comenzar un ensayo?", "p_de": "Was ist der wichtigste Rat der Tutorin für den Beginn eines Aufsatzes?", "s": {"type": "multiple_choice", "options": ["Start writing without worrying about perfection", "Wait until every idea is fully formed", "Write the bibliography first"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5620 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5620 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5620, 'en', 'listening', 'academic-essay', $transcript$
# AUDIO PROFILE
- **Format:** One-on-one tutorial session
- **Duration:** ~5 minutes
- **Accent:** British English (tutor), International English (student)
- **Tone:** Encouraging, practical, clear

## "Essay Writing Advice: From Draft to Final"

## THE SCENE
A tutor, Dr. Collins, meets a student, Marcus, who is struggling to start his essay.

### DIRECTOR'S NOTES
- Dr. Collins speaks calmly and gives concrete, step-by-step guidance
- Marcus sounds unsure at first but becomes more confident

#### TRANSCRIPT
[encouraging] Dr. Collins: Marcus, I can see you''re not sure where to begin. That''s completely normal.
[uncertain] Marcus: I keep thinking I need to write a perfect first sentence. It''s stopping me from writing anything.
[warm] Dr. Collins: The first draft does not need to be perfect. It just needs to exist. Write the body paragraphs first.
[curious] Marcus: Really? Not the introduction?
[confident] Dr. Collins: The introduction works best when you know what your argument actually is. Start with the body. Get your ideas down.
[relieved] Marcus: That actually makes sense. What about transitions?
[clear] Dr. Collins: Transition phrases are essential. They guide the reader from one idea to the next. Use phrases like ''Furthermore'' or ''In contrast'' to improve the flow.
[engaged] Marcus: Should I worry about grammar in the first draft?
[reassuring] Dr. Collins: Not at all. Focus on content and logic first. Grammar and punctuation come during revision.
[curious] Marcus: How many times should I revise?
[thoughtful] Dr. Collins: Multiple rounds. First for argument structure, then for clarity, then for language. Each pass serves a different purpose.
[practical] Dr. Collins: And once you have a full draft, read it aloud. You will catch things your eyes miss — awkward sentences, missing logic.
[motivated] Marcus: I''ll try that. I feel less anxious now.
[warm] Dr. Collins: Good. Start messy. Refine later. That''s how good essays are built.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Consejos de redacción de ensayos: del borrador al producto final', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Aufsatzschreibtipps: Vom Entwurf zum fertigen Text', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
