-- ============================================================
-- Seed: A0 English Path – STEP 1750 – Grammar – Presente Continuo
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

            DELETE FROM grammar WHERE step_order = 1750 AND path_uuid = v_path_id;

            INSERT INTO grammar (path_uuid, step_order, source_language, type)
            VALUES (v_path_id, 1750, 'en', 'grammar')
            RETURNING uuid INTO v_grammar_id;

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'es',
                'Presente Continuo',
                to_jsonb($content_1750_es$## Presente Continuo

El **presente continuo** describe acciones que están pasando **ahora**, alrededor de este momento o en una situación temporal. La estructura básica es **sujeto + am/is/are + verbo-ing**. Expresiones como **now, right now, at the moment, today** aparecen mucho con este tiempo y te dan una pista útil.

---

##### 1. Afirmativas

Usa **am / is / are** según el sujeto y después el verbo en **-ing**.

* I **am reading** now.
* She **is cooking** dinner.
* They **are playing** outside.

**I → am**, **he/she/it → is**, **you/we/they → are**.

---

##### 2. Negativas

Para negar, añadimos **not** al verbo **be**.

* I **am not working** today.
* He **isn't sleeping**.
* We **aren't waiting**.

La forma negativa sigue usando el verbo principal en **-ing**.

---

##### 3. Preguntas

Para preguntas, cambiamos el orden: **Am/Is/Are + sujeto + verbo-ing?**

* **Are** you studying?
* **Is** she coming?
* **Am** I speaking too fast?

Las respuestas cortas usan el mismo verbo **be**: **Yes, she is. / No, they aren't.** También puedes reconocer este tiempo porque el verbo principal siempre termina en **-ing**.

---

##### 4. Verbos de estado

Algunos verbos normalmente **no** usan **-ing** cuando hablan de estado, opinión o necesidad.

* know
* love
* want
* need

Decimos **I know**, **She wants**, **We need**, no **I am knowing** o **She is wanting**. Estos verbos describen estado mental, sentimiento o necesidad más que una acción física en progreso. Por eso normalmente suenan naturales en presente simple, incluso cuando hablas de ahora mismo.

---

##### 5. Cuándo usarlo

Usa este tiempo para acciones en progreso o planes temporales.

* I am doing homework now.
* We are staying with friends this week.
* It is raining today.

Para rutinas normales usamos presente simple, no presente continuo. También es frecuente para situaciones temporales: **I am staying with my aunt this week**.

---

##### 6. Error frecuente

* ❌ She cooking now.  
  ✅ She **is cooking** now.

* ❌ Are working they?  
  ✅ **Are they working?**

* ❌ I am knowing the answer.  
  ✅ I **know** the answer.$content_1750_es$::text)
            );

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'de',
                'Present Continuous',
                to_jsonb($content_1750_de$## Present Continuous

Das **Present Continuous** beschreibt Handlungen, die **jetzt gerade**, rund um diesen Moment oder nur vorübergehend passieren. Die Grundstruktur ist **Subjekt + am/is/are + Verb-ing**. Wörter wie **now, right now, at the moment, today** stehen oft bei diesem Tempus und geben dir einen klaren Hinweis.

---

##### 1. Aussagen

Benutze **am / is / are** passend zum Subjekt und danach das Verb mit **-ing**.

* I **am reading** now.
* She **is cooking** dinner.
* They **are playing** outside.

**I → am**, **he/she/it → is**, **you/we/they → are**.

---

##### 2. Verneinung

Für die Verneinung kommt **not** zum Verb **be**.

* I **am not working** today.
* He **isn't sleeping**.
* We **aren't waiting**.

Das Hauptverb bleibt weiter in der **-ing-Form**.

---

##### 3. Fragen

Für Fragen ändert sich die Wortstellung: **Am/Is/Are + Subjekt + Verb-ing?**

* **Are** you studying?
* **Is** she coming?
* **Am** I speaking too fast?

Kurze Antworten benutzen wieder dasselbe Verb **be**: **Yes, she is. / No, they aren't.** Man erkennt dieses Tempus auch daran, dass das Hauptverb immer auf **-ing** endet.

---

##### 4. Zustandsverben

Einige Verben benutzt man normalerweise **nicht** mit **-ing**, wenn sie Zustand, Meinung oder Bedürfnis ausdrücken.

* know
* love
* want
* need

Man sagt **I know**, **She wants**, **We need**, nicht **I am knowing** oder **She is wanting**. Diese Verben beschreiben eher Zustand, Gefühl oder Bedürfnis als eine sichtbare Handlung im Ablauf. Darum klingen sie normalerweise im Simple Present natürlicher, selbst wenn es um den jetzigen Moment geht.

---

##### 5. Wann benutzt man es?

Dieses Tempus passt für Handlungen im Verlauf oder vorübergehende Situationen.

* I am doing homework now.
* We are staying with friends this week.
* It is raining today.

Für normale Routinen nimmt man das Simple Present, nicht das Present Continuous. Es passt auch gut zu vorübergehenden Situationen: **I am staying with my aunt this week**.

---

##### 6. Häufiger Fehler

* ❌ She cooking now.  
  ✅ She **is cooking** now.

* ❌ Are working they?  
  ✅ **Are they working?**

* ❌ I am knowing the answer.  
  ✅ I **know** the answer.$content_1750_de$::text)
            );


-- Rule 1
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'es', 'Afirmativas: AM / IS / ARE + verbo-ing', 'En afirmativa necesitas el verbo be correcto antes de la forma en -ing: ❌ She cooking → ✅ She is cooking.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'de', 'Aussagen: AM / IS / ARE + Verb-ing', 'In positiven Sätzen brauchst du das passende be vor der -ing-Form: ❌ She cooking → ✅ She is cooking.');


-- Rule 2
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'es', 'Negativas: AM NOT / ISN''T / AREN''T + verbo-ing', 'Para negar en presente continuo usa am not / isn''t / aren''t antes del verbo en -ing: ❌ He not sleeping → ✅ He isn''t sleeping.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'de', 'Verneinung: AM NOT / ISN''T / AREN''T + Verb-ing', 'Für die Verneinung im Present Continuous benutzt du am not / isn''t / aren''t vor dem Verb auf -ing: ❌ He not sleeping → ✅ He isn''t sleeping.');


-- Rule 3
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'es', 'Preguntas con AM / IS / ARE', 'En preguntas el verbo be va antes del sujeto: ❌ You are studying? → ✅ Are you studying?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'de', 'Fragen mit AM / IS / ARE', 'In Fragen steht das Verb be vor dem Subjekt: ❌ You are studying? → ✅ Are you studying?');


-- Rule 4
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'es', 'Verbos de estado: sin -ING', 'No uses presente continuo con verbos de estado como know, love, want o need: ❌ I am knowing → ✅ I know.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'de', 'Zustandsverben ohne -ING', 'Benutze bei Zustandsverben wie know, love, want oder need normalerweise kein Present Continuous: ❌ I am knowing → ✅ I know.');


-- =========================================================
-- TYPING — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ reading now.', '{"type": "typing", "correct_answers": ["am"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ reading now.', '{"type": "typing", "correct_answers": ["am"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ cooking dinner.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ cooking dinner.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ playing outside.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ playing outside.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ waiting for the bus.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ waiting for the bus.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ talking on the phone.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ talking on the phone.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ listening to me.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ listening to me.', '{"type": "typing", "correct_answers": ["are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ raining today.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It ___ raining today.', '{"type": "typing", "correct_answers": ["is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ working today.', '{"type": "typing", "correct_answers": ["am not"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ working today.', '{"type": "typing", "correct_answers": ["am not"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ sleeping now.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ sleeping now.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ watching TV.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ watching TV.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ going by car.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ going by car.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ studying tonight.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ studying tonight.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ wearing a jacket.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ wearing a jacket.', '{"type": "typing", "correct_answers": ["aren''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ snowing this morning.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It ___ snowing this morning.', '{"type": "typing", "correct_answers": ["isn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you studying right now?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you studying right now?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ she coming with us?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ she coming with us?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they waiting outside?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ they waiting outside?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he using your laptop?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ he using your laptop?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ I speaking too fast?', '{"type": "typing", "correct_answers": ["Am"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ I speaking too fast?', '{"type": "typing", "correct_answers": ["Am"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ we meeting at six?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ we meeting at six?', '{"type": "typing", "correct_answers": ["Are"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ the baby sleeping?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ the baby sleeping?', '{"type": "typing", "correct_answers": ["Is"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ the answer. (know)', '{"type": "typing", "correct_answers": ["know"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ the answer. (know)', '{"type": "typing", "correct_answers": ["know"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ chocolate. (love)', '{"type": "typing", "correct_answers": ["loves"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ chocolate. (love)', '{"type": "typing", "correct_answers": ["loves"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ more time. (need)', '{"type": "typing", "correct_answers": ["need"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ more time. (need)', '{"type": "typing", "correct_answers": ["need"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ a new phone. (want)', '{"type": "typing", "correct_answers": ["wants"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ a new phone. (want)', '{"type": "typing", "correct_answers": ["wants"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ this song very much. (like)', '{"type": "typing", "correct_answers": ["like"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ this song very much. (like)', '{"type": "typing", "correct_answers": ["like"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My brother ___ Spanish. (understand)', '{"type": "typing", "correct_answers": ["understands"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My brother ___ Spanish. (understand)', '{"type": "typing", "correct_answers": ["understands"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ a break now. (need)', '{"type": "typing", "correct_answers": ["need"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ a break now. (need)', '{"type": "typing", "correct_answers": ["need"], "case_sensitive": false}'::jsonb);

        END;
        $seed$;
