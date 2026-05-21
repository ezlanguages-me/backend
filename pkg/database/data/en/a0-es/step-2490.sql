-- ============================================================
-- Seed: A0 English Path – STEP 2490 – Grammar – Can y Could: Habilidad
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

            DELETE FROM grammar WHERE step_order = 2490 AND path_uuid = v_path_id;

            INSERT INTO grammar (path_uuid, step_order, source_language, type)
            VALUES (v_path_id, 2490, 'en', 'grammar')
            RETURNING uuid INTO v_grammar_id;

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'es',
                'Can y Could: Habilidad',
                to_jsonb($content_2490_es$## Can y Could: Habilidad

**Can** y **could** son verbos modales muy frecuentes. Sirven para hablar de habilidad, capacidad, posibilidad simple y también para pedir permiso o hacer peticiones. Después de estos modales usamos siempre el **verbo base**, sin **to** y sin **-s**. Además, **can** y **could** no cambian con **he / she / it**: siempre mantienen la misma forma.

---

##### 1. CAN para habilidad presente

**Can** expresa habilidad o capacidad en el presente.

* I **can swim**.
* She **can speak** English.
* We **can finish** today.

La estructura es **sujeto + can + verbo base**.

---

##### 2. CAN'T para incapacidad

**Can't** expresa que alguien no puede hacer algo.

* I **can't lift** this box.
* He **can't drive** yet.
* We **can't hear** you.

El verbo después de **can't** sigue en forma base.

---

##### 3. COULD para habilidad pasada

**Could** habla de habilidad general en el pasado. Su negativa es **couldn't**.

* She **could read** at five.
* They **could play** the piano.
* I **couldn't understand** the noise.

Es una forma muy útil para comparar pasado y presente. También ayuda a hablar de lo que antes era posible y ahora ya no lo es, o al contrario. Así puedes comparar etapas de la vida de forma muy simple y clara. En conversación diaria aparece muchísimo cuando hablas de infancia, escuela o trabajo.

---

##### 4. CAN para permiso y peticiones

También usamos **can** para pedir permiso o hacer peticiones sencillas.

* **Can I** open the window?
* **Can you** help me?
* **Can we** sit here?

En inglés básico es una forma natural y muy común.

---

##### 5. Consejo útil

Después de **can / can't / could / couldn't** nunca añadas **to** ni **-s**. En respuestas cortas repetimos el modal: **Yes, I can. / No, I couldn't.**

* ✅ She can **swim**.
* ❌ She can **swims**.
* ❌ He could **to drive**.

---

##### 6. Error frecuente

* ❌ He can plays football.  
  ✅ He can **play** football.

* ❌ I could to swim.  
  ✅ I **could swim**.

* ❌ You can help me?  
  ✅ **Can you** help me?$content_2490_es$::text)
            );

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'de',
                'Can und Could: Fähigkeit',
                to_jsonb($content_2490_de$## Can und Could: Fähigkeit

**Can** und **could** sind sehr häufige Modalverben. Sie sprechen über Fähigkeit, einfache Möglichkeit und auch über Erlaubnis oder Bitten. Nach diesen Modalverben steht immer die **Grundform**, also **ohne to** und **ohne -s**. Außerdem ändern sich **can** und **could** nicht mit **he / she / it**: Die Form bleibt immer gleich.

---

##### 1. CAN für gegenwärtige Fähigkeit

**Can** drückt Fähigkeit oder Möglichkeit in der Gegenwart aus.

* I **can swim**.
* She **can speak** English.
* We **can finish** today.

Die Struktur ist **Subjekt + can + Grundform**.

---

##### 2. CAN'T für Unfähigkeit

**Can't** zeigt, dass jemand etwas nicht kann.

* I **can't lift** this box.
* He **can't drive** yet.
* We **can't hear** you.

Das Verb nach **can't** bleibt in der Grundform.

---

##### 3. COULD für Fähigkeit in der Vergangenheit

**Could** spricht über allgemeine Fähigkeit in der Vergangenheit. Die Verneinung ist **couldn't**.

* She **could read** at five.
* They **could play** the piano.
* I **couldn't understand** the noise.

Diese Form ist sehr nützlich, um Vergangenheit und Gegenwart zu vergleichen. So kann man gut sagen, was früher möglich war und heute vielleicht nicht mehr geht. Damit lassen sich verschiedene Lebensphasen einfach und klar vergleichen. Im Alltag hört man diese Form oft bei Gesprächen über Kindheit, Schule oder Arbeit.

---

##### 4. CAN für Erlaubnis und Bitten

**Can** benutzt man auch für Erlaubnis und einfache Bitten.

* **Can I** open the window?
* **Can you** help me?
* **Can we** sit here?

Im einfachen Englisch klingt diese Form natürlich und ist sehr gebräuchlich. Sie ist besonders nützlich in der Klasse, im Geschäft oder auf Reisen.

---

##### 5. Praktischer Tipp

Nach **can / can't / could / couldn't** kommt nie **to** und nie **-s**. In kurzen Antworten wiederholt man das Modal: **Yes, I can. / No, I couldn't.**

* ✅ She can **swim**.
* ❌ She can **swims**.
* ❌ He could **to drive**.

---

##### 6. Häufiger Fehler

* ❌ He can plays football.  
  ✅ He can **play** football.

* ❌ I could to swim.  
  ✅ I **could swim**.

* ❌ You can help me?  
  ✅ **Can you** help me?$content_2490_de$::text)
            );


-- Rule 1
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'es', 'CAN para habilidad presente', 'Usa can + verbo base para habilidad actual: ❌ She can speaks English → ✅ She can speak English.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'de', 'CAN für gegenwärtige Fähigkeit', 'Benutze can + Grundform für Fähigkeiten in der Gegenwart: ❌ She can speaks English → ✅ She can speak English.');


-- Rule 2
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'es', 'CAN''T para incapacidad', 'Usa can''t + verbo base para expresar incapacidad: ❌ He can''t rides a bike → ✅ He can''t ride a bike.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'de', 'CAN''T für Unfähigkeit', 'Benutze can''t + Grundform, um Unfähigkeit auszudrücken: ❌ He can''t rides a bike → ✅ He can''t ride a bike.');


-- Rule 3
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'es', 'COULD / COULDN''T para habilidad pasada', 'Usa could o couldn''t para hablar de habilidad en el pasado: ❌ When I was five, I can read → ✅ When I was five, I could read.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'de', 'COULD / COULDN''T für vergangene Fähigkeit', 'Benutze could oder couldn''t für Fähigkeiten in der Vergangenheit: ❌ When I was five, I can read → ✅ When I was five, I could read.');


-- Rule 4
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'es', 'CAN para permiso y peticiones', 'Para pedir permiso o hacer peticiones usa Can I...? / Can you...?: ❌ You can help me? → ✅ Can you help me?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'de', 'CAN für Erlaubnis und Bitten', 'Für Erlaubnis und Bitten benutzt man Can I...? / Can you...?: ❌ You can help me? → ✅ Can you help me?');


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
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ finish this today.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ finish this today.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ drive a truck.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ drive a truck.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ play chess well.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ play chess well.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ hear the music from here.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ hear the music from here.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My sister ___ cook Italian food.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My sister ___ cook Italian food.', '{"type": "typing", "correct_answers": ["can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ lift this box alone.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ lift this box alone.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ come today.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ come today.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ hear you.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ hear you.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ ride a bike yet.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ ride a bike yet.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ stay very long.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ stay very long.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My phone ___ connect to the Wi-Fi.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My phone ___ connect to the Wi-Fi.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ see the screen from there.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ see the screen from there.', '{"type": "typing", "correct_answers": ["can''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'When I was five, I ___ read simple books.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'When I was five, I ___ read simple books.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ swim when she was six.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ swim when she was six.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ walk after the accident for a month.', '{"type": "typing", "correct_answers": ["couldn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ walk after the accident for a month.', '{"type": "typing", "correct_answers": ["couldn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ play the piano when they were young.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ play the piano when they were young.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ understand the teacher yesterday because of the noise.', '{"type": "typing", "correct_answers": ["couldn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ understand the teacher yesterday because of the noise.', '{"type": "typing", "correct_answers": ["couldn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My grandfather ___ drive until he was eighty.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My grandfather ___ drive until he was eighty.', '{"type": "typing", "correct_answers": ["could"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ find the hotel without a map.', '{"type": "typing", "correct_answers": ["couldn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ find the hotel without a map.', '{"type": "typing", "correct_answers": ["couldn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ I open the window?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ I open the window?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you help me with this bag?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you help me with this bag?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ we sit here?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ we sit here?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you repeat that, please?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you repeat that, please?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ I use your phone for a minute?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ I use your phone for a minute?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you close the door, please?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you close the door, please?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ I ask a question?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ I ask a question?', '{"type": "typing", "correct_answers": ["Can"], "case_sensitive": false}'::jsonb);

        END;
        $seed$;
