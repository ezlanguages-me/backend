-- ============================================================
-- Seed: A0 English Path – STEP 640 – Grammar – Presente Simple
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

    DELETE FROM grammar WHERE step_order = 640 AND path_uuid = v_path_id;

    INSERT INTO grammar (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 640, 'en', 'grammar')
    RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, content)
    VALUES (
        v_grammar_id,
        'es',
        'Presente Simple',
        to_jsonb($content_640_es$## Presente Simple

El **presente simple** se usa para hablar de hábitos, rutinas, hechos y horarios. En nivel A0 conviene recordar una idea central: con **I / you / we / they** usamos el **verbo base**, y con **he / she / it** normalmente añadimos **-s** o **-es**.

---

##### 1. Afirmativas

La estructura básica es **sujeto + verbo**. No usamos ningún auxiliar en frases afirmativas.

* I **work** in a café.
* They **play** after school.
* She **works** at home.
* He **goes** by bus.

---

##### 2. Negativas

Para negar usamos **don't** o **doesn't** + verbo base. Después de **doesn't**, el verbo vuelve a su forma base.

* I **don't like** tea.
* We **don't study** on Sunday.
* He **doesn't live** here.
* She **doesn't play** tennis.

> 💡 Recuerda: **doesn't works** es incorrecto. Debe ser **doesn't work**.

---

##### 3. Preguntas

Para preguntas usamos **Do** o **Does** al principio: **Do/Does + sujeto + verbo base?**

* **Do** you work here?
* **Do** they need help?
* **Does** she like music?
* **Does** he speak English?

Las respuestas cortas usan el mismo auxiliar: **Yes, I do. / No, she doesn't.**

---

##### 4. Ortografía en tercera persona

Algunos verbos cambian la escritura con **he / she / it**:

* **watch → watches**
* **go → goes**
* **study → studies**

Si el verbo termina en **-ch, -sh, -o, -x, -ss**, suele llevar **-es**. Si termina en consonante + **y**, la **y** cambia a **i**: **study → studies**.

---

##### 5. Cuándo usarlo

Usa este tiempo para cosas habituales, verdades generales y horarios.

Las palabras de tiempo como **every day, usually, always, on Mondays** aparecen mucho con este tiempo y ayudan a reconocerlo. Si hablas de una rutina normal, esta suele ser la opción correcta. También aparece mucho en horarios, instrucciones y hechos que no cambian normalmente.

* I **drink** coffee every morning.
* The shop **opens** at nine.
* Water **boils** at 100°C.

---

##### 6. Error frecuente

* ❌ She work every day.  
  ✅ She **works** every day.

* ❌ He doesn't goes to school.  
  ✅ He **doesn't go** to school.

* ❌ Does she likes coffee?  
  ✅ **Does** she **like** coffee?$content_640_es$::text)
    );

    INSERT INTO grammar_translation (grammar_uuid, language, title, content)
    VALUES (
        v_grammar_id,
        'de',
        'Simple Present',
        to_jsonb($content_640_de$## Simple Present

Das **Simple Present** benutzt man für Gewohnheiten, Routinen, Fakten und Fahrpläne. Auf A0-Niveau ist die wichtigste Idee: Mit **I / you / we / they** steht das **Verb in der Grundform**, mit **he / she / it** kommt meistens **-s** oder **-es** dazu.

---

##### 1. Aussagen

Die Grundstruktur ist **Subjekt + Verb**. In positiven Sätzen braucht man kein Hilfsverb.

* I **work** in a café.
* They **play** after school.
* She **works** at home.
* He **goes** by bus.

---

##### 2. Verneinung

Für die Verneinung benutzt man **don't** oder **doesn't** + Grundform. Nach **doesn't** hat das Verb **kein -s** mehr.

* I **don't like** tea.
* We **don't study** on Sunday.
* He **doesn't live** here.
* She **doesn't play** tennis.

> 💡 Wichtig: **doesn't works** ist falsch. Richtig ist **doesn't work**.

---

##### 3. Fragen

Für Fragen benutzt man **Do** oder **Does** am Satzanfang: **Do/Does + Subjekt + Grundform?**

* **Do** you work here?
* **Do** they need help?
* **Does** she like music?
* **Does** he speak English?

Kurze Antworten benutzen dasselbe Hilfsverb: **Yes, I do. / No, she doesn't.**

---

##### 4. Rechtschreibung in der 3. Person

Einige Verben ändern ihre Schreibweise mit **he / she / it**:

* **watch → watches**
* **go → goes**
* **study → studies**

Endet das Verb auf **-ch, -sh, -o, -x, -ss**, nimmt es oft **-es**. Bei Konsonant + **y** wird **y** zu **i**: **study → studies**.

---

##### 5. Wann benutzt man es?

Dieses Tempus benutzt man für Gewohnheiten, allgemeine Wahrheiten und feste Zeiten.

Zeitwörter wie **every day, usually, always, on Mondays** stehen oft mit diesem Tempus und helfen dir, es schnell zu erkennen. Wenn du über eine normale Routine sprichst, ist das meistens die richtige Wahl. Es steht auch oft bei Fahrplänen, Anweisungen und allgemeinen Tatsachen.

* I **drink** coffee every morning.
* The shop **opens** at nine.
* Water **boils** at 100°C.

---

##### 6. Häufiger Fehler

* ❌ She work every day.  
  ✅ She **works** every day.

* ❌ He doesn't goes to school.  
  ✅ He **doesn't go** to school.

* ❌ Does she likes coffee?  
  ✅ **Does** she **like** coffee?$content_640_de$::text)
    );


-- Rule 1
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'es', 'Afirmativas en presente simple', 'En afirmativa usa el verbo base con I/you/we/they y añade -s o -es con he/she/it: ❌ She work here → ✅ She works here.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'de', 'Aussagen im Simple Present', 'In Aussagesätzen steht bei I/you/we/they die Grundform und bei he/she/it meist -s oder -es: ❌ She work here → ✅ She works here.');


-- Rule 2
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'es', 'Negativas con DON''T / DOESN''T', 'Para negar usa don''t o doesn''t + verbo base: ❌ He doesn''t lives here → ✅ He doesn''t live here.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'de', 'Verneinung mit DON''T / DOESN''T', 'Für die Verneinung benutzt du don''t oder doesn''t + Grundform: ❌ He doesn''t lives here → ✅ He doesn''t live here.');


-- Rule 3
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'es', 'Preguntas con DO / DOES', 'En preguntas usa do o does antes del sujeto y luego el verbo base: ❌ She likes coffee? → ✅ Does she like coffee?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'de', 'Fragen mit DO / DOES', 'In Fragen steht do oder does vor dem Subjekt und danach die Grundform: ❌ She likes coffee? → ✅ Does she like coffee?');


-- Rule 4
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'es', 'Ortografía de tercera persona: -s / -es / -ies', 'Con he/she/it algunos verbos cambian de forma: ❌ He go to work → ✅ He goes to work; ❌ She study English → ✅ She studies English.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'de', 'Schreibung in der 3. Person: -s / -es / -ies', 'Mit he/she/it ändern einige Verben ihre Form: ❌ He go to work → ✅ He goes to work; ❌ She study English → ✅ She studies English.');


-- =========================================================
-- TYPING — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ coffee every morning.', '{"type": "typing", "correct_answers": ["drink"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ coffee every morning.', '{"type": "typing", "correct_answers": ["drink"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ in Madrid.', '{"type": "typing", "correct_answers": ["live"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ in Madrid.', '{"type": "typing", "correct_answers": ["live"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ English at school.', '{"type": "typing", "correct_answers": ["study"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ English at school.', '{"type": "typing", "correct_answers": ["study"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ in a bank.', '{"type": "typing", "correct_answers": ["works"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ in a bank.', '{"type": "typing", "correct_answers": ["works"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ tennis on Fridays.', '{"type": "typing", "correct_answers": ["plays"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ tennis on Fridays.', '{"type": "typing", "correct_answers": ["plays"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My brother ___ the bus to work.', '{"type": "typing", "correct_answers": ["takes"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My brother ___ the bus to work.', '{"type": "typing", "correct_answers": ["takes"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ very fast.', '{"type": "typing", "correct_answers": ["runs"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It ___ very fast.', '{"type": "typing", "correct_answers": ["runs"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ like coffee.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ like coffee.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ work on Sundays.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ work on Sundays.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ watch TV in class.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ watch TV in class.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ eat meat.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ eat meat.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ live near here.', '{"type": "typing", "correct_answers": ["doesn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ live near here.', '{"type": "typing", "correct_answers": ["doesn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ speak German.', '{"type": "typing", "correct_answers": ["doesn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ speak German.', '{"type": "typing", "correct_answers": ["doesn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My dog ___ sleep inside.', '{"type": "typing", "correct_answers": ["doesn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My dog ___ sleep inside.', '{"type": "typing", "correct_answers": ["doesn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you play football?', '{"type": "typing", "correct_answers": ["Do"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you play football?', '{"type": "typing", "correct_answers": ["Do"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they live in Seville?', '{"type": "typing", "correct_answers": ["Do"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ they live in Seville?', '{"type": "typing", "correct_answers": ["Do"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ we need more time?', '{"type": "typing", "correct_answers": ["Do"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ we need more time?', '{"type": "typing", "correct_answers": ["Do"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ I need a ticket?', '{"type": "typing", "correct_answers": ["Do"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ I need a ticket?', '{"type": "typing", "correct_answers": ["Do"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he work on Saturdays?', '{"type": "typing", "correct_answers": ["Does"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ he work on Saturdays?', '{"type": "typing", "correct_answers": ["Does"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ she like sushi?', '{"type": "typing", "correct_answers": ["Does"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ she like sushi?', '{"type": "typing", "correct_answers": ["Does"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ your sister study at home?', '{"type": "typing", "correct_answers": ["Does"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ your sister study at home?', '{"type": "typing", "correct_answers": ["Does"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ TV after dinner. (watch)', '{"type": "typing", "correct_answers": ["watches"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ TV after dinner. (watch)', '{"type": "typing", "correct_answers": ["watches"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My father ___ to work by bus. (go)', '{"type": "typing", "correct_answers": ["goes"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My father ___ to work by bus. (go)', '{"type": "typing", "correct_answers": ["goes"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ English every evening. (study)', '{"type": "typing", "correct_answers": ["studies"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ English every evening. (study)', '{"type": "typing", "correct_answers": ["studies"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The teacher ___ online classes. (teach)', '{"type": "typing", "correct_answers": ["teaches"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The teacher ___ online classes. (teach)', '{"type": "typing", "correct_answers": ["teaches"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Anna ___ her face before bed. (wash)', '{"type": "typing", "correct_answers": ["washes"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Anna ___ her face before bed. (wash)', '{"type": "typing", "correct_answers": ["washes"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The mechanic ___ cars on weekends. (fix)', '{"type": "typing", "correct_answers": ["fixes"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The mechanic ___ cars on weekends. (fix)', '{"type": "typing", "correct_answers": ["fixes"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The chef ___ lunch at noon. (finish)', '{"type": "typing", "correct_answers": ["finishes"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The chef ___ lunch at noon. (finish)', '{"type": "typing", "correct_answers": ["finishes"], "case_sensitive": false}'::jsonb);

END;
$seed$;
