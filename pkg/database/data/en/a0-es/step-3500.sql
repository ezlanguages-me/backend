-- ============================================================
-- Seed: A0 English Path – STEP 3500 – Grammar – Will (future with will — predictions, decisions, offers, promises)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_grammar_id UUID;
        v_rule_id UUID;
        v_ex_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise
        WHERE target_uuid IN (
            SELECT uuid FROM grammar
            WHERE step_order = 3500 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'grammar'
        ) OR grammar_rule_uuid IN (
            SELECT gr.uuid
            FROM grammar_rule gr
            JOIN grammar g ON g.uuid = gr.grammar_uuid
            WHERE g.step_order = 3500 AND g.path_uuid = v_path_id AND g.source_language = 'en' AND g.type = 'grammar'
        );
        DELETE FROM grammar WHERE step_order = 3500 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'grammar';

        INSERT INTO grammar (path_uuid, step_order, source_language, type)
        VALUES (v_path_id, 3500, 'en', 'grammar')
        RETURNING uuid INTO v_grammar_id;

        INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
        VALUES
            (v_grammar_id, 'es', 'Will para el futuro', 'Usa will para hablar de predicciones, decisiones instantáneas, ofertas y promesas.', to_jsonb($content_es$## Will para hablar del futuro

Usamos **will** para varias ideas básicas sobre el futuro.

### 1. Predicciones y creencias
Usa **will** cuando dices lo que crees, piensas o imaginas sobre el futuro.

- I think it will rain.
- She will probably be late.
- I think they will win.

Suele aparecer con expresiones como **I think**, **I believe** o **probably**.

### 2. Decisiones instantáneas
Usa **will** cuando decides algo en ese momento.

- I'll have the chicken.
- I'll call you back.
- We'll take a taxi.

La decisión no estaba preparada antes; nace en el momento de hablar.

### 3. Ofertas y promesas
Usa **will** para ofrecer ayuda o prometer algo.

- I'll help you.
- We'll fix it by Friday.
- I'll send the report tonight.

### 4. Negativas y preguntas
La forma negativa es **will not** o **won't**.
La pregunta empieza con **Will**.

- Will you come?
- I won't be long.
- Will she call?

### Forma rápida
- afirmativa: **will / 'll**
- negativa: **won't**
- pregunta: **Will + subject + base verb?**
$content_es$::text)),
            (v_grammar_id, 'de', 'Will für die Zukunft', 'Benutze will für Vorhersagen, spontane Entscheidungen, Angebote und Versprechen.', to_jsonb($content_de$## Will, um über die Zukunft zu sprechen

Wir benutzen **will** für mehrere einfache Ideen über die Zukunft.

### 1. Vorhersagen und Vermutungen
Benutze **will**, wenn du sagst, was du über die Zukunft denkst oder glaubst.

- I think it will rain.
- She will probably be late.
- I think they will win.

Oft steht **will** mit Ausdrücken wie **I think**, **I believe** oder **probably**.

### 2. Spontane Entscheidungen
Benutze **will**, wenn du etwas direkt im Moment entscheidest.

- I'll have the chicken.
- I'll call you back.
- We'll take a taxi.

Die Entscheidung ist neu und entsteht beim Sprechen.

### 3. Angebote und Versprechen
Benutze **will**, um Hilfe anzubieten oder etwas zu versprechen.

- I'll help you.
- We'll fix it by Friday.
- I'll send the report tonight.

### 4. Verneinungen und Fragen
Die negative Form ist **will not** oder **won't**.
Fragen beginnen mit **Will**.

- Will you come?
- I won't be long.
- Will she call?

### Kurze Form
- Aussage: **will / 'll**
- Verneinung: **won't**
- Frage: **Will + subject + base verb?**
$content_de$::text));

INSERT INTO grammar_rule (grammar_uuid, source_language)
VALUES (v_grammar_id, 'en')
RETURNING uuid INTO v_rule_id;

INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES
    (v_rule_id, 'es', 'Predicciones y creencias con will', 'Usa will para decir lo que crees o predices sobre el futuro.'),
    (v_rule_id, 'de', 'Vorhersagen und Vermutungen mit will', 'Benutze will, wenn du etwas über die Zukunft vorhersagst oder vermutest.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I think it ___ rain later.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I think it ___ rain later.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: She ___ probably be late.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: She ___ probably be late.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: The bus ___ arrive soon, I think.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: The bus ___ arrive soon, I think.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: In my opinion, they ___ like the film.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: In my opinion, they ___ like the film.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I think our team ___ win today.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I think our team ___ win today.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: He ___ need a coat tonight.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: He ___ need a coat tonight.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: The weather ___ be better tomorrow.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: The weather ___ be better tomorrow.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I think she ___ be tired after work.', '{"type": "multiple_choice", "options": ["will", "won''t", "am"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I think she ___ be tired after work.', '{"type": "multiple_choice", "options": ["will", "wird nicht", "bin"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The train ___ probably be late.', '{"type": "multiple_choice", "options": ["will", "do", "has"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The train ___ probably be late.', '{"type": "multiple_choice", "options": ["will", "tun", "hat"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I believe they ___ win the game.', '{"type": "multiple_choice", "options": ["will", "are", "did"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I believe they ___ win the game.', '{"type": "multiple_choice", "options": ["will", "sind", "taten"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: It ___ be sunny tomorrow, I think.', '{"type": "multiple_choice", "options": ["will", "can", "was"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: It ___ be sunny tomorrow, I think.', '{"type": "multiple_choice", "options": ["will", "kann", "war"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He ___ like this news.', '{"type": "multiple_choice", "options": ["will", "to", "is"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He ___ like this news.', '{"type": "multiple_choice", "options": ["will", "zu", "ist"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I think we ___ need more chairs.', '{"type": "multiple_choice", "options": ["will", "are", "have"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I think we ___ need more chairs.', '{"type": "multiple_choice", "options": ["will", "sind", "haben"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: They ___ arrive around six.', '{"type": "multiple_choice", "options": ["will", "did", "were"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: They ___ arrive around six.', '{"type": "multiple_choice", "options": ["will", "taten", "waren"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“I think it will snow.” usa will para una predicción.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„I think it will snow.“ benutzt will für eine Vorhersage.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“She will probably call later.” habla de una creencia sobre el futuro.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„She will probably call later.“ zeigt eine Vermutung über die Zukunft.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Para predicciones usamos have/has + participio, no will.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', 'Für Vorhersagen benutzt man have/has + Partizip statt will.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“I think they will win.” expresa una opinión sobre el futuro.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„I think they will win.“ drückt eine Meinung über die Zukunft aus.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Will no se usa con I think.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', 'Will wird nicht mit I think benutzt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“It will be cold tonight.” es una predicción.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„It will be cold tonight.“ ist eine Vorhersage.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“She is will late.” es correcto.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„She is will late.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / think / it / will / rain.', '{"type": "scramble", "chunks": ["I", "think", "it", "will", "rain"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / think / it / will / rain.', '{"type": "scramble", "chunks": ["I", "think", "it", "will", "rain"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: She / will / probably / be / late.', '{"type": "scramble", "chunks": ["She", "will", "probably", "be", "late"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: She / will / probably / be / late.', '{"type": "scramble", "chunks": ["She", "will", "probably", "be", "late"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: They / will / win / the / match.', '{"type": "scramble", "chunks": ["They", "will", "win", "the", "match"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: They / will / win / the / match.', '{"type": "scramble", "chunks": ["They", "will", "win", "the", "match"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: The / bus / will / arrive / soon.', '{"type": "scramble", "chunks": ["The", "bus", "will", "arrive", "soon"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: The / bus / will / arrive / soon.', '{"type": "scramble", "chunks": ["The", "bus", "will", "arrive", "soon"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / think / he / will / call.', '{"type": "scramble", "chunks": ["I", "think", "he", "will", "call"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / think / he / will / call.', '{"type": "scramble", "chunks": ["I", "think", "he", "will", "call"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: It / will / be / sunny / tomorrow.', '{"type": "scramble", "chunks": ["It", "will", "be", "sunny", "tomorrow"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: It / will / be / sunny / tomorrow.', '{"type": "scramble", "chunks": ["It", "will", "be", "sunny", "tomorrow"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: We / will / need / umbrellas.', '{"type": "scramble", "chunks": ["We", "will", "need", "umbrellas"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: We / will / need / umbrellas.', '{"type": "scramble", "chunks": ["We", "will", "need", "umbrellas"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO grammar_rule (grammar_uuid, source_language)
VALUES (v_grammar_id, 'en')
RETURNING uuid INTO v_rule_id;

INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES
    (v_rule_id, 'es', 'Decisiones instantáneas con will', 'Usa will cuando decides algo en el momento de hablar.'),
    (v_rule_id, 'de', 'Spontane Entscheidungen mit will', 'Benutze will, wenn du etwas direkt beim Sprechen entscheidest.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: ___ have the chicken.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: ___ have the chicken.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: Wait here. ___ call you back.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: Wait here. ___ call you back.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: The phone is ringing. ___ answer it.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: The phone is ringing. ___ answer it.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: We are late. ___ take a taxi.', '{"type": "typing", "correct_answers": ["We''ll", "We will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: We are late. ___ take a taxi.', '{"type": "typing", "correct_answers": ["We''ll", "We will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: This bag is heavy. ___ carry it.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: This bag is heavy. ___ carry it.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: No coffee for me. ___ have tea instead.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: No coffee for me. ___ have tea instead.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: It is cold. ___ close the window.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: It is cold. ___ close the window.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The menu is here. I ___ have the fish.', '{"type": "multiple_choice", "options": ["''ll", "did", "have"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The menu is here. I ___ have the fish.', '{"type": "multiple_choice", "options": ["''ll", "tat", "habe"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The phone is ringing. I ___ answer it.', '{"type": "multiple_choice", "options": ["will", "was", "am"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The phone is ringing. I ___ answer it.', '{"type": "multiple_choice", "options": ["will", "war", "bin"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We are in a hurry. We ___ take a taxi.', '{"type": "multiple_choice", "options": ["will", "have", "do"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We are in a hurry. We ___ take a taxi.', '{"type": "multiple_choice", "options": ["will", "haben", "tun"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I forgot his number. I ___ look for it now.', '{"type": "multiple_choice", "options": ["will", "did", "was"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I forgot his number. I ___ look for it now.', '{"type": "multiple_choice", "options": ["will", "tat", "war"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I am thirsty. I ___ get some water.', '{"type": "multiple_choice", "options": ["will", "to", "can"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I am thirsty. I ___ get some water.', '{"type": "multiple_choice", "options": ["will", "zu", "kann"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The window is open. I ___ close it.', '{"type": "multiple_choice", "options": ["will", "has", "are"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The window is open. I ___ close it.', '{"type": "multiple_choice", "options": ["will", "hat", "sind"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We need a plan now. We ___ start with step one.', '{"type": "multiple_choice", "options": ["will", "were", "had"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We need a plan now. We ___ start with step one.', '{"type": "multiple_choice", "options": ["will", "waren", "hatten"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Ill have the chicken.” es una decisión tomada en el momento.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„Ill have the chicken.“ ist eine spontane Entscheidung.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Usamos will para decisiones nuevas hechas ahora.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Man benutzt will für neue Entscheidungen im Moment.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“I decide yesterday, I will...” es una decisión instantánea.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„I decide yesterday, I will...“ ist eine spontane Entscheidung.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Ill answer it.” puede decirse cuando suena el teléfono.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„Ill answer it.“ kann man sagen, wenn das Telefon klingelt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Para decisiones del momento usamos usually + present simple.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', 'Für spontane Entscheidungen benutzt man usually + Präsens.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Well take a taxi.” puede ser una decisión rápida.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„Well take a taxi.“ kann eine schnelle Entscheidung sein.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“I willed choose soup.” es correcto.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„I willed choose soup.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I''ll / have / the / chicken.', '{"type": "scramble", "chunks": ["I''ll", "have", "the", "chicken"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I''ll / have / the / chicken.', '{"type": "scramble", "chunks": ["I''ll", "have", "the", "chicken"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I''ll / call / you / back.', '{"type": "scramble", "chunks": ["I''ll", "call", "you", "back"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I''ll / call / you / back.', '{"type": "scramble", "chunks": ["I''ll", "call", "you", "back"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I''ll / answer / it / now.', '{"type": "scramble", "chunks": ["I''ll", "answer", "it", "now"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I''ll / answer / it / now.', '{"type": "scramble", "chunks": ["I''ll", "answer", "it", "now"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: We''ll / take / a / taxi.', '{"type": "scramble", "chunks": ["We''ll", "take", "a", "taxi"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: We''ll / take / a / taxi.', '{"type": "scramble", "chunks": ["We''ll", "take", "a", "taxi"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I''ll / carry / this / bag.', '{"type": "scramble", "chunks": ["I''ll", "carry", "this", "bag"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I''ll / carry / this / bag.', '{"type": "scramble", "chunks": ["I''ll", "carry", "this", "bag"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I''ll / have / tea / instead.', '{"type": "scramble", "chunks": ["I''ll", "have", "tea", "instead"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I''ll / have / tea / instead.', '{"type": "scramble", "chunks": ["I''ll", "have", "tea", "instead"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I''ll / close / the / window.', '{"type": "scramble", "chunks": ["I''ll", "close", "the", "window"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I''ll / close / the / window.', '{"type": "scramble", "chunks": ["I''ll", "close", "the", "window"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO grammar_rule (grammar_uuid, source_language)
VALUES (v_grammar_id, 'en')
RETURNING uuid INTO v_rule_id;

INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES
    (v_rule_id, 'es', 'Ofertas y promesas con will', 'Usa will para ofrecer ayuda y para prometer acciones futuras.'),
    (v_rule_id, 'de', 'Angebote und Versprechen mit will', 'Benutze will, um Hilfe anzubieten oder etwas zu versprechen.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: Don''t worry. ___ help you.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: Don''t worry. ___ help you.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: We ___ fix it by Friday.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: We ___ fix it by Friday.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I ___ send the report tonight.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I ___ send the report tonight.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: ___ carry those boxes for you.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: ___ carry those boxes for you.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: We ___ call you tomorrow, I promise.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: We ___ call you tomorrow, I promise.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I ___ be there on time.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I ___ be there on time.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: ___ open the door for you.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: ___ open the door for you.', '{"type": "typing", "correct_answers": ["I''ll", "I will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I ___ help you with that bag.', '{"type": "multiple_choice", "options": ["will", "am", "did"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I ___ help you with that bag.', '{"type": "multiple_choice", "options": ["will", "bin", "tat"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We ___ finish the job by Friday.', '{"type": "multiple_choice", "options": ["will", "has", "to"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We ___ finish the job by Friday.', '{"type": "multiple_choice", "options": ["will", "hat", "zu"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I promise I ___ call tonight.', '{"type": "multiple_choice", "options": ["will", "was", "do"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I promise I ___ call tonight.', '{"type": "multiple_choice", "options": ["will", "war", "tue"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Don''t move. I ___ open the door.', '{"type": "multiple_choice", "options": ["will", "had", "can"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Don''t move. I ___ open the door.', '{"type": "multiple_choice", "options": ["will", "hatte", "kann"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We ___ send the invoice today.', '{"type": "multiple_choice", "options": ["will", "were", "is"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We ___ send the invoice today.', '{"type": "multiple_choice", "options": ["will", "waren", "ist"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I ___ stay until the work is done.', '{"type": "multiple_choice", "options": ["will", "to", "did"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I ___ stay until the work is done.', '{"type": "multiple_choice", "options": ["will", "zu", "tat"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I ___ get some water for you.', '{"type": "multiple_choice", "options": ["will", "has", "was"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I ___ get some water for you.', '{"type": "multiple_choice", "options": ["will", "hat", "war"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Ill help you.” es una oferta.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„Ill help you.“ ist ein Angebot.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Well fix it by Friday.” funciona como una promesa.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„Well fix it by Friday.“ funktioniert als Versprechen.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Will no se usa para promesas.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', 'Will wird nicht für Versprechen benutzt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Ill send the report tonight.” promete una acción futura.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„Ill send the report tonight.“ verspricht eine spätere Handlung.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“I helping you” es la forma correcta de una oferta con will.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„I helping you“ ist die korrekte Angebotsform mit will.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Las ofertas con will suelen aparecer con Ill.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Angebote mit will erscheinen oft mit Ill.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“We will never finished it” es correcto.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„We will never finished it“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I''ll / help / you.', '{"type": "scramble", "chunks": ["I''ll", "help", "you"], "correct_order": [0, 1, 2]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I''ll / help / you.', '{"type": "scramble", "chunks": ["I''ll", "help", "you"], "correct_order": [0, 1, 2]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: We''ll / fix / it / by / Friday.', '{"type": "scramble", "chunks": ["We''ll", "fix", "it", "by", "Friday"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: We''ll / fix / it / by / Friday.', '{"type": "scramble", "chunks": ["We''ll", "fix", "it", "by", "Friday"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / will / send / the / report / tonight.', '{"type": "scramble", "chunks": ["I", "will", "send", "the", "report", "tonight"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / will / send / the / report / tonight.', '{"type": "scramble", "chunks": ["I", "will", "send", "the", "report", "tonight"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I''ll / carry / those / boxes.', '{"type": "scramble", "chunks": ["I''ll", "carry", "those", "boxes"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I''ll / carry / those / boxes.', '{"type": "scramble", "chunks": ["I''ll", "carry", "those", "boxes"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: We / will / call / you / tomorrow.', '{"type": "scramble", "chunks": ["We", "will", "call", "you", "tomorrow"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: We / will / call / you / tomorrow.', '{"type": "scramble", "chunks": ["We", "will", "call", "you", "tomorrow"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / will / be / there / on / time.', '{"type": "scramble", "chunks": ["I", "will", "be", "there", "on", "time"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / will / be / there / on / time.', '{"type": "scramble", "chunks": ["I", "will", "be", "there", "on", "time"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I''ll / open / the / door.', '{"type": "scramble", "chunks": ["I''ll", "open", "the", "door"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I''ll / open / the / door.', '{"type": "scramble", "chunks": ["I''ll", "open", "the", "door"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO grammar_rule (grammar_uuid, source_language)
VALUES (v_grammar_id, 'en')
RETURNING uuid INTO v_rule_id;

INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES
    (v_rule_id, 'es', 'Negativas y preguntas con will', 'En preguntas, empieza con Will; en negativo, usa won''t o will not.'),
    (v_rule_id, 'de', 'Verneinungen und Fragen mit will', 'In Fragen beginnt der Satz mit Will; in der Verneinung benutzt man won''t oder will not.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: ___ you come tomorrow?', '{"type": "typing", "correct_answers": ["Will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: ___ you come tomorrow?', '{"type": "typing", "correct_answers": ["Will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I ___ be long.', '{"type": "typing", "correct_answers": ["won''t", "will not"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I ___ be long.', '{"type": "typing", "correct_answers": ["won''t", "will not"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: ___ she need a taxi?', '{"type": "typing", "correct_answers": ["Will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: ___ she need a taxi?', '{"type": "typing", "correct_answers": ["Will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: They ___ forget the address.', '{"type": "typing", "correct_answers": ["won''t", "will not"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: They ___ forget the address.', '{"type": "typing", "correct_answers": ["won''t", "will not"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: ___ we meet at six?', '{"type": "typing", "correct_answers": ["Will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: ___ we meet at six?', '{"type": "typing", "correct_answers": ["Will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: He ___ be late.', '{"type": "typing", "correct_answers": ["won''t", "will not"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: He ___ be late.', '{"type": "typing", "correct_answers": ["won''t", "will not"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: ___ it rain tonight?', '{"type": "typing", "correct_answers": ["Will"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: ___ it rain tonight?', '{"type": "typing", "correct_answers": ["Will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: ___ you call me later?', '{"type": "multiple_choice", "options": ["Will", "Do", "Are"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: ___ you call me later?', '{"type": "multiple_choice", "options": ["Will", "Tust", "Bist"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I ___ stay long.', '{"type": "multiple_choice", "options": ["won''t", "am not", "did not"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I ___ stay long.', '{"type": "multiple_choice", "options": ["won''t", "bin nicht", "tat nicht"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: ___ they be ready soon?', '{"type": "multiple_choice", "options": ["Will", "Have", "Did"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: ___ they be ready soon?', '{"type": "multiple_choice", "options": ["Will", "Haben", "Taten"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She ___ forget the meeting.', '{"type": "multiple_choice", "options": ["won''t", "is", "has"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She ___ forget the meeting.', '{"type": "multiple_choice", "options": ["won''t", "ist", "hat"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: ___ he come with us?', '{"type": "multiple_choice", "options": ["Will", "Was", "Can"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: ___ he come with us?', '{"type": "multiple_choice", "options": ["Will", "War", "Kann"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We ___ be late.', '{"type": "multiple_choice", "options": ["won''t", "were", "do"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We ___ be late.', '{"type": "multiple_choice", "options": ["won''t", "waren", "tun"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: ___ it be difficult?', '{"type": "multiple_choice", "options": ["Will", "Does", "Had"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: ___ it be difficult?', '{"type": "multiple_choice", "options": ["Will", "Tut", "Hatte"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'La pregunta con will empieza con Will + sujeto.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Eine Frage mit will beginnt mit Will + Subjekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'La negativa corta de will es won''t.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Die kurze Verneinung von will ist won''t.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Will you come?” es una pregunta correcta.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„Will you come?“ ist eine korrekte Frage.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“I won''t be long.” es una frase negativa correcta.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„I won''t be long.“ ist ein korrekter negativer Satz.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'En preguntas con will, el verbo principal lleva -ing.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', 'In Fragen mit will steht das Hauptverb in der -ing-Form.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Will she comes?” es correcto.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„Will she comes?“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“They will not come.” es una negativa con will.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„They will not come.“ ist eine Verneinung mit will.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: Will / you / come / tomorrow?', '{"type": "scramble", "chunks": ["Will", "you", "come", "tomorrow"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: Will / you / come / tomorrow?', '{"type": "scramble", "chunks": ["Will", "you", "come", "tomorrow"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / won''t / be / long.', '{"type": "scramble", "chunks": ["I", "won''t", "be", "long"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / won''t / be / long.', '{"type": "scramble", "chunks": ["I", "won''t", "be", "long"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: Will / she / need / a / taxi?', '{"type": "scramble", "chunks": ["Will", "she", "need", "a", "taxi"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: Will / she / need / a / taxi?', '{"type": "scramble", "chunks": ["Will", "she", "need", "a", "taxi"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: They / won''t / forget / the / address.', '{"type": "scramble", "chunks": ["They", "won''t", "forget", "the", "address"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: They / won''t / forget / the / address.', '{"type": "scramble", "chunks": ["They", "won''t", "forget", "the", "address"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: Will / we / meet / at / six?', '{"type": "scramble", "chunks": ["Will", "we", "meet", "at", "six"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: Will / we / meet / at / six?', '{"type": "scramble", "chunks": ["Will", "we", "meet", "at", "six"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: He / won''t / be / late.', '{"type": "scramble", "chunks": ["He", "won''t", "be", "late"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: He / won''t / be / late.', '{"type": "scramble", "chunks": ["He", "won''t", "be", "late"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id)
RETURNING uuid INTO v_ex_id;

INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: Will / it / rain / tonight?', '{"type": "scramble", "chunks": ["Will", "it", "rain", "tonight"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: Will / it / rain / tonight?', '{"type": "scramble", "chunks": ["Will", "it", "rain", "tonight"], "correct_order": [0, 1, 2, 3]}'::jsonb);
END;
$seed$;
