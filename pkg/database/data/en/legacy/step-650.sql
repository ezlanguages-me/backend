-- ============================================================
-- Seed: A0 English Path – STEP 650 – Grammar – Preguntas WH- y HOW
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

    DELETE FROM grammar WHERE step_order = 650 AND path_uuid = v_path_id;

    INSERT INTO grammar (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 650, 'en', 'grammar')
    RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, content)
    VALUES (
        v_grammar_id,
        'es',
        'Preguntas WH- y HOW',
        to_jsonb($content_650_es$## Preguntas WH- y HOW

Las preguntas con **WH-** sirven para pedir información concreta: persona, lugar, tiempo, razón o cosa. En inglés básico, muchas de estas preguntas usan la estructura **WH + do/does + sujeto + verbo base**. **How** también forma preguntas muy frecuentes como **How old** o **How many**.

---

##### 1. What, Where, When, Why

Con **what, where, when, why** normalmente usamos **do/does**.

* **Where do** you live?
* **What does** she eat for breakfast?
* **When does** the class start?
* **Why do** they study English?

Con **does**, el verbo principal va en forma base: **Where does he work?**

---

##### 2. Preguntas con WHO

**Who** puede ser el sujeto o el objeto.

* **Who lives** here? → *who* es el sujeto.
* **Who do** you call? → *who* es el objeto.

Si **who** es sujeto, normalmente **no** usamos **do/does**. Si **who** es objeto, sí usamos el auxiliar.

---

##### 3. Preguntas con HOW

**How** se combina con adjetivos o cuantificadores.

* **How old** are you?
* **How much** water do you drink?
* **How many** books do you have?
* **How far** is the station?

Estas combinaciones son muy comunes y conviene memorizarlas como bloques.

---

##### 4. Cómo responder

Las preguntas **WH-** necesitan **información real**, no solo yes o no.

* Where do you live? → **I live in Bilbao.**
* When do you study? → **I study at night.**

Las preguntas **yes/no** se responden con **Yes/No + auxiliar**.

* Do you work here? → **Yes, I do.**
* Does she drive? → **No, she doesn't.**

---

##### 5. Consejo útil

Piensa primero qué información quieres pedir: lugar, tiempo, persona, cantidad o razón. Después elige la palabra correcta: **where, when, who, how many**, etc. Si ya sabes qué tipo de respuesta esperas, es mucho más fácil construir la pregunta completa sin cambiar el orden.

---

##### 6. Error frecuente

* ❌ Where she works?  
  ✅ **Where does** she **work**?

* ❌ Who do lives here?  
  ✅ **Who lives** here?

* ❌ Where do you live? — Yes, I do.  
  ✅ Where do you live? — **I live in Madrid.**$content_650_es$::text)
    );

    INSERT INTO grammar_translation (grammar_uuid, language, title, content)
    VALUES (
        v_grammar_id,
        'de',
        'WH-Fragen und HOW',
        to_jsonb($content_650_de$## WH-Fragen und HOW

**WH-Fragen** benutzt man, um konkrete Informationen zu bekommen: Person, Ort, Zeit, Grund oder Sache. Im einfachen Englisch haben viele dieser Fragen die Struktur **WH + do/does + Subjekt + Grundform**. Auch **How** bildet sehr häufige Fragen wie **How old** oder **How many**.

---

##### 1. What, Where, When, Why

Mit **what, where, when, why** benutzt man normalerweise **do/does**.

* **Where do** you live?
* **What does** she eat for breakfast?
* **When does** the class start?
* **Why do** they study English?

Nach **does** steht das Hauptverb in der Grundform: **Where does he work?**

---

##### 2. Fragen mit WHO

**Who** kann Subjekt oder Objekt sein.

* **Who lives** here? → *who* ist das Subjekt.
* **Who do** you call? → *who* ist das Objekt.

Wenn **who** das Subjekt ist, benutzt man normalerweise **kein do/does**. Wenn **who** das Objekt ist, braucht man das Hilfsverb.

---

##### 3. Fragen mit HOW

**How** kombiniert man oft mit Adjektiven oder Mengenwörtern.

* **How old** are you?
* **How much** water do you drink?
* **How many** books do you have?
* **How far** is the station?

Diese Kombinationen kommen sehr oft vor und sollten als feste Blöcke gelernt werden.

---

##### 4. Antworten auf Fragen

**WH-Fragen** brauchen **echte Information**, nicht nur yes oder no.

* Where do you live? → **I live in Bilbao.**
* When do you study? → **I study at night.**

**Ja/Nein-Fragen** beantwortet man mit **Yes/No + Hilfsverb**.

* Do you work here? → **Yes, I do.**
* Does she drive? → **No, she doesn't.**

---

##### 5. Praktischer Tipp

Überlege zuerst, welche Information du brauchst: Ort, Zeit, Person, Menge oder Grund. Danach wählst du das passende Fragewort: **where, when, who, how many** usw. Wenn du schon weißt, welche Art Antwort du erwartest, kannst du die ganze Frage leichter und sicherer bauen.

---

##### 6. Häufiger Fehler

* ❌ Where she works?  
  ✅ **Where does** she **work**?

* ❌ Who do lives here?  
  ✅ **Who lives** here?

* ❌ Where do you live? — Yes, I do.  
  ✅ Where do you live? — **I live in Madrid.**$content_650_de$::text)
    );


-- Rule 1
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'es', 'WHAT / WHERE / WHEN / WHY + DO / DOES', 'Después de what/where/when/why usa do o does según el sujeto, y luego el verbo base: ❌ Where she works? → ✅ Where does she work?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'de', 'WHAT / WHERE / WHEN / WHY + DO / DOES', 'Nach what/where/when/why benutzt du do oder does und dann die Grundform: ❌ Where she works? → ✅ Where does she work?');


-- Rule 2
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'es', 'WHO como sujeto y como objeto', 'Si who es sujeto, normalmente no lleva do/does; si es objeto, sí: ❌ Who do lives here? → ✅ Who lives here? / ✅ Who do you visit?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'de', 'WHO als Subjekt und Objekt', 'Wenn who das Subjekt ist, steht meist kein do/does; als Objekt braucht es das Hilfsverb: ❌ Who do lives here? → ✅ Who lives here? / ✅ Who do you visit?');


-- Rule 3
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'es', 'HOW + adjetivo o cantidad', 'Usa how con la palabra correcta según la información: ❌ How many water? → ✅ How much water? / ❌ How old books? → ✅ How many books?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'de', 'HOW + Adjektiv oder Menge', 'Benutze nach how das passende Wort: ❌ How many water? → ✅ How much water? / ❌ How old books? → ✅ How many books?');


-- Rule 4
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'es', 'Respuestas a preguntas WH y yes/no', 'Las preguntas WH piden información y las yes/no se responden con yes/no + auxiliar: ❌ Where do you live? → Yes, I do. → ✅ I live in Lima.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'de', 'Antworten auf WH- und Ja/Nein-Fragen', 'WH-Fragen brauchen Information; Ja/Nein-Fragen antwortet man mit yes/no + Hilfsverb: ❌ Where do you live? → Yes, I do. → ✅ I live in Lima.');


-- =========================================================
-- TYPING — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ she work?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Where ___ she work?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ they eat for breakfast?', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ they eat for breakfast?', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'When ___ your class start?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'When ___ your class start?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Why ___ you study English?', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Why ___ you study English?', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ he live?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Where ___ he live?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ we need for the trip?', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ we need for the trip?', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'When ___ the shop close?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'When ___ the shop close?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ lives next door?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ lives next door?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ do you call after work?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ do you call after work?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ cooks dinner in your house?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ cooks dinner in your house?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ she invite to the party?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ she invite to the party?', '{"type": "typing", "correct_answers": ["does"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ teaches your class?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ teaches your class?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ they visit on Sundays?', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ they visit on Sundays?', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ needs help today?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ needs help today?', '{"type": "typing", "correct_answers": ["Who"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ are you?', '{"type": "typing", "correct_answers": ["old"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ are you?', '{"type": "typing", "correct_answers": ["old"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ milk do we need?', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ milk do we need?', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ books do you have?', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ books do you have?', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ is the station from here?', '{"type": "typing", "correct_answers": ["far"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ is the station from here?', '{"type": "typing", "correct_answers": ["far"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ is your brother?', '{"type": "typing", "correct_answers": ["old"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ is your brother?', '{"type": "typing", "correct_answers": ["old"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ money do you have?', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ money do you have?', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ students are in the class?', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ students are in the class?', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Do you like tea? — Yes, I ___.', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Do you like tea? — Yes, I ___.', '{"type": "typing", "correct_answers": ["do"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Does he work here? — No, he ___.', '{"type": "typing", "correct_answers": ["doesn''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Does he work here? — No, he ___.', '{"type": "typing", "correct_answers": ["doesn''t"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where do you live? — I live ___ Valencia.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Where do you live? — I live ___ Valencia.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'When do they study? — They study ___ the evening.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'When do they study? — They study ___ the evening.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Why do you exercise? — Because it ___ me energy.', '{"type": "typing", "correct_answers": ["gives"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Why do you exercise? — Because it ___ me energy.', '{"type": "typing", "correct_answers": ["gives"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What do you eat for breakfast? — I ___ eggs and fruit.', '{"type": "typing", "correct_answers": ["eat"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What do you eat for breakfast? — I ___ eggs and fruit.', '{"type": "typing", "correct_answers": ["eat"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Do they need a car? — No, they ___.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Do they need a car? — No, they ___.', '{"type": "typing", "correct_answers": ["don''t"], "case_sensitive": false}'::jsonb);

END;
$seed$;
