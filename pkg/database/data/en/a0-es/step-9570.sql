-- ============================================================
-- Seed: A0 English Path – STEP 9570 – Grammar – See, Watch and Look
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
        WHERE g.step_order=9570 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=9570 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,9570,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'See, Watch and Look', 'Cómo distinguir ver de forma pasiva, observar deliberadamente y dirigir la mirada.', to_jsonb('# See, Watch and Look

**See**, **watch** y **look** se relacionan con la vista, pero no significan exactamente lo mismo.

## Regla 1: See = percibir con los ojos

**See** se usa cuando algo entra en tu campo visual sin esfuerzo especial.

- I can see the mountains.
- Did you see what happened?

## Regla 2: Watch = observar algo en movimiento o durante un tiempo

**Watch** implica atención deliberada a una actividad, un proceso o algo que se mueve.

- watch football
- watch the children playing

## Regla 3: Look (at) = dirigir la mirada

**Look (at)** significa mover los ojos hacia algo de manera consciente.

- Look at this photo.
- Please look at the board.

## Regla 4: Expresiones fijas

- **look after** = cuidar de
- **watch out** = tener cuidado
- **look for** = buscar
- **see you** = nos vemos

### Consejo rápido
Si la vista es pasiva, usa **see**. Si observas algo durante un tiempo, usa **watch**. Si diriges la mirada, usa **look (at)**.'::text)),
        (v_grammar_id, 'de', 'See, Watch and Look', 'Wie man passives Sehen, bewusstes Beobachten und gezieltes Hinschauen unterscheidet.', to_jsonb('# See, Watch and Look

**See**, **watch** und **look** haben alle mit dem Sehen zu tun, bedeuten aber nicht genau dasselbe.

## Regel 1: See = mit den Augen wahrnehmen

**See** wird verwendet, wenn etwas ohne besondere Anstrengung in dein Blickfeld kommt.

- I can see the mountains.
- Did you see what happened?

## Regel 2: Watch = etwas in Bewegung oder über eine Zeit beobachten

**Watch** bedeutet, dass du einer Aktivität, einem Vorgang oder etwas Bewegtem bewusst Aufmerksamkeit schenkst.

- watch football
- watch the children playing

## Regel 3: Look (at) = den Blick auf etwas richten

**Look (at)** bedeutet, die Augen bewusst auf etwas zu richten.

- Look at this photo.
- Please look at the board.

## Regel 4: Feste Wendungen

- **look after** = sich kümmern um
- **watch out** = aufpassen
- **look for** = suchen
- **see you** = bis später

### Schneller Tipp
Wenn das Sehen passiv ist, nimm **see**. Wenn du etwas eine Zeit lang beobachtest, nimm **watch**. Wenn du den Blick gezielt richtest, nimm **look (at)**.'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'See = percepción pasiva', 'Usa see cuando percibes algo con los ojos sin intención especial.'),
        (v_current_rule_id, 'de', 'See = passive Wahrnehmung', 'Verwende see, wenn du etwas ohne besondere Absicht mit den Augen wahrnimmst.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: I can ___ the mountains from my window.', '{"type": "typing", "correct_answers": ["see"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: I can ___ the mountains from my window.', '{"type": "typing", "correct_answers": ["see"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I can ___ the mountains from my window.', '{"type": "multiple_choice", "options": ["see", "watch", "look"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I can ___ the mountains from my window.', '{"type": "multiple_choice", "options": ["see", "watch", "look"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: See se usa cuando percibimos algo con los ojos sin intención deliberada.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: See wird verwendet, wenn wir etwas ohne bewusste Absicht mit den Augen wahrnehmen.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "can", "see", "the", "mountains", "from", "my", "window."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "can", "see", "the", "mountains", "from", "my", "window."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: Did you ___ what happened?', '{"type": "typing", "correct_answers": ["see"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: Did you ___ what happened?', '{"type": "typing", "correct_answers": ["see"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Did you ___ what happened?', '{"type": "multiple_choice", "options": ["see", "watch", "look"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Did you ___ what happened?', '{"type": "multiple_choice", "options": ["see", "watch", "look"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "Did you see what happened?", see se refiere a percibir un hecho.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „Did you see what happened?“ bezieht sich see auf das Wahrnehmen eines Ereignisses.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Did", "you", "see", "what", "happened?"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Did", "you", "see", "what", "happened?"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Watch = observación deliberada', 'Usa watch cuando sigues algo en movimiento o una actividad durante un tiempo.'),
        (v_current_rule_id, 'de', 'Watch = bewusstes Beobachten', 'Verwende watch, wenn du etwas in Bewegung oder eine Aktivität über eine Zeit verfolgst.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: We love to ___ football on Saturday evenings.', '{"type": "typing", "correct_answers": ["watch"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: We love to ___ football on Saturday evenings.', '{"type": "typing", "correct_answers": ["watch"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We love to ___ football on Saturday evenings.', '{"type": "multiple_choice", "options": ["watch", "see", "look"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We love to ___ football on Saturday evenings.', '{"type": "multiple_choice", "options": ["watch", "see", "look"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Watch se usa cuando observamos algo en movimiento o que ocurre durante un tiempo.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Watch wird verwendet, wenn wir etwas in Bewegung oder über einen Zeitraum beobachten.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "love", "to", "watch", "football", "on", "Saturday", "evenings."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "love", "to", "watch", "football", "on", "Saturday", "evenings."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: She ___ the children playing in the garden.', '{"type": "typing", "correct_answers": ["watched"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She ___ the children playing in the garden.', '{"type": "typing", "correct_answers": ["watched"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She ___ the children playing in the garden.', '{"type": "multiple_choice", "options": ["watched", "saw", "looked"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She ___ the children playing in the garden.', '{"type": "multiple_choice", "options": ["watched", "saw", "looked"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Watch encaja bien con actividades como jugar, correr o actuar.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Watch passt gut zu Aktivitäten wie spielen, laufen oder auftreten.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "watched", "the", "children", "playing", "in", "the", "garden."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "watched", "the", "children", "playing", "in", "the", "garden."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Look (at) = dirigir la mirada', 'Usa look at cuando diriges los ojos conscientemente hacia algo.'),
        (v_current_rule_id, 'de', 'Look (at) = den Blick richten', 'Verwende look at, wenn du den Blick bewusst auf etwas richtest.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: ___ at this photograph — isn''t it beautiful?', '{"type": "typing", "correct_answers": ["Look"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: ___ at this photograph — isn''t it beautiful?', '{"type": "typing", "correct_answers": ["Look"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: ___ at this photograph — isn''t it beautiful?', '{"type": "multiple_choice", "options": ["Look", "See", "Watch"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: ___ at this photograph — isn''t it beautiful?', '{"type": "multiple_choice", "options": ["Look", "See", "Watch"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: Look (at) se usa cuando dirigimos los ojos hacia algo de forma intencional y puntual.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Look (at) wird verwendet, wenn wir den Blick bewusst und gezielt auf etwas richten.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Look", "at", "this", "photograph", "—", "isn''t", "it", "beautiful?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Look", "at", "this", "photograph", "—", "isn''t", "it", "beautiful?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: Please ___ at the board while I explain.', '{"type": "typing", "correct_answers": ["look"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: Please ___ at the board while I explain.', '{"type": "typing", "correct_answers": ["look"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Please ___ at the board while I explain.', '{"type": "multiple_choice", "options": ["look", "see", "watch"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Please ___ at the board while I explain.', '{"type": "multiple_choice", "options": ["look", "see", "watch"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "look at the board", look requiere normalmente at.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „look at the board“ braucht look normalerweise at.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Please", "look", "at", "the", "board", "while", "I", "explain."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Please", "look", "at", "the", "board", "while", "I", "explain."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_current_rule_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Expresiones fijas', 'Aprende expresiones como look after y watch out como bloques fijos.'),
        (v_current_rule_id, 'de', 'Feste Wendungen', 'Lerne Ausdrücke wie look after und watch out als feste Einheiten.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: Could you ___ after my cat while I''m away?', '{"type": "typing", "correct_answers": ["look"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: Could you ___ after my cat while I''m away?', '{"type": "typing", "correct_answers": ["look"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Could you ___ after my cat while I''m away?', '{"type": "multiple_choice", "options": ["look", "watch", "see"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Could you ___ after my cat while I''m away?', '{"type": "multiple_choice", "options": ["look", "watch", "see"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: La expresión "look after" significa cuidar de alguien, mientras que "watch out" significa tener cuidado.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: Der Ausdruck „look after“ bedeutet, sich um jemanden zu kümmern, während „watch out“ bedeutet, vorsichtig zu sein.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Could", "you", "look", "after", "my", "cat", "while", "I''m", "away?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Could", "you", "look", "after", "my", "cat", "while", "I''m", "away?"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa con la palabra correcta: ___ out! There''s a car coming!', '{"type": "typing", "correct_answers": ["Watch"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: ___ out! There''s a car coming!', '{"type": "typing", "correct_answers": ["Watch"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: ___ out! There''s a car coming!', '{"type": "multiple_choice", "options": ["Watch", "Look", "See"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: ___ out! There''s a car coming!', '{"type": "multiple_choice", "options": ["Watch", "Look", "See"], "answer": 0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Verdadero o falso: En "Watch out!", watch no significa observar durante mucho tiempo, sino advertir de un peligro.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Wahr oder falsch: In „Watch out!“ bedeutet watch nicht langes Beobachten, sondern eine Warnung vor Gefahr.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_current_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Watch", "out!", "There''s", "a", "car", "coming!"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Watch", "out!", "There''s", "a", "car", "coming!"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

END;
$seed$;
