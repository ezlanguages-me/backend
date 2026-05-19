-- ============================================================
-- Seed: A0 English Path – STEP 9550 – Grammar – Whole vs All
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
        WHERE g.step_order=9550 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=9550 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,9550,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Whole vs All', 'Cómo expresar totalidad con whole, all, all of y the whole of en estructuras correctas.', to_jsonb('# Whole vs All

**Whole** y **all** expresan totalidad, pero no se combinan con los mismos tipos de palabras.

## Regla 1: Whole + singular noun

**Whole** suele ir con un sustantivo singular y a menudo con **the**.

- the whole book
- the whole day
- the whole city

## Regla 2: All + plural noun o expresiones de tiempo

**All** se usa con nombres en plural y también con algunas expresiones de tiempo.

- all students
- all day
- all the time

## Regla 3: All of / the whole of

Antes de pronombres o determinantes usamos **all of** y, en algunos casos, **the whole of**.

- all of the team
- all of us
- the whole of the building

## Regla 4: The whole day / all day

**The whole day** y **all day** tienen prácticamente el mismo significado, pero la estructura cambia.

- I waited all day.
- I waited the whole day.

### Error común
No digas *whole students* ni *all whole day*. Elige la estructura según el tipo de nombre.

### Consejo rápido
- **whole** + singular noun
- **all** + plural noun / time expression
- **all of** + determiner o pronombre'::text)),
        (v_grammar_id, 'de', 'Whole vs All', 'Wie man Ganzheit mit whole, all, all of und the whole of korrekt ausdrückt.', to_jsonb('# Whole vs All

**Whole** und **all** drücken Ganzheit aus, aber sie werden nicht mit denselben Wortarten kombiniert.

## Regel 1: Whole + singular noun

**Whole** steht meistens mit einem singularischen Nomen und oft mit **the**.

- the whole book
- the whole day
- the whole city

## Regel 2: All + plural noun oder Zeitangaben

**All** wird mit Pluralnomen und auch mit manchen Zeitangaben verwendet.

- all students
- all day
- all the time

## Regel 3: All of / the whole of

Vor Pronomen oder Determinanten verwenden wir **all of** und in manchen Fällen **the whole of**.

- all of the team
- all of us
- the whole of the building

## Regel 4: The whole day / all day

**The whole day** und **all day** bedeuten fast dasselbe, aber die Struktur ist unterschiedlich.

- I waited all day.
- I waited the whole day.

### Häufiger Fehler
Sag nicht *whole students* oder *all whole day*. Wähle die Struktur nach der Art des Nomens.

### Schneller Tipp
- **whole** + singular noun
- **all** + plural noun / Zeitangabe
- **all of** + Determinant oder Pronomen'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Whole + nombre singular', 'Usa whole con sustantivos singulares, normalmente con the.'),
        (v_current_rule_id, 'de', 'Whole + Singularnomen', 'Verwende whole mit Singularnomen, meistens mit the.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: I read the ___ book in one afternoon.', '{"type": "typing", "correct_answers": ["whole"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: I read the ___ book in one afternoon.', '{"type": "typing", "correct_answers": ["whole"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I read the ___ book in one afternoon.', '{"type": "multiple_choice", "options": ["whole", "all", "all of"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I read the ___ book in one afternoon.', '{"type": "multiple_choice", "options": ["whole", "all", "all of"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Whole se usa con un nombre en singular precedido de the.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Whole wird mit einem singularischen Nomen verwendet, das oft von the eingeleitet wird.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "read", "the", "whole", "book", "in", "one", "afternoon."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "read", "the", "whole", "book", "in", "one", "afternoon."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She spent the ___ day at the office.', '{"type": "typing", "correct_answers": ["whole"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She spent the ___ day at the office.', '{"type": "typing", "correct_answers": ["whole"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She spent the ___ day at the office.', '{"type": "multiple_choice", "options": ["whole", "all", "all of"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She spent the ___ day at the office.', '{"type": "multiple_choice", "options": ["whole", "all", "all of"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "the whole day", whole modifica un nombre singular.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „the whole day“ beschreibt whole ein Singularnomen.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "spent", "the", "whole", "day", "at", "the", "office."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "spent", "the", "whole", "day", "at", "the", "office."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'All + plural o tiempo', 'Usa all con plurales y expresiones como all day o all the time.'),
        (v_current_rule_id, 'de', 'All + Plural oder Zeitangabe', 'Verwende all mit Pluralen und Ausdrücken wie all day oder all the time.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: ___ students must register before the deadline.', '{"type": "typing", "correct_answers": ["All"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: ___ students must register before the deadline.', '{"type": "typing", "correct_answers": ["All"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: ___ students must register before the deadline.', '{"type": "multiple_choice", "options": ["All", "Whole", "The whole"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: ___ students must register before the deadline.', '{"type": "multiple_choice", "options": ["All", "Whole", "The whole"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: All se puede usar tanto con nombres en plural como con expresiones de tiempo.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: All kann sowohl mit Pluralnomen als auch mit Zeitangaben verwendet werden.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["All", "students", "must", "register", "before", "the", "deadline."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["All", "students", "must", "register", "before", "the", "deadline."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: He worked ___ day without a break.', '{"type": "typing", "correct_answers": ["all"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: He worked ___ day without a break.', '{"type": "typing", "correct_answers": ["all"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He worked ___ day without a break.', '{"type": "multiple_choice", "options": ["all", "whole", "all of"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He worked ___ day without a break.', '{"type": "multiple_choice", "options": ["all", "whole", "all of"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "all day", all funciona como una expresión de tiempo completa.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „all day“ bildet all einen vollständigen Zeitausdruck.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "worked", "all", "day", "without", "a", "break."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "worked", "all", "day", "without", "a", "break."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'All of / the whole of', 'Usa all of antes de determinantes y pronombres; the whole of aparece en contextos más formales.'),
        (v_current_rule_id, 'de', 'All of / the whole of', 'Verwende all of vor Determinanten und Pronomen; the whole of erscheint eher in formelleren Kontexten.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: ___ of the team attended the meeting.', '{"type": "typing", "correct_answers": ["All"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: ___ of the team attended the meeting.', '{"type": "typing", "correct_answers": ["All"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: ___ of the team attended the meeting.', '{"type": "multiple_choice", "options": ["All", "Whole", "The whole"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: ___ of the team attended the meeting.', '{"type": "multiple_choice", "options": ["All", "Whole", "The whole"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: All of y the whole of pueden usarse antes de pronombres y determinantes.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: All of und the whole of können vor Pronomen und Determinanten stehen.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["All", "of", "the", "team", "attended", "the", "meeting."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["All", "of", "the", "team", "attended", "the", "meeting."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: The whole ___ the building was evacuated.', '{"type": "typing", "correct_answers": ["of"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: The whole ___ the building was evacuated.', '{"type": "typing", "correct_answers": ["of"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The whole ___ the building was evacuated.', '{"type": "multiple_choice", "options": ["of", "all", "in"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The whole ___ the building was evacuated.', '{"type": "multiple_choice", "options": ["of", "all", "in"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "the whole of the building", of conecta whole con el grupo nominal.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „the whole of the building“ verbindet of whole mit der Nominalgruppe.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "whole", "of", "the", "building", "was", "evacuated."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "whole", "of", "the", "building", "was", "evacuated."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'The whole day / all day', 'The whole day y all day significan lo mismo, pero se construyen de forma distinta.'),
        (v_current_rule_id, 'de', 'The whole day / all day', 'The whole day und all day bedeuten dasselbe, sind aber unterschiedlich aufgebaut.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: I waited ___ day for an answer.', '{"type": "typing", "correct_answers": ["all"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: I waited ___ day for an answer.', '{"type": "typing", "correct_answers": ["all"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I waited ___ day for an answer.', '{"type": "multiple_choice", "options": ["all", "whole", "of"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I waited ___ day for an answer.', '{"type": "multiple_choice", "options": ["all", "whole", "of"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: "The whole day" y "all day" tienen el mismo significado pero estructuras diferentes.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: „The whole day“ und „all day“ haben dieselbe Bedeutung, aber unterschiedliche Strukturen.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "waited", "all", "day", "for", "an", "answer."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "waited", "all", "day", "for", "an", "answer."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She was on the phone the ___ morning.', '{"type": "typing", "correct_answers": ["whole"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She was on the phone the ___ morning.', '{"type": "typing", "correct_answers": ["whole"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She was on the phone the ___ morning.', '{"type": "multiple_choice", "options": ["whole", "all", "of"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She was on the phone the ___ morning.', '{"type": "multiple_choice", "options": ["whole", "all", "of"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "the whole morning", the forma parte de la estructura con whole.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „the whole morning“ gehört the zur Struktur mit whole.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "was", "on", "the", "phone", "the", "whole", "morning."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "was", "on", "the", "phone", "the", "whole", "morning."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

END;
$seed$;
