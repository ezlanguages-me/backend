-- ============================================================
-- Seed: A0 English Path – STEP 315 – Grammar – Habilidad y Capacidad (Can, Could)
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

            DELETE FROM grammar WHERE step_order = 315 AND path_uuid = v_path_id;

            INSERT INTO grammar (path_uuid, step_order, source_language, type)
            VALUES (v_path_id, 315, 'en', 'grammar')
            RETURNING uuid INTO v_grammar_id;

            INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
            VALUES (
                v_grammar_id,
                'es',
                'Can y Could',
                '',
                to_jsonb($content_315_es$## Can y Could

**Can** se usa para hablar de habilidad o capacidad en el presente. **Could** se usa con frecuencia para hablar de habilidad en el pasado.

---

##### 1. CAN para habilidad presente

| Sujeto | Modal | Verbo |
|--------|-------|-------|
| I / You / He / She / We / They | **can** | verbo base |

* I **can swim**.
* She **can speak** English.
* We **can cook** dinner.

> ⚠️ Después de **can** el verbo va siempre en forma base. No uses **to** y no añadas **-s**.

---

##### 2. CANNOT / CAN'T para negación

Para decir que una persona **no puede** hacer algo, usa **cannot** o **can't**.

* I **can't drive**.
* He **cannot see** without glasses.
* They **can't come** today.

> 💡 **Cannot** es la forma completa. **Can't** es la forma corta y muy común en la conversación.

---

##### 3. CAN para preguntas

Pon **Can** al principio de la oración:

* **Can** you help me?
* **Can** she play the piano?
* **Can** we sit here?

La estructura es: **Can + sujeto + verbo base + ?**

---

##### 4. COULD para habilidad pasada

Usa **could** para decir que alguien tenía una habilidad en el pasado.

* When I was young, I **could run** fast.
* My grandmother **could speak** French.
* He **could read** at five.

---

##### 5. Error frecuente

* ❌ She can sings.
* ✅ She can sing.

* ❌ Can he drives?
* ✅ Can he drive?$content_315_es$::text)
            );

            INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
            VALUES (
                v_grammar_id,
                'de',
                'Can und Could',
                '',
                to_jsonb($content_315_de$## Can und Could

**Can** wird verwendet, um Fähigkeit oder Möglichkeit in der Gegenwart auszudrücken. **Could** wird oft für Fähigkeiten in der Vergangenheit verwendet.

---

##### 1. CAN für Fähigkeiten in der Gegenwart

| Subjekt | Modalverb | Verb |
|---------|-----------|------|
| I / You / He / She / We / They | **can** | Grundform |

* I **can swim**.
* She **can speak** English.
* We **can cook** dinner.

> ⚠️ Nach **can** steht das Verb immer in der Grundform. Kein **to** und kein **-s**.

---

##### 2. CANNOT / CAN'T für die Verneinung

Um zu sagen, dass jemand etwas **nicht kann**, benutzt man **cannot** oder **can't**.

* I **can't drive**.
* He **cannot see** without glasses.
* They **can't come** today.

> 💡 **Cannot** ist die lange Form. **Can't** ist die kurze, sehr häufige Form.

---

##### 3. CAN in Fragen

Stelle **Can** an den Anfang des Satzes:

* **Can** you help me?
* **Can** she play the piano?
* **Can** we sit here?

Die Struktur ist: **Can + Subjekt + Grundform + ?**

---

##### 4. COULD für Fähigkeiten in der Vergangenheit

Benutze **could**, um zu sagen, dass jemand in der Vergangenheit eine Fähigkeit hatte.

* When I was young, I **could run** fast.
* My grandmother **could speak** French.
* He **could read** at five.

---

##### 5. Häufiger Fehler

* ❌ She can sings.
* ✅ She can sing.

* ❌ Can he drives?
* ✅ Can he drive?$content_315_de$::text)
            );


-- Rule 1
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'es', 'CAN para habilidad presente', 'Usa "can" + verbo base para hablar de habilidad en el presente. No añadas "to" ni cambies el verbo: ❌ She can sings → ✅ She can sing.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'de', 'CAN für Fähigkeiten in der Gegenwart', 'Verwende "can" + Grundform für Fähigkeiten in der Gegenwart. Kein "to" und keine Verbendung: ❌ She can sings → ✅ She can sing.');


-- Rule 2
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'es', 'CANNOT / CAN''T para negación', 'Para negar, usa "cannot" o "can''t" + verbo base. No uses do/does con can: ❌ He doesn''t can swim → ✅ He can''t swim.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'de', 'CANNOT / CAN''T für die Verneinung', 'Für die Verneinung benutzt du "cannot" oder "can''t" + Grundform. Kein do/does mit can: ❌ He doesn''t can swim → ✅ He can''t swim.');


-- Rule 3
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'es', 'CAN para preguntas', 'Para hacer preguntas, pon "Can" al principio y usa el verbo base: ❌ Can she plays? → ✅ Can she play?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'de', 'CAN in Fragen', 'Für Fragen steht "Can" am Satzanfang und danach die Grundform: ❌ Can she plays? → ✅ Can she play?');


-- Rule 4
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'es', 'COULD para habilidad pasada', 'Usa "could" + verbo base para hablar de habilidad pasada: ❌ I could ran → ✅ I could run.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'de', 'COULD für Fähigkeiten in der Vergangenheit', 'Benutze "could" + Grundform für Fähigkeiten in der Vergangenheit: ❌ I could ran → ✅ I could run.');


-- =========================================================
-- TYPING — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ swim very well.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ swim very well.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ speak English and Spanish.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ speak English and Spanish.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ play cards after dinner.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ play cards after dinner.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My brother ___ ride a bike.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My brother ___ ride a bike.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ cook pasta at home.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ cook pasta at home.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Anna ___ use a computer.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Anna ___ use a computer.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The boy ___ run fast.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The boy ___ run fast.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ drive.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ drive.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ come today.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ come today.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ open the door.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ open the door.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ see without glasses.', '{"type": "typing", "correct_answers": ["cannot"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ see without glasses.', '{"type": "typing", "correct_answers": ["cannot"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ stay late tonight.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ stay late tonight.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The dog ___ jump that high.', '{"type": "typing", "correct_answers": ["cannot"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The dog ___ jump that high.', '{"type": "typing", "correct_answers": ["cannot"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Anna ___ find her key.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Anna ___ find her key.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you help me?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you help me?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ she play the piano?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ she play the piano?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they come today?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ they come today?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he use the elevator?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ he use the elevator?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ we sit here?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ we sit here?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ your brother drive?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ your brother drive?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ I open the window?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ I open the window?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'When I was six, I ___ swim.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'When I was six, I ___ swim.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My grandfather ___ speak French.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My grandfather ___ speak French.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ run fast at school.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ run fast at school.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ stay up late on Saturdays.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ stay up late on Saturdays.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ read at four.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ read at four.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ play football after class.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ play football after class.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ climb that tree as a child.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ climb that tree as a child.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);


-- =========================================================
-- MULTIPLE CHOICE — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ play tennis.', '{"type": "multiple_choice", "options": ["can", "cans", "can to"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ play tennis.', '{"type": "multiple_choice", "options": ["can", "cans", "can to"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ help you with the bags.', '{"type": "multiple_choice", "options": ["can", "am can", "coulded"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ help you with the bags.', '{"type": "multiple_choice", "options": ["can", "am can", "coulded"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ dance very well.', '{"type": "multiple_choice", "options": ["can", "cans", "is can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ dance very well.', '{"type": "multiple_choice", "options": ["can", "cans", "is can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ see the station from here.', '{"type": "multiple_choice", "options": ["can", "are can", "couldn''t"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ see the station from here.', '{"type": "multiple_choice", "options": ["can", "are can", "couldn''t"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My dad ___ fix the bike.', '{"type": "multiple_choice", "options": ["can", "can''t", "does can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My dad ___ fix the bike.', '{"type": "multiple_choice", "options": ["can", "can''t", "does can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ speak slowly.', '{"type": "multiple_choice", "options": ["can", "can to", "is can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ speak slowly.', '{"type": "multiple_choice", "options": ["can", "can to", "is can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The baby ___ sit alone now.', '{"type": "multiple_choice", "options": ["can", "coulded", "sits can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The baby ___ sit alone now.', '{"type": "multiple_choice", "options": ["can", "coulded", "sits can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ swim today.', '{"type": "multiple_choice", "options": ["can''t", "don''t can", "am not can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ swim today.', '{"type": "multiple_choice", "options": ["can''t", "don''t can", "am not can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ read that sign.', '{"type": "multiple_choice", "options": ["cannot", "can''t reads", "doesn''t can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ read that sign.', '{"type": "multiple_choice", "options": ["cannot", "can''t reads", "doesn''t can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ stay here.', '{"type": "multiple_choice", "options": ["can''t", "cannot to", "aren''t can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ stay here.', '{"type": "multiple_choice", "options": ["can''t", "cannot to", "aren''t can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ hear you.', '{"type": "multiple_choice", "options": ["can''t", "cans not", "doesn''t can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ hear you.', '{"type": "multiple_choice", "options": ["can''t", "cans not", "doesn''t can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My phone ___ connect to Wi-Fi.', '{"type": "multiple_choice", "options": ["can''t", "don''t can", "isn''t can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My phone ___ connect to Wi-Fi.', '{"type": "multiple_choice", "options": ["can''t", "don''t can", "isn''t can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ come by bus today.', '{"type": "multiple_choice", "options": ["can''t", "cannot comes", "don''t can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ come by bus today.', '{"type": "multiple_choice", "options": ["can''t", "cannot comes", "don''t can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The baby ___ walk yet.', '{"type": "multiple_choice", "options": ["cannot", "can not to", "does not can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The baby ___ walk yet.', '{"type": "multiple_choice", "options": ["cannot", "can not to", "does not can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you help me?', '{"type": "multiple_choice", "options": ["Can", "Do can", "Are can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you help me?', '{"type": "multiple_choice", "options": ["Can", "Do can", "Are can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ she swim well?', '{"type": "multiple_choice", "options": ["Can", "Does can", "Can does"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ she swim well?', '{"type": "multiple_choice", "options": ["Can", "Does can", "Can does"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they speak English?', '{"type": "multiple_choice", "options": ["Can", "Do", "Are"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ they speak English?', '{"type": "multiple_choice", "options": ["Can", "Do", "Are"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he fix the TV?', '{"type": "multiple_choice", "options": ["Can", "Does", "Is can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ he fix the TV?', '{"type": "multiple_choice", "options": ["Can", "Does", "Is can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ we use this room?', '{"type": "multiple_choice", "options": ["Can", "Do can", "May to"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ we use this room?', '{"type": "multiple_choice", "options": ["Can", "Do can", "May to"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ Anna read this?', '{"type": "multiple_choice", "options": ["Can", "Does can", "Can reads"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ Anna read this?', '{"type": "multiple_choice", "options": ["Can", "Does can", "Can reads"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ I ask a question?', '{"type": "multiple_choice", "options": ["Can", "Am can", "Do"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ I ask a question?', '{"type": "multiple_choice", "options": ["Can", "Am can", "Do"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'When she was young, she ___ dance very well.', '{"type": "multiple_choice", "options": ["could", "can", "could to"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'When she was young, she ___ dance very well.', '{"type": "multiple_choice", "options": ["could", "can", "could to"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My dad ___ run ten kilometers at twenty.', '{"type": "multiple_choice", "options": ["could", "cans", "is could"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My dad ___ run ten kilometers at twenty.', '{"type": "multiple_choice", "options": ["could", "cans", "is could"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ play outside until late in summer.', '{"type": "multiple_choice", "options": ["could", "can", "coulded"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ play outside until late in summer.', '{"type": "multiple_choice", "options": ["could", "can", "coulded"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ read before school.', '{"type": "multiple_choice", "options": ["could", "can", "did can"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ read before school.', '{"type": "multiple_choice", "options": ["could", "can", "did can"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ swim in the river.', '{"type": "multiple_choice", "options": ["could", "could swims", "are could"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ swim in the river.', '{"type": "multiple_choice", "options": ["could", "could swims", "are could"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ speak a little German at school.', '{"type": "multiple_choice", "options": ["could", "can", "could to speak"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ speak a little German at school.', '{"type": "multiple_choice", "options": ["could", "can", "could to speak"], "answer": 0}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My sister ___ ride a bike at five.', '{"type": "multiple_choice", "options": ["could", "can", "rides could"], "answer": 0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My sister ___ ride a bike at five.', '{"type": "multiple_choice", "options": ["could", "can", "rides could"], "answer": 0}'::jsonb);


-- =========================================================
-- TRUE / FALSE — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«She can to swim.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„She can to swim.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«I can play chess.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„I can play chess.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«He can speaks English.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„He can speaks English.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«We can cook dinner.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„We can cook dinner.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«My sister can ride a horse.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„My sister can ride a horse.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Con he/she/it usamos «cans».', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Mit he/she/it benutzt man „cans“.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Can» no cambia con he, she o it.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Can“ verändert sich nicht mit he, she oder it.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«I can''t drive.» expresa una negación correcta.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„I can''t drive.“ ist eine korrekte Verneinung.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«He doesn''t can see.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„He doesn''t can see.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Cannot» y «can''t» pueden expresar la misma idea.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Cannot“ und „can''t“ können dieselbe Idee ausdrücken.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Después de «can''t» usamos el verbo con -s.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Nach „can''t“ benutzt man das Verb mit -s.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«She can''t come today.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„She can''t come today.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«We cannot to stay.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„We cannot to stay.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«The dog cannot jump.» es una frase correcta.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„The dog cannot jump.“ ist ein korrekter Satz.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Can you help me?» es una pregunta correcta.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Can you help me?“ ist eine korrekte Frage.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Can she plays piano?» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Can she plays piano?“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En preguntas con can, el verbo principal va en forma base.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'In Fragen mit can steht das Hauptverb in der Grundform.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Can they comes today?» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Can they comes today?“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Can we sit here?» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Can we sit here?“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Do can he swim?» es una buena pregunta.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Do can he swim?“ ist eine gute Frage.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Can I open the window?» es una petición o pregunta posible.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Can I open the window?“ ist eine mögliche Frage oder Bitte.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«When I was young, I could run fast.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„When I was young, I could run fast.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«She could sings well.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„She could sings well.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Could» puede hablar de una habilidad en el pasado.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Could“ kann über eine Fähigkeit in der Vergangenheit sprechen.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Después de «could» usamos el verbo con -ed.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Nach „could“ benutzt man das Verb mit -ed.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«My grandmother could cook very well.» es correcto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„My grandmother could cook very well.“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«He could drove.» es correcto.', '{"type": "true_false", "answer": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„He could drove.“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Could» no cambia con el sujeto.', '{"type": "true_false", "answer": true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '„Could“ verändert sich nicht mit dem Subjekt.', '{"type": "true_false", "answer": true}'::jsonb);


-- =========================================================
-- SCRAMBLE — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: I can swim.', '{"type": "scramble", "chunks": ["swim.", "can", "I"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: I can swim.', '{"type": "scramble", "chunks": ["swim.", "can", "I"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She can speak English.', '{"type": "scramble", "chunks": ["English.", "She", "can speak"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: She can speak English.', '{"type": "scramble", "chunks": ["English.", "She", "can speak"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: We can help now.', '{"type": "scramble", "chunks": ["can help", "now.", "We"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: We can help now.', '{"type": "scramble", "chunks": ["can help", "now.", "We"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: He can drive a car.', '{"type": "scramble", "chunks": ["a car.", "He", "can drive"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: He can drive a car.', '{"type": "scramble", "chunks": ["a car.", "He", "can drive"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: They can play chess.', '{"type": "scramble", "chunks": ["play chess.", "They", "can"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: They can play chess.', '{"type": "scramble", "chunks": ["play chess.", "They", "can"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: My mother can cook well.', '{"type": "scramble", "chunks": ["can cook", "well.", "My mother"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: My mother can cook well.', '{"type": "scramble", "chunks": ["can cook", "well.", "My mother"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: The child can read now.', '{"type": "scramble", "chunks": ["read now.", "The child", "can"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: The child can read now.', '{"type": "scramble", "chunks": ["read now.", "The child", "can"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: I can''t drive.', '{"type": "scramble", "chunks": ["can''t", "drive.", "I"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: I can''t drive.', '{"type": "scramble", "chunks": ["can''t", "drive.", "I"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She can''t come today.', '{"type": "scramble", "chunks": ["today.", "can''t come", "She"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: She can''t come today.', '{"type": "scramble", "chunks": ["today.", "can''t come", "She"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: We can''t open the door.', '{"type": "scramble", "chunks": ["the door.", "We", "can''t open"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: We can''t open the door.', '{"type": "scramble", "chunks": ["the door.", "We", "can''t open"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: He cannot see well.', '{"type": "scramble", "chunks": ["see well.", "cannot", "He"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: He cannot see well.', '{"type": "scramble", "chunks": ["see well.", "cannot", "He"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: They can''t stay late.', '{"type": "scramble", "chunks": ["stay late.", "They", "can''t"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: They can''t stay late.', '{"type": "scramble", "chunks": ["stay late.", "They", "can''t"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: My phone can''t work here.', '{"type": "scramble", "chunks": ["can''t work", "here.", "My phone"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: My phone can''t work here.', '{"type": "scramble", "chunks": ["can''t work", "here.", "My phone"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Anna cannot find her key.', '{"type": "scramble", "chunks": ["find her key.", "Anna", "cannot"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Anna cannot find her key.', '{"type": "scramble", "chunks": ["find her key.", "Anna", "cannot"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Can you help me?', '{"type": "scramble", "chunks": ["help me?", "Can", "you"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Can you help me?', '{"type": "scramble", "chunks": ["help me?", "Can", "you"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Can she play the piano?', '{"type": "scramble", "chunks": ["the piano?", "Can she", "play"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Can she play the piano?', '{"type": "scramble", "chunks": ["the piano?", "Can she", "play"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Can they come today?', '{"type": "scramble", "chunks": ["today?", "come", "Can they"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Can they come today?', '{"type": "scramble", "chunks": ["today?", "come", "Can they"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Can he use the elevator?', '{"type": "scramble", "chunks": ["use", "the elevator?", "Can he"], "correct_order": [2, 0, 1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Can he use the elevator?', '{"type": "scramble", "chunks": ["use", "the elevator?", "Can he"], "correct_order": [2, 0, 1]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Can we sit here?', '{"type": "scramble", "chunks": ["sit here?", "Can we"], "correct_order": [1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Can we sit here?', '{"type": "scramble", "chunks": ["sit here?", "Can we"], "correct_order": [1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Can your brother drive?', '{"type": "scramble", "chunks": ["drive?", "Can", "your brother"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Can your brother drive?', '{"type": "scramble", "chunks": ["drive?", "Can", "your brother"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Can I ask a question?', '{"type": "scramble", "chunks": ["a question?", "ask", "Can I"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: Can I ask a question?', '{"type": "scramble", "chunks": ["a question?", "ask", "Can I"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: I could swim at six.', '{"type": "scramble", "chunks": ["swim", "I", "could", "at six."], "correct_order": [1, 2, 0, 3]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: I could swim at six.', '{"type": "scramble", "chunks": ["swim", "I", "could", "at six."], "correct_order": [1, 2, 0, 3]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She could run fast.', '{"type": "scramble", "chunks": ["run fast.", "could", "She"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: She could run fast.', '{"type": "scramble", "chunks": ["run fast.", "could", "She"], "correct_order": [2, 1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: We could play outside.', '{"type": "scramble", "chunks": ["outside.", "We", "could play"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: We could play outside.', '{"type": "scramble", "chunks": ["outside.", "We", "could play"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: He could read at four.', '{"type": "scramble", "chunks": ["at four.", "He", "could read"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: He could read at four.', '{"type": "scramble", "chunks": ["at four.", "He", "could read"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: They could speak French.', '{"type": "scramble", "chunks": ["French.", "They", "could speak"], "correct_order": [1, 2, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: They could speak French.', '{"type": "scramble", "chunks": ["French.", "They", "could speak"], "correct_order": [1, 2, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: My dad could drive.', '{"type": "scramble", "chunks": ["could drive.", "My dad"], "correct_order": [1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: My dad could drive.', '{"type": "scramble", "chunks": ["could drive.", "My dad"], "correct_order": [1, 0]}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: I could climb trees.', '{"type": "scramble", "chunks": ["climb trees.", "could", "I"], "correct_order": [2, 1, 0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne zu: I could climb trees.', '{"type": "scramble", "chunks": ["climb trees.", "could", "I"], "correct_order": [2, 1, 0]}'::jsonb);

END;
$seed$;
