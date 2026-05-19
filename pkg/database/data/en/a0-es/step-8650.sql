-- ============================================================
-- Seed: A0 English Path – STEP 8650 – Grammar – Recíprocos
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
        WHERE g.step_order=8650 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=8650 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,8650,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Recíprocos', 'Cómo expresar acciones mutuas con each other y one another, diferenciarlas de los reflexivos y formar posesivos.', to_jsonb('# Recíprocos

Los recíprocos muestran que dos o más personas hacen la misma acción **una hacia la otra**.

## 1. Each other
**Each other** es la forma más frecuente en inglés general.
- They help **each other**.
- We respect **each other**.

## 2. One another
**One another** también es correcto. A veces suena un poco más formal.
- The students support **one another**.
- The teams congratulated **one another**.

## 3. Reflexivo vs. recíproco
No es lo mismo **themselves** que **each other**.
- They looked at **themselves** in the mirror. (reflexivo)
- They looked at **each other** and laughed. (recíproco)

## 4. Formas posesivas
Para hablar de posesión compartida usamos:
- **each other''s** books
- **one another''s** ideas

### Idea clave
Si la acción vuelve al mismo sujeto → reflexivo. Si va de una persona a otra → recíproco.'::text)),
        (v_grammar_id, 'de', 'Reziproke Ausdrücke', 'Wie man gegenseitige Handlungen mit each other und one another ausdrückt, sie von reflexiven Formen trennt und Possessivformen bildet.', to_jsonb('# Reziproke Ausdrücke

Reziproke Formen zeigen, dass zwei oder mehr Personen dieselbe Handlung **gegenseitig** ausführen.

## 1. Each other
**Each other** ist die häufigste Form im allgemeinen Englisch.
- They help **each other**.
- We respect **each other**.

## 2. One another
**One another** ist auch richtig und klingt manchmal etwas formeller.
- The students support **one another**.
- The teams congratulated **one another**.

## 3. Reflexiv vs. reziprok
**Themselves** ist nicht dasselbe wie **each other**.
- They looked at **themselves** in the mirror. (reflexiv)
- They looked at **each other** and laughed. (reziprok)

## 4. Possessivformen
Für gemeinsamen Besitz benutzen wir:
- **each other''s** books
- **one another''s** ideas

### Kernidee
Wenn die Handlung zum selben Subjekt zurückgeht → reflexiv. Wenn sie von einer Person zur anderen geht → reziprok.'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule1_id, 'es', 'each other', 'Usa each other para mostrar una acción mutua entre dos o más personas.'),
        (v_rule1_id, 'de', 'each other', 'Benutze each other, um eine gegenseitige Handlung zwischen zwei oder mehr Personen zu zeigen.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con each other: Anna and Leo help ___ with homework.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit each other: Anna and Leo help ___ with homework.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Anna and Leo help ___ with homework.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Anna and Leo help ___ with homework.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Anna and Leo help each others with homework.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Anna and Leo help each others with homework.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase recíproca.', '{"type": "scramble", "chunks": ["Anna", "and", "Leo", "help", "each", "other", "with", "homework."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den reziproken Satz.', '{"type": "scramble", "chunks": ["Anna", "and", "Leo", "help", "each", "other", "with", "homework."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con each other: The twins call ___ every night.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit each other: The twins call ___ every night.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The twins call ___ every night.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The twins call ___ every night.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The twins call each other every night.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The twins call each other every night.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase recíproca.', '{"type": "scramble", "chunks": ["The", "twins", "call", "each", "other", "every", "night."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den reziproken Satz.', '{"type": "scramble", "chunks": ["The", "twins", "call", "each", "other", "every", "night."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con each other: We should listen to ___.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit each other: We should listen to ___.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We should listen to ___.', '{"type": "multiple_choice", "options": ["each other", "ourselves", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We should listen to ___.', '{"type": "multiple_choice", "options": ["each other", "ourselves", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We should listen each other.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We should listen each other.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase recíproca.', '{"type": "scramble", "chunks": ["We", "should", "listen", "to", "each", "other."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den reziproken Satz.', '{"type": "scramble", "chunks": ["We", "should", "listen", "to", "each", "other."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con each other: The two teams respect ___.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit each other: The two teams respect ___.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The two teams respect ___.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The two teams respect ___.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The two teams respect each other.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The two teams respect each other.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase recíproca.', '{"type": "scramble", "chunks": ["The", "two", "teams", "respect", "each", "other."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den reziproken Satz.', '{"type": "scramble", "chunks": ["The", "two", "teams", "respect", "each", "other."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con each other: My parents text ___ all day.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit each other: My parents text ___ all day.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: My parents text ___ all day.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: My parents text ___ all day.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: My parents text each other all day.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: My parents text each other all day.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase recíproca.', '{"type": "scramble", "chunks": ["My", "parents", "text", "each", "other", "all", "day."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den reziproken Satz.', '{"type": "scramble", "chunks": ["My", "parents", "text", "each", "other", "all", "day."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con each other: The dogs were chasing ___ in the garden.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit each other: The dogs were chasing ___ in the garden.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The dogs were chasing ___ in the garden.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The dogs were chasing ___ in the garden.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The dogs were chasing each others in the garden.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The dogs were chasing each others in the garden.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase recíproca.', '{"type": "scramble", "chunks": ["The", "dogs", "were", "chasing", "each", "other", "in", "the", "garden."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den reziproken Satz.', '{"type": "scramble", "chunks": ["The", "dogs", "were", "chasing", "each", "other", "in", "the", "garden."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con each other: Sara and Mia gave ___ a hug.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit each other: Sara and Mia gave ___ a hug.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Sara and Mia gave ___ a hug.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Sara and Mia gave ___ a hug.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Sara and Mia gave each other a hug.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Sara and Mia gave each other a hug.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase recíproca.', '{"type": "scramble", "chunks": ["Sara", "and", "Mia", "gave", "each", "other", "a", "hug."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den reziproken Satz.', '{"type": "scramble", "chunks": ["Sara", "and", "Mia", "gave", "each", "other", "a", "hug."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule2_id, 'es', 'one another', 'One another también expresa reciprocidad y suele sonar un poco más formal.'),
        (v_rule2_id, 'de', 'one another', 'One another drückt ebenfalls Gegenseitigkeit aus und klingt oft etwas formeller.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con one another: The students in the club support ___.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit one another: The students in the club support ___.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The students in the club support ___.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The students in the club support ___.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The students in the club support one another.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The students in the club support one another.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con one another.', '{"type": "scramble", "chunks": ["The", "students", "in", "the", "club", "support", "one", "another."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit one another.', '{"type": "scramble", "chunks": ["The", "students", "in", "the", "club", "support", "one", "another."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con one another: Good neighbours help ___ in winter.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit one another: Good neighbours help ___ in winter.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Good neighbours help ___ in winter.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Good neighbours help ___ in winter.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Good neighbours help one anothers in winter.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Good neighbours help one anothers in winter.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con one another.', '{"type": "scramble", "chunks": ["Good", "neighbours", "help", "one", "another", "in", "winter."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit one another.', '{"type": "scramble", "chunks": ["Good", "neighbours", "help", "one", "another", "in", "winter."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con one another: The three brothers rarely call ___.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit one another: The three brothers rarely call ___.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The three brothers rarely call ___.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The three brothers rarely call ___.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The three brothers rarely call one another.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The three brothers rarely call one another.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con one another.', '{"type": "scramble", "chunks": ["The", "three", "brothers", "rarely", "call", "one", "another."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit one another.', '{"type": "scramble", "chunks": ["The", "three", "brothers", "rarely", "call", "one", "another."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con one another: The musicians listened to ___ carefully.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit one another: The musicians listened to ___ carefully.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The musicians listened to ___ carefully.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The musicians listened to ___ carefully.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The musicians listened one another carefully.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The musicians listened one another carefully.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con one another.', '{"type": "scramble", "chunks": ["The", "musicians", "listened", "to", "one", "another", "carefully."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit one another.', '{"type": "scramble", "chunks": ["The", "musicians", "listened", "to", "one", "another", "carefully."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con one another: The teams congratulated ___ after the final.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit one another: The teams congratulated ___ after the final.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The teams congratulated ___ after the final.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The teams congratulated ___ after the final.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The teams congratulated one another after the final.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The teams congratulated one another after the final.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con one another.', '{"type": "scramble", "chunks": ["The", "teams", "congratulated", "one", "another", "after", "the", "final."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit one another.', '{"type": "scramble", "chunks": ["The", "teams", "congratulated", "one", "another", "after", "the", "final."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con one another: In a small group, people can learn from ___.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit one another: In a small group, people can learn from ___.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: In a small group, people can learn from ___.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: In a small group, people can learn from ___.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: In a small group, people can learn from one another.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: In a small group, people can learn from one another.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con one another.', '{"type": "scramble", "chunks": ["In", "a", "small", "group,", "people", "can", "learn", "from", "one", "another."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit one another.', '{"type": "scramble", "chunks": ["In", "a", "small", "group,", "people", "can", "learn", "from", "one", "another."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con one another: The volunteers encouraged ___ during the campaign.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit one another: The volunteers encouraged ___ during the campaign.', '{"type": "typing", "correct_answers": ["one another"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The volunteers encouraged ___ during the campaign.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The volunteers encouraged ___ during the campaign.', '{"type": "multiple_choice", "options": ["one another", "each other", "themselves"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The volunteers encouraged one anothers during the campaign.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The volunteers encouraged one anothers during the campaign.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con one another.', '{"type": "scramble", "chunks": ["The", "volunteers", "encouraged", "one", "another", "during", "the", "campaign."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit one another.', '{"type": "scramble", "chunks": ["The", "volunteers", "encouraged", "one", "another", "during", "the", "campaign."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule3_id, 'es', 'Reflexivo vs. recíproco', 'Distingue entre reflexivos (themselves, ourselves) y recíprocos (each other, one another).'),
        (v_rule3_id, 'de', 'Reflexiv vs. reziprok', 'Unterscheide zwischen reflexiven Formen (themselves, ourselves) und reziproken Formen (each other, one another).');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta: The children looked at ___ in the mirror.', '{"type": "typing", "correct_answers": ["themselves"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form: The children looked at ___ in the mirror.', '{"type": "typing", "correct_answers": ["themselves"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The children looked at ___ in the mirror.', '{"type": "multiple_choice", "options": ["themselves", "each other", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The children looked at ___ in the mirror.', '{"type": "multiple_choice", "options": ["themselves", "each other", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The children looked at themself in the mirror.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The children looked at themself in the mirror.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "children", "looked", "at", "themselves", "in", "the", "mirror."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "children", "looked", "at", "themselves", "in", "the", "mirror."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta: The children looked at ___ and laughed.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form: The children looked at ___ and laughed.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The children looked at ___ and laughed.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The children looked at ___ and laughed.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The children looked at each other and laughed.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The children looked at each other and laughed.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "children", "looked", "at", "each", "other", "and", "laughed."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "children", "looked", "at", "each", "other", "and", "laughed."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta: We introduced ___ to the teacher.', '{"type": "typing", "correct_answers": ["ourselves"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form: We introduced ___ to the teacher.', '{"type": "typing", "correct_answers": ["ourselves"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We introduced ___ to the teacher.', '{"type": "multiple_choice", "options": ["ourselves", "each other", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We introduced ___ to the teacher.', '{"type": "multiple_choice", "options": ["ourselves", "each other", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We introduced ourself to the teacher.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We introduced ourself to the teacher.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "introduced", "ourselves", "to", "the", "teacher."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "introduced", "ourselves", "to", "the", "teacher."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta: We introduced ___ to our families.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form: We introduced ___ to our families.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We introduced ___ to our families.', '{"type": "multiple_choice", "options": ["each other", "ourselves", "themselves"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We introduced ___ to our families.', '{"type": "multiple_choice", "options": ["each other", "ourselves", "themselves"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We introduced each other to our families.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We introduced each other to our families.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "introduced", "each", "other", "to", "our", "families."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "introduced", "each", "other", "to", "our", "families."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta: The two friends blamed ___ for the mistake.', '{"type": "typing", "correct_answers": ["themselves"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form: The two friends blamed ___ for the mistake.', '{"type": "typing", "correct_answers": ["themselves"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The two friends blamed ___ for the mistake.', '{"type": "multiple_choice", "options": ["themselves", "each other", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The two friends blamed ___ for the mistake.', '{"type": "multiple_choice", "options": ["themselves", "each other", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The two friends blamed themselves for the mistake.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The two friends blamed themselves for the mistake.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "two", "friends", "blamed", "themselves", "for", "the", "mistake."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "two", "friends", "blamed", "themselves", "for", "the", "mistake."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta: The two friends blamed ___ for the mistake.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form: The two friends blamed ___ for the mistake.', '{"type": "typing", "correct_answers": ["each other"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The two friends blamed ___ for the mistake.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The two friends blamed ___ for the mistake.', '{"type": "multiple_choice", "options": ["each other", "themselves", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The two friends blamed each others for the mistake.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The two friends blamed each others for the mistake.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "two", "friends", "blamed", "each", "other", "for", "the", "mistake."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "two", "friends", "blamed", "each", "other", "for", "the", "mistake."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta: The players hurt ___ during training.', '{"type": "typing", "correct_answers": ["themselves"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form: The players hurt ___ during training.', '{"type": "typing", "correct_answers": ["themselves"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The players hurt ___ during training.', '{"type": "multiple_choice", "options": ["themselves", "each other", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The players hurt ___ during training.', '{"type": "multiple_choice", "options": ["themselves", "each other", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The players hurt themselves during training.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The players hurt themselves during training.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "players", "hurt", "themselves", "during", "training."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "players", "hurt", "themselves", "during", "training."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule4_id, 'es', 'Posesivos: each other''s / one another''s', 'Para hablar de posesión mutua usa each other''s o one another''s delante de un nombre.'),
        (v_rule4_id, 'de', 'Possessivformen: each other''s / one another''s', 'Für gegenseitigen Besitz benutzt du each other''s oder one another''s vor einem Nomen.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma posesiva correcta: The sisters borrowed ___ jackets.', '{"type": "typing", "correct_answers": ["each other''s"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Possessivform: The sisters borrowed ___ jackets.', '{"type": "typing", "correct_answers": ["each other''s"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The sisters borrowed ___ jackets.', '{"type": "multiple_choice", "options": ["each other''s", "each other", "one another''s"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The sisters borrowed ___ jackets.', '{"type": "multiple_choice", "options": ["each other''s", "each other", "one another''s"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The sisters borrowed each other''s jackets.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The sisters borrowed each other''s jackets.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase posesiva.', '{"type": "scramble", "chunks": ["The", "sisters", "borrowed", "each", "other''s", "jackets."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Possessivsatz.', '{"type": "scramble", "chunks": ["The", "sisters", "borrowed", "each", "other''s", "jackets."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma posesiva correcta: The players checked ___ equipment before the game.', '{"type": "typing", "correct_answers": ["one another''s"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Possessivform: The players checked ___ equipment before the game.', '{"type": "typing", "correct_answers": ["one another''s"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The players checked ___ equipment before the game.', '{"type": "multiple_choice", "options": ["one another''s", "one another", "each other''s"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The players checked ___ equipment before the game.', '{"type": "multiple_choice", "options": ["one another''s", "one another", "each other''s"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The players checked one another equipment before the game.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The players checked one another equipment before the game.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase posesiva.', '{"type": "scramble", "chunks": ["The", "players", "checked", "one", "another''s", "equipment", "before", "the", "game."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Possessivsatz.', '{"type": "scramble", "chunks": ["The", "players", "checked", "one", "another''s", "equipment", "before", "the", "game."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma posesiva correcta: We read ___ notes before the exam.', '{"type": "typing", "correct_answers": ["each other''s"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Possessivform: We read ___ notes before the exam.', '{"type": "typing", "correct_answers": ["each other''s"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We read ___ notes before the exam.', '{"type": "multiple_choice", "options": ["each other''s", "each other", "one another"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We read ___ notes before the exam.', '{"type": "multiple_choice", "options": ["each other''s", "each other", "one another"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We read each other''s notes before the exam.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We read each other''s notes before the exam.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase posesiva.', '{"type": "scramble", "chunks": ["We", "read", "each", "other''s", "notes", "before", "the", "exam."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Possessivsatz.', '{"type": "scramble", "chunks": ["We", "read", "each", "other''s", "notes", "before", "the", "exam."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma posesiva correcta: The neighbours watered ___ plants during the holidays.', '{"type": "typing", "correct_answers": ["one another''s"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Possessivform: The neighbours watered ___ plants during the holidays.', '{"type": "typing", "correct_answers": ["one another''s"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The neighbours watered ___ plants during the holidays.', '{"type": "multiple_choice", "options": ["one another''s", "one another", "each other"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The neighbours watered ___ plants during the holidays.', '{"type": "multiple_choice", "options": ["one another''s", "one another", "each other"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The neighbours watered one another plants during the holidays.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The neighbours watered one another plants during the holidays.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase posesiva.', '{"type": "scramble", "chunks": ["The", "neighbours", "watered", "one", "another''s", "plants", "during", "the", "holidays."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Possessivsatz.', '{"type": "scramble", "chunks": ["The", "neighbours", "watered", "one", "another''s", "plants", "during", "the", "holidays."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma posesiva correcta: The twins finished ___ sentences.', '{"type": "typing", "correct_answers": ["each other''s"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Possessivform: The twins finished ___ sentences.', '{"type": "typing", "correct_answers": ["each other''s"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The twins finished ___ sentences.', '{"type": "multiple_choice", "options": ["each other''s", "each other", "one another''s"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The twins finished ___ sentences.', '{"type": "multiple_choice", "options": ["each other''s", "each other", "one another''s"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The twins finished each other''s sentences.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The twins finished each other''s sentences.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase posesiva.', '{"type": "scramble", "chunks": ["The", "twins", "finished", "each", "other''s", "sentences."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Possessivsatz.', '{"type": "scramble", "chunks": ["The", "twins", "finished", "each", "other''s", "sentences."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma posesiva correcta: The teams studied ___ strategies all week.', '{"type": "typing", "correct_answers": ["one another''s"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Possessivform: The teams studied ___ strategies all week.', '{"type": "typing", "correct_answers": ["one another''s"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The teams studied ___ strategies all week.', '{"type": "multiple_choice", "options": ["one another''s", "one another", "each other''s"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The teams studied ___ strategies all week.', '{"type": "multiple_choice", "options": ["one another''s", "one another", "each other''s"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The teams studied one another''s strategies all week.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The teams studied one another''s strategies all week.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase posesiva.', '{"type": "scramble", "chunks": ["The", "teams", "studied", "one", "another''s", "strategies", "all", "week."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Possessivsatz.', '{"type": "scramble", "chunks": ["The", "teams", "studied", "one", "another''s", "strategies", "all", "week."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma posesiva correcta: The children admired ___ drawings.', '{"type": "typing", "correct_answers": ["each other''s"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Possessivform: The children admired ___ drawings.', '{"type": "typing", "correct_answers": ["each other''s"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The children admired ___ drawings.', '{"type": "multiple_choice", "options": ["each other''s", "each other", "one another''s"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The children admired ___ drawings.', '{"type": "multiple_choice", "options": ["each other''s", "each other", "one another''s"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The children admired each other drawings.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The children admired each other drawings.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase posesiva.', '{"type": "scramble", "chunks": ["The", "children", "admired", "each", "other''s", "drawings."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Possessivsatz.', '{"type": "scramble", "chunks": ["The", "children", "admired", "each", "other''s", "drawings."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

END;
$seed$;
