-- ============================================================
-- Seed: A0 English Path – STEP 9580 – Grammar – Alone, Lonely, Only and Single
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
        WHERE g.step_order=9580 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=9580 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,9580,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Alone, Lonely, Only and Single', 'Cómo distinguir estado, emoción, exclusividad y cantidad con alone, lonely, only y single.', to_jsonb('# Alone, Lonely, Only and Single

Estas cuatro palabras pueden parecer parecidas, pero expresan ideas distintas.

## Regla 1: Alone = sin otras personas

**Alone** describe el hecho neutral de estar sin compañía.

- work alone
- be alone in the house

## Regla 2: Lonely = sentirse triste por estar solo

**Lonely** añade una emoción negativa: falta de compañía o aislamiento.

- feel lonely
- a lonely person

## Regla 3: Only = único / solamente

**Only** puede ser adjetivo o adverbio.

- the only option
- the only person
- I only need one

## Regla 4: Single = uno / individual / soltero según el contexto

**Single** enfatiza una sola unidad y aparece mucho en contextos formales.

- a single reply
- a single page
- a single ticket

### Consejo
Si hablas de una emoción, piensa en **lonely**. Si hablas simplemente de estar sin otros, usa **alone**. Si quieres decir “único”, usa **only**. Si quieres enfatizar una sola unidad, usa **single**.'::text)),
        (v_grammar_id, 'de', 'Alone, Lonely, Only and Single', 'Wie man Zustand, Gefühl, Ausschließlichkeit und Anzahl mit alone, lonely, only und single unterscheidet.', to_jsonb('# Alone, Lonely, Only and Single

Diese vier Wörter können ähnlich wirken, drücken aber unterschiedliche Ideen aus.

## Regel 1: Alone = ohne andere Personen

**Alone** beschreibt neutral den Zustand, ohne Gesellschaft zu sein.

- work alone
- be alone in the house

## Regel 2: Lonely = sich traurig fühlen, weil man allein ist

**Lonely** fügt eine negative Emotion hinzu: fehlende Gesellschaft oder Isolation.

- feel lonely
- a lonely person

## Regel 3: Only = einzig / nur

**Only** kann Adjektiv oder Adverb sein.

- the only option
- the only person
- I only need one

## Regel 4: Single = eins / einzeln / ledig je nach Kontext

**Single** betont eine einzige Einheit und erscheint oft in formelleren Kontexten.

- a single reply
- a single page
- a single ticket

### Tipp
Wenn du über ein Gefühl sprichst, denke an **lonely**. Wenn du nur ausdrücken willst, dass niemand sonst da ist, nimm **alone**. Für „einzig“ verwende **only**. Wenn du eine einzelne Einheit betonen willst, nimm **single**.'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Alone = sin compañía', 'Usa alone para describir una situación neutral sin otras personas.'),
        (v_current_rule_id, 'de', 'Alone = ohne Gesellschaft', 'Verwende alone, um neutral auszudrücken, dass niemand sonst dabei ist.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She prefers to work ___ when she needs to concentrate.', '{"type": "typing", "correct_answers": ["alone"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She prefers to work ___ when she needs to concentrate.', '{"type": "typing", "correct_answers": ["alone"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She prefers to work ___ when she needs to concentrate.', '{"type": "multiple_choice", "options": ["alone", "lonely", "single"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She prefers to work ___ when she needs to concentrate.', '{"type": "multiple_choice", "options": ["alone", "lonely", "single"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Alone es neutral y simplemente describe el estado de estar sin otras personas.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Alone ist neutral und beschreibt einfach den Zustand, ohne andere Menschen zu sein.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "prefers", "to", "work", "alone", "when", "she", "needs", "to", "concentrate."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "prefers", "to", "work", "alone", "when", "she", "needs", "to", "concentrate."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: He was ___ in the house for the whole weekend.', '{"type": "typing", "correct_answers": ["alone"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: He was ___ in the house for the whole weekend.', '{"type": "typing", "correct_answers": ["alone"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He was ___ in the house for the whole weekend.', '{"type": "multiple_choice", "options": ["alone", "lonely", "only"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He was ___ in the house for the whole weekend.', '{"type": "multiple_choice", "options": ["alone", "lonely", "only"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Alone no expresa necesariamente tristeza.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Alone drückt nicht unbedingt Traurigkeit aus.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "was", "alone", "in", "the", "house", "for", "the", "whole", "weekend."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "was", "alone", "in", "the", "house", "for", "the", "whole", "weekend."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Lonely = sensación emocional', 'Usa lonely cuando quieres expresar tristeza o aislamiento emocional.'),
        (v_current_rule_id, 'de', 'Lonely = emotionales Gefühl', 'Verwende lonely, wenn du Traurigkeit oder emotionale Isolation ausdrücken willst.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She felt ___ after moving to a new city.', '{"type": "typing", "correct_answers": ["lonely"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She felt ___ after moving to a new city.', '{"type": "typing", "correct_answers": ["lonely"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She felt ___ after moving to a new city.', '{"type": "multiple_choice", "options": ["lonely", "alone", "single"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She felt ___ after moving to a new city.', '{"type": "multiple_choice", "options": ["lonely", "alone", "single"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Lonely implica una emoción negativa: tristeza por estar sin compañía.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Lonely enthält eine negative Emotion: Traurigkeit wegen fehlender Gesellschaft.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "felt", "lonely", "after", "moving", "to", "a", "new", "city."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "felt", "lonely", "after", "moving", "to", "a", "new", "city."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: The ___ old man sat by the window every day.', '{"type": "typing", "correct_answers": ["lonely"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: The ___ old man sat by the window every day.', '{"type": "typing", "correct_answers": ["lonely"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The ___ old man sat by the window every day.', '{"type": "multiple_choice", "options": ["lonely", "alone", "only"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The ___ old man sat by the window every day.', '{"type": "multiple_choice", "options": ["lonely", "alone", "only"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Lonely puede describir tanto un sentimiento como a una persona que inspira esa idea.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Lonely kann sowohl ein Gefühl als auch eine Person beschreiben, die diesen Eindruck vermittelt.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "lonely", "old", "man", "sat", "by", "the", "window", "every", "day."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "lonely", "old", "man", "sat", "by", "the", "window", "every", "day."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Only = único / solamente', 'Usa only para hablar de exclusividad o para limitar algo.'),
        (v_current_rule_id, 'de', 'Only = einzig / nur', 'Verwende only, um Einzigartigkeit oder eine Einschränkung auszudrücken.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: That was the ___ option available to us.', '{"type": "typing", "correct_answers": ["only"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: That was the ___ option available to us.', '{"type": "typing", "correct_answers": ["only"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: That was the ___ option available to us.', '{"type": "multiple_choice", "options": ["only", "single", "alone"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: That was the ___ option available to us.', '{"type": "multiple_choice", "options": ["only", "single", "alone"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Only puede usarse como adjetivo (the only) o como adverbio (I only need one).', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Only kann als Adjektiv (the only) oder als Adverb (I only need one) verwendet werden.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["That", "was", "the", "only", "option", "available", "to", "us."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["That", "was", "the", "only", "option", "available", "to", "us."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She is the ___ person who knows the answer.', '{"type": "typing", "correct_answers": ["only"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She is the ___ person who knows the answer.', '{"type": "typing", "correct_answers": ["only"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She is the ___ person who knows the answer.', '{"type": "multiple_choice", "options": ["only", "single", "lonely"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She is the ___ person who knows the answer.', '{"type": "multiple_choice", "options": ["only", "single", "lonely"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "the only person", only significa que no hay ninguna otra.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „the only person“ bedeutet only, dass es keine andere gibt.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "is", "the", "only", "person", "who", "knows", "the", "answer."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "is", "the", "only", "person", "who", "knows", "the", "answer."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Single = una sola unidad', 'Usa single para enfatizar una unidad o elemento individual.'),
        (v_current_rule_id, 'de', 'Single = eine einzelne Einheit', 'Verwende single, um eine einzelne Einheit oder ein einzelnes Element zu betonen.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: I haven''t received a ___ reply to my emails.', '{"type": "typing", "correct_answers": ["single"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: I haven''t received a ___ reply to my emails.', '{"type": "typing", "correct_answers": ["single"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I haven''t received a ___ reply to my emails.', '{"type": "multiple_choice", "options": ["single", "only", "alone"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I haven''t received a ___ reply to my emails.', '{"type": "multiple_choice", "options": ["single", "only", "alone"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Single enfatiza la cantidad de uno y puede usarse en contextos formales o de énfasis.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Single betont die Anzahl eins und kann in formellen oder betonten Kontexten verwendet werden.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "haven''t", "received", "a", "single", "reply", "to", "my", "emails."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "haven''t", "received", "a", "single", "reply", "to", "my", "emails."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: The form must be completed on a ___ page.', '{"type": "typing", "correct_answers": ["single"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: The form must be completed on a ___ page.', '{"type": "typing", "correct_answers": ["single"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The form must be completed on a ___ page.', '{"type": "multiple_choice", "options": ["single", "only", "lonely"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The form must be completed on a ___ page.', '{"type": "multiple_choice", "options": ["single", "only", "lonely"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "a single page", single destaca que debe ser una sola página.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „a single page“ betont single, dass es nur eine Seite sein darf.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "form", "must", "be", "completed", "on", "a", "single", "page."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "form", "must", "be", "completed", "on", "a", "single", "page."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

END;
$seed$;
