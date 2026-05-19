-- ============================================================
-- Seed: A0 English Path – STEP 8640 – Grammar – Be Used To / Get Used To / Used To
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_grammar_id UUID;
    v_rule1_id UUID;
    v_rule2_id UUID;
    v_rule3_id UUID;
    v_rule4_id UUID;
    v_ex_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE grammar_rule_uuid IN (
        SELECT gr.uuid
        FROM grammar_rule gr
        JOIN grammar g ON gr.grammar_uuid = g.uuid
        WHERE g.step_order=8640 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=8640 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,8640,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Be Used To / Get Used To / Used To', 'Diferencias entre estado habitual, proceso de adaptación, hábito pasado y las formas negativas o interrogativas.', to_jsonb('# Be Used To / Get Used To / Used To

Estas tres expresiones parecen parecidas, pero hablan de cosas distintas.

## 1. Be used to + nombre / -ing
Describe una situación que ya te resulta normal.
- I am **used to** early mornings.
- She is **used to working** late.

## 2. Get used to + nombre / -ing
Habla del proceso de adaptación.
- We are **getting used to** the noise.
- He **got used to driving** on the left.

## 3. Used to + infinitivo
Habla de hábitos o estados del pasado que ya no son normales ahora.
- I **used to walk** to school.
- My town **used to be** quieter.

## 4. Negativas y preguntas
- I **didn''t use to** drink coffee.
- **Did** you **use to** live here?
- Are you **used to** spicy food?

### Recordatorio
Después de **be used to** y **get used to**, si viene verbo usamos **-ing**. Después de **used to** para hábito pasado usamos **infinitivo base**.'::text)),
        (v_grammar_id, 'de', 'Be Used To / Get Used To / Used To', 'Unterschiede zwischen Gewöhnung, Anpassungsprozess, früheren Gewohnheiten und negativen oder fragenden Formen.', to_jsonb('# Be Used To / Get Used To / Used To

Diese drei Ausdrücke sehen ähnlich aus, sprechen aber über verschiedene Dinge.

## 1. Be used to + Nomen / -ing
Das beschreibt etwas, das für dich schon normal ist.
- I am **used to** early mornings.
- She is **used to working** late.

## 2. Get used to + Nomen / -ing
Das beschreibt den Prozess der Gewöhnung.
- We are **getting used to** the noise.
- He **got used to driving** on the left.

## 3. Used to + Infinitiv
Das beschreibt Gewohnheiten oder Zustände in der Vergangenheit, die heute nicht mehr typisch sind.
- I **used to walk** to school.
- My town **used to be** quieter.

## 4. Verneinungen und Fragen
- I **didn''t use to** drink coffee.
- **Did** you **use to** live here?
- Are you **used to** spicy food?

### Merksatz
Nach **be used to** und **get used to** folgt bei einem Verb die **-ing-Form**. Nach **used to** für frühere Gewohnheiten folgt der **Infinitiv ohne to**.'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule1_id, 'es', 'be used to + nombre / -ing', 'Con be used to hablas de algo que ya es normal para ti. Después de to usamos un nombre o un verbo en -ing.'),
        (v_rule1_id, 'de', 'be used to + Nomen / -ing', 'Mit be used to sprichst du über etwas, das für dich schon normal ist. Nach to steht ein Nomen oder ein Verb mit -ing.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura correcta: I ___ early.', '{"type": "typing", "correct_answers": ["am used to waking up"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die richtige Struktur: I ___ early.', '{"type": "typing", "correct_answers": ["am used to waking up"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: I ___ early.', '{"type": "multiple_choice", "options": ["am used to waking up", "am used to wake up", "used to waking up"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: I ___ early.', '{"type": "multiple_choice", "options": ["am used to waking up", "am used to wake up", "used to waking up"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: I am used to wake up early.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: I am used to wake up early.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con be used to.', '{"type": "scramble", "chunks": ["I", "am", "used", "to", "waking", "up", "early."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit be used to.', '{"type": "scramble", "chunks": ["I", "am", "used", "to", "waking", "up", "early."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura correcta: She ___ late.', '{"type": "typing", "correct_answers": ["is used to working"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die richtige Struktur: She ___ late.', '{"type": "typing", "correct_answers": ["is used to working"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: She ___ late.', '{"type": "multiple_choice", "options": ["is used to working", "is used to work", "used to working"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: She ___ late.', '{"type": "multiple_choice", "options": ["is used to working", "is used to work", "used to working"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She is used to working late.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She is used to working late.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con be used to.', '{"type": "scramble", "chunks": ["She", "is", "used", "to", "working", "late."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit be used to.', '{"type": "scramble", "chunks": ["She", "is", "used", "to", "working", "late."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura correcta: We ___ the cold here.', '{"type": "typing", "correct_answers": ["are used to"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die richtige Struktur: We ___ the cold here.', '{"type": "typing", "correct_answers": ["are used to"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: We ___ the cold here.', '{"type": "multiple_choice", "options": ["are used to", "used to", "get used to"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: We ___ the cold here.', '{"type": "multiple_choice", "options": ["are used to", "used to", "get used to"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We are used the cold here.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We are used the cold here.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con be used to.', '{"type": "scramble", "chunks": ["We", "are", "used", "to", "the", "cold", "here."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit be used to.', '{"type": "scramble", "chunks": ["We", "are", "used", "to", "the", "cold", "here."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura correcta: He ___ on the left.', '{"type": "typing", "correct_answers": ["is used to driving"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die richtige Struktur: He ___ on the left.', '{"type": "typing", "correct_answers": ["is used to driving"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: He ___ on the left.', '{"type": "multiple_choice", "options": ["is used to driving", "is used to drive", "used to driving"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: He ___ on the left.', '{"type": "multiple_choice", "options": ["is used to driving", "is used to drive", "used to driving"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He is used to driving on the left.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He is used to driving on the left.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con be used to.', '{"type": "scramble", "chunks": ["He", "is", "used", "to", "driving", "on", "the", "left."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit be used to.', '{"type": "scramble", "chunks": ["He", "is", "used", "to", "driving", "on", "the", "left."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura correcta: They ___ long meetings.', '{"type": "typing", "correct_answers": ["are used to"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die richtige Struktur: They ___ long meetings.', '{"type": "typing", "correct_answers": ["are used to"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: They ___ long meetings.', '{"type": "multiple_choice", "options": ["are used to", "used to", "get used to"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: They ___ long meetings.', '{"type": "multiple_choice", "options": ["are used to", "used to", "get used to"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They are used to long meetings.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They are used to long meetings.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con be used to.', '{"type": "scramble", "chunks": ["They", "are", "used", "to", "long", "meetings."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit be used to.', '{"type": "scramble", "chunks": ["They", "are", "used", "to", "long", "meetings."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura correcta: My parents ___ in the city.', '{"type": "typing", "correct_answers": ["are used to living"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die richtige Struktur: My parents ___ in the city.', '{"type": "typing", "correct_answers": ["are used to living"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: My parents ___ in the city.', '{"type": "multiple_choice", "options": ["are used to living", "are used to live", "used to living"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: My parents ___ in the city.', '{"type": "multiple_choice", "options": ["are used to living", "are used to live", "used to living"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: My parents are used to live in the city.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: My parents are used to live in the city.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con be used to.', '{"type": "scramble", "chunks": ["My", "parents", "are", "used", "to", "living", "in", "the", "city."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit be used to.', '{"type": "scramble", "chunks": ["My", "parents", "are", "used", "to", "living", "in", "the", "city."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura correcta: The students ___ homework online.', '{"type": "typing", "correct_answers": ["are used to doing"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die richtige Struktur: The students ___ homework online.', '{"type": "typing", "correct_answers": ["are used to doing"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: The students ___ homework online.', '{"type": "multiple_choice", "options": ["are used to doing", "are used to do", "used to doing"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: The students ___ homework online.', '{"type": "multiple_choice", "options": ["are used to doing", "are used to do", "used to doing"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The students are used to doing homework online.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The students are used to doing homework online.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con be used to.', '{"type": "scramble", "chunks": ["The", "students", "are", "used", "to", "doing", "homework", "online."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit be used to.', '{"type": "scramble", "chunks": ["The", "students", "are", "used", "to", "doing", "homework", "online."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule2_id, 'es', 'get used to + nombre / -ing', 'Con get used to hablas del proceso de acostumbrarse. Después de to usamos nombre o verbo en -ing.'),
        (v_rule2_id, 'de', 'get used to + Nomen / -ing', 'Mit get used to sprichst du über den Gewöhnungsprozess. Nach to steht ein Nomen oder ein Verb mit -ing.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura de adaptación: I ___ my new schedule.', '{"type": "typing", "correct_answers": ["am getting used to"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Gewöhnungsstruktur: I ___ my new schedule.', '{"type": "typing", "correct_answers": ["am getting used to"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: I ___ my new schedule.', '{"type": "multiple_choice", "options": ["am getting used to", "am used to", "used to"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: I ___ my new schedule.', '{"type": "multiple_choice", "options": ["am getting used to", "am used to", "used to"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: I am getting used to my new schedule.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: I am getting used to my new schedule.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con get used to.', '{"type": "scramble", "chunks": ["I", "am", "getting", "used", "to", "my", "new", "schedule."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit get used to.', '{"type": "scramble", "chunks": ["I", "am", "getting", "used", "to", "my", "new", "schedule."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura de adaptación: She ___ from home.', '{"type": "typing", "correct_answers": ["got used to working"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Gewöhnungsstruktur: She ___ from home.', '{"type": "typing", "correct_answers": ["got used to working"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: She ___ from home.', '{"type": "multiple_choice", "options": ["got used to working", "got used to work", "was used to working"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: She ___ from home.', '{"type": "multiple_choice", "options": ["got used to working", "got used to work", "was used to working"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She got used to work from home.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She got used to work from home.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con get used to.', '{"type": "scramble", "chunks": ["She", "got", "used", "to", "working", "from", "home."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit get used to.', '{"type": "scramble", "chunks": ["She", "got", "used", "to", "working", "from", "home."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura de adaptación: We ___ the rain.', '{"type": "typing", "correct_answers": ["are getting used to"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Gewöhnungsstruktur: We ___ the rain.', '{"type": "typing", "correct_answers": ["are getting used to"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: We ___ the rain.', '{"type": "multiple_choice", "options": ["are getting used to", "are used to", "get used to"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: We ___ the rain.', '{"type": "multiple_choice", "options": ["are getting used to", "are used to", "get used to"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We are getting used to the rain.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We are getting used to the rain.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con get used to.', '{"type": "scramble", "chunks": ["We", "are", "getting", "used", "to", "the", "rain."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit get used to.', '{"type": "scramble", "chunks": ["We", "are", "getting", "used", "to", "the", "rain."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura de adaptación: He ___ glasses.', '{"type": "typing", "correct_answers": ["got used to wearing"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Gewöhnungsstruktur: He ___ glasses.', '{"type": "typing", "correct_answers": ["got used to wearing"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: He ___ glasses.', '{"type": "multiple_choice", "options": ["got used to wearing", "got used to wear", "was used to wearing"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: He ___ glasses.', '{"type": "multiple_choice", "options": ["got used to wearing", "got used to wear", "was used to wearing"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He got used to wear glasses.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He got used to wear glasses.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con get used to.', '{"type": "scramble", "chunks": ["He", "got", "used", "to", "wearing", "glasses."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit get used to.', '{"type": "scramble", "chunks": ["He", "got", "used", "to", "wearing", "glasses."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura de adaptación: They will ___ the new teacher.', '{"type": "typing", "correct_answers": ["get used to"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Gewöhnungsstruktur: They will ___ the new teacher.', '{"type": "typing", "correct_answers": ["get used to"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: They will ___ the new teacher.', '{"type": "multiple_choice", "options": ["get used to", "be used to", "used to"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: They will ___ the new teacher.', '{"type": "multiple_choice", "options": ["get used to", "be used to", "used to"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They will get used to the new teacher.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They will get used to the new teacher.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con get used to.', '{"type": "scramble", "chunks": ["They", "will", "get", "used", "to", "the", "new", "teacher."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit get used to.', '{"type": "scramble", "chunks": ["They", "will", "get", "used", "to", "the", "new", "teacher."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura de adaptación: The baby ___ alone.', '{"type": "typing", "correct_answers": ["is getting used to sleeping"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Gewöhnungsstruktur: The baby ___ alone.', '{"type": "typing", "correct_answers": ["is getting used to sleeping"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: The baby ___ alone.', '{"type": "multiple_choice", "options": ["is getting used to sleeping", "is getting used to sleep", "is used to sleeping"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: The baby ___ alone.', '{"type": "multiple_choice", "options": ["is getting used to sleeping", "is getting used to sleep", "is used to sleeping"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The baby is getting used to sleep alone.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The baby is getting used to sleep alone.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con get used to.', '{"type": "scramble", "chunks": ["The", "baby", "is", "getting", "used", "to", "sleeping", "alone."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit get used to.', '{"type": "scramble", "chunks": ["The", "baby", "is", "getting", "used", "to", "sleeping", "alone."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura de adaptación: You ___ the noise after a few days.', '{"type": "typing", "correct_answers": ["get used to"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Gewöhnungsstruktur: You ___ the noise after a few days.', '{"type": "typing", "correct_answers": ["get used to"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: You ___ the noise after a few days.', '{"type": "multiple_choice", "options": ["get used to", "are used to", "used to"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: You ___ the noise after a few days.', '{"type": "multiple_choice", "options": ["get used to", "are used to", "used to"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: You get used to the noise after a few days.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: You get used to the noise after a few days.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con get used to.', '{"type": "scramble", "chunks": ["You", "get", "used", "to", "the", "noise", "after", "a", "few", "days."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit get used to.', '{"type": "scramble", "chunks": ["You", "get", "used", "to", "the", "noise", "after", "a", "few", "days."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule3_id, 'es', 'used to + infinitivo (hábito pasado)', 'Used to + verbo base habla de hábitos o estados del pasado que ya no son normales ahora.'),
        (v_rule3_id, 'de', 'used to + Infinitiv (frühere Gewohnheit)', 'Used to + Grundverb beschreibt frühere Gewohnheiten oder Zustände, die heute nicht mehr normal sind.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa el hábito del pasado: I ___ to school.', '{"type": "typing", "correct_answers": ["used to walk"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die frühere Gewohnheit: I ___ to school.', '{"type": "typing", "correct_answers": ["used to walk"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: I ___ to school.', '{"type": "multiple_choice", "options": ["used to walk", "am used to walking", "use to walk"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: I ___ to school.', '{"type": "multiple_choice", "options": ["used to walk", "am used to walking", "use to walk"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: I used to walk to school.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: I used to walk to school.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con used to.', '{"type": "scramble", "chunks": ["I", "used", "to", "walk", "to", "school."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit used to.', '{"type": "scramble", "chunks": ["I", "used", "to", "walk", "to", "school."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa el hábito del pasado: She ___ the piano every day.', '{"type": "typing", "correct_answers": ["used to play"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die frühere Gewohnheit: She ___ the piano every day.', '{"type": "typing", "correct_answers": ["used to play"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: She ___ the piano every day.', '{"type": "multiple_choice", "options": ["used to play", "used to playing", "use to play"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: She ___ the piano every day.', '{"type": "multiple_choice", "options": ["used to play", "used to playing", "use to play"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She used to playing the piano every day.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She used to playing the piano every day.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con used to.', '{"type": "scramble", "chunks": ["She", "used", "to", "play", "the", "piano", "every", "day."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit used to.', '{"type": "scramble", "chunks": ["She", "used", "to", "play", "the", "piano", "every", "day."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa el hábito del pasado: We ___ near the sea.', '{"type": "typing", "correct_answers": ["used to live"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die frühere Gewohnheit: We ___ near the sea.', '{"type": "typing", "correct_answers": ["used to live"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: We ___ near the sea.', '{"type": "multiple_choice", "options": ["used to live", "are used to living", "use to live"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: We ___ near the sea.', '{"type": "multiple_choice", "options": ["used to live", "are used to living", "use to live"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We used to live near the sea.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We used to live near the sea.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con used to.', '{"type": "scramble", "chunks": ["We", "used", "to", "live", "near", "the", "sea."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit used to.', '{"type": "scramble", "chunks": ["We", "used", "to", "live", "near", "the", "sea."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa el hábito del pasado: He ___, but he quit.', '{"type": "typing", "correct_answers": ["used to smoke"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die frühere Gewohnheit: He ___, but he quit.', '{"type": "typing", "correct_answers": ["used to smoke"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: He ___, but he quit.', '{"type": "multiple_choice", "options": ["used to smoke", "used to smoking", "use to smoke"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: He ___, but he quit.', '{"type": "multiple_choice", "options": ["used to smoke", "used to smoking", "use to smoke"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He used to smoking, but he quit.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He used to smoking, but he quit.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con used to.', '{"type": "scramble", "chunks": ["He", "used", "to", "smoke,", "but", "he", "quit."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit used to.', '{"type": "scramble", "chunks": ["He", "used", "to", "smoke,", "but", "he", "quit."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa el hábito del pasado: They ___ their grandparents every summer.', '{"type": "typing", "correct_answers": ["used to visit"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die frühere Gewohnheit: They ___ their grandparents every summer.', '{"type": "typing", "correct_answers": ["used to visit"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: They ___ their grandparents every summer.', '{"type": "multiple_choice", "options": ["used to visit", "used to visiting", "use to visit"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: They ___ their grandparents every summer.', '{"type": "multiple_choice", "options": ["used to visit", "used to visiting", "use to visit"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They used to visit their grandparents every summer.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They used to visit their grandparents every summer.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con used to.', '{"type": "scramble", "chunks": ["They", "used", "to", "visit", "their", "grandparents", "every", "summer."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit used to.', '{"type": "scramble", "chunks": ["They", "used", "to", "visit", "their", "grandparents", "every", "summer."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa el hábito del pasado: My brother ___ vegetables.', '{"type": "typing", "correct_answers": ["used to hate"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die frühere Gewohnheit: My brother ___ vegetables.', '{"type": "typing", "correct_answers": ["used to hate"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: My brother ___ vegetables.', '{"type": "multiple_choice", "options": ["used to hate", "is used to hating", "use to hate"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: My brother ___ vegetables.', '{"type": "multiple_choice", "options": ["used to hate", "is used to hating", "use to hate"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: My brother used to hate vegetables.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: My brother used to hate vegetables.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con used to.', '{"type": "scramble", "chunks": ["My", "brother", "used", "to", "hate", "vegetables."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit used to.', '{"type": "scramble", "chunks": ["My", "brother", "used", "to", "hate", "vegetables."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa el hábito del pasado: The town ___ much quieter.', '{"type": "typing", "correct_answers": ["used to be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die frühere Gewohnheit: The town ___ much quieter.', '{"type": "typing", "correct_answers": ["used to be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: The town ___ much quieter.', '{"type": "multiple_choice", "options": ["used to be", "was used to being", "use to be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: The town ___ much quieter.', '{"type": "multiple_choice", "options": ["used to be", "was used to being", "use to be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The town used be much quieter.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The town used be much quieter.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con used to.', '{"type": "scramble", "chunks": ["The", "town", "used", "to", "be", "much", "quieter."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit used to.', '{"type": "scramble", "chunks": ["The", "town", "used", "to", "be", "much", "quieter."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule4_id, 'es', 'Negativas y preguntas', 'En negativas usamos didn''t use to. En preguntas usamos Did ... use to ...? y con be/get used to mantenemos la estructura normal del verbo to be.'),
        (v_rule4_id, 'de', 'Verneinungen und Fragen', 'In Verneinungen benutzen wir didn''t use to. In Fragen verwenden wir Did ... use to ...? und bei be/get used to bleibt die normale Struktur von to be.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma negativa o interrogativa: I ___ coffee.', '{"type": "typing", "correct_answers": ["didn''t use to drink"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die negative oder fragende Form: I ___ coffee.', '{"type": "typing", "correct_answers": ["didn''t use to drink"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: I ___ coffee.', '{"type": "multiple_choice", "options": ["didn''t use to drink", "didn''t used to drink", "don''t use to drink"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: I ___ coffee.', '{"type": "multiple_choice", "options": ["didn''t use to drink", "didn''t used to drink", "don''t use to drink"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: I didn''t used to drink coffee.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: I didn''t used to drink coffee.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la pregunta o negativa.', '{"type": "scramble", "chunks": ["I", "didn''t", "use", "to", "drink", "coffee."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Frage oder Verneinung.', '{"type": "scramble", "chunks": ["I", "didn''t", "use", "to", "drink", "coffee."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma negativa o interrogativa: ___ football after school?', '{"type": "typing", "correct_answers": ["Did you use to play"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die negative oder fragende Form: ___ football after school?', '{"type": "typing", "correct_answers": ["Did you use to play"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: ___ football after school?', '{"type": "multiple_choice", "options": ["Did you use to play", "Did you used to play", "Do you use to play"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: ___ football after school?', '{"type": "multiple_choice", "options": ["Did you use to play", "Did you used to play", "Do you use to play"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Did you use to play football after school?', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Did you use to play football after school?', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la pregunta o negativa.', '{"type": "scramble", "chunks": ["Did", "you", "use", "to", "play", "football", "after", "school?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Frage oder Verneinung.', '{"type": "scramble", "chunks": ["Did", "you", "use", "to", "play", "football", "after", "school?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma negativa o interrogativa: She ___ in public.', '{"type": "typing", "correct_answers": ["isn''t used to speaking"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die negative oder fragende Form: She ___ in public.', '{"type": "typing", "correct_answers": ["isn''t used to speaking"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: She ___ in public.', '{"type": "multiple_choice", "options": ["isn''t used to speaking", "doesn''t used to speak", "isn''t used to speak"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: She ___ in public.', '{"type": "multiple_choice", "options": ["isn''t used to speaking", "doesn''t used to speak", "isn''t used to speak"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She isn''t used to speak in public.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She isn''t used to speak in public.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la pregunta o negativa.', '{"type": "scramble", "chunks": ["She", "isn''t", "used", "to", "speaking", "in", "public."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Frage oder Verneinung.', '{"type": "scramble", "chunks": ["She", "isn''t", "used", "to", "speaking", "in", "public."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma negativa o interrogativa: ___ at night?', '{"type": "typing", "correct_answers": ["Are they used to working"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die negative oder fragende Form: ___ at night?', '{"type": "typing", "correct_answers": ["Are they used to working"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: ___ at night?', '{"type": "multiple_choice", "options": ["Are they used to working", "Do they used to work", "Are they used to work"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: ___ at night?', '{"type": "multiple_choice", "options": ["Are they used to working", "Do they used to work", "Are they used to work"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Are they used to working at night?', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Are they used to working at night?', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la pregunta o negativa.', '{"type": "scramble", "chunks": ["Are", "they", "used", "to", "working", "at", "night?"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Frage oder Verneinung.', '{"type": "scramble", "chunks": ["Are", "they", "used", "to", "working", "at", "night?"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma negativa o interrogativa: He ___ so patient.', '{"type": "typing", "correct_answers": ["didn''t use to be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die negative oder fragende Form: He ___ so patient.', '{"type": "typing", "correct_answers": ["didn''t use to be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: He ___ so patient.', '{"type": "multiple_choice", "options": ["didn''t use to be", "didn''t used to be", "wasn''t used to be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: He ___ so patient.', '{"type": "multiple_choice", "options": ["didn''t use to be", "didn''t used to be", "wasn''t used to be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He didn''t used to be so patient.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He didn''t used to be so patient.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la pregunta o negativa.', '{"type": "scramble", "chunks": ["He", "didn''t", "use", "to", "be", "so", "patient."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Frage oder Verneinung.', '{"type": "scramble", "chunks": ["He", "didn''t", "use", "to", "be", "so", "patient."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma negativa o interrogativa: Will you ___ the new keyboard?', '{"type": "typing", "correct_answers": ["get used to"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die negative oder fragende Form: Will you ___ the new keyboard?', '{"type": "typing", "correct_answers": ["get used to"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: Will you ___ the new keyboard?', '{"type": "multiple_choice", "options": ["get used to", "be used to", "used to"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: Will you ___ the new keyboard?', '{"type": "multiple_choice", "options": ["get used to", "be used to", "used to"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Will you get used to the new keyboard?', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Will you get used to the new keyboard?', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la pregunta o negativa.', '{"type": "scramble", "chunks": ["Will", "you", "get", "used", "to", "the", "new", "keyboard?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Frage oder Verneinung.', '{"type": "scramble", "chunks": ["Will", "you", "get", "used", "to", "the", "new", "keyboard?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma negativa o interrogativa: Are you ___ the new apartment?', '{"type": "typing", "correct_answers": ["getting used to"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die negative oder fragende Form: Are you ___ the new apartment?', '{"type": "typing", "correct_answers": ["getting used to"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la forma correcta: Are you ___ the new apartment?', '{"type": "multiple_choice", "options": ["getting used to", "used to", "get used"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Form: Are you ___ the new apartment?', '{"type": "multiple_choice", "options": ["getting used to", "used to", "get used"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Are you getting used the new apartment?', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Are you getting used the new apartment?', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la pregunta o negativa.', '{"type": "scramble", "chunks": ["Are", "you", "getting", "used", "to", "the", "new", "apartment?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Frage oder Verneinung.', '{"type": "scramble", "chunks": ["Are", "you", "getting", "used", "to", "the", "new", "apartment?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

END;
$seed$;
