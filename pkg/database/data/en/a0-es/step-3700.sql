-- ============================================================
-- Seed: A0 English Path – STEP 3700 – Grammar – Presente Perfecto (Present Perfect tense)
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
        WHERE target_uuid IN (SELECT uuid FROM grammar WHERE step_order = 3700 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'grammar')
           OR grammar_rule_uuid IN (
                SELECT gr.uuid FROM grammar_rule gr
                JOIN grammar g ON g.uuid = gr.grammar_uuid
                WHERE g.step_order = 3700 AND g.path_uuid = v_path_id AND g.source_language = 'en' AND g.type = 'grammar'
           );
        DELETE FROM grammar WHERE step_order = 3700 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'grammar';
        INSERT INTO grammar (path_uuid, step_order, source_language, type)
        VALUES (v_path_id, 3700, 'en', 'grammar') RETURNING uuid INTO v_grammar_id;
        INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
        VALUES
            (v_grammar_id, 'es', 'Presente perfecto', 'Aprende la forma básica del present perfect, experiencias, hechos recientes y el uso de for/since.', to_jsonb($content_es$## Presente perfecto básico

El **present perfect** se forma con **have/has + participio pasado**.

### 1. Forma básica
Usamos **have** con I, you, we, they y **has** con he, she, it.

- I have visited London.
- She has eaten.
- They have finished.

### 2. Experiencias en la vida
Usamos el present perfect para hablar de experiencias sin decir el momento exacto.

- Have you ever been to Japan?
- I have never seen snow.

### 3. Hechos recientes con resultado ahora
También lo usamos para acciones recientes que todavía tienen efecto.

- I've lost my keys.
- She has just arrived.
- We have finished the report.

### 4. Con for y since
**for** habla de duración y **since** marca el punto de inicio.

- I have worked here for two years.
- She has lived here since 2018.

### Idea clave
No hablamos de un momento terminado del pasado; hablamos de experiencia, resultado actual o duración hasta ahora.
$content_es$::text)),
            (v_grammar_id, 'de', 'Present perfect', 'Lerne die Grundform des present perfect, Erfahrungen, neue Ereignisse und die Verwendung von for/since.', to_jsonb($content_de$## Das present perfect – die Grundform

Das **present perfect** bildet man mit **have/has + Partizip**.

### 1. Grundform
Wir benutzen **have** mit I, you, we, they und **has** mit he, she, it.

- I have visited London.
- She has eaten.
- They have finished.

### 2. Lebenserfahrungen
Man benutzt das present perfect für Erfahrungen, ohne einen genauen Zeitpunkt zu nennen.

- Have you ever been to Japan?
- I have never seen snow.

### 3. Kürzliche Ereignisse mit Wirkung jetzt
Wir benutzen es auch für kürzliche Handlungen, die jetzt noch wichtig sind.

- I've lost my keys.
- She has just arrived.
- We have finished the report.

### 4. Mit for und since
**for** spricht über eine Dauer, **since** über den Startpunkt.

- I have worked here for two years.
- She has lived here since 2018.

### Kernidee
Wir sprechen nicht über einen abgeschlossenen Zeitpunkt in der Vergangenheit, sondern über Erfahrung, ein aktuelles Ergebnis oder eine Dauer bis jetzt.
$content_de$::text));

INSERT INTO grammar_rule (grammar_uuid, source_language)
VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES
    (v_rule_id, 'es', 'Forma: have/has + participio', 'Recuerda: I/you/we/they llevan have; he/she/it llevan has.'),
    (v_rule_id, 'de', 'Form: have/has + Partizip', 'Denk daran: I/you/we/they nehmen have; he/she/it nimmt has.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I ___ visited London.', '{"type": "typing", "correct_answers": ["have"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I ___ visited London.', '{"type": "typing", "correct_answers": ["have"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: She ___ eaten already.', '{"type": "typing", "correct_answers": ["has"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: She ___ eaten already.', '{"type": "typing", "correct_answers": ["has"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: We ___ finished the task.', '{"type": "typing", "correct_answers": ["have"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: We ___ finished the task.', '{"type": "typing", "correct_answers": ["have"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: He ___ lost his ticket.', '{"type": "typing", "correct_answers": ["has"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: He ___ lost his ticket.', '{"type": "typing", "correct_answers": ["has"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: They ___ seen the photo.', '{"type": "typing", "correct_answers": ["have"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: They ___ seen the photo.', '{"type": "typing", "correct_answers": ["have"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: Maria ___ arrived.', '{"type": "typing", "correct_answers": ["has"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: Maria ___ arrived.', '{"type": "typing", "correct_answers": ["has"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: You ___ learned a lot.', '{"type": "typing", "correct_answers": ["have"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: You ___ learned a lot.', '{"type": "typing", "correct_answers": ["have"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She ___ visited Rome.', '{"type": "multiple_choice", "options": ["has", "have", "did"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She ___ visited Rome.', '{"type": "multiple_choice", "options": ["has", "have", "tat"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We ___ finished breakfast.', '{"type": "multiple_choice", "options": ["have", "has", "are"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We ___ finished breakfast.', '{"type": "multiple_choice", "options": ["have", "has", "sind"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He ___ eaten.', '{"type": "multiple_choice", "options": ["has", "have", "was"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He ___ eaten.', '{"type": "multiple_choice", "options": ["has", "have", "war"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: They ___ seen that film.', '{"type": "multiple_choice", "options": ["have", "has", "did"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: They ___ seen that film.', '{"type": "multiple_choice", "options": ["have", "has", "taten"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I ___ lost my bag.', '{"type": "multiple_choice", "options": ["have", "has", "am"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I ___ lost my bag.', '{"type": "multiple_choice", "options": ["have", "has", "bin"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: It ___ stopped.', '{"type": "multiple_choice", "options": ["has", "have", "were"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: It ___ stopped.', '{"type": "multiple_choice", "options": ["has", "have", "waren"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: You ___ arrived early.', '{"type": "multiple_choice", "options": ["have", "has", "to"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: You ___ arrived early.', '{"type": "multiple_choice", "options": ["have", "has", "zu"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'El present perfect usa have/has + participio.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Das present perfect benutzt have/has + Partizip.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Con she usamos has.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Mit she benutzt man has.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Con they usamos has.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', 'Mit they benutzt man has.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“I have visited London.” es una forma correcta.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„I have visited London.“ ist eine korrekte Form.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“He have eaten.” es correcto.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„He have eaten.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Con we usamos have.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Mit we benutzt man have.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'El participio va después de have o has.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Das Partizip steht nach have oder has.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / have / visited / London.', '{"type": "scramble", "chunks": ["I", "have", "visited", "London"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / have / visited / London.', '{"type": "scramble", "chunks": ["I", "have", "visited", "London"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: She / has / eaten.', '{"type": "scramble", "chunks": ["She", "has", "eaten"], "correct_order": [0, 1, 2]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: She / has / eaten.', '{"type": "scramble", "chunks": ["She", "has", "eaten"], "correct_order": [0, 1, 2]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: We / have / finished / the / task.', '{"type": "scramble", "chunks": ["We", "have", "finished", "the", "task"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: We / have / finished / the / task.', '{"type": "scramble", "chunks": ["We", "have", "finished", "the", "task"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: He / has / lost / his / ticket.', '{"type": "scramble", "chunks": ["He", "has", "lost", "his", "ticket"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: He / has / lost / his / ticket.', '{"type": "scramble", "chunks": ["He", "has", "lost", "his", "ticket"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: They / have / seen / the / photo.', '{"type": "scramble", "chunks": ["They", "have", "seen", "the", "photo"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: They / have / seen / the / photo.', '{"type": "scramble", "chunks": ["They", "have", "seen", "the", "photo"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: Maria / has / arrived.', '{"type": "scramble", "chunks": ["Maria", "has", "arrived"], "correct_order": [0, 1, 2]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: Maria / has / arrived.', '{"type": "scramble", "chunks": ["Maria", "has", "arrived"], "correct_order": [0, 1, 2]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: You / have / learned / a / lot.', '{"type": "scramble", "chunks": ["You", "have", "learned", "a", "lot"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: You / have / learned / a / lot.', '{"type": "scramble", "chunks": ["You", "have", "learned", "a", "lot"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO grammar_rule (grammar_uuid, source_language)
VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES
    (v_rule_id, 'es', 'Experiencias de vida con ever/never', 'Usa ever en preguntas sobre experiencias y never para decir que no ha pasado nunca.'),
    (v_rule_id, 'de', 'Lebenserfahrungen mit ever/never', 'Benutze ever in Fragen nach Erfahrungen und never, wenn etwas noch nie passiert ist.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: Have you ___ been to Japan?', '{"type": "typing", "correct_answers": ["ever"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: Have you ___ been to Japan?', '{"type": "typing", "correct_answers": ["ever"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I have ___ seen snow.', '{"type": "typing", "correct_answers": ["never"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I have ___ seen snow.', '{"type": "typing", "correct_answers": ["never"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: Has she ___ tried sushi?', '{"type": "typing", "correct_answers": ["ever"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: Has she ___ tried sushi?', '{"type": "typing", "correct_answers": ["ever"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: We have ___ visited Rome.', '{"type": "typing", "correct_answers": ["never"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: We have ___ visited Rome.', '{"type": "typing", "correct_answers": ["never"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: Have they ___ flown before?', '{"type": "typing", "correct_answers": ["ever"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: Have they ___ flown before?', '{"type": "typing", "correct_answers": ["ever"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: He has ___ met my sister.', '{"type": "typing", "correct_answers": ["never"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: He has ___ met my sister.', '{"type": "typing", "correct_answers": ["never"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: Have you ___ eaten octopus?', '{"type": "typing", "correct_answers": ["ever"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: Have you ___ eaten octopus?', '{"type": "typing", "correct_answers": ["ever"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Have you ___ been abroad?', '{"type": "multiple_choice", "options": ["ever", "never", "for"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Have you ___ been abroad?', '{"type": "multiple_choice", "options": ["ever", "never", "for"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I have ___ seen that mountain.', '{"type": "multiple_choice", "options": ["never", "ever", "since"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I have ___ seen that mountain.', '{"type": "multiple_choice", "options": ["never", "ever", "since"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Has she ___ tried Indian food?', '{"type": "multiple_choice", "options": ["ever", "never", "just"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Has she ___ tried Indian food?', '{"type": "multiple_choice", "options": ["ever", "never", "just"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We have ___ visited Berlin.', '{"type": "multiple_choice", "options": ["never", "ever", "already"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We have ___ visited Berlin.', '{"type": "multiple_choice", "options": ["never", "ever", "already"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Have they ___ driven in snow?', '{"type": "multiple_choice", "options": ["ever", "never", "for"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Have they ___ driven in snow?', '{"type": "multiple_choice", "options": ["ever", "never", "for"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He has ___ spoken to the director.', '{"type": "multiple_choice", "options": ["never", "ever", "since"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He has ___ spoken to the director.', '{"type": "multiple_choice", "options": ["never", "ever", "since"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: Have you ___ eaten here before?', '{"type": "multiple_choice", "options": ["ever", "never", "just"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: Have you ___ eaten here before?', '{"type": "multiple_choice", "options": ["ever", "never", "just"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ever se usa a menudo en preguntas sobre experiencias.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Ever wird oft in Fragen nach Erfahrungen benutzt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Never significa “nunca”.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Never bedeutet „nie“.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Have you ever been to Japan?” pregunta por una experiencia de vida.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„Have you ever been to Japan?“ fragt nach einer Lebenserfahrung.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“I have ever seen snow.” es la forma normal en afirmativa.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„I have ever seen snow.“ ist die normale bejahte Form.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Never puede usarse para decir que algo no ha pasado nunca.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Never kann benutzt werden, um zu sagen, dass etwas noch nie passiert ist.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ever y never hablan siempre de una hora exacta.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', 'Ever und never sprechen immer über eine genaue Uhrzeit.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“She has never tried sushi.” es una frase correcta.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„She has never tried sushi.“ ist ein korrekter Satz.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: Have / you / ever / been / to / Japan?', '{"type": "scramble", "chunks": ["Have", "you", "ever", "been", "to", "Japan"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: Have / you / ever / been / to / Japan?', '{"type": "scramble", "chunks": ["Have", "you", "ever", "been", "to", "Japan"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / have / never / seen / snow.', '{"type": "scramble", "chunks": ["I", "have", "never", "seen", "snow"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / have / never / seen / snow.', '{"type": "scramble", "chunks": ["I", "have", "never", "seen", "snow"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: Has / she / ever / tried / sushi?', '{"type": "scramble", "chunks": ["Has", "she", "ever", "tried", "sushi"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: Has / she / ever / tried / sushi?', '{"type": "scramble", "chunks": ["Has", "she", "ever", "tried", "sushi"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: We / have / never / visited / Rome.', '{"type": "scramble", "chunks": ["We", "have", "never", "visited", "Rome"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: We / have / never / visited / Rome.', '{"type": "scramble", "chunks": ["We", "have", "never", "visited", "Rome"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: Have / they / ever / flown / before?', '{"type": "scramble", "chunks": ["Have", "they", "ever", "flown", "before"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: Have / they / ever / flown / before?', '{"type": "scramble", "chunks": ["Have", "they", "ever", "flown", "before"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: He / has / never / met / my / sister.', '{"type": "scramble", "chunks": ["He", "has", "never", "met", "my", "sister"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: He / has / never / met / my / sister.', '{"type": "scramble", "chunks": ["He", "has", "never", "met", "my", "sister"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: Have / you / ever / eaten / octopus?', '{"type": "scramble", "chunks": ["Have", "you", "ever", "eaten", "octopus"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: Have / you / ever / eaten / octopus?', '{"type": "scramble", "chunks": ["Have", "you", "ever", "eaten", "octopus"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO grammar_rule (grammar_uuid, source_language)
VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES
    (v_rule_id, 'es', 'Hechos recientes con impacto ahora', 'Usa el presente perfecto para noticias recientes o problemas actuales como lost, finished o just arrived.'),
    (v_rule_id, 'de', 'Kürzliche Ereignisse mit Wirkung jetzt', 'Benutze das present perfect für neue Ereignisse oder aktuelle Folgen wie lost, finished oder just arrived.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I have ___ my keys.', '{"type": "typing", "correct_answers": ["lost"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I have ___ my keys.', '{"type": "typing", "correct_answers": ["lost"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: She has ___ arrived.', '{"type": "typing", "correct_answers": ["just"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: She has ___ arrived.', '{"type": "typing", "correct_answers": ["just"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: We have ___ the report.', '{"type": "typing", "correct_answers": ["finished"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: We have ___ the report.', '{"type": "typing", "correct_answers": ["finished"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: He has ___ his phone.', '{"type": "typing", "correct_answers": ["broken"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: He has ___ his phone.', '{"type": "typing", "correct_answers": ["broken"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: They have ___ the tickets.', '{"type": "typing", "correct_answers": ["found"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: They have ___ the tickets.', '{"type": "typing", "correct_answers": ["found"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I have ___ the email.', '{"type": "typing", "correct_answers": ["sent"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I have ___ the email.', '{"type": "typing", "correct_answers": ["sent"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: The bus has ___.', '{"type": "typing", "correct_answers": ["left"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: The bus has ___.', '{"type": "typing", "correct_answers": ["left"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I have ___ my wallet.', '{"type": "multiple_choice", "options": ["lost", "lose", "losing"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I have ___ my wallet.', '{"type": "multiple_choice", "options": ["lost", "lose", "losing"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She has ___ arrived.', '{"type": "multiple_choice", "options": ["just", "ever", "for"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She has ___ arrived.', '{"type": "multiple_choice", "options": ["just", "ever", "for"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We have ___ the work.', '{"type": "multiple_choice", "options": ["finished", "finish", "finishing"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We have ___ the work.', '{"type": "multiple_choice", "options": ["finished", "finish", "finishing"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He has ___ his glasses.', '{"type": "multiple_choice", "options": ["broken", "break", "breaking"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He has ___ his glasses.', '{"type": "multiple_choice", "options": ["broken", "break", "breaking"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: They have ___ the tickets now.', '{"type": "multiple_choice", "options": ["found", "find", "finding"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: They have ___ the tickets now.', '{"type": "multiple_choice", "options": ["found", "find", "finding"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I have ___ the email already.', '{"type": "multiple_choice", "options": ["sent", "send", "sending"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I have ___ the email already.', '{"type": "multiple_choice", "options": ["sent", "send", "sending"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: The bus has ___.', '{"type": "multiple_choice", "options": ["left", "leave", "leaving"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: The bus has ___.', '{"type": "multiple_choice", "options": ["left", "leave", "leaving"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“I''ve lost my keys.” muestra un problema actual.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„I''ve lost my keys.“ zeigt ein aktuelles Problem.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“She has just arrived.” habla de algo reciente.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„She has just arrived.“ spricht von etwas Kürzlichem.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Just suele aparecer con acciones muy recientes.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Just erscheint oft bei sehr neuen Handlungen.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“We have finished the report.” puede tener un resultado importante ahora.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„We have finished the report.“ kann jetzt ein wichtiges Ergebnis haben.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Para noticias recientes siempre usamos past simple, no present perfect.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', 'Für neue Nachrichten benutzt man immer past simple, nie present perfect.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“He has break his phone.” es correcto.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„He has break his phone.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'El present perfect puede usarse cuando la consecuencia sigue ahora.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Das present perfect kann benutzt werden, wenn die Folge jetzt noch wichtig ist.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / have / lost / my / keys.', '{"type": "scramble", "chunks": ["I", "have", "lost", "my", "keys"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / have / lost / my / keys.', '{"type": "scramble", "chunks": ["I", "have", "lost", "my", "keys"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: She / has / just / arrived.', '{"type": "scramble", "chunks": ["She", "has", "just", "arrived"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: She / has / just / arrived.', '{"type": "scramble", "chunks": ["She", "has", "just", "arrived"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: We / have / finished / the / report.', '{"type": "scramble", "chunks": ["We", "have", "finished", "the", "report"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: We / have / finished / the / report.', '{"type": "scramble", "chunks": ["We", "have", "finished", "the", "report"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: He / has / broken / his / phone.', '{"type": "scramble", "chunks": ["He", "has", "broken", "his", "phone"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: He / has / broken / his / phone.', '{"type": "scramble", "chunks": ["He", "has", "broken", "his", "phone"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: They / have / found / the / tickets.', '{"type": "scramble", "chunks": ["They", "have", "found", "the", "tickets"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: They / have / found / the / tickets.', '{"type": "scramble", "chunks": ["They", "have", "found", "the", "tickets"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / have / sent / the / email.', '{"type": "scramble", "chunks": ["I", "have", "sent", "the", "email"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / have / sent / the / email.', '{"type": "scramble", "chunks": ["I", "have", "sent", "the", "email"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: The / bus / has / left.', '{"type": "scramble", "chunks": ["The", "bus", "has", "left"], "correct_order": [0, 1, 2, 3]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: The / bus / has / left.', '{"type": "scramble", "chunks": ["The", "bus", "has", "left"], "correct_order": [0, 1, 2, 3]}'::jsonb);

INSERT INTO grammar_rule (grammar_uuid, source_language)
VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES
    (v_rule_id, 'es', 'Con for y since', 'For expresa duración; since marca el punto de inicio.'),
    (v_rule_id, 'de', 'Mit for und since', 'For zeigt eine Dauer; since zeigt den Anfangspunkt.');

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I have worked here ___ two years.', '{"type": "typing", "correct_answers": ["for"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I have worked here ___ two years.', '{"type": "typing", "correct_answers": ["for"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: She has lived here ___ 2018.', '{"type": "typing", "correct_answers": ["since"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: She has lived here ___ 2018.', '{"type": "typing", "correct_answers": ["since"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: We have waited ___ an hour.', '{"type": "typing", "correct_answers": ["for"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: We have waited ___ an hour.', '{"type": "typing", "correct_answers": ["for"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: He has known her ___ Monday.', '{"type": "typing", "correct_answers": ["since"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: He has known her ___ Monday.', '{"type": "typing", "correct_answers": ["since"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: They have studied English ___ three months.', '{"type": "typing", "correct_answers": ["for"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: They have studied English ___ three months.', '{"type": "typing", "correct_answers": ["for"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: I have stayed here ___ last week.', '{"type": "typing", "correct_answers": ["since"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: I have stayed here ___ last week.', '{"type": "typing", "correct_answers": ["since"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Completa: She has used this laptop ___ a long time.', '{"type": "typing", "correct_answers": ["for"], "case_sensitive": false}'::jsonb),
    (v_ex_id, 'de', 'Ergänze: She has used this laptop ___ a long time.', '{"type": "typing", "correct_answers": ["for"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I have worked here ___ two years.', '{"type": "multiple_choice", "options": ["for", "since", "just"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I have worked here ___ two years.', '{"type": "multiple_choice", "options": ["for", "since", "just"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She has lived here ___ 2018.', '{"type": "multiple_choice", "options": ["since", "for", "ever"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She has lived here ___ 2018.', '{"type": "multiple_choice", "options": ["since", "for", "ever"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: We have waited ___ an hour.', '{"type": "multiple_choice", "options": ["for", "since", "never"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: We have waited ___ an hour.', '{"type": "multiple_choice", "options": ["for", "since", "never"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: He has known her ___ Monday.', '{"type": "multiple_choice", "options": ["since", "for", "just"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: He has known her ___ Monday.', '{"type": "multiple_choice", "options": ["since", "for", "just"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: They have studied English ___ three months.', '{"type": "multiple_choice", "options": ["for", "since", "already"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: They have studied English ___ three months.', '{"type": "multiple_choice", "options": ["for", "since", "already"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: I have stayed here ___ last week.', '{"type": "multiple_choice", "options": ["since", "for", "ever"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: I have stayed here ___ last week.', '{"type": "multiple_choice", "options": ["since", "for", "ever"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Elige la opción correcta: She has used this laptop ___ a long time.', '{"type": "multiple_choice", "options": ["for", "since", "just"], "answer": 0}'::jsonb),
    (v_ex_id, 'de', 'Wähle die richtige Option: She has used this laptop ___ a long time.', '{"type": "multiple_choice", "options": ["for", "since", "just"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'For habla de duración.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'For spricht über eine Dauer.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Since señala el punto de inicio.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Since zeigt den Startpunkt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“For 2018” es la forma normal.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', '„For 2018“ ist die normale Form.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“Since Monday” es correcto.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„Since Monday“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', '“For two years” expresa una duración.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', '„For two years“ drückt eine Dauer aus.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Since se usa siempre con cantidades como two hours.', '{"type": "true_false", "answer": false}'::jsonb),
    (v_ex_id, 'de', 'Since wird immer mit Mengen wie two hours benutzt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'El present perfect suele aparecer con for y since.', '{"type": "true_false", "answer": true}'::jsonb),
    (v_ex_id, 'de', 'Das present perfect erscheint oft mit for und since.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / have / worked / here / for / two / years.', '{"type": "scramble", "chunks": ["I", "have", "worked", "here", "for", "two", "years"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / have / worked / here / for / two / years.', '{"type": "scramble", "chunks": ["I", "have", "worked", "here", "for", "two", "years"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: She / has / lived / here / since / 2018.', '{"type": "scramble", "chunks": ["She", "has", "lived", "here", "since", "2018"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: She / has / lived / here / since / 2018.', '{"type": "scramble", "chunks": ["She", "has", "lived", "here", "since", "2018"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: We / have / waited / for / an / hour.', '{"type": "scramble", "chunks": ["We", "have", "waited", "for", "an", "hour"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: We / have / waited / for / an / hour.', '{"type": "scramble", "chunks": ["We", "have", "waited", "for", "an", "hour"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: He / has / known / her / since / Monday.', '{"type": "scramble", "chunks": ["He", "has", "known", "her", "since", "Monday"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: He / has / known / her / since / Monday.', '{"type": "scramble", "chunks": ["He", "has", "known", "her", "since", "Monday"], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: They / have / studied / English / for / three / months.', '{"type": "scramble", "chunks": ["They", "have", "studied", "English", "for", "three", "months"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: They / have / studied / English / for / three / months.', '{"type": "scramble", "chunks": ["They", "have", "studied", "English", "for", "three", "months"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: I / have / stayed / here / since / last / week.', '{"type": "scramble", "chunks": ["I", "have", "stayed", "here", "since", "last", "week"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: I / have / stayed / here / since / last / week.', '{"type": "scramble", "chunks": ["I", "have", "stayed", "here", "since", "last", "week"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid)
VALUES (v_grammar_id, v_rule_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
VALUES
    (v_ex_id, 'es', 'Ordena la frase: She / has / used / this / laptop / for / a / long / time.', '{"type": "scramble", "chunks": ["She", "has", "used", "this", "laptop", "for", "a", "long", "time"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
    (v_ex_id, 'de', 'Ordne den Satz: She / has / used / this / laptop / for / a / long / time.', '{"type": "scramble", "chunks": ["She", "has", "used", "this", "laptop", "for", "a", "long", "time"], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);
END;
$seed$;
