-- ============================================================
-- Seed: A0 English Path – STEP 320 – Grammar – Descripciones (There is / There are)
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

            DELETE FROM grammar WHERE step_order = 320 AND path_uuid = v_path_id;

            INSERT INTO grammar (path_uuid, step_order, source_language, type)
            VALUES (v_path_id, 320, 'en', 'grammar')
            RETURNING uuid INTO v_grammar_id;

            INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
            VALUES (
                v_grammar_id,
                'es',
                'There is / There are',
                '',
                to_jsonb($content_320_es$## There is / There are

Usamos **there is** y **there are** para decir que algo existe o está en un lugar.

---

##### 1. THERE IS para singular

Usa **there is** con una persona, una cosa o una idea en singular.

* There **is** a cat in the room.
* There **is** a bathroom on this floor.
* There **is** one key on the table.

---

##### 2. THERE ARE para plural

Usa **there are** con nombres en plural.

* There **are** three books on the table.
* There **are** two chairs in the kitchen.
* There **are** many people in the lobby.

---

##### 3. Negativas

Para negar, usamos **there isn't** y **there aren't**.

* There **isn't** a pool.
* There **aren't** any chairs.
* There **isn't** a lift in the building.

> 💡 Con plural suele aparecer **any**: *There aren't any towels.*

---

##### 4. Preguntas

Para hacer preguntas, cambiamos el orden:

* **Is there** a bathroom?
* **Are there** any keys?
* **Is there** a bus stop near here?

---

##### 5. Error frecuente

* ❌ There are a cat.
* ✅ There is a cat.

* ❌ There is three books.
* ✅ There are three books.$content_320_es$::text)
            );

            INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
            VALUES (
                v_grammar_id,
                'de',
                'There is / There are',
                '',
                to_jsonb($content_320_de$## There is / There are

Mit **there is** und **there are** sagt man, dass etwas existiert oder sich irgendwo befindet.

---

##### 1. THERE IS für Singular

**There is** wird mit einer Person oder Sache im Singular verwendet.

* There **is** a cat in the room.
* There **is** a bathroom on this floor.
* There **is** one key on the table.

---

##### 2. THERE ARE für Plural

**There are** wird mit Nomen im Plural verwendet.

* There **are** three books on the table.
* There **are** two chairs in the kitchen.
* There **are** many people in the lobby.

---

##### 3. Verneinung

Für die Verneinung benutzt man **there isn't** und **there aren't**.

* There **isn't** a pool.
* There **aren't** any chairs.
* There **isn't** a lift in the building.

> 💡 Im Plural steht oft **any**: *There aren't any towels.*

---

##### 4. Fragen

Für Fragen ändert sich die Wortstellung:

* **Is there** a bathroom?
* **Are there** any keys?
* **Is there** a bus stop near here?

---

##### 5. Häufiger Fehler

* ❌ There are a cat.
* ✅ There is a cat.

* ❌ There is three books.
* ✅ There are three books.$content_320_de$::text)
            );


-- Rule 1
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'es', 'THERE IS para singular', 'Usa "there is" con un nombre en singular: ❌ There are a cat → ✅ There is a cat.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'de', 'THERE IS für Singular', 'Benutze "there is" mit einem Nomen im Singular: ❌ There are a cat → ✅ There is a cat.');


-- Rule 2
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'es', 'THERE ARE para plural', 'Usa "there are" con nombres en plural: ❌ There is three books → ✅ There are three books.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'de', 'THERE ARE für Plural', 'Benutze "there are" mit Nomen im Plural: ❌ There is three books → ✅ There are three books.');


-- Rule 3
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'es', 'Negativas con THERE ISN''T / THERE AREN''T', 'Usa "there isn''t" con singular y "there aren''t" con plural: ❌ There isn''t chairs → ✅ There aren''t any chairs.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'de', 'Verneinung mit THERE ISN''T / THERE AREN''T', 'Benutze "there isn''t" mit Singular und "there aren''t" mit Plural: ❌ There isn''t chairs → ✅ There aren''t any chairs.');


-- Rule 4
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'es', 'Preguntas con IS THERE / ARE THERE', 'En preguntas usa "Is there" para singular y "Are there" para plural: ❌ There is a bathroom? → ✅ Is there a bathroom?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'de', 'Fragen mit IS THERE / ARE THERE', 'In Fragen benutzt du "Is there" für Singular und "Are there" für Plural: ❌ There is a bathroom? → ✅ Is there a bathroom?');


-- =========================================================
-- TYPING — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a cat in the room.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a cat in the room.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a bank near the hotel.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a bank near the hotel.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ an elevator in the building.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ an elevator in the building.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ one key on the table.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ one key on the table.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a shower in the bathroom.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a shower in the bathroom.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a bus stop outside.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a bus stop outside.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a problem with the light.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a problem with the light.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ three books on the table.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ three books on the table.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ two chairs in the kitchen.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ two chairs in the kitchen.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ many people in the lobby.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ many people in the lobby.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ four windows in the flat.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ four windows in the flat.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ some towels in the bathroom.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ some towels in the bathroom.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ two keys on the desk.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ two keys on the desk.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ five students in the room.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ five students in the room.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a pool in the hotel.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a pool in the hotel.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ any chairs in the room.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ any chairs in the room.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a key in my bag.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a key in my bag.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ any towels in the bathroom.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ any towels in the bathroom.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a supermarket near here.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a supermarket near here.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ any clean cups on the table.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ any clean cups on the table.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a TV in the kitchen.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a TV in the kitchen.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ there a bathroom on this floor?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ there a bathroom on this floor?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ there any keys on the desk?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ there any keys on the desk?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ there a car park behind the hotel?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ there a car park behind the hotel?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ there any towels in the room?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ there any towels in the room?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ there a bus stop near the house?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ there a bus stop near the house?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ there any shops open now?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ there any shops open now?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ there an elevator in the building?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ there an elevator in the building?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);


-- =========================================================
-- MULTIPLE CHOICE — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a cat under the bed.', '{"type": "multiple_choice", "options": ["is", "are", "am"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a cat under the bed.', '{"type": "multiple_choice", "options": ["is", "are", "am"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a reception desk in the lobby.', '{"type": "multiple_choice", "options": ["is", "are", "be"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a reception desk in the lobby.', '{"type": "multiple_choice", "options": ["is", "are", "be"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ one apple on the table.', '{"type": "multiple_choice", "options": ["is", "are", "bees"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ one apple on the table.', '{"type": "multiple_choice", "options": ["is", "are", "bees"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a bathroom on this floor.', '{"type": "multiple_choice", "options": ["is", "are", "has"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a bathroom on this floor.', '{"type": "multiple_choice", "options": ["is", "are", "has"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ an old TV in the room.', '{"type": "multiple_choice", "options": ["is", "are", "am"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ an old TV in the room.', '{"type": "multiple_choice", "options": ["is", "are", "am"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a key in my bag.', '{"type": "multiple_choice", "options": ["is", "are", "be"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a key in my bag.', '{"type": "multiple_choice", "options": ["is", "are", "be"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a chair by the window.', '{"type": "multiple_choice", "options": ["is", "are", "have"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a chair by the window.', '{"type": "multiple_choice", "options": ["is", "are", "have"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ two beds in the room.', '{"type": "multiple_choice", "options": ["are", "is", "am"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ two beds in the room.', '{"type": "multiple_choice", "options": ["are", "is", "am"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ many shops near the station.', '{"type": "multiple_choice", "options": ["are", "is", "has"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ many shops near the station.', '{"type": "multiple_choice", "options": ["are", "is", "has"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ three bathrooms in the house.', '{"type": "multiple_choice", "options": ["are", "is", "be"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ three bathrooms in the house.', '{"type": "multiple_choice", "options": ["are", "is", "be"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ two elevators in the hotel.', '{"type": "multiple_choice", "options": ["are", "is", "have"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ two elevators in the hotel.', '{"type": "multiple_choice", "options": ["are", "is", "have"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ some clean cups on the shelf.', '{"type": "multiple_choice", "options": ["are", "is", "am"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ some clean cups on the shelf.', '{"type": "multiple_choice", "options": ["are", "is", "am"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ six students in my class.', '{"type": "multiple_choice", "options": ["are", "is", "bees"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ six students in my class.', '{"type": "multiple_choice", "options": ["are", "is", "bees"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ many cars outside.', '{"type": "multiple_choice", "options": ["are", "is", "has"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ many cars outside.', '{"type": "multiple_choice", "options": ["are", "is", "has"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a lift in this building.', '{"type": "multiple_choice", "options": ["isn''t", "aren''t", "not are"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a lift in this building.', '{"type": "multiple_choice", "options": ["isn''t", "aren''t", "not are"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ any keys on the desk.', '{"type": "multiple_choice", "options": ["aren''t", "isn''t", "doesn''t have"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ any keys on the desk.', '{"type": "multiple_choice", "options": ["aren''t", "isn''t", "doesn''t have"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a shower in the room.', '{"type": "multiple_choice", "options": ["isn''t", "aren''t", "haven''t"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a shower in the room.', '{"type": "multiple_choice", "options": ["isn''t", "aren''t", "haven''t"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ any buses after midnight.', '{"type": "multiple_choice", "options": ["aren''t", "isn''t", "not is"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ any buses after midnight.', '{"type": "multiple_choice", "options": ["aren''t", "isn''t", "not is"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a pharmacy nearby.', '{"type": "multiple_choice", "options": ["isn''t", "aren''t", "don''t have"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a pharmacy nearby.', '{"type": "multiple_choice", "options": ["isn''t", "aren''t", "don''t have"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ any apples in the kitchen.', '{"type": "multiple_choice", "options": ["aren''t", "isn''t", "doesn''t are"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ any apples in the kitchen.', '{"type": "multiple_choice", "options": ["aren''t", "isn''t", "doesn''t are"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There ___ a lamp on the desk.', '{"type": "multiple_choice", "options": ["isn''t", "aren''t", "not have"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There ___ a lamp on the desk.', '{"type": "multiple_choice", "options": ["isn''t", "aren''t", "not have"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ a bathroom on this floor?', '{"type": "multiple_choice", "options": ["Is there", "Are there", "There is"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ a bathroom on this floor?', '{"type": "multiple_choice", "options": ["Is there", "Are there", "There is"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ any keys on the table?', '{"type": "multiple_choice", "options": ["Are there", "Is there", "There are"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ any keys on the table?', '{"type": "multiple_choice", "options": ["Are there", "Is there", "There are"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ a supermarket nearby?', '{"type": "multiple_choice", "options": ["Is there", "Are there", "There is"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ a supermarket nearby?', '{"type": "multiple_choice", "options": ["Is there", "Are there", "There is"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ any buses after ten?', '{"type": "multiple_choice", "options": ["Are there", "Is there", "There are"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ any buses after ten?', '{"type": "multiple_choice", "options": ["Are there", "Is there", "There are"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ an elevator here?', '{"type": "multiple_choice", "options": ["Is there", "Are there", "There is"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ an elevator here?', '{"type": "multiple_choice", "options": ["Is there", "Are there", "There is"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ any clean towels?', '{"type": "multiple_choice", "options": ["Are there", "Is there", "There are"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ any clean towels?', '{"type": "multiple_choice", "options": ["Are there", "Is there", "There are"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ a TV in the room?', '{"type": "multiple_choice", "options": ["Is there", "Are there", "There is"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ a TV in the room?', '{"type": "multiple_choice", "options": ["Is there", "Are there", "There is"], "answer": 0}'::jsonb);


-- =========================================================
-- TRUE / FALSE — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There is a cat in the room.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There is a cat in the room.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There are a bathroom upstairs.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There are a bathroom upstairs.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There is» se usa con singular.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There is“ wird mit Singular benutzt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There is one key on the table.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There is one key on the table.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There is two beds.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There is two beds.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There is an elevator.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There is an elevator.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There is» se usa con nombres en plural.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There is“ wird mit Nomen im Plural benutzt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There are three books on the table.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There are three books on the table.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There is two chairs.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There is two chairs.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There are» se usa con plural.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There are“ wird mit dem Plural benutzt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There are some towels in the bathroom.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There are some towels in the bathroom.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There are a key on the table.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There are a key on the table.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There are many people in the lobby.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There are many people in the lobby.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There are» no puede ir con números.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There are“ kann nicht mit Zahlen benutzt werden.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There isn''t a pool.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There isn''t a pool.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There isn''t any chairs.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There isn''t any chairs.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There aren''t any towels.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There aren''t any towels.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Con plural usamos «there aren''t».', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Mit dem Plural benutzt man „there aren''t“.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There aren''t a key.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There aren''t a key.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«There isn''t a TV in the kitchen.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„There isn''t a TV in the kitchen.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Any» aparece a menudo en negativas plurales.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Any“ erscheint oft in negativen Pluralsätzen.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Is there a bathroom?» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Is there a bathroom?“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Are there a key on the desk?» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Are there a key on the desk?“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Are there any towels?» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Are there any towels?“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para singular usamos «Is there».', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Für den Singular benutzt man „Is there“.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Is there any chairs?» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Is there any chairs?“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Are there any shops open?» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Are there any shops open?“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En preguntas no cambiamos el orden de «there is / there are».', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'In Fragen verändert sich die Wortstellung von „there is / there are“ nicht.', '{"type": "true_false", "answer": false}'::jsonb);


-- =========================================================
-- SCRAMBLE — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There is a cat in the room.', '{"type": "scramble", "chunks": ["a cat", "in the room.", "There is"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There is a cat in the room.', '{"type": "scramble", "chunks": ["a cat", "in the room.", "There is"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There is a bank near the hotel.', '{"type": "scramble", "chunks": ["near the hotel.", "There is", "a bank"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There is a bank near the hotel.', '{"type": "scramble", "chunks": ["near the hotel.", "There is", "a bank"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There is an elevator here.', '{"type": "scramble", "chunks": ["There is", "an elevator", "here."], "correct_order": [0, 1, 2]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There is an elevator here.', '{"type": "scramble", "chunks": ["There is", "an elevator", "here."], "correct_order": [0, 1, 2]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There is one key on the desk.', '{"type": "scramble", "chunks": ["one key", "on the desk.", "There is"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There is one key on the desk.', '{"type": "scramble", "chunks": ["one key", "on the desk.", "There is"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There is a shower upstairs.', '{"type": "scramble", "chunks": ["upstairs.", "a shower", "There is"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There is a shower upstairs.', '{"type": "scramble", "chunks": ["upstairs.", "a shower", "There is"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There is a bus stop outside.', '{"type": "scramble", "chunks": ["a bus stop", "outside.", "There is"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There is a bus stop outside.', '{"type": "scramble", "chunks": ["a bus stop", "outside.", "There is"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There is a light in the hall.', '{"type": "scramble", "chunks": ["in the hall.", "There is", "a light"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There is a light in the hall.', '{"type": "scramble", "chunks": ["in the hall.", "There is", "a light"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There are three books on the table.', '{"type": "scramble", "chunks": ["three books", "There are", "on the table."], "correct_order": [1, 0, 2]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There are three books on the table.', '{"type": "scramble", "chunks": ["three books", "There are", "on the table."], "correct_order": [1, 0, 2]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There are two chairs in the kitchen.', '{"type": "scramble", "chunks": ["in the kitchen.", "There are", "two chairs"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There are two chairs in the kitchen.', '{"type": "scramble", "chunks": ["in the kitchen.", "There are", "two chairs"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There are many people here.', '{"type": "scramble", "chunks": ["many people", "here.", "There are"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There are many people here.', '{"type": "scramble", "chunks": ["many people", "here.", "There are"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There are four windows upstairs.', '{"type": "scramble", "chunks": ["There are", "four windows", "upstairs."], "correct_order": [0, 1, 2]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There are four windows upstairs.', '{"type": "scramble", "chunks": ["There are", "four windows", "upstairs."], "correct_order": [0, 1, 2]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There are some towels in the bathroom.', '{"type": "scramble", "chunks": ["in the bathroom.", "some towels", "There are"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There are some towels in the bathroom.', '{"type": "scramble", "chunks": ["in the bathroom.", "some towels", "There are"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There are two keys on the desk.', '{"type": "scramble", "chunks": ["two keys", "on the desk.", "There are"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There are two keys on the desk.', '{"type": "scramble", "chunks": ["two keys", "on the desk.", "There are"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There are five students in the room.', '{"type": "scramble", "chunks": ["There are", "five students", "in the room."], "correct_order": [0, 1, 2]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There are five students in the room.', '{"type": "scramble", "chunks": ["There are", "five students", "in the room."], "correct_order": [0, 1, 2]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There isn''t a pool.', '{"type": "scramble", "chunks": ["a pool.", "There isn''t"], "correct_order": [1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There isn''t a pool.', '{"type": "scramble", "chunks": ["a pool.", "There isn''t"], "correct_order": [1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There aren''t any chairs.', '{"type": "scramble", "chunks": ["any chairs.", "There aren''t"], "correct_order": [1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There aren''t any chairs.', '{"type": "scramble", "chunks": ["any chairs.", "There aren''t"], "correct_order": [1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There isn''t a key here.', '{"type": "scramble", "chunks": ["a key", "here.", "There isn''t"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There isn''t a key here.', '{"type": "scramble", "chunks": ["a key", "here.", "There isn''t"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There aren''t any towels in the room.', '{"type": "scramble", "chunks": ["in the room.", "There aren''t", "any towels"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There aren''t any towels in the room.', '{"type": "scramble", "chunks": ["in the room.", "There aren''t", "any towels"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There isn''t a supermarket nearby.', '{"type": "scramble", "chunks": ["nearby.", "There isn''t", "a supermarket"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There isn''t a supermarket nearby.', '{"type": "scramble", "chunks": ["nearby.", "There isn''t", "a supermarket"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There aren''t any clean cups.', '{"type": "scramble", "chunks": ["any clean cups.", "There aren''t"], "correct_order": [1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There aren''t any clean cups.', '{"type": "scramble", "chunks": ["any clean cups.", "There aren''t"], "correct_order": [1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: There isn''t a TV in the kitchen.', '{"type": "scramble", "chunks": ["a TV", "in the kitchen.", "There isn''t"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: There isn''t a TV in the kitchen.', '{"type": "scramble", "chunks": ["a TV", "in the kitchen.", "There isn''t"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Is there a bathroom?', '{"type": "scramble", "chunks": ["a bathroom?", "Is there"], "correct_order": [1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Is there a bathroom?', '{"type": "scramble", "chunks": ["a bathroom?", "Is there"], "correct_order": [1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Are there any keys on the desk?', '{"type": "scramble", "chunks": ["on the desk?", "Are there", "any keys"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Are there any keys on the desk?', '{"type": "scramble", "chunks": ["on the desk?", "Are there", "any keys"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Is there a car park nearby?', '{"type": "scramble", "chunks": ["nearby?", "a car park", "Is there"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Is there a car park nearby?', '{"type": "scramble", "chunks": ["nearby?", "a car park", "Is there"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Are there any towels in the room?', '{"type": "scramble", "chunks": ["in the room?", "any towels", "Are there"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Are there any towels in the room?', '{"type": "scramble", "chunks": ["in the room?", "any towels", "Are there"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Is there a bus stop here?', '{"type": "scramble", "chunks": ["a bus stop", "here?", "Is there"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Is there a bus stop here?', '{"type": "scramble", "chunks": ["a bus stop", "here?", "Is there"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Are there any shops open now?', '{"type": "scramble", "chunks": ["open now?", "Are there", "any shops"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Are there any shops open now?', '{"type": "scramble", "chunks": ["open now?", "Are there", "any shops"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Is there an elevator in the building?', '{"type": "scramble", "chunks": ["in the building?", "Is there", "an elevator"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Is there an elevator in the building?', '{"type": "scramble", "chunks": ["in the building?", "Is there", "an elevator"], "correct_order": [1, 2, 0]}'::jsonb);

END;
$seed$;
