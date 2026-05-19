-- ============================================================
-- Seed: A0 English Path – STEP 9540 – Grammar – Like vs As
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
        WHERE g.step_order=9540 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=9540 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,9540,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Like vs As', 'Diferencias entre like para semejanza, as para función, comparaciones irreales y expresiones fijas frecuentes.', to_jsonb('# Like vs As

**Like** y **as** pueden traducirse ambos como "como", pero tienen usos muy diferentes.

## Regla 1: Like = similar a (preposición)

**Like** se usa como preposición antes de nombres, pronombres y grupos nominales para indicar similitud.

- She sings **like** a professional.
- He looks **like** his father.

**No uses like antes de una oración completa (sujeto + verbo).**

## Regla 2: As = en el rol de (conjunción o preposición)

**As** se usa para indicar función, rol o identidad real. También introduce cláusulas.

- He works **as** a doctor. (rol real)
- **As** I said earlier, the results are clear. (conjunción: introduce cláusula)

## Regla 3: As if / As though — comparaciones irreales

**As if** y **as though** introducen comparaciones hipotéticas o irreales.

- She acts **as if** she owns the place.
- He talked to me **as though** I were a child.

## Regla 4: Expresiones fijas

- **as usual** = como de costumbre
- **as planned** = según lo previsto
- **as expected** = como se esperaba
- **just like** = exactamente igual que

"Everything went **as** planned." (no: like planned)'::text)),
        (v_grammar_id, 'de', 'Like vs As', 'Unterschiede zwischen like für Ähnlichkeit, as für Funktion, irrealen Vergleichen und festen Wendungen.', to_jsonb('# Like vs As

**Like** und **as** können beide mit „wie“ übersetzt werden, aber sie werden sehr unterschiedlich verwendet.

## Regel 1: Like = ähnlich wie (Präposition)

**Like** wird als Präposition vor Nomen, Pronomen und Nominalgruppen benutzt, um Ähnlichkeit auszudrücken.

- She sings **like** a professional.
- He looks **like** his father.

**Verwende like nicht vor einem ganzen Satz (Subjekt + Verb).**

## Regel 2: As = in der Rolle von (Konjunktion oder Präposition)

**As** wird benutzt, um Funktion, Rolle oder echte Identität auszudrücken. Es kann auch Nebensätze einleiten.

- He works **as** a doctor. (echte Rolle)
- **As** I said earlier, the results are clear. (Konjunktion: leitet einen Satz ein)

## Regel 3: As if / As though — irreale Vergleiche

**As if** und **as though** leiten hypothetische oder irreale Vergleiche ein.

- She acts **as if** she owns the place.
- He talked to me **as though** I were a child.

## Regel 4: Feste Wendungen

- **as usual** = wie gewöhnlich
- **as planned** = wie geplant
- **as expected** = wie erwartet
- **just like** = genau wie

"Everything went **as** planned." (nicht: like planned)'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Like = similar a', 'Usa like delante de nombres y pronombres para expresar semejanza.'),
        (v_current_rule_id, 'de', 'Like = ähnlich wie', 'Verwende like vor Nomen und Pronomen, um Ähnlichkeit auszudrücken.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She sings ___ a professional.', '{"type": "typing", "correct_answers": ["like"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She sings ___ a professional.', '{"type": "typing", "correct_answers": ["like"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She sings ___ a professional.', '{"type": "multiple_choice", "options": ["like", "as", "than"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She sings ___ a professional.', '{"type": "multiple_choice", "options": ["like", "as", "than"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Like se usa como preposición antes de nombres y pronombres.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Like wird als Präposition vor Nomen und Pronomen verwendet.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "sings", "like", "a", "professional."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "sings", "like", "a", "professional."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: He looks ___ his father.', '{"type": "typing", "correct_answers": ["like"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: He looks ___ his father.', '{"type": "typing", "correct_answers": ["like"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He looks ___ his father.', '{"type": "multiple_choice", "options": ["like", "as", "than"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He looks ___ his father.', '{"type": "multiple_choice", "options": ["like", "as", "than"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "He looks like his father", like expresa semejanza.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „He looks like his father“ drückt like Ähnlichkeit aus.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "looks", "like", "his", "father."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "looks", "like", "his", "father."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'As = rol o función', 'Usa as para indicar función real o para introducir una cláusula.'),
        (v_current_rule_id, 'de', 'As = Rolle oder Funktion', 'Verwende as für eine echte Funktion oder um einen Nebensatz einzuleiten.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: He works ___ a doctor in Paris.', '{"type": "typing", "correct_answers": ["as"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: He works ___ a doctor in Paris.', '{"type": "typing", "correct_answers": ["as"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He works ___ a doctor in Paris.', '{"type": "multiple_choice", "options": ["as", "like", "than"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He works ___ a doctor in Paris.', '{"type": "multiple_choice", "options": ["as", "like", "than"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: As se usa para indicar el rol o la función de alguien o algo.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: As wird verwendet, um die Rolle oder Funktion von jemandem oder etwas auszudrücken.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "works", "as", "a", "doctor", "in", "Paris."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "works", "as", "a", "doctor", "in", "Paris."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: ___ I said earlier, the results are clear.', '{"type": "typing", "correct_answers": ["As"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: ___ I said earlier, the results are clear.', '{"type": "typing", "correct_answers": ["As"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: ___ I said earlier, the results are clear.', '{"type": "multiple_choice", "options": ["As", "Like", "So"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: ___ I said earlier, the results are clear.', '{"type": "multiple_choice", "options": ["As", "Like", "So"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "As I said earlier", as introduce una cláusula.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „As I said earlier“ leitet as einen Satz ein.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["As", "I", "said", "earlier,", "the", "results", "are", "clear."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["As", "I", "said", "earlier,", "the", "results", "are", "clear."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'As if / as though', 'Usa as if y as though para comparaciones hipotéticas o irreales.'),
        (v_current_rule_id, 'de', 'As if / as though', 'Verwende as if und as though für hypothetische oder irreale Vergleiche.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She acts ___ if she owns the place.', '{"type": "typing", "correct_answers": ["as"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She acts ___ if she owns the place.', '{"type": "typing", "correct_answers": ["as"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She acts ___ if she owns the place.', '{"type": "multiple_choice", "options": ["as", "like", "so"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She acts ___ if she owns the place.', '{"type": "multiple_choice", "options": ["as", "like", "so"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: As if y as though introducen comparaciones irreales.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: As if und as though leiten irreale Vergleiche ein.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "acts", "as", "if", "she", "owns", "the", "place."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "acts", "as", "if", "she", "owns", "the", "place."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: He talked to me ___ though I were a child.', '{"type": "typing", "correct_answers": ["as"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: He talked to me ___ though I were a child.', '{"type": "typing", "correct_answers": ["as"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He talked to me ___ though I were a child.', '{"type": "multiple_choice", "options": ["as", "like", "so"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He talked to me ___ though I were a child.', '{"type": "multiple_choice", "options": ["as", "like", "so"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "as though I were a child", la comparación es hipotética.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „as though I were a child“ ist der Vergleich hypothetisch.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "talked", "to", "me", "as", "though", "I", "were", "a", "child."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "talked", "to", "me", "as", "though", "I", "were", "a", "child."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Expresiones fijas con as y like', 'Aprende expresiones como as planned, as usual o just like como unidades completas.'),
        (v_current_rule_id, 'de', 'Feste Wendungen mit as und like', 'Lerne Wendungen wie as planned, as usual oder just like als feste Einheiten.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: Everything went ___ planned.', '{"type": "typing", "correct_answers": ["as"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: Everything went ___ planned.', '{"type": "typing", "correct_answers": ["as"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Everything went ___ planned.', '{"type": "multiple_choice", "options": ["as", "like", "than"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Everything went ___ planned.', '{"type": "multiple_choice", "options": ["as", "like", "than"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: La expresión "as usual" significa "como de costumbre".', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Der Ausdruck „as usual“ bedeutet „wie gewöhnlich“.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Everything", "went", "as", "planned."], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Everything", "went", "as", "planned."], "correct_order": [0, 1, 2, 3]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: I told him, but he acted ___ nothing had happened.', '{"type": "typing", "correct_answers": ["as if"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: I told him, but he acted ___ nothing had happened.', '{"type": "typing", "correct_answers": ["as if"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I told him, but he acted ___ nothing had happened.', '{"type": "multiple_choice", "options": ["as if", "like", "as"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I told him, but he acted ___ nothing had happened.', '{"type": "multiple_choice", "options": ["as if", "like", "as"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "acted as if nothing had happened", la expresión completa es fija y natural.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „acted as if nothing had happened“ ist der ganze Ausdruck fest und natürlich.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "told", "him,", "but", "he", "acted", "as", "if", "nothing", "had", "happened."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "told", "him,", "but", "he", "acted", "as", "if", "nothing", "had", "happened."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb);

END;
$seed$;
