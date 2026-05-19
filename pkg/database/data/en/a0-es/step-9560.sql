-- ============================================================
-- Seed: A0 English Path – STEP 9560 – Grammar – Speak vs Talk
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
        WHERE g.step_order=9560 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=9560 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,9560,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Speak vs Talk', 'Diferencias entre speak y talk en contextos formales, informales y expresiones fijas.', to_jsonb('# Speak vs Talk

**Speak** y **talk** se relacionan con hablar, pero no siempre se usan igual.

## Regla 1: Speak = más formal

**Speak** suena más formal y a menudo se usa cuando una persona se dirige a otras o cuando hablamos de idiomas.

- She will speak at the conference.
- He speaks three languages.

## Regla 2: Talk = más informal

**Talk** se usa en conversaciones cotidianas y suele sugerir intercambio entre personas.

- We need to talk.
- They talked for hours.

## Regla 3: Speak to / with vs Talk to / with

Ambos verbos pueden ir con **to** o **with**, pero **speak** suele sonar más formal que **talk**.

- Could I speak to the manager?
- I need to talk to you.

## Regla 4: Expresiones fijas

- **speak up** = hablar más alto
- **talk nonsense** = decir tonterías
- **talk about** = hablar sobre
- **speak clearly** = hablar con claridad

### Consejo
Piensa en **speak** para contextos formales, idiomas o presentaciones, y en **talk** para conversaciones normales.'::text)),
        (v_grammar_id, 'de', 'Speak vs Talk', 'Unterschiede zwischen speak und talk in formellen, informellen Kontexten und festen Wendungen.', to_jsonb('# Speak vs Talk

**Speak** und **talk** beziehen sich beide auf Sprechen, werden aber nicht immer gleich verwendet.

## Regel 1: Speak = formeller

**Speak** klingt formeller und wird oft benutzt, wenn sich eine Person an andere richtet oder wenn wir über Sprachen sprechen.

- She will speak at the conference.
- He speaks three languages.

## Regel 2: Talk = informeller

**Talk** wird in alltäglichen Gesprächen verwendet und deutet oft einen Austausch zwischen Personen an.

- We need to talk.
- They talked for hours.

## Regel 3: Speak to / with vs Talk to / with

Beide Verben können mit **to** oder **with** stehen, aber **speak** klingt oft formeller als **talk**.

- Could I speak to the manager?
- I need to talk to you.

## Regel 4: Feste Wendungen

- **speak up** = lauter sprechen
- **talk nonsense** = Unsinn reden
- **talk about** = über etwas sprechen
- **speak clearly** = deutlich sprechen

### Tipp
Denke an **speak** für formelle Situationen, Sprachen oder Präsentationen und an **talk** für normale Gespräche.'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Speak = formal', 'Usa speak en situaciones más formales y cuando hablas de idiomas.'),
        (v_current_rule_id, 'de', 'Speak = formell', 'Verwende speak in formelleren Situationen und wenn du über Sprachen sprichst.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She will ___ at the conference tomorrow.', '{"type": "typing", "correct_answers": ["speak"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She will ___ at the conference tomorrow.', '{"type": "typing", "correct_answers": ["speak"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She will ___ at the conference tomorrow.', '{"type": "multiple_choice", "options": ["speak", "talk", "say"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She will ___ at the conference tomorrow.', '{"type": "multiple_choice", "options": ["speak", "talk", "say"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Speak se usa en contextos más formales y a menudo implica que una persona se dirige a otras.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Speak wird in formelleren Kontexten verwendet und bedeutet oft, dass sich eine Person an andere richtet.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "will", "speak", "at", "the", "conference", "tomorrow."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "will", "speak", "at", "the", "conference", "tomorrow."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: He ___ three languages fluently.', '{"type": "typing", "correct_answers": ["speaks"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: He ___ three languages fluently.', '{"type": "typing", "correct_answers": ["speaks"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He ___ three languages fluently.', '{"type": "multiple_choice", "options": ["speaks", "talks", "says"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He ___ three languages fluently.', '{"type": "multiple_choice", "options": ["speaks", "talks", "says"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Speak también se usa para hablar de idiomas.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Speak wird auch verwendet, wenn man über Sprachen spricht.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "speaks", "three", "languages", "fluently."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "speaks", "three", "languages", "fluently."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Talk = informal', 'Usa talk para conversaciones informales y bidireccionales.'),
        (v_current_rule_id, 'de', 'Talk = informell', 'Verwende talk für informelle Gespräche und wechselseitige Kommunikation.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: We need to ___ about the project.', '{"type": "typing", "correct_answers": ["talk"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: We need to ___ about the project.', '{"type": "typing", "correct_answers": ["talk"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We need to ___ about the project.', '{"type": "multiple_choice", "options": ["talk", "speak", "say"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We need to ___ about the project.', '{"type": "multiple_choice", "options": ["talk", "speak", "say"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Talk se usa en contextos más informales e implica conversación bidireccional.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Talk wird in informelleren Kontexten verwendet und deutet auf ein wechselseitiges Gespräch hin.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "need", "to", "talk", "about", "the", "project."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "need", "to", "talk", "about", "the", "project."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: They ___ for hours at the café.', '{"type": "typing", "correct_answers": ["talked"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: They ___ for hours at the café.', '{"type": "typing", "correct_answers": ["talked"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: They ___ for hours at the café.', '{"type": "multiple_choice", "options": ["talked", "spoke", "said"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: They ___ for hours at the café.', '{"type": "multiple_choice", "options": ["talked", "spoke", "said"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En una conversación larga y relajada, talk suele ser la opción natural.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In einem langen, entspannten Gespräch ist talk oft die natürliche Wahl.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["They", "talked", "for", "hours", "at", "the", "café."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["They", "talked", "for", "hours", "at", "the", "café."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Speak to/with vs Talk to/with', 'Tanto speak como talk pueden ir con to o with; la diferencia principal es el nivel de formalidad.'),
        (v_current_rule_id, 'de', 'Speak to/with vs Talk to/with', 'Sowohl speak als auch talk können mit to oder with stehen; der Hauptunterschied ist die Formalität.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: Could I ___ to the manager, please?', '{"type": "typing", "correct_answers": ["speak"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: Could I ___ to the manager, please?', '{"type": "typing", "correct_answers": ["speak"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Could I ___ to the manager, please?', '{"type": "multiple_choice", "options": ["speak", "talk", "say"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Could I ___ to the manager, please?', '{"type": "multiple_choice", "options": ["speak", "talk", "say"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Tanto speak como talk pueden ir seguidos de to o with.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Sowohl speak als auch talk können von to oder with gefolgt werden.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Could", "I", "speak", "to", "the", "manager,", "please?"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Could", "I", "speak", "to", "the", "manager,", "please?"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: I need to ___ to you about something.', '{"type": "typing", "correct_answers": ["talk"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: I need to ___ to you about something.', '{"type": "typing", "correct_answers": ["talk"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I need to ___ to you about something.', '{"type": "multiple_choice", "options": ["talk", "speak", "tell"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I need to ___ to you about something.', '{"type": "multiple_choice", "options": ["talk", "speak", "tell"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Talk to suele sonar más natural en conversaciones personales.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Talk to klingt in persönlichen Gesprächen oft natürlicher.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "need", "to", "talk", "to", "you", "about", "something."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "need", "to", "talk", "to", "you", "about", "something."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Expresiones fijas', 'Memoriza expresiones completas como speak up y talk nonsense.'),
        (v_current_rule_id, 'de', 'Feste Wendungen', 'Lerne feste Ausdrücke wie speak up und talk nonsense als ganze Einheiten.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: Can you ___ up? I can''t hear you.', '{"type": "typing", "correct_answers": ["speak"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: Can you ___ up? I can''t hear you.', '{"type": "typing", "correct_answers": ["speak"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Can you ___ up? I can''t hear you.', '{"type": "multiple_choice", "options": ["speak", "talk", "tell"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Can you ___ up? I can''t hear you.', '{"type": "multiple_choice", "options": ["speak", "talk", "tell"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: La expresión "speak up" significa hablar más alto, mientras que "talk nonsense" significa decir tonterías.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Der Ausdruck „speak up“ bedeutet lauter sprechen, während „talk nonsense“ Unsinn reden bedeutet.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Can", "you", "speak", "up?", "I", "can''t", "hear", "you."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Can", "you", "speak", "up?", "I", "can''t", "hear", "you."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: Don''t ___ nonsense!', '{"type": "typing", "correct_answers": ["talk"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: Don''t ___ nonsense!', '{"type": "typing", "correct_answers": ["talk"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Don''t ___ nonsense!', '{"type": "multiple_choice", "options": ["talk", "speak", "say"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Don''t ___ nonsense!', '{"type": "multiple_choice", "options": ["talk", "speak", "say"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "Don''t talk nonsense!", talk forma parte de una expresión fija.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „Don''t talk nonsense!“ ist talk Teil eines festen Ausdrucks.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Don''t", "talk", "nonsense!"], "correct_order": [0, 1, 2]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Don''t", "talk", "nonsense!"], "correct_order": [0, 1, 2]}'::jsonb);

END;
$seed$;
