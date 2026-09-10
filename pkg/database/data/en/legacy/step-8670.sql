-- ============================================================
-- Seed: A0 English Path – STEP 8670 – Grammar – Phrasal Verbs (particles)
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
        WHERE g.step_order=8670 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=8670 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,8670,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, content)
    VALUES
        (
    v_grammar_id,
    'es',
    'Phrasal Verbs (particles)',
    to_jsonb('# Phrasal Verbs (particles)

Un **phrasal verb** combina un verbo con una partícula como **up, out, on, off, after, with**. La partícula cambia el significado.

## 1. Separable phrasal verbs
Con algunos phrasal verbs puedes separar verbo y partícula.
- turn **off** the light
- turn **it off**

Con pronombres, la separación suele ser obligatoria.

## 2. Inseparable phrasal verbs
Otros no se separan.
- look **after** a child
- rely **on** a friend
- talk **about** the problem

## 3. Three-word phrasal verbs
Algunos tienen verbo + partícula + preposición.
- get along **with**
- look forward **to**
- run out **of**

## 4. Mismo verbo, distintas partículas
La partícula cambia mucho el sentido.
- take **off** = quitarse
- take **on** = aceptar / asumir
- take **over** = tomar el control
- take **up** = empezar una actividad

### Consejo
No aprendas solo el verbo base. Aprende la combinación completa y un ejemplo corto.'::text)
),
(
    v_grammar_id,
    'de',
    'Phrasal Verbs mit Partikeln',
    to_jsonb('# Phrasal Verbs mit Partikeln

Ein **Phrasal Verb** verbindet ein Verb mit einer Partikel wie **up, out, on, off, after, with**. Die Partikel verändert die Bedeutung.

## 1. Trennbare Phrasal Verbs
Bei manchen Phrasal Verbs kann man Verb und Partikel trennen.
- turn **off** the light
- turn **it off**

Mit Pronomen ist die Trennung oft nötig.

## 2. Untrennbare Phrasal Verbs
Andere darf man nicht trennen.
- look **after** a child
- rely **on** a friend
- talk **about** the problem

## 3. Dreiteilige Phrasal Verbs
Manche bestehen aus Verb + Partikel + Präposition.
- get along **with**
- look forward **to**
- run out **of**

## 4. Dasselbe Verb, andere Partikel
Die Partikel verändert die Bedeutung stark.
- take **off** = ausziehen
- take **on** = annehmen / übernehmen
- take **over** = die Kontrolle übernehmen
- take **up** = mit einer Aktivität anfangen

### Tipp
Lerne nicht nur das Grundverb. Lerne die ganze Kombination mit einem kurzen Beispielsatz.'::text)
);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule1_id, 'es', 'Separable phrasal verbs', 'Con los phrasal verbs separables, un objeto nominal puede ir en medio o al final; con pronombres suele ir en medio.'),
        (v_rule1_id, 'de', 'Trennbare Phrasal Verbs', 'Bei trennbaren Phrasal Verbs kann ein Nomen in der Mitte oder am Ende stehen; bei Pronomen steht es meist in der Mitte.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Please ___.', '{"type": "typing", "correct_answers": ["turn it off"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Please ___.', '{"type": "typing", "correct_answers": ["turn it off"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Please ___.', '{"type": "multiple_choice", "options": ["turn it off", "turn off it", "off turn it"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Please ___.', '{"type": "multiple_choice", "options": ["turn it off", "turn off it", "off turn it"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Please turn off it.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Please turn off it.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con objeto pronombre.', '{"type": "scramble", "chunks": ["Please", "turn", "it", "off."], "correct_order": [0, 1, 2, 3]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit Pronomenobjekt.', '{"type": "scramble", "chunks": ["Please", "turn", "it", "off."], "correct_order": [0, 1, 2, 3]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She ___ from the floor.', '{"type": "typing", "correct_answers": ["picked it up"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'She ___ from the floor.', '{"type": "typing", "correct_answers": ["picked it up"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She ___ from the floor.', '{"type": "multiple_choice", "options": ["picked it up", "picked up it", "up picked it"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'She ___ from the floor.', '{"type": "multiple_choice", "options": ["picked it up", "picked up it", "up picked it"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She picked it up from the floor.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She picked it up from the floor.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con objeto pronombre.', '{"type": "scramble", "chunks": ["She", "picked", "it", "up", "from", "the", "floor."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit Pronomenobjekt.', '{"type": "scramble", "chunks": ["She", "picked", "it", "up", "from", "the", "floor."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '___ before you go outside.', '{"type": "typing", "correct_answers": ["Put it on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', '___ before you go outside.', '{"type": "typing", "correct_answers": ["Put it on"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '___ before you go outside.', '{"type": "multiple_choice", "options": ["Put it on", "Put on it", "On put it"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', '___ before you go outside.', '{"type": "multiple_choice", "options": ["Put it on", "Put on it", "On put it"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Put on it before you go outside.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Put on it before you go outside.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con objeto pronombre.', '{"type": "scramble", "chunks": ["Put", "it", "on", "before", "you", "go", "outside."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit Pronomenobjekt.', '{"type": "scramble", "chunks": ["Put", "it", "on", "before", "you", "go", "outside."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He ___ at the door.', '{"type": "typing", "correct_answers": ["took them off"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'He ___ at the door.', '{"type": "typing", "correct_answers": ["took them off"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He ___ at the door.', '{"type": "multiple_choice", "options": ["took them off", "took off them", "off took them"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'He ___ at the door.', '{"type": "multiple_choice", "options": ["took them off", "took off them", "off took them"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He took them off at the door.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He took them off at the door.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con objeto pronombre.', '{"type": "scramble", "chunks": ["He", "took", "them", "off", "at", "the", "door."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit Pronomenobjekt.', '{"type": "scramble", "chunks": ["He", "took", "them", "off", "at", "the", "door."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '___ after the meal.', '{"type": "typing", "correct_answers": ["Throw it away"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', '___ after the meal.', '{"type": "typing", "correct_answers": ["Throw it away"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '___ after the meal.', '{"type": "multiple_choice", "options": ["Throw it away", "Throw away it", "Away throw it"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', '___ after the meal.', '{"type": "multiple_choice", "options": ["Throw it away", "Throw away it", "Away throw it"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Throw away it after the meal.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Throw away it after the meal.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con objeto pronombre.', '{"type": "scramble", "chunks": ["Throw", "it", "away", "after", "the", "meal."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit Pronomenobjekt.', '{"type": "scramble", "chunks": ["Throw", "it", "away", "after", "the", "meal."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '___ in the dictionary.', '{"type": "typing", "correct_answers": ["Look it up"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', '___ in the dictionary.', '{"type": "typing", "correct_answers": ["Look it up"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '___ in the dictionary.', '{"type": "multiple_choice", "options": ["Look it up", "Look up it", "Up look it"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', '___ in the dictionary.', '{"type": "multiple_choice", "options": ["Look it up", "Look up it", "Up look it"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Look it up in the dictionary.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Look it up in the dictionary.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con objeto pronombre.', '{"type": "scramble", "chunks": ["Look", "it", "up", "in", "the", "dictionary."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit Pronomenobjekt.', '{"type": "scramble", "chunks": ["Look", "it", "up", "in", "the", "dictionary."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '___ with a black pen.', '{"type": "typing", "correct_answers": ["Fill it out"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', '___ with a black pen.', '{"type": "typing", "correct_answers": ["Fill it out"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '___ with a black pen.', '{"type": "multiple_choice", "options": ["Fill it out", "Fill out it", "Out fill it"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', '___ with a black pen.', '{"type": "multiple_choice", "options": ["Fill it out", "Fill out it", "Out fill it"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Fill out it with a black pen.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Fill out it with a black pen.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase con objeto pronombre.', '{"type": "scramble", "chunks": ["Fill", "it", "out", "with", "a", "black", "pen."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz mit Pronomenobjekt.', '{"type": "scramble", "chunks": ["Fill", "it", "out", "with", "a", "black", "pen."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule2_id, 'es', 'Inseparable phrasal verbs', 'Los phrasal verbs inseparables mantienen juntas sus partes: no pongas el objeto entre ellas.'),
        (v_rule2_id, 'de', 'Untrennbare Phrasal Verbs', 'Bei untrennbaren Phrasal Verbs bleiben die Teile zusammen: Das Objekt darf nicht dazwischen stehen.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She ___ her grandmother every weekend.', '{"type": "typing", "correct_answers": ["looks after"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'She ___ her grandmother every weekend.', '{"type": "typing", "correct_answers": ["looks after"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She ___ her grandmother every weekend.', '{"type": "multiple_choice", "options": ["looks after", "looks her grandmother after", "after looks"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'She ___ her grandmother every weekend.', '{"type": "multiple_choice", "options": ["looks after", "looks her grandmother after", "after looks"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She looks her grandmother after every weekend.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She looks her grandmother after every weekend.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "looks", "after", "her", "grandmother", "every", "weekend."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "looks", "after", "her", "grandmother", "every", "weekend."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We ___ our teacher at the station.', '{"type": "typing", "correct_answers": ["ran into"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'We ___ our teacher at the station.', '{"type": "typing", "correct_answers": ["ran into"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We ___ our teacher at the station.', '{"type": "multiple_choice", "options": ["ran into", "ran our teacher into", "into ran"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'We ___ our teacher at the station.', '{"type": "multiple_choice", "options": ["ran into", "ran our teacher into", "into ran"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We ran into our teacher at the station.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We ran into our teacher at the station.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "ran", "into", "our", "teacher", "at", "the", "station."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "ran", "into", "our", "teacher", "at", "the", "station."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They are ___ a taxi.', '{"type": "typing", "correct_answers": ["looking for"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'They are ___ a taxi.', '{"type": "typing", "correct_answers": ["looking for"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They are ___ a taxi.', '{"type": "multiple_choice", "options": ["looking for", "looking a taxi for", "for looking"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'They are ___ a taxi.', '{"type": "multiple_choice", "options": ["looking for", "looking a taxi for", "for looking"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They are looking a taxi for.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They are looking a taxi for.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["They", "are", "looking", "for", "a", "taxi."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["They", "are", "looking", "for", "a", "taxi."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He ___ complaints calmly.', '{"type": "typing", "correct_answers": ["deals with"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'He ___ complaints calmly.', '{"type": "typing", "correct_answers": ["deals with"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He ___ complaints calmly.', '{"type": "multiple_choice", "options": ["deals with", "deals complaints with", "with deals"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'He ___ complaints calmly.', '{"type": "multiple_choice", "options": ["deals with", "deals complaints with", "with deals"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He deals with complaints calmly.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He deals with complaints calmly.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "deals", "with", "complaints", "calmly."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "deals", "with", "complaints", "calmly."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I ___ your idea.', '{"type": "typing", "correct_answers": ["believe in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'I ___ your idea.', '{"type": "typing", "correct_answers": ["believe in"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I ___ your idea.', '{"type": "multiple_choice", "options": ["believe in", "believe your idea in", "in believe"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'I ___ your idea.', '{"type": "multiple_choice", "options": ["believe in", "believe your idea in", "in believe"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: I believe your idea in.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: I believe your idea in.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "believe", "in", "your", "idea."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "believe", "in", "your", "idea."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'You can ___ this map.', '{"type": "typing", "correct_answers": ["rely on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'You can ___ this map.', '{"type": "typing", "correct_answers": ["rely on"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'You can ___ this map.', '{"type": "multiple_choice", "options": ["rely on", "rely this map on", "on rely"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'You can ___ this map.', '{"type": "multiple_choice", "options": ["rely on", "rely this map on", "on rely"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: You can rely on this map.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: You can rely on this map.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["You", "can", "rely", "on", "this", "map."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["You", "can", "rely", "on", "this", "map."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We ___ the problem for an hour.', '{"type": "typing", "correct_answers": ["talked about"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'We ___ the problem for an hour.', '{"type": "typing", "correct_answers": ["talked about"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We ___ the problem for an hour.', '{"type": "multiple_choice", "options": ["talked about", "talked the problem about", "about talked"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'We ___ the problem for an hour.', '{"type": "multiple_choice", "options": ["talked about", "talked the problem about", "about talked"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We talked the problem about for an hour.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We talked the problem about for an hour.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "talked", "about", "the", "problem", "for", "an", "hour."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "talked", "about", "the", "problem", "for", "an", "hour."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule3_id, 'es', 'Three-word phrasal verbs', 'Los phrasal verbs de tres palabras incluyen una partícula y una preposición: get along with, run out of.'),
        (v_rule3_id, 'de', 'Dreiteilige Phrasal Verbs', 'Dreiteilige Phrasal Verbs enthalten eine Partikel und eine Präposition: get along with, run out of.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I ___ my neighbours.', '{"type": "typing", "correct_answers": ["get along with"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'I ___ my neighbours.', '{"type": "typing", "correct_answers": ["get along with"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I ___ my neighbours.', '{"type": "multiple_choice", "options": ["get along with", "get with along", "along get with"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'I ___ my neighbours.', '{"type": "multiple_choice", "options": ["get along with", "get with along", "along get with"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: I get along my neighbours with.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: I get along my neighbours with.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "get", "along", "with", "my", "neighbours."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "get", "along", "with", "my", "neighbours."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She is ___ the trip.', '{"type": "typing", "correct_answers": ["looking forward to"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'She is ___ the trip.', '{"type": "typing", "correct_answers": ["looking forward to"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She is ___ the trip.', '{"type": "multiple_choice", "options": ["looking forward to", "looking to forward", "forward looking to"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'She is ___ the trip.', '{"type": "multiple_choice", "options": ["looking forward to", "looking to forward", "forward looking to"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She is looking forward to the trip.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She is looking forward to the trip.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "is", "looking", "forward", "to", "the", "trip."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "is", "looking", "forward", "to", "the", "trip."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We ___ milk.', '{"type": "typing", "correct_answers": ["ran out of"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'We ___ milk.', '{"type": "typing", "correct_answers": ["ran out of"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We ___ milk.', '{"type": "multiple_choice", "options": ["ran out of", "ran of out", "out ran of"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'We ___ milk.', '{"type": "multiple_choice", "options": ["ran out of", "ran of out", "out ran of"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: We ran milk out of.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: We ran milk out of.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "ran", "out", "of", "milk."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "ran", "out", "of", "milk."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He ___ a smart solution.', '{"type": "typing", "correct_answers": ["came up with"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'He ___ a smart solution.', '{"type": "typing", "correct_answers": ["came up with"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He ___ a smart solution.', '{"type": "multiple_choice", "options": ["came up with", "came with up", "up came with"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'He ___ a smart solution.', '{"type": "multiple_choice", "options": ["came up with", "came with up", "up came with"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He came up with a smart solution.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He came up with a smart solution.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "came", "up", "with", "a", "smart", "solution."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "came", "up", "with", "a", "smart", "solution."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They ___ the noise.', '{"type": "typing", "correct_answers": ["put up with"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'They ___ the noise.', '{"type": "typing", "correct_answers": ["put up with"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They ___ the noise.', '{"type": "multiple_choice", "options": ["put up with", "put with up", "up put with"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'They ___ the noise.', '{"type": "multiple_choice", "options": ["put up with", "put with up", "up put with"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They put the noise up with.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They put the noise up with.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["They", "put", "up", "with", "the", "noise."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["They", "put", "up", "with", "the", "noise."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'You need to ___ the group.', '{"type": "typing", "correct_answers": ["catch up with"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'You need to ___ the group.', '{"type": "typing", "correct_answers": ["catch up with"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'You need to ___ the group.', '{"type": "multiple_choice", "options": ["catch up with", "catch with up", "up catch with"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'You need to ___ the group.', '{"type": "multiple_choice", "options": ["catch up with", "catch with up", "up catch with"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: You need to catch up with the group.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: You need to catch up with the group.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["You", "need", "to", "catch", "up", "with", "the", "group."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["You", "need", "to", "catch", "up", "with", "the", "group."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He ___ a silly excuse.', '{"type": "typing", "correct_answers": ["got away with"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'He ___ a silly excuse.', '{"type": "typing", "correct_answers": ["got away with"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He ___ a silly excuse.', '{"type": "multiple_choice", "options": ["got away with", "got with away", "away got with"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'He ___ a silly excuse.', '{"type": "multiple_choice", "options": ["got away with", "got with away", "away got with"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: He got a silly excuse away with.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: He got a silly excuse away with.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "got", "away", "with", "a", "silly", "excuse."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "got", "away", "with", "a", "silly", "excuse."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule4_id, 'es', 'El mismo verbo con partículas distintas', 'La partícula cambia el significado del verbo base: take off, take on, take over, take up.'),
        (v_rule4_id, 'de', 'Dasselbe Verb mit verschiedenen Partikeln', 'Die Partikel verändert die Bedeutung des Grundverbs: take off, take on, take over, take up.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Please take ___ your shoes at the door.', '{"type": "typing", "correct_answers": ["off"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Please take ___ your shoes at the door.', '{"type": "typing", "correct_answers": ["off"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Please take ___ your shoes at the door.', '{"type": "multiple_choice", "options": ["off", "on", "over"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Please take ___ your shoes at the door.', '{"type": "multiple_choice", "options": ["off", "on", "over"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Please take off your shoes at the door.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Please take off your shoes at the door.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Please", "take", "off", "your", "shoes", "at", "the", "door."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Please", "take", "off", "your", "shoes", "at", "the", "door."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The company will take ___ two interns this summer.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The company will take ___ two interns this summer.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The company will take ___ two interns this summer.', '{"type": "multiple_choice", "options": ["on", "off", "back"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The company will take ___ two interns this summer.', '{"type": "multiple_choice", "options": ["on", "off", "back"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The company will take off two interns this summer.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The company will take off two interns this summer.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "company", "will", "take", "on", "two", "interns", "this", "summer."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "company", "will", "take", "on", "two", "interns", "this", "summer."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Can you take ___ the rubbish tonight?', '{"type": "typing", "correct_answers": ["out"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Can you take ___ the rubbish tonight?', '{"type": "typing", "correct_answers": ["out"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Can you take ___ the rubbish tonight?', '{"type": "multiple_choice", "options": ["out", "over", "back"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Can you take ___ the rubbish tonight?', '{"type": "multiple_choice", "options": ["out", "over", "back"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Can you take out the rubbish tonight?', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Can you take out the rubbish tonight?', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Can", "you", "take", "out", "the", "rubbish", "tonight?"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Can", "you", "take", "out", "the", "rubbish", "tonight?"], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They want to take ___ the café next year.', '{"type": "typing", "correct_answers": ["over"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'They want to take ___ the café next year.', '{"type": "typing", "correct_answers": ["over"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They want to take ___ the café next year.', '{"type": "multiple_choice", "options": ["over", "out", "up"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'They want to take ___ the café next year.', '{"type": "multiple_choice", "options": ["over", "out", "up"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: They want to take out the café next year.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: They want to take out the café next year.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["They", "want", "to", "take", "over", "the", "café", "next", "year."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["They", "want", "to", "take", "over", "the", "café", "next", "year."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7, 8]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I had to take ___ my words.', '{"type": "typing", "correct_answers": ["back"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'I had to take ___ my words.', '{"type": "typing", "correct_answers": ["back"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I had to take ___ my words.', '{"type": "multiple_choice", "options": ["back", "off", "down"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'I had to take ___ my words.', '{"type": "multiple_choice", "options": ["back", "off", "down"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: I had to take back my words.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: I had to take back my words.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "had", "to", "take", "back", "my", "words."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "had", "to", "take", "back", "my", "words."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She took ___ yoga last year.', '{"type": "typing", "correct_answers": ["up"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'She took ___ yoga last year.', '{"type": "typing", "correct_answers": ["up"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She took ___ yoga last year.', '{"type": "multiple_choice", "options": ["up", "out", "over"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'She took ___ yoga last year.', '{"type": "multiple_choice", "options": ["up", "out", "over"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: She took over yoga last year.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: She took over yoga last year.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "took", "up", "yoga", "last", "year."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "took", "up", "yoga", "last", "year."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The secretary took ___ the message.', '{"type": "typing", "correct_answers": ["down"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The secretary took ___ the message.', '{"type": "typing", "correct_answers": ["down"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The secretary took ___ the message.', '{"type": "multiple_choice", "options": ["down", "off", "back"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The secretary took ___ the message.', '{"type": "multiple_choice", "options": ["down", "off", "back"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: The secretary took down the message.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: The secretary took down the message.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "secretary", "took", "down", "the", "message."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "secretary", "took", "down", "the", "message."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

END;
$seed$;
