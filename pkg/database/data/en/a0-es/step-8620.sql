-- ============================================================
-- Seed: A0 English Path – STEP 8620 – Grammar – So vs Such
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
        WHERE g.step_order=8620 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=8620 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,8620,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'So vs Such', 'Cómo intensificar ideas con so y such, formar consecuencias con that y usar expresiones fijas frecuentes.', to_jsonb('# So vs Such

**So** y **such** sirven para intensificar una idea, pero no van con la misma clase de palabra.

## 1. So + adjetivo o adverbio
Usa **so** delante de un **adjetivo** o un **adverbio**.
- so hot
- so tired
- so quickly
- so clearly

## 2. Such + (a/an) + nombre o sintagma nominal
Usa **such** cuando la palabra principal es un **nombre**.
- such a mess
- such an interesting idea
- such friendly people
- such bad weather

## 3. So / Such ... that
Ambas formas pueden introducir una consecuencia con **that**.
- The soup was **so** hot **that** I waited.
- It was **such a** long film **that** we left early.

## 4. Expresiones fijas
Algunas combinaciones no cambian:
- **so far** = hasta ahora
- **so far so good** = hasta ahora, todo va bien
- **such as** = como / por ejemplo
- **as such** = en calidad de eso / como tal

### Error común
No digas *such tired* ni *so a problem*. Si el núcleo es adjetivo o adverbio, usa **so**. Si el núcleo es nombre, usa **such**.

### Consejo rápido
Pregunta: ¿qué palabra estoy intensificando? Si es **adjetivo/adverbio** → **so**. Si es **nombre o grupo nominal** → **such**.'::text)),
        (v_grammar_id, 'de', 'So vs Such', 'Wie man mit so und such verstärkt, Folgen mit that bildet und feste Wendungen sicher verwendet.', to_jsonb('# So vs Such

**So** und **such** verstärken eine Aussage, aber sie stehen nicht vor derselben Wortart.

## 1. So + Adjektiv oder Adverb
Benutze **so** vor einem **Adjektiv** oder **Adverb**.
- so hot
- so tired
- so quickly
- so clearly

## 2. Such + (a/an) + Nomen oder Nominalgruppe
Benutze **such**, wenn der wichtigste Teil ein **Nomen** ist.
- such a mess
- such an interesting idea
- such friendly people
- such bad weather

## 3. So / Such ... that
Beide Formen können mit **that** eine Folge ausdrücken.
- The soup was **so** hot **that** I waited.
- It was **such a** long film **that** we left early.

## 4. Feste Wendungen
Einige Kombinationen sind fest:
- **so far** = bis jetzt
- **so far so good** = bis jetzt läuft es gut
- **such as** = wie / zum Beispiel
- **as such** = als solches / in dieser Funktion

### Häufiger Fehler
Sag nicht *such tired* oder *so a problem*. Wenn der Kern ein Adjektiv oder Adverb ist, nimm **so**. Wenn der Kern ein Nomen ist, nimm **such**.

### Schneller Tipp
Frage dich: Welche Wortart verstärke ich? **Adjektiv/Adverb** → **so**. **Nomen/Nominalgruppe** → **such**.'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule1_id, 'es', 'So + adjetivo/adverbio', 'Recuerda: so va delante de adjetivos y adverbios: so cold, so quickly, so tired.'),
        (v_rule1_id, 'de', 'So + Adjektiv/Adverb', 'Denk daran: so steht vor Adjektiven und Adverbien: so cold, so quickly, so tired.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con so: The ___up is so hot.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit so: The ___up is so hot.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The ___up is so hot.', '{"type": "multiple_choice", "options": ["so", "such", "such a"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The ___up is so hot.', '{"type": "multiple_choice", "options": ["so", "such", "such a"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The soup is such hot.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The soup is such hot.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con so.', '{"type": "scramble", "chunks": ["The", "soup", "is", "so", "hot."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit so.', '{"type": "scramble", "chunks": ["The", "soup", "is", "so", "hot."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con so: She speaks ___ clearly.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit so: She speaks ___ clearly.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She speaks ___ clearly.', '{"type": "multiple_choice", "options": ["so", "such", "too"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She speaks ___ clearly.', '{"type": "multiple_choice", "options": ["so", "such", "too"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She speaks so clearly.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She speaks so clearly.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con so.', '{"type": "scramble", "chunks": ["She", "speaks", "so", "clearly."], "correct_order": [0, 1, 2, 3]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit so.', '{"type": "scramble", "chunks": ["She", "speaks", "so", "clearly."], "correct_order": [0, 1, 2, 3]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con so: It was ___ noisy outside.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit so: It was ___ noisy outside.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: It was ___ noisy outside.', '{"type": "multiple_choice", "options": ["so", "such", "such a"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: It was ___ noisy outside.', '{"type": "multiple_choice", "options": ["so", "such", "such a"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: It was such noisy outside.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: It was such noisy outside.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con so.', '{"type": "scramble", "chunks": ["It", "was", "so", "noisy", "outside."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit so.', '{"type": "scramble", "chunks": ["It", "was", "so", "noisy", "outside."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con so: They arrived ___ early.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit so: They arrived ___ early.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: They arrived ___ early.', '{"type": "multiple_choice", "options": ["so", "such", "too"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: They arrived ___ early.', '{"type": "multiple_choice", "options": ["so", "such", "too"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They arrived so early.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They arrived so early.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con so.', '{"type": "scramble", "chunks": ["They", "arrived", "so", "early."], "correct_order": [0, 1, 2, 3]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit so.', '{"type": "scramble", "chunks": ["They", "arrived", "so", "early."], "correct_order": [0, 1, 2, 3]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con so: The film was ___ boring.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit so: The film was ___ boring.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The film was ___ boring.', '{"type": "multiple_choice", "options": ["so", "such", "such a"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The film was ___ boring.', '{"type": "multiple_choice", "options": ["so", "such", "such a"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The film was such boring.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The film was such boring.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con so.', '{"type": "scramble", "chunks": ["The", "film", "was", "so", "boring."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit so.', '{"type": "scramble", "chunks": ["The", "film", "was", "so", "boring."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con so: He drives ___ carefully.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit so: He drives ___ carefully.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He drives ___ carefully.', '{"type": "multiple_choice", "options": ["so", "such", "too"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He drives ___ carefully.', '{"type": "multiple_choice", "options": ["so", "such", "too"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He drives so carefully.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He drives so carefully.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con so.', '{"type": "scramble", "chunks": ["He", "drives", "so", "carefully."], "correct_order": [0, 1, 2, 3]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit so.', '{"type": "scramble", "chunks": ["He", "drives", "so", "carefully."], "correct_order": [0, 1, 2, 3]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con so: We were ___ tired after the trip.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit so: We were ___ tired after the trip.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We were ___ tired after the trip.', '{"type": "multiple_choice", "options": ["so", "such", "such a"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We were ___ tired after the trip.', '{"type": "multiple_choice", "options": ["so", "such", "such a"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We were so tired after the trip.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We were so tired after the trip.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con so.', '{"type": "scramble", "chunks": ["We", "were", "so", "tired", "after", "the", "trip."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit so.', '{"type": "scramble", "chunks": ["We", "were", "so", "tired", "after", "the", "trip."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule2_id, 'es', 'Such + (a/an) + nombre o sintagma nominal', 'Recuerda: such va delante de nombres o grupos nominales: such a mess, such friendly people.'),
        (v_rule2_id, 'de', 'Such + (a/an) + Nomen/Nominalgruppe', 'Denk daran: such steht vor Nomen oder Nominalgruppen: such a mess, such friendly people.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de such: It was ___ long meeting.', '{"type": "typing", "correct_answers": ["such a"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen such-Form: It was ___ long meeting.', '{"type": "typing", "correct_answers": ["such a"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: It was ___ long meeting.', '{"type": "multiple_choice", "options": ["such a", "so", "such"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: It was ___ long meeting.', '{"type": "multiple_choice", "options": ["such a", "so", "such"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: It was such a long meeting.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: It was such a long meeting.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con such.', '{"type": "scramble", "chunks": ["It", "was", "such", "a", "long", "meeting."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit such.', '{"type": "scramble", "chunks": ["It", "was", "such", "a", "long", "meeting."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de such: She is ___ good teacher.', '{"type": "typing", "correct_answers": ["such a"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen such-Form: She is ___ good teacher.', '{"type": "typing", "correct_answers": ["such a"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She is ___ good teacher.', '{"type": "multiple_choice", "options": ["such a", "so", "such"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She is ___ good teacher.', '{"type": "multiple_choice", "options": ["such a", "so", "such"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She is so good teacher.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She is so good teacher.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con such.', '{"type": "scramble", "chunks": ["She", "is", "such", "a", "good", "teacher."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit such.', '{"type": "scramble", "chunks": ["She", "is", "such", "a", "good", "teacher."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de such: They are ___ friendly neighbours.', '{"type": "typing", "correct_answers": ["such"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen such-Form: They are ___ friendly neighbours.', '{"type": "typing", "correct_answers": ["such"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: They are ___ friendly neighbours.', '{"type": "multiple_choice", "options": ["such", "so", "so a"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: They are ___ friendly neighbours.', '{"type": "multiple_choice", "options": ["such", "so", "so a"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They are such friendly neighbours.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They are such friendly neighbours.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con such.', '{"type": "scramble", "chunks": ["They", "are", "such", "friendly", "neighbours."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit such.', '{"type": "scramble", "chunks": ["They", "are", "such", "friendly", "neighbours."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de such: We had ___ bad weather.', '{"type": "typing", "correct_answers": ["such"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen such-Form: We had ___ bad weather.', '{"type": "typing", "correct_answers": ["such"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We had ___ bad weather.', '{"type": "multiple_choice", "options": ["such", "so", "such a"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We had ___ bad weather.', '{"type": "multiple_choice", "options": ["such", "so", "such a"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We had so bad weather.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We had so bad weather.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con such.', '{"type": "scramble", "chunks": ["We", "had", "such", "bad", "weather."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit such.', '{"type": "scramble", "chunks": ["We", "had", "such", "bad", "weather."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de such: That was ___ interesting idea.', '{"type": "typing", "correct_answers": ["such an"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen such-Form: That was ___ interesting idea.', '{"type": "typing", "correct_answers": ["such an"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: That was ___ interesting idea.', '{"type": "multiple_choice", "options": ["such an", "so", "such a"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: That was ___ interesting idea.', '{"type": "multiple_choice", "options": ["such an", "so", "such a"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: That was such an interesting idea.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: That was such an interesting idea.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con such.', '{"type": "scramble", "chunks": ["That", "was", "such", "an", "interesting", "idea."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit such.', '{"type": "scramble", "chunks": ["That", "was", "such", "an", "interesting", "idea."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de such: He bought ___ expensive shoes.', '{"type": "typing", "correct_answers": ["such"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen such-Form: He bought ___ expensive shoes.', '{"type": "typing", "correct_answers": ["such"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He bought ___ expensive shoes.', '{"type": "multiple_choice", "options": ["such", "so", "such a"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He bought ___ expensive shoes.', '{"type": "multiple_choice", "options": ["such", "so", "such a"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He bought so expensive shoes.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He bought so expensive shoes.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con such.', '{"type": "scramble", "chunks": ["He", "bought", "such", "expensive", "shoes."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit such.', '{"type": "scramble", "chunks": ["He", "bought", "such", "expensive", "shoes."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de such: This is ___ mess.', '{"type": "typing", "correct_answers": ["such a"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen such-Form: This is ___ mess.', '{"type": "typing", "correct_answers": ["such a"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This is ___ mess.', '{"type": "multiple_choice", "options": ["such a", "so", "such"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This is ___ mess.', '{"type": "multiple_choice", "options": ["such a", "so", "such"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: This is such a mess.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: This is such a mess.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con such.', '{"type": "scramble", "chunks": ["This", "is", "such", "a", "mess."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit such.', '{"type": "scramble", "chunks": ["This", "is", "such", "a", "mess."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule3_id, 'es', 'So / Such ... that', 'Usa so o such para intensificar y añade that para mostrar la consecuencia: so tired that..., such a mess that....'),
        (v_rule3_id, 'de', 'So / Such ... that', 'Benutze so oder such zur Verstärkung und füge that für die Folge hinzu: so tired that..., such a mess that....');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura con so o such: He was ___ tired that he fell asleep on the sofa.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Struktur mit so oder such: He was ___ tired that he fell asleep on the sofa.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He was ___ tired that he fell asleep on the sofa.', '{"type": "multiple_choice", "options": ["so", "such", "very"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He was ___ tired that he fell asleep on the sofa.', '{"type": "multiple_choice", "options": ["so", "such", "very"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He was so tired that he fell asleep on the sofa.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He was so tired that he fell asleep on the sofa.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase de consecuencia.', '{"type": "scramble", "chunks": ["He", "was", "so", "tired", "that", "he", "fell", "asleep", "on", "the", "sofa."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Folgesatz.', '{"type": "scramble", "chunks": ["He", "was", "so", "tired", "that", "he", "fell", "asleep", "on", "the", "sofa."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura con so o such: It was ___ good book that I read it twice.', '{"type": "typing", "correct_answers": ["such a"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Struktur mit so oder such: It was ___ good book that I read it twice.', '{"type": "typing", "correct_answers": ["such a"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: It was ___ good book that I read it twice.', '{"type": "multiple_choice", "options": ["such a", "so", "such"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: It was ___ good book that I read it twice.', '{"type": "multiple_choice", "options": ["such a", "so", "such"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: It was such a good book that I read it twice.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: It was such a good book that I read it twice.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase de consecuencia.', '{"type": "scramble", "chunks": ["It", "was", "such", "a", "good", "book", "that", "I", "read", "it", "twice."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Folgesatz.', '{"type": "scramble", "chunks": ["It", "was", "such", "a", "good", "book", "that", "I", "read", "it", "twice."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura con so o such: She spoke ___ quietly that nobody heard her.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Struktur mit so oder such: She spoke ___ quietly that nobody heard her.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She spoke ___ quietly that nobody heard her.', '{"type": "multiple_choice", "options": ["so", "such", "very"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She spoke ___ quietly that nobody heard her.', '{"type": "multiple_choice", "options": ["so", "such", "very"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She spoke such quietly that nobody heard her.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She spoke such quietly that nobody heard her.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase de consecuencia.', '{"type": "scramble", "chunks": ["She", "spoke", "so", "quietly", "that", "nobody", "heard", "her."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Folgesatz.', '{"type": "scramble", "chunks": ["She", "spoke", "so", "quietly", "that", "nobody", "heard", "her."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura con so o such: They had ___ heavy traffic that they missed the train.', '{"type": "typing", "correct_answers": ["such"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Struktur mit so oder such: They had ___ heavy traffic that they missed the train.', '{"type": "typing", "correct_answers": ["such"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: They had ___ heavy traffic that they missed the train.', '{"type": "multiple_choice", "options": ["such", "so", "such a"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: They had ___ heavy traffic that they missed the train.', '{"type": "multiple_choice", "options": ["such", "so", "such a"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They had such heavy traffic that they missed the train.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They had such heavy traffic that they missed the train.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase de consecuencia.', '{"type": "scramble", "chunks": ["They", "had", "such", "heavy", "traffic", "that", "they", "missed", "the", "train."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Folgesatz.', '{"type": "scramble", "chunks": ["They", "had", "such", "heavy", "traffic", "that", "they", "missed", "the", "train."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura con so o such: The coffee was ___ strong that I couldn''t sleep.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Struktur mit so oder such: The coffee was ___ strong that I couldn''t sleep.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The coffee was ___ strong that I couldn''t sleep.', '{"type": "multiple_choice", "options": ["so", "such", "very"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The coffee was ___ strong that I couldn''t sleep.', '{"type": "multiple_choice", "options": ["so", "such", "very"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The coffee was so strong that I couldn''t sleep.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The coffee was so strong that I couldn''t sleep.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase de consecuencia.', '{"type": "scramble", "chunks": ["The", "coffee", "was", "so", "strong", "that", "I", "couldn''t", "sleep."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Folgesatz.', '{"type": "scramble", "chunks": ["The", "coffee", "was", "so", "strong", "that", "I", "couldn''t", "sleep."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura con so o such: It was ___ easy test that everyone finished early.', '{"type": "typing", "correct_answers": ["such an"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Struktur mit so oder such: It was ___ easy test that everyone finished early.', '{"type": "typing", "correct_answers": ["such an"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: It was ___ easy test that everyone finished early.', '{"type": "multiple_choice", "options": ["such an", "so", "such"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: It was ___ easy test that everyone finished early.', '{"type": "multiple_choice", "options": ["such an", "so", "such"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: It was so easy test that everyone finished early.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: It was so easy test that everyone finished early.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase de consecuencia.', '{"type": "scramble", "chunks": ["It", "was", "such", "an", "easy", "test", "that", "everyone", "finished", "early."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Folgesatz.', '{"type": "scramble", "chunks": ["It", "was", "such", "an", "easy", "test", "that", "everyone", "finished", "early."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la estructura con so o such: We were ___ hungry that we ordered two pizzas.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Struktur mit so oder such: We were ___ hungry that we ordered two pizzas.', '{"type": "typing", "correct_answers": ["so"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We were ___ hungry that we ordered two pizzas.', '{"type": "multiple_choice", "options": ["so", "such", "very"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We were ___ hungry that we ordered two pizzas.', '{"type": "multiple_choice", "options": ["so", "such", "very"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We were so hungry that we ordered two pizzas.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We were so hungry that we ordered two pizzas.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase de consecuencia.', '{"type": "scramble", "chunks": ["We", "were", "so", "hungry", "that", "we", "ordered", "two", "pizzas."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Folgesatz.', '{"type": "scramble", "chunks": ["We", "were", "so", "hungry", "that", "we", "ordered", "two", "pizzas."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule4_id, 'es', 'Expresiones fijas: so far, so far so good, such as, as such', 'Memoriza estas expresiones completas: so far, so far so good, such as y as such tienen usos fijos.'),
        (v_rule4_id, 'de', 'Feste Wendungen: so far, so far so good, such as, as such', 'Lerne diese festen Wendungen komplett: so far, so far so good, such as und as such haben feste Verwendungen.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la expresión fija correcta: ___, the project is on schedule.', '{"type": "typing", "correct_answers": ["So far"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen festen Wendung: ___, the project is on schedule.', '{"type": "typing", "correct_answers": ["So far"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la expresión correcta: ___, the project is on schedule.', '{"type": "multiple_choice", "options": ["So far", "Such far", "As such"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Wendung: ___, the project is on schedule.', '{"type": "multiple_choice", "options": ["So far", "Such far", "As such"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: So far, the project is on schedule.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: So far, the project is on schedule.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la expresión en contexto.', '{"type": "scramble", "chunks": ["So", "far,", "the", "project", "is", "on", "schedule."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Wendung im Kontext.', '{"type": "scramble", "chunks": ["So", "far,", "the", "project", "is", "on", "schedule."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la expresión fija correcta: We have visited three cities ___.', '{"type": "typing", "correct_answers": ["so far"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen festen Wendung: We have visited three cities ___.', '{"type": "typing", "correct_answers": ["so far"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la expresión correcta: We have visited three cities ___.', '{"type": "multiple_choice", "options": ["so far", "such as", "as such"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Wendung: We have visited three cities ___.', '{"type": "multiple_choice", "options": ["so far", "such as", "as such"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We have visited three cities so far.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We have visited three cities so far.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la expresión en contexto.', '{"type": "scramble", "chunks": ["We", "have", "visited", "three", "cities", "so", "far."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Wendung im Kontext.', '{"type": "scramble", "chunks": ["We", "have", "visited", "three", "cities", "so", "far."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la expresión fija correcta: The new job is hard, but ___.', '{"type": "typing", "correct_answers": ["so far so good"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen festen Wendung: The new job is hard, but ___.', '{"type": "typing", "correct_answers": ["so far so good"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la expresión correcta: The new job is hard, but ___.', '{"type": "multiple_choice", "options": ["so far so good", "so far good", "such as"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Wendung: The new job is hard, but ___.', '{"type": "multiple_choice", "options": ["so far so good", "so far good", "such as"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The new job is hard, but so far good.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The new job is hard, but so far good.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la expresión en contexto.', '{"type": "scramble", "chunks": ["The", "new", "job", "is", "hard,", "but", "so", "far", "so", "good."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Wendung im Kontext.', '{"type": "scramble", "chunks": ["The", "new", "job", "is", "hard,", "but", "so", "far", "so", "good."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la expresión fija correcta: I enjoy outdoor sports ___ hiking and cycling.', '{"type": "typing", "correct_answers": ["such as"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen festen Wendung: I enjoy outdoor sports ___ hiking and cycling.', '{"type": "typing", "correct_answers": ["such as"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la expresión correcta: I enjoy outdoor sports ___ hiking and cycling.', '{"type": "multiple_choice", "options": ["such as", "so far", "as such"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Wendung: I enjoy outdoor sports ___ hiking and cycling.', '{"type": "multiple_choice", "options": ["such as", "so far", "as such"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: I enjoy outdoor sports such as hiking and cycling.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: I enjoy outdoor sports such as hiking and cycling.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la expresión en contexto.', '{"type": "scramble", "chunks": ["I", "enjoy", "outdoor", "sports", "such", "as", "hiking", "and", "cycling."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Wendung im Kontext.', '{"type": "scramble", "chunks": ["I", "enjoy", "outdoor", "sports", "such", "as", "hiking", "and", "cycling."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la expresión fija correcta: He sells fruit ___ apples and pears.', '{"type": "typing", "correct_answers": ["such as"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen festen Wendung: He sells fruit ___ apples and pears.', '{"type": "typing", "correct_answers": ["such as"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la expresión correcta: He sells fruit ___ apples and pears.', '{"type": "multiple_choice", "options": ["such as", "so far", "as such"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Wendung: He sells fruit ___ apples and pears.', '{"type": "multiple_choice", "options": ["such as", "so far", "as such"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He sells fruit such as apples and pears.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He sells fruit such as apples and pears.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la expresión en contexto.', '{"type": "scramble", "chunks": ["He", "sells", "fruit", "such", "as", "apples", "and", "pears."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Wendung im Kontext.', '{"type": "scramble", "chunks": ["He", "sells", "fruit", "such", "as", "apples", "and", "pears."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la expresión fija correcta: The report is informal, and ___ it uses simple language.', '{"type": "typing", "correct_answers": ["as such"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen festen Wendung: The report is informal, and ___ it uses simple language.', '{"type": "typing", "correct_answers": ["as such"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la expresión correcta: The report is informal, and ___ it uses simple language.', '{"type": "multiple_choice", "options": ["as such", "such as", "so far"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Wendung: The report is informal, and ___ it uses simple language.', '{"type": "multiple_choice", "options": ["as such", "such as", "so far"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The report is informal, and as such it uses simple language.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The report is informal, and as such it uses simple language.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la expresión en contexto.', '{"type": "scramble", "chunks": ["The", "report", "is", "informal,", "and", "as", "such", "it", "uses", "simple", "language."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Wendung im Kontext.', '{"type": "scramble", "chunks": ["The", "report", "is", "informal,", "and", "as", "such", "it", "uses", "simple", "language."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la expresión fija correcta: She is the team leader, and ___ she approves the final plan.', '{"type": "typing", "correct_answers": ["as such"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen festen Wendung: She is the team leader, and ___ she approves the final plan.', '{"type": "typing", "correct_answers": ["as such"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la expresión correcta: She is the team leader, and ___ she approves the final plan.', '{"type": "multiple_choice", "options": ["as such", "such as", "so far"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Wendung: She is the team leader, and ___ she approves the final plan.', '{"type": "multiple_choice", "options": ["as such", "such as", "so far"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She is the team leader, and such as she approves the final plan.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She is the team leader, and such as she approves the final plan.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la expresión en contexto.', '{"type": "scramble", "chunks": ["She", "is", "the", "team", "leader,", "and", "as", "such", "she", "approves", "the", "final", "plan."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Wendung im Kontext.', '{"type": "scramble", "chunks": ["She", "is", "the", "team", "leader,", "and", "as", "such", "she", "approves", "the", "final", "plan."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]}'::jsonb);

END;
$seed$;
