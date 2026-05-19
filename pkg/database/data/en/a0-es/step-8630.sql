-- ============================================================
-- Seed: A0 English Path – STEP 8630 – Grammar – Conjeturas y especulación con modales
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
        WHERE g.step_order=8630 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=8630 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,8630,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Conjeturas y especulación con modales', 'Cómo expresar certeza, posibilidad e imposibilidad en presente y pasado con verbos modales.', to_jsonb('# Conjeturas y especulación con modales

En inglés usamos varios **modales** para hacer conclusiones a partir de la evidencia.

## 1. Must para una conclusión fuerte
**Must** expresa una deducción muy probable.
- The lights are on. They **must be** home.
- She has a uniform. She **must work** here.

## 2. Might / Could para posibilidad
**Might** y **could** indican una posibilidad, no una certeza.
- He **might be** at the library.
- It **could rain** later.

## 3. Can''t para imposibilidad
**Can''t** expresa que algo parece imposible según la evidencia.
- She **can''t be** asleep. The TV is very loud.
- This **can''t be** the right key.

## 4. Modales + have + participio
Para especular sobre el pasado usamos **must / might / could / can''t + have + past participle**.
- They **must have left** early.
- I **might have forgotten** my phone.
- He **can''t have seen** the message.

### Idea clave
- evidencia fuerte ahora → **must**
- posibilidad → **might / could**
- imposibilidad → **can''t**
- especulación sobre el pasado → **modal + have + participio**'::text)),
        (v_grammar_id, 'de', 'Vermutungen mit Modalverben', 'Wie man Gewissheit, Möglichkeit und Unmöglichkeit in Gegenwart und Vergangenheit mit Modalverben ausdrückt.', to_jsonb('# Vermutungen mit Modalverben

Im Englischen benutzen wir verschiedene **Modalverben**, um aus Hinweisen eine Schlussfolgerung zu ziehen.

## 1. Must für eine starke Schlussfolgerung
**Must** drückt eine sehr wahrscheinliche Vermutung aus.
- The lights are on. They **must be** home.
- She has a uniform. She **must work** here.

## 2. Might / Could für Möglichkeit
**Might** und **could** zeigen eine Möglichkeit, aber keine Sicherheit.
- He **might be** at the library.
- It **could rain** later.

## 3. Can''t für Unmöglichkeit
**Can''t** zeigt, dass etwas nach den Hinweisen unmöglich wirkt.
- She **can''t be** asleep. The TV is very loud.
- This **can''t be** the right key.

## 4. Modal + have + Partizip Perfekt
Für Vermutungen über die Vergangenheit benutzen wir **must / might / could / can''t + have + past participle**.
- They **must have left** early.
- I **might have forgotten** my phone.
- He **can''t have seen** the message.

### Kernidee
- starke Hinweise jetzt → **must**
- Möglichkeit → **might / could**
- Unmöglichkeit → **can''t**
- Vermutung über die Vergangenheit → **Modal + have + Partizip**'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule1_id, 'es', 'must para certeza o conclusión fuerte', 'Usa must + verbo base cuando la evidencia te lleva a una conclusión casi segura en el presente.'),
        (v_rule1_id, 'de', 'must für starke Schlussfolgerungen', 'Benutze must + Grundverb, wenn dich die Hinweise zu einer fast sicheren Schlussfolgerung in der Gegenwart führen.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con must: The lights are on. They ___ home.', '{"type": "typing", "correct_answers": ["must be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit must: The lights are on. They ___ home.', '{"type": "typing", "correct_answers": ["must be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The lights are on. They ___ home.', '{"type": "multiple_choice", "options": ["must be", "might be", "can''t be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The lights are on. They ___ home.', '{"type": "multiple_choice", "options": ["must be", "might be", "can''t be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The lights are on. They must is home.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The lights are on. They must is home.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión con must.', '{"type": "scramble", "chunks": ["The", "lights", "are", "on.", "They", "must", "be", "home."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung mit must.', '{"type": "scramble", "chunks": ["The", "lights", "are", "on.", "They", "must", "be", "home."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con must: He has a chef''s jacket. He ___ in that restaurant.', '{"type": "typing", "correct_answers": ["must work"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit must: He has a chef''s jacket. He ___ in that restaurant.', '{"type": "typing", "correct_answers": ["must work"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He has a chef''s jacket. He ___ in that restaurant.', '{"type": "multiple_choice", "options": ["must work", "might work", "can''t work"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He has a chef''s jacket. He ___ in that restaurant.', '{"type": "multiple_choice", "options": ["must work", "might work", "can''t work"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He has a chef''s jacket. He must work in that restaurant.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He has a chef''s jacket. He must work in that restaurant.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión con must.', '{"type": "scramble", "chunks": ["He", "has", "a", "chef''s", "jacket.", "He", "must", "work", "in", "that", "restaurant."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung mit must.', '{"type": "scramble", "chunks": ["He", "has", "a", "chef''s", "jacket.", "He", "must", "work", "in", "that", "restaurant."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con must: She is yawning. She ___ tired.', '{"type": "typing", "correct_answers": ["must be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit must: She is yawning. She ___ tired.', '{"type": "typing", "correct_answers": ["must be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She is yawning. She ___ tired.', '{"type": "multiple_choice", "options": ["must be", "might be", "can''t be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She is yawning. She ___ tired.', '{"type": "multiple_choice", "options": ["must be", "might be", "can''t be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She is yawning. She must tired.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She is yawning. She must tired.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión con must.', '{"type": "scramble", "chunks": ["She", "is", "yawning.", "She", "must", "be", "tired."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung mit must.', '{"type": "scramble", "chunks": ["She", "is", "yawning.", "She", "must", "be", "tired."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con must: The answer is perfect. She ___ the topic well.', '{"type": "typing", "correct_answers": ["must know"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit must: The answer is perfect. She ___ the topic well.', '{"type": "typing", "correct_answers": ["must know"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The answer is perfect. She ___ the topic well.', '{"type": "multiple_choice", "options": ["must know", "might know", "can''t know"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The answer is perfect. She ___ the topic well.', '{"type": "multiple_choice", "options": ["must know", "might know", "can''t know"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The answer is perfect. She must know the topic well.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The answer is perfect. She must know the topic well.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión con must.', '{"type": "scramble", "chunks": ["The", "answer", "is", "perfect.", "She", "must", "know", "the", "topic", "well."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung mit must.', '{"type": "scramble", "chunks": ["The", "answer", "is", "perfect.", "She", "must", "know", "the", "topic", "well."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con must: He is carrying a suitcase. He ___.', '{"type": "typing", "correct_answers": ["must be travelling"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit must: He is carrying a suitcase. He ___.', '{"type": "typing", "correct_answers": ["must be travelling"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He is carrying a suitcase. He ___.', '{"type": "multiple_choice", "options": ["must be travelling", "might be travelling", "can''t be travelling"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He is carrying a suitcase. He ___.', '{"type": "multiple_choice", "options": ["must be travelling", "might be travelling", "can''t be travelling"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He is carrying a suitcase. He must travelling.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He is carrying a suitcase. He must travelling.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión con must.', '{"type": "scramble", "chunks": ["He", "is", "carrying", "a", "suitcase.", "He", "must", "be", "travelling."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung mit must.', '{"type": "scramble", "chunks": ["He", "is", "carrying", "a", "suitcase.", "He", "must", "be", "travelling."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con must: Their car is outside. They ___ at home.', '{"type": "typing", "correct_answers": ["must be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit must: Their car is outside. They ___ at home.', '{"type": "typing", "correct_answers": ["must be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Their car is outside. They ___ at home.', '{"type": "multiple_choice", "options": ["must be", "might be", "can''t be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Their car is outside. They ___ at home.', '{"type": "multiple_choice", "options": ["must be", "might be", "can''t be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Their car is outside. They must be at home.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Their car is outside. They must be at home.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión con must.', '{"type": "scramble", "chunks": ["Their", "car", "is", "outside.", "They", "must", "be", "at", "home."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung mit must.', '{"type": "scramble", "chunks": ["Their", "car", "is", "outside.", "They", "must", "be", "at", "home."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con must: This cake tastes amazing. You ___ a great cook.', '{"type": "typing", "correct_answers": ["must be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit must: This cake tastes amazing. You ___ a great cook.', '{"type": "typing", "correct_answers": ["must be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This cake tastes amazing. You ___ a great cook.', '{"type": "multiple_choice", "options": ["must be", "might be", "can''t be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This cake tastes amazing. You ___ a great cook.', '{"type": "multiple_choice", "options": ["must be", "might be", "can''t be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: This cake tastes amazing. You must be a great cook.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: This cake tastes amazing. You must be a great cook.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión con must.', '{"type": "scramble", "chunks": ["This", "cake", "tastes", "amazing.", "You", "must", "be", "a", "great", "cook."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung mit must.', '{"type": "scramble", "chunks": ["This", "cake", "tastes", "amazing.", "You", "must", "be", "a", "great", "cook."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule2_id, 'es', 'might / could para posibilidad', 'Usa might o could para una posibilidad real cuando no estás seguro de la respuesta.'),
        (v_rule2_id, 'de', 'might / could für Möglichkeiten', 'Benutze might oder could für eine reale Möglichkeit, wenn du dir nicht sicher bist.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con might o could: She isn''t answering. She ___ in a meeting.', '{"type": "typing", "correct_answers": ["might be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit might oder could: She isn''t answering. She ___ in a meeting.', '{"type": "typing", "correct_answers": ["might be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She isn''t answering. She ___ in a meeting.', '{"type": "multiple_choice", "options": ["might be", "must be", "can''t be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She isn''t answering. She ___ in a meeting.', '{"type": "multiple_choice", "options": ["might be", "must be", "can''t be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She isn''t answering. She might is in a meeting.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She isn''t answering. She might is in a meeting.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la posibilidad.', '{"type": "scramble", "chunks": ["She", "isn''t", "answering.", "She", "might", "be", "in", "a", "meeting."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Möglichkeit.', '{"type": "scramble", "chunks": ["She", "isn''t", "answering.", "She", "might", "be", "in", "a", "meeting."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con might o could: The shop is closed. It ___ a holiday today.', '{"type": "typing", "correct_answers": ["could be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit might oder could: The shop is closed. It ___ a holiday today.', '{"type": "typing", "correct_answers": ["could be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The shop is closed. It ___ a holiday today.', '{"type": "multiple_choice", "options": ["could be", "must be", "can''t be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The shop is closed. It ___ a holiday today.', '{"type": "multiple_choice", "options": ["could be", "must be", "can''t be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The shop is closed. It could be a holiday today.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The shop is closed. It could be a holiday today.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la posibilidad.', '{"type": "scramble", "chunks": ["The", "shop", "is", "closed.", "It", "could", "be", "a", "holiday", "today."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Möglichkeit.', '{"type": "scramble", "chunks": ["The", "shop", "is", "closed.", "It", "could", "be", "a", "holiday", "today."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con might o could: He looks familiar. I ___ him from college.', '{"type": "typing", "correct_answers": ["might know"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit might oder could: He looks familiar. I ___ him from college.', '{"type": "typing", "correct_answers": ["might know"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He looks familiar. I ___ him from college.', '{"type": "multiple_choice", "options": ["might know", "must know", "can''t know"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He looks familiar. I ___ him from college.', '{"type": "multiple_choice", "options": ["might know", "must know", "can''t know"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He looks familiar. I might knows him from college.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He looks familiar. I might knows him from college.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la posibilidad.', '{"type": "scramble", "chunks": ["He", "looks", "familiar.", "I", "might", "know", "him", "from", "college."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Möglichkeit.', '{"type": "scramble", "chunks": ["He", "looks", "familiar.", "I", "might", "know", "him", "from", "college."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con might o could: They ___ on the wrong train.', '{"type": "typing", "correct_answers": ["could be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit might oder could: They ___ on the wrong train.', '{"type": "typing", "correct_answers": ["could be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: They ___ on the wrong train.', '{"type": "multiple_choice", "options": ["could be", "must be", "can''t be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: They ___ on the wrong train.', '{"type": "multiple_choice", "options": ["could be", "must be", "can''t be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They could be on the wrong train.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They could be on the wrong train.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la posibilidad.', '{"type": "scramble", "chunks": ["They", "could", "be", "on", "the", "wrong", "train."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Möglichkeit.', '{"type": "scramble", "chunks": ["They", "could", "be", "on", "the", "wrong", "train."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con might o could: The keys ___ in your bag.', '{"type": "typing", "correct_answers": ["might be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit might oder could: The keys ___ in your bag.', '{"type": "typing", "correct_answers": ["might be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The keys ___ in your bag.', '{"type": "multiple_choice", "options": ["might be", "must be", "can''t be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The keys ___ in your bag.', '{"type": "multiple_choice", "options": ["might be", "must be", "can''t be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The keys might in your bag.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The keys might in your bag.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la posibilidad.', '{"type": "scramble", "chunks": ["The", "keys", "might", "be", "in", "your", "bag."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Möglichkeit.', '{"type": "scramble", "chunks": ["The", "keys", "might", "be", "in", "your", "bag."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con might o could: This noise ___ from the kitchen.', '{"type": "typing", "correct_answers": ["could come"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit might oder could: This noise ___ from the kitchen.', '{"type": "typing", "correct_answers": ["could come"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This noise ___ from the kitchen.', '{"type": "multiple_choice", "options": ["could come", "must come", "can''t come"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This noise ___ from the kitchen.', '{"type": "multiple_choice", "options": ["could come", "must come", "can''t come"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: This noise could come from the kitchen.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: This noise could come from the kitchen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la posibilidad.', '{"type": "scramble", "chunks": ["This", "noise", "could", "come", "from", "the", "kitchen."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Möglichkeit.', '{"type": "scramble", "chunks": ["This", "noise", "could", "come", "from", "the", "kitchen."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con might o could: We ___ more time.', '{"type": "typing", "correct_answers": ["might need"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit might oder could: We ___ more time.', '{"type": "typing", "correct_answers": ["might need"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We ___ more time.', '{"type": "multiple_choice", "options": ["might need", "must need", "can''t need"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We ___ more time.', '{"type": "multiple_choice", "options": ["might need", "must need", "can''t need"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We might need more time.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We might need more time.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la posibilidad.', '{"type": "scramble", "chunks": ["We", "might", "need", "more", "time."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Möglichkeit.', '{"type": "scramble", "chunks": ["We", "might", "need", "more", "time."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule3_id, 'es', 'can''t para imposibilidad', 'Usa can''t + verbo base cuando la evidencia muestra que algo no puede ser verdad.'),
        (v_rule3_id, 'de', 'can''t für Unmöglichkeit', 'Benutze can''t + Grundverb, wenn die Hinweise zeigen, dass etwas nicht wahr sein kann.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con can''t: She ___ at school; it''s Saturday.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit can''t: She ___ at school; it''s Saturday.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She ___ at school; it''s Saturday.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She ___ at school; it''s Saturday.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She can''t is at school; it''s Saturday.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She can''t is at school; it''s Saturday.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión de imposibilidad.', '{"type": "scramble", "chunks": ["She", "can''t", "be", "at", "school;", "it''s", "Saturday."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung der Unmöglichkeit.', '{"type": "scramble", "chunks": ["She", "can''t", "be", "at", "school;", "it''s", "Saturday."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con can''t: This ___ John''s coat; he never wears black.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit can''t: This ___ John''s coat; he never wears black.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This ___ John''s coat; he never wears black.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This ___ John''s coat; he never wears black.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: This can''t be John''s coat; he never wears black.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: This can''t be John''s coat; he never wears black.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión de imposibilidad.', '{"type": "scramble", "chunks": ["This", "can''t", "be", "John''s", "coat;", "he", "never", "wears", "black."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung der Unmöglichkeit.', '{"type": "scramble", "chunks": ["This", "can''t", "be", "John''s", "coat;", "he", "never", "wears", "black."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con can''t: He ___ the answer; he missed the class.', '{"type": "typing", "correct_answers": ["can''t know"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit can''t: He ___ the answer; he missed the class.', '{"type": "typing", "correct_answers": ["can''t know"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He ___ the answer; he missed the class.', '{"type": "multiple_choice", "options": ["can''t know", "must know", "might know"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He ___ the answer; he missed the class.', '{"type": "multiple_choice", "options": ["can''t know", "must know", "might know"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He can''t knows the answer; he missed the class.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He can''t knows the answer; he missed the class.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión de imposibilidad.', '{"type": "scramble", "chunks": ["He", "can''t", "know", "the", "answer;", "he", "missed", "the", "class."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung der Unmöglichkeit.', '{"type": "scramble", "chunks": ["He", "can''t", "know", "the", "answer;", "he", "missed", "the", "class."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con can''t: They ___ hungry; they just ate lunch.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit can''t: They ___ hungry; they just ate lunch.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: They ___ hungry; they just ate lunch.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: They ___ hungry; they just ate lunch.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They can''t be hungry; they just ate lunch.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They can''t be hungry; they just ate lunch.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión de imposibilidad.', '{"type": "scramble", "chunks": ["They", "can''t", "be", "hungry;", "they", "just", "ate", "lunch."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung der Unmöglichkeit.', '{"type": "scramble", "chunks": ["They", "can''t", "be", "hungry;", "they", "just", "ate", "lunch."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con can''t: That ___ the right key; it doesn''t fit.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit can''t: That ___ the right key; it doesn''t fit.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: That ___ the right key; it doesn''t fit.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: That ___ the right key; it doesn''t fit.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: That can''t be the right key; it doesn''t fit.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: That can''t be the right key; it doesn''t fit.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión de imposibilidad.', '{"type": "scramble", "chunks": ["That", "can''t", "be", "the", "right", "key;", "it", "doesn''t", "fit."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung der Unmöglichkeit.', '{"type": "scramble", "chunks": ["That", "can''t", "be", "the", "right", "key;", "it", "doesn''t", "fit."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con can''t: It ___ easy to work three jobs.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit can''t: It ___ easy to work three jobs.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: It ___ easy to work three jobs.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: It ___ easy to work three jobs.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: It can''t easy to work three jobs.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: It can''t easy to work three jobs.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión de imposibilidad.', '{"type": "scramble", "chunks": ["It", "can''t", "be", "easy", "to", "work", "three", "jobs."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung der Unmöglichkeit.', '{"type": "scramble", "chunks": ["It", "can''t", "be", "easy", "to", "work", "three", "jobs."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con can''t: She ___ asleep; the music is too loud.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit can''t: She ___ asleep; the music is too loud.', '{"type": "typing", "correct_answers": ["can''t be"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She ___ asleep; the music is too loud.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She ___ asleep; the music is too loud.', '{"type": "multiple_choice", "options": ["can''t be", "must be", "might be"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She can''t be asleep; the music is too loud.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She can''t be asleep; the music is too loud.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la conclusión de imposibilidad.', '{"type": "scramble", "chunks": ["She", "can''t", "be", "asleep;", "the", "music", "is", "too", "loud."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Schlussfolgerung der Unmöglichkeit.', '{"type": "scramble", "chunks": ["She", "can''t", "be", "asleep;", "the", "music", "is", "too", "loud."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule4_id, 'es', 'Modales + have + participio', 'Para hablar del pasado con especulación usa modal + have + participio: must have left, might have forgotten.'),
        (v_rule4_id, 'de', 'Modalverben + have + Partizip Perfekt', 'Für Vermutungen über die Vergangenheit benutze Modal + have + Partizip: must have left, might have forgotten.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma del pasado: The lights are off and the office is empty. They ___.', '{"type": "typing", "correct_answers": ["must have left"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Vergangenheitsform: The lights are off and the office is empty. They ___.', '{"type": "typing", "correct_answers": ["must have left"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The lights are off and the office is empty. They ___.', '{"type": "multiple_choice", "options": ["must have left", "must left", "must have leave"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The lights are off and the office is empty. They ___.', '{"type": "multiple_choice", "options": ["must have left", "must left", "must have leave"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The lights are off and the office is empty. They must left.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The lights are off and the office is empty. They must left.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la especulación sobre el pasado.', '{"type": "scramble", "chunks": ["The", "lights", "are", "off", "and", "the", "office", "is", "empty.", "They", "must", "have", "left."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Vermutung über die Vergangenheit.', '{"type": "scramble", "chunks": ["The", "lights", "are", "off", "and", "the", "office", "is", "empty.", "They", "must", "have", "left."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma del pasado: I can''t find my phone. I ___ it on the bus.', '{"type": "typing", "correct_answers": ["might have dropped"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Vergangenheitsform: I can''t find my phone. I ___ it on the bus.', '{"type": "typing", "correct_answers": ["might have dropped"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: I can''t find my phone. I ___ it on the bus.', '{"type": "multiple_choice", "options": ["might have dropped", "might dropped", "might have drop"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: I can''t find my phone. I ___ it on the bus.', '{"type": "multiple_choice", "options": ["might have dropped", "might dropped", "might have drop"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: I can''t find my phone. I might have dropped it on the bus.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: I can''t find my phone. I might have dropped it on the bus.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la especulación sobre el pasado.', '{"type": "scramble", "chunks": ["I", "can''t", "find", "my", "phone.", "I", "might", "have", "dropped", "it", "on", "the", "bus."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Vermutung über die Vergangenheit.', '{"type": "scramble", "chunks": ["I", "can''t", "find", "my", "phone.", "I", "might", "have", "dropped", "it", "on", "the", "bus."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma del pasado: The cake is gone. The children ___ it.', '{"type": "typing", "correct_answers": ["could have eaten"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Vergangenheitsform: The cake is gone. The children ___ it.', '{"type": "typing", "correct_answers": ["could have eaten"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The cake is gone. The children ___ it.', '{"type": "multiple_choice", "options": ["could have eaten", "could eaten", "could have eat"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The cake is gone. The children ___ it.', '{"type": "multiple_choice", "options": ["could have eaten", "could eaten", "could have eat"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The cake is gone. The children could eaten it.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The cake is gone. The children could eaten it.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la especulación sobre el pasado.', '{"type": "scramble", "chunks": ["The", "cake", "is", "gone.", "The", "children", "could", "have", "eaten", "it."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Vermutung über die Vergangenheit.', '{"type": "scramble", "chunks": ["The", "cake", "is", "gone.", "The", "children", "could", "have", "eaten", "it."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma del pasado: The printer is still warm. Someone ___ it recently.', '{"type": "typing", "correct_answers": ["must have used"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Vergangenheitsform: The printer is still warm. Someone ___ it recently.', '{"type": "typing", "correct_answers": ["must have used"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The printer is still warm. Someone ___ it recently.', '{"type": "multiple_choice", "options": ["must have used", "must used", "must have use"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The printer is still warm. Someone ___ it recently.', '{"type": "multiple_choice", "options": ["must have used", "must used", "must have use"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The printer is still warm. Someone must have used it recently.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The printer is still warm. Someone must have used it recently.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la especulación sobre el pasado.', '{"type": "scramble", "chunks": ["The", "printer", "is", "still", "warm.", "Someone", "must", "have", "used", "it", "recently."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Vermutung über die Vergangenheit.', '{"type": "scramble", "chunks": ["The", "printer", "is", "still", "warm.", "Someone", "must", "have", "used", "it", "recently."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma del pasado: There is milk on the floor. The cat ___ the bottle.', '{"type": "typing", "correct_answers": ["might have knocked over"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Vergangenheitsform: There is milk on the floor. The cat ___ the bottle.', '{"type": "typing", "correct_answers": ["might have knocked over"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: There is milk on the floor. The cat ___ the bottle.', '{"type": "multiple_choice", "options": ["might have knocked over", "might knocked over", "might have knock over"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: There is milk on the floor. The cat ___ the bottle.', '{"type": "multiple_choice", "options": ["might have knocked over", "might knocked over", "might have knock over"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: There is milk on the floor. The cat might knocked over the bottle.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: There is milk on the floor. The cat might knocked over the bottle.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la especulación sobre el pasado.', '{"type": "scramble", "chunks": ["There", "is", "milk", "on", "the", "floor.", "The", "cat", "might", "have", "knocked", "over", "the", "bottle."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Vermutung über die Vergangenheit.', '{"type": "scramble", "chunks": ["There", "is", "milk", "on", "the", "floor.", "The", "cat", "might", "have", "knocked", "over", "the", "bottle."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma del pasado: He isn''t answering. He ___ his phone at home.', '{"type": "typing", "correct_answers": ["could have left"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Vergangenheitsform: He isn''t answering. He ___ his phone at home.', '{"type": "typing", "correct_answers": ["could have left"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He isn''t answering. He ___ his phone at home.', '{"type": "multiple_choice", "options": ["could have left", "could left", "could have leave"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He isn''t answering. He ___ his phone at home.', '{"type": "multiple_choice", "options": ["could have left", "could left", "could have leave"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He isn''t answering. He could have left his phone at home.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He isn''t answering. He could have left his phone at home.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la especulación sobre el pasado.', '{"type": "scramble", "chunks": ["He", "isn''t", "answering.", "He", "could", "have", "left", "his", "phone", "at", "home."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Vermutung über die Vergangenheit.', '{"type": "scramble", "chunks": ["He", "isn''t", "answering.", "He", "could", "have", "left", "his", "phone", "at", "home."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa la forma del pasado: The window is open and the papers are everywhere. The wind ___ them off the desk.', '{"type": "typing", "correct_answers": ["must have blown"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze die Vergangenheitsform: The window is open and the papers are everywhere. The wind ___ them off the desk.', '{"type": "typing", "correct_answers": ["must have blown"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The window is open and the papers are everywhere. The wind ___ them off the desk.', '{"type": "multiple_choice", "options": ["must have blown", "must blown", "must have blow"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The window is open and the papers are everywhere. The wind ___ them off the desk.', '{"type": "multiple_choice", "options": ["must have blown", "must blown", "must have blow"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The window is open and the papers are everywhere. The wind must have blown them off the desk.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The window is open and the papers are everywhere. The wind must have blown them off the desk.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la especulación sobre el pasado.', '{"type": "scramble", "chunks": ["The", "window", "is", "open", "and", "the", "papers", "are", "everywhere.", "The", "wind", "must", "have", "blown", "them", "off", "the", "desk."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]}'::jsonb),
        (v_ex_id, 'de', 'Ordne die Vermutung über die Vergangenheit.', '{"type": "scramble", "chunks": ["The", "window", "is", "open", "and", "the", "papers", "are", "everywhere.", "The", "wind", "must", "have", "blown", "them", "off", "the", "desk."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]}'::jsonb);

END;
$seed$;
