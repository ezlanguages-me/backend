-- ============================================================
-- Seed: A0 English Path – STEP 9590 – Grammar – Big, Large and Great
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_grammar_id UUID;
    v_current_rule_id UUID;
    v_ex_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE grammar_rule_uuid IN (
        SELECT gr.uuid
        FROM grammar_rule gr
        JOIN grammar g ON gr.grammar_uuid = g.uuid
        WHERE g.step_order=9590 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=9590 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,9590,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Big, Large and Great', 'Cómo elegir big, large y great según el tipo de tamaño, formalidad o intensidad.', to_jsonb('# Big, Large and Great

**Big**, **large** y **great** pueden sugerir amplitud o intensidad, pero no se usan igual.

## Regla 1: Big = tamaño general y cotidiano

**Big** es la palabra más común en situaciones informales y de todos los días.

- a big dog
- a big garden
- a big problem

## Regla 2: Large = tamaño o cantidad más formal

**Large** suena más formal y es muy frecuente con cantidades, escalas y medidas.

- a large scale
- a large quantity
- a large number

## Regla 3: Great = excelente, importante o intenso

**Great** suele hablar de calidad, importancia o intensidad, no de tamaño físico.

- a great honour
- a great effort
- great importance

## Regla 4: Combinaciones frecuentes

- **big deal**
- **large-scale**
- **great implications**
- **great opportunity**

### Consejo
Para tamaño cotidiano usa **big**. Para tamaño o cantidad en un registro más formal usa **large**. Para importancia o intensidad usa **great**.'::text)),
        (v_grammar_id, 'de', 'Big, Large and Great', 'Wie man big, large und great je nach Größe, Formalität oder Intensität auswählt.', to_jsonb('# Big, Large and Great

**Big**, **large** und **great** können Weite oder Intensität andeuten, werden aber nicht gleich verwendet.

## Regel 1: Big = allgemeine und alltägliche Größe

**Big** ist das häufigste Wort in informellen Alltagssituationen.

- a big dog
- a big garden
- a big problem

## Regel 2: Large = formellere Größe oder Menge

**Large** klingt formeller und ist sehr häufig bei Mengen, Maßstäben und Größenangaben.

- a large scale
- a large quantity
- a large number

## Regel 3: Great = ausgezeichnet, wichtig oder intensiv

**Great** bezieht sich meist auf Qualität, Bedeutung oder Intensität, nicht auf physische Größe.

- a great honour
- a great effort
- great importance

## Regel 4: Häufige Kombinationen

- **big deal**
- **large-scale**
- **great implications**
- **great opportunity**

### Tipp
Für alltägliche Größe verwende **big**. Für Größe oder Menge in einem formelleren Register verwende **large**. Für Bedeutung oder Intensität verwende **great**.'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Big = tamaño general', 'Usa big en contextos cotidianos para hablar de tamaño de forma general.'),
        (v_current_rule_id, 'de', 'Big = allgemeine Größe', 'Verwende big in alltäglichen Kontexten, um allgemein über Größe zu sprechen.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: That is a ___ dog — I was not expecting it to be so tall!', '{"type": "typing", "correct_answers": ["big"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: That is a ___ dog — I was not expecting it to be so tall!', '{"type": "typing", "correct_answers": ["big"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: That is a ___ dog — I was not expecting it to be so tall!', '{"type": "multiple_choice", "options": ["big", "large", "great"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: That is a ___ dog — I was not expecting it to be so tall!', '{"type": "multiple_choice", "options": ["big", "large", "great"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Big se usa de forma general e informal para hablar de tamaño.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Big wird allgemein und informell verwendet, um über Größe zu sprechen.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["That", "is", "a", "big", "dog", "—", "I", "was", "not", "expecting", "it", "to", "be", "so", "tall!"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["That", "is", "a", "big", "dog", "—", "I", "was", "not", "expecting", "it", "to", "be", "so", "tall!"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: We have a ___ garden where the children can play.', '{"type": "typing", "correct_answers": ["big"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: We have a ___ garden where the children can play.', '{"type": "typing", "correct_answers": ["big"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We have a ___ garden where the children can play.', '{"type": "multiple_choice", "options": ["big", "large", "great"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We have a ___ garden where the children can play.', '{"type": "multiple_choice", "options": ["big", "large", "great"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Big suena natural en contextos cotidianos como house, dog o garden.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Big klingt in alltäglichen Kontexten wie house, dog oder garden natürlich.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "have", "a", "big", "garden", "where", "the", "children", "can", "play."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "have", "a", "big", "garden", "where", "the", "children", "can", "play."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Large = tamaño formal o cantidad', 'Usa large con escalas, cantidades y contextos más formales.'),
        (v_current_rule_id, 'de', 'Large = formelle Größe oder Menge', 'Verwende large bei Maßstäben, Mengen und formelleren Kontexten.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: The company operates on a ___ scale across four continents.', '{"type": "typing", "correct_answers": ["large"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: The company operates on a ___ scale across four continents.', '{"type": "typing", "correct_answers": ["large"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The company operates on a ___ scale across four continents.', '{"type": "multiple_choice", "options": ["large", "big", "great"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The company operates on a ___ scale across four continents.', '{"type": "multiple_choice", "options": ["large", "big", "great"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Large se usa en contextos más formales, especialmente con cantidades y medidas.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Large wird in formelleren Kontexten verwendet, besonders bei Mengen und Maßen.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "company", "operates", "on", "a", "large", "scale", "across", "four", "continents."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "company", "operates", "on", "a", "large", "scale", "across", "four", "continents."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: We need a ___ quantity of materials for the project.', '{"type": "typing", "correct_answers": ["large"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: We need a ___ quantity of materials for the project.', '{"type": "typing", "correct_answers": ["large"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We need a ___ quantity of materials for the project.', '{"type": "multiple_choice", "options": ["large", "big", "great"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We need a ___ quantity of materials for the project.', '{"type": "multiple_choice", "options": ["large", "big", "great"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Large quantity es una combinación típica y natural.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Large quantity ist eine typische und natürliche Kombination.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "need", "a", "large", "quantity", "of", "materials", "for", "the", "project."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "need", "a", "large", "quantity", "of", "materials", "for", "the", "project."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Great = importancia o intensidad', 'Usa great para hablar de honor, esfuerzo, importancia o calidad.'),
        (v_current_rule_id, 'de', 'Great = Bedeutung oder Intensität', 'Verwende great, wenn du über Ehre, Anstrengung, Bedeutung oder Qualität sprichst.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: It is a ___ honour to receive this award.', '{"type": "typing", "correct_answers": ["great"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: It is a ___ honour to receive this award.', '{"type": "typing", "correct_answers": ["great"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: It is a ___ honour to receive this award.', '{"type": "multiple_choice", "options": ["great", "big", "large"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: It is a ___ honour to receive this award.', '{"type": "multiple_choice", "options": ["great", "big", "large"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Great se usa para expresar excelencia, importancia o intensidad, no tamaño físico.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Great wird verwendet, um Exzellenz, Bedeutung oder Intensität auszudrücken, nicht physische Größe.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["It", "is", "a", "great", "honour", "to", "receive", "this", "award."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["It", "is", "a", "great", "honour", "to", "receive", "this", "award."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She made a ___ effort to improve her performance.', '{"type": "typing", "correct_answers": ["great"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She made a ___ effort to improve her performance.', '{"type": "typing", "correct_answers": ["great"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She made a ___ effort to improve her performance.', '{"type": "multiple_choice", "options": ["great", "big", "large"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She made a ___ effort to improve her performance.', '{"type": "multiple_choice", "options": ["great", "big", "large"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Great effort habla de intensidad o valor, no de tamaño literal.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Great effort spricht von Intensität oder Wert, nicht von wörtlicher Größe.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "made", "a", "great", "effort", "to", "improve", "her", "performance."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "made", "a", "great", "effort", "to", "improve", "her", "performance."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Combinaciones fijas', 'Aprende combinaciones como big deal, large-scale y great implications como colocaciones habituales.'),
        (v_current_rule_id, 'de', 'Feste Kombinationen', 'Lerne Kombinationen wie big deal, large-scale und great implications als feste Kollokationen.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: It was no ___ deal — everything was resolved quickly.', '{"type": "typing", "correct_answers": ["big"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: It was no ___ deal — everything was resolved quickly.', '{"type": "typing", "correct_answers": ["big"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: It was no ___ deal — everything was resolved quickly.', '{"type": "multiple_choice", "options": ["big", "large", "great"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: It was no ___ deal — everything was resolved quickly.', '{"type": "multiple_choice", "options": ["big", "large", "great"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Expresiones como "big deal", "large-scale" y "great opportunity" son combinaciones fijas.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Ausdrücke wie „big deal“, „large-scale“ und „great opportunity“ sind feste Kombinationen.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["It", "was", "no", "big", "deal", "—", "everything", "was", "resolved", "quickly."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["It", "was", "no", "big", "deal", "—", "everything", "was", "resolved", "quickly."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: The findings have ___ implications for public health.', '{"type": "typing", "correct_answers": ["great"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: The findings have ___ implications for public health.', '{"type": "typing", "correct_answers": ["great"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The findings have ___ implications for public health.', '{"type": "multiple_choice", "options": ["great", "big", "large"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The findings have ___ implications for public health.', '{"type": "multiple_choice", "options": ["great", "big", "large"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Great implications suena natural cuando hablamos de importancia o consecuencias.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Great implications klingt natürlich, wenn wir über Bedeutung oder Folgen sprechen.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "findings", "have", "great", "implications", "for", "public", "health."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "findings", "have", "great", "implications", "for", "public", "health."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

END;
$seed$;
