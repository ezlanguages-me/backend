-- ============================================================
-- Seed: A0 English Path – STEP 3490 – Grammar – Be Going To: Planes y Predicciones
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

            DELETE FROM grammar WHERE step_order = 3490 AND path_uuid = v_path_id;

            INSERT INTO grammar (path_uuid, step_order, source_language, type)
            VALUES (v_path_id, 3490, 'en', 'grammar')
            RETURNING uuid INTO v_grammar_id;

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'es',
                'Planes y Predicciones',
                to_jsonb($content_3490_es$## Be Going To: Planes y Predicciones

**Be going to** se usa para hablar del futuro cuando ya existe un plan, una intención o una señal clara. La estructura lleva siempre el verbo **be**: **am / is / are + going to + verbo base**. Suele aparecer con expresiones como **tomorrow, tonight, next week, next month**.

---

##### 1. Afirmativas

En afirmativa usamos **am / is / are + going to + verbo base**.

* I **am going to visit** my aunt.
* She **is going to study** tonight.
* They **are going to travel** tomorrow.

El verbo después de **going to** siempre va en forma base.

---

##### 2. Negativas

Para negar, ponemos **not** dentro del verbo **be**.

* I **am not going to work** on Sunday.
* He **isn't going to call** today.
* We **aren't going to move** this year.

---

##### 3. Preguntas

Para preguntas, cambiamos el orden: **Am/Is/Are + sujeto + going to + verbo base?**

* **Are** you going to study tonight?
* **Is** she going to drive?
* **Am** I going to need a ticket?

---

##### 4. Going to vs will

Usamos **going to** para planes ya pensados o predicciones con evidencia visible.

* We bought the tickets. We **are going to travel** next week.
* Look at those clouds. It **is going to rain**.

Usamos **will** mucho para decisiones espontáneas o predicciones más generales. Las dos formas hablan del futuro, pero la intención y el contexto no son iguales.

* The phone is ringing. I **will answer** it.
* I think you **will like** this film.

---

##### 5. Consejo útil

Si ya hay plan o ves una señal clara, piensa en **going to**. Si decides en ese momento, muchas veces usamos **will**. Esa pequeña diferencia ayuda a sonar más natural.

---

##### 6. Error frecuente

* ❌ She going to study.  
  ✅ She **is going to study**.

* ❌ Are going to travel they?  
  ✅ **Are they going to travel?**

* ❌ I bought the ticket. I will travel tomorrow.  
  ✅ I bought the ticket. I **am going to travel** tomorrow.$content_3490_es$::text)
            );

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'de',
                'Pläne und Vorhersagen',
                to_jsonb($content_3490_de$## Be Going To: Pläne und Vorhersagen

**Be going to** benutzt man für die Zukunft, wenn schon ein Plan, eine Absicht oder ein klares Zeichen vorhanden ist. Die Struktur braucht immer das Verb **be**: **am / is / are + going to + Grundform**. Häufig stehen dazu Zeitangaben wie **tomorrow, tonight, next week, next month**.

---

##### 1. Aussagen

In positiven Sätzen benutzt man **am / is / are + going to + Grundform**.

* I **am going to visit** my aunt.
* She **is going to study** tonight.
* They **are going to travel** tomorrow.

Das Verb nach **going to** bleibt immer in der Grundform.

---

##### 2. Verneinung

Für die Verneinung setzt man **not** in das Verb **be**.

* I **am not going to work** on Sunday.
* He **isn't going to call** today.
* We **aren't going to move** this year.

---

##### 3. Fragen

Für Fragen ändert sich die Wortstellung: **Am/Is/Are + Subjekt + going to + Grundform?**

* **Are** you going to study tonight?
* **Is** she going to drive?
* **Am** I going to need a ticket?

---

##### 4. Going to vs will

**Going to** benutzt man für schon geplante Handlungen oder Vorhersagen mit sichtbaren Beweisen.

* We bought the tickets. We **are going to travel** next week.
* Look at those clouds. It **is going to rain**.

**Will** benutzt man oft für spontane Entscheidungen oder allgemeinere Vorhersagen. Beide Formen sprechen über die Zukunft, aber die Absicht und der Kontext sind nicht gleich.

* The phone is ringing. I **will answer** it.
* I think you **will like** this film.

---

##### 5. Praktischer Tipp

Gibt es schon einen Plan oder ein klares Zeichen, denke an **going to**. Triffst du die Entscheidung erst im Moment des Sprechens, passt oft **will**.

---

##### 6. Häufiger Fehler

* ❌ She going to study.  
  ✅ She **is going to study**.

* ❌ Are going to travel they?  
  ✅ **Are they going to travel?**

* ❌ I bought the ticket. I will travel tomorrow.  
  ✅ I bought the ticket. I **am going to travel** tomorrow.$content_3490_de$::text)
            );


-- Rule 1
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'es', 'Afirmativas con AM / IS / ARE + GOING TO', 'En afirmativa necesitas am/is/are antes de going to: ❌ She going to study → ✅ She is going to study.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'de', 'Aussagen mit AM / IS / ARE + GOING TO', 'In positiven Sätzen brauchst du am/is/are vor going to: ❌ She going to study → ✅ She is going to study.');


-- Rule 2
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'es', 'Negativas con AM NOT / ISN''T / AREN''T + GOING TO', 'Para negar usa am not / isn''t / aren''t antes de going to: ❌ He not going to call → ✅ He isn''t going to call.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'de', 'Verneinung mit AM NOT / ISN''T / AREN''T + GOING TO', 'Für die Verneinung benutzt du am not / isn''t / aren''t vor going to: ❌ He not going to call → ✅ He isn''t going to call.');


-- Rule 3
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'es', 'Preguntas con AM / IS / ARE + GOING TO', 'En preguntas el verbo be va antes del sujeto: ❌ You are going to study? → ✅ Are you going to study?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'de', 'Fragen mit AM / IS / ARE + GOING TO', 'In Fragen steht das Verb be vor dem Subjekt: ❌ You are going to study? → ✅ Are you going to study?');


-- Rule 4
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'es', 'GOING TO vs WILL', 'Usa be going to para planes o evidencia visible y will para decisiones instantáneas o predicciones generales: ❌ Look at the clouds! It will rain. → ✅ It is going to rain.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'de', 'GOING TO vs WILL', 'Benutze be going to für Pläne oder sichtbare Hinweise und will für spontane Entscheidungen oder allgemeine Vorhersagen: ❌ Look at the clouds! It will rain. → ✅ It is going to rain.');


-- =========================================================
-- TYPING — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ going to visit my aunt tomorrow.', '{"type": "typing", "correct_answers": ["am"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ going to visit my aunt tomorrow.', '{"type": "typing", "correct_answers": ["am"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ going to study tonight.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ going to study tonight.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ going to travel by train.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ going to travel by train.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ going to watch a film later.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ going to watch a film later.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ going to cook dinner.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ going to cook dinner.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ going to stay here tonight.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ going to stay here tonight.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The team ___ going to practice after school.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The team ___ going to practice after school.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ going to work on Sunday.', '{"type": "typing", "correct_answers": ["am not"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ going to work on Sunday.', '{"type": "typing", "correct_answers": ["am not"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ going to buy that dress.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ going to buy that dress.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ going to take a taxi.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ going to take a taxi.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ going to move this year.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ going to move this year.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ going to call today.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ going to call today.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ going to miss the class.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ going to miss the class.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The baby ___ going to sleep early.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The baby ___ going to sleep early.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you going to study tonight?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you going to study tonight?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ she going to drive to work?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ she going to drive to work?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they going to stay with friends?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ they going to stay with friends?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he going to cook for us?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ he going to cook for us?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ I going to need a ticket?', '{"type": "typing", "correct_answers": ["Am"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ I going to need a ticket?', '{"type": "typing", "correct_answers": ["Am"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ we going to leave soon?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ we going to leave soon?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ the train going to arrive on time?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ the train going to arrive on time?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Look at those clouds! It ___ rain.', '{"type": "typing", "correct_answers": ["is going to"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Look at those clouds! It ___ rain.', '{"type": "typing", "correct_answers": ["is going to"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We bought the tickets yesterday. We ___ travel to Berlin next week.', '{"type": "typing", "correct_answers": ["are going to"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We bought the tickets yesterday. We ___ travel to Berlin next week.', '{"type": "typing", "correct_answers": ["are going to"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The phone is ringing. I ___ answer it.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The phone is ringing. I ___ answer it.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I think you ___ love this movie.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I think you ___ love this movie.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She studied the map and packed her bag. She ___ hike tomorrow.', '{"type": "typing", "correct_answers": ["is going to"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She studied the map and packed her bag. She ___ hike tomorrow.', '{"type": "typing", "correct_answers": ["is going to"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I forgot the sugar. I ___ buy some now.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I forgot the sugar. I ___ buy some now.', '{"type": "typing", "correct_answers": ["will"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They see the dark sky and the wind. It ___ be a storm.', '{"type": "typing", "correct_answers": ["is going to"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They see the dark sky and the wind. It ___ be a storm.', '{"type": "typing", "correct_answers": ["is going to"], "case_sensitive": false}'::jsonb);

        END;
        $seed$;
