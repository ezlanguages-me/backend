-- ============================================================
-- Seed: A0 English Path – STEP 65 – Grammar – Preguntas WH-? y HOW…?
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id    UUID;
    v_grammar_id UUID;
    v_rule1_id   UUID;
    v_rule2_id   UUID;
    v_rule3_id   UUID;
    v_rule4_id   UUID;
    v_ex_id      UUID;
BEGIN

    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    INSERT INTO grammar (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 65, 'en', 'grammar')
    RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES (
        v_grammar_id,
        'es',
        'Preguntas WH-? y HOW…?',
        '',
        to_jsonb($content$## Preguntas WH-? y HOW…?

Las **preguntas con palabras interrogativas** permiten solicitar información específica, a diferencia del simple "Yes/No".

---

##### 1. Las palabras interrogativas básicas

| Palabra | Significado | Pregunta por… | Ejemplo |
|---------|-------------|---------------|---------|
| **What** | Qué / Cuál | Cosas, ideas | *What is your name?* |
| **Where** | Dónde | Lugar | *Where do you live?* |
| **When** | Cuándo | Momento / Tiempo | *When does the class start?* |
| **Who** | Quién | Persona (sujeto) | *Who is your teacher?* |
| **Why** | Por qué | Motivo, razón | *Why are you late?* |
| **Which** | Cuál / Qué | Elección entre opciones | *Which color do you prefer?* |
| **Whose** | De quién | Posesión | *Whose bag is this?* |
| **How** | Cómo | Manera, modo | *How do you spell that?* |

---

##### 2. HOW + adjetivo / adverbio

| Expresión | Significado | Ejemplo |
|-----------|-------------|---------|
| **How much** | Cuánto (incontable) | *How much water do you need?* |
| **How many** | Cuántos/as (contable) | *How many brothers do you have?* |
| **How old** | Qué edad | *How old are you?* |
| **How far** | A qué distancia | *How far is the station?* |
| **How long** | Cuánto tiempo | *How long does it take?* |
| **How often** | Con qué frecuencia | *How often do you exercise?* |

---

##### 3. Estructura de la pregunta WH

**WH + auxiliar + sujeto + verbo principal + ?**

El auxiliar depende del tiempo verbal:
*   Presente Simple → **Do / Does:** *Where **do** you **live**?*
*   Verbo To Be → **Am / Is / Are:** *What **is** your name?*
*   Pasado Simple → **Did:** *When **did** you **arrive**?*

---

##### 4. Regla especial: cuando WH es el sujeto

Cuando la palabra interrogativa **es el sujeto** de la oración, no se usa auxiliar:

*   *Who **lives** here?* (Who = sujeto → no "does who live")
*   *What **happened** last night?* (What = sujeto)

---

##### 5. Respuestas habituales

*   What? → *It's a pen. / My name is Ana.*
*   Where? → *In Madrid. / At school.*
*   When? → *At 8 o'clock. / On Monday.*
*   Who? → *My sister. / The teacher.*
*   Why? → *Because I was tired.*
*   How? → *By bus. / Very well.*$content$::text)
    );

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES (
        v_grammar_id,
        'de',
        'W-Fragen und HOW…?',
        '',
        to_jsonb($content_de$## W-Fragen und HOW…?

**W-Fragen** ermöglichen es, spezifische Informationen zu erfragen – im Gegensatz zu einfachen Ja/Nein-Fragen.

---

##### 1. Die grundlegenden Fragewörter

| Wort | Bedeutung | Fragt nach… | Beispiel |
|------|-----------|-------------|---------|
| **What** | Was / Welcher | Dinge, Ideen | *What is your name?* |
| **Where** | Wo / Wohin | Ort | *Where do you live?* |
| **When** | Wann | Zeitpunkt | *When does the class start?* |
| **Who** | Wer | Person (Subjekt) | *Who is your teacher?* |
| **Why** | Warum | Grund | *Why are you late?* |
| **Which** | Welcher/e/s | Auswahl | *Which color do you prefer?* |
| **Whose** | Wessen | Besitz | *Whose bag is this?* |
| **How** | Wie | Art und Weise | *How do you spell that?* |

---

##### 2. HOW + Adjektiv / Adverb

| Ausdruck | Bedeutung | Beispiel |
|---------|-----------|---------|
| **How much** | Wie viel (unzählbar) | *How much water do you need?* |
| **How many** | Wie viele (zählbar) | *How many brothers do you have?* |
| **How old** | Wie alt | *How old are you?* |
| **How long** | Wie lange | *How long does it take?* |
| **How often** | Wie oft | *How often do you exercise?* |

---

##### 3. Satzstruktur

**W-Wort + Hilfsverb + Subjekt + Hauptverb + ?**

*   *Where **do** you **live**?*
*   *What **is** your name?*
*   *When **did** you **arrive**?*

---

##### 4. Sonderregel: W-Wort als Subjekt

Wenn das Fragewort **das Subjekt** ist, wird kein Hilfsverb verwendet:

*   *Who **lives** here?*
*   *What **happened** last night?*$content_de$::text)
    );

    -- =========================================================
    -- REGLAS GRAMATICALES
    -- =========================================================

    -- Regla 1: Palabras interrogativas básicas
    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule1_id, 'es', 'Palabras interrogativas básicas', 'What=qué/cuál, Where=dónde, When=cuándo, Who=quién, Why=por qué, Which=cuál/qué (opciones), Whose=de quién. Elige bien según lo que preguntas.');
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule1_id, 'de', 'Grundlegende Fragewörter', 'What=was, Where=wo, When=wann, Who=wer, Why=warum, Which=welcher, Whose=wessen. Wähle je nach dem, was du fragst.');

    -- Regla 2: HOW + adjetivo
    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule2_id, 'es', 'HOW + adjetivo / adverbio', 'How much=cuánto (incontable), How many=cuántos (contable), How old=qué edad, How far=a qué distancia, How long=cuánto tiempo, How often=con qué frecuencia, How tall=qué altura.');
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule2_id, 'de', 'HOW + Adjektiv / Adverb', 'How much=wie viel (unzählbar), How many=wie viele (zählbar), How old=wie alt, How far=wie weit, How long=wie lange, How often=wie oft, How tall=wie groß.');

    -- Regla 3: Estructura WH + Do/Does
    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule3_id, 'es', 'Estructura: WH + Do / Does', 'La estructura es: WH + Do/Does + sujeto + verbo base. Usa "Do" con I/You/We/They y "Does" con He/She/It. El verbo principal NO lleva -s: ❌ Where does she lives? → ✅ Where does she live?');
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule3_id, 'de', 'Struktur: WH + Do / Does', 'Die Struktur ist: WH + Do/Does + Subjekt + Grundform. Verwende "Do" mit I/You/We/They und "Does" mit He/She/It. Das Hauptverb bekommt kein -s: ❌ Where does she lives? → ✅ Where does she live?');

    -- Regla 4: WHO/WHAT como sujeto
    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule4_id, 'es', 'WHO / WHAT como sujeto', 'Cuando Who o What son el sujeto, NO se usa auxiliar Do/Does. El verbo va en 3ª persona del singular: ❌ Who does live here? → ✅ Who lives here?');
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule4_id, 'de', 'WHO / WHAT als Subjekt', 'Wenn Who oder What das Subjekt sind, wird kein Hilfsverb Do/Does verwendet. Das Verb steht in der 3. Person Singular: ❌ Who does live here? → ✅ Who lives here?');

    -- =========================================================
    -- TIPO 1: TYPING — 7 ejercicios por regla
    -- =========================================================

    -- R1: Palabras interrogativas básicas
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is your name?', '{"type":"typing","correct_answers":["What"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ is your name?', '{"type":"typing","correct_answers":["What"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ do you live?', '{"type":"typing","correct_answers":["Where"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ do you live?', '{"type":"typing","correct_answers":["Where"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ does the class start?', '{"type":"typing","correct_answers":["When"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ does the class start?', '{"type":"typing","correct_answers":["When"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is your teacher?', '{"type":"typing","correct_answers":["Who"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ is your teacher?', '{"type":"typing","correct_answers":["Who"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ are you late?', '{"type":"typing","correct_answers":["Why"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ are you late?', '{"type":"typing","correct_answers":["Why"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ color do you prefer, red or blue?', '{"type":"typing","correct_answers":["Which"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ color do you prefer, red or blue?', '{"type":"typing","correct_answers":["Which"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ bag is this?', '{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ bag is this?', '{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}'::jsonb);

    -- R2: HOW + adjetivo
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ does it cost?', '{"type":"typing","correct_answers":["much"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ does it cost?', '{"type":"typing","correct_answers":["much"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ brothers do you have?', '{"type":"typing","correct_answers":["many"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ brothers do you have?', '{"type":"typing","correct_answers":["many"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ are you? – I''m 25.', '{"type":"typing","correct_answers":["old"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ are you? – I''m 25.', '{"type":"typing","correct_answers":["old"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ is the station? – 2 km.', '{"type":"typing","correct_answers":["far"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ is the station? – 2 km.', '{"type":"typing","correct_answers":["far"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ does the film last?', '{"type":"typing","correct_answers":["long"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ does the film last?', '{"type":"typing","correct_answers":["long"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ do you go to the gym?', '{"type":"typing","correct_answers":["often"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ do you go to the gym?', '{"type":"typing","correct_answers":["often"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ is your brother? – 1.80 m.', '{"type":"typing","correct_answers":["tall"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ is your brother? – 1.80 m.', '{"type":"typing","correct_answers":["tall"],"case_sensitive":false}'::jsonb);

    -- R3: Estructura WH + Do/Does
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ you live?', '{"type":"typing","correct_answers":["do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Where ___ you live?', '{"type":"typing","correct_answers":["do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ she eat for breakfast?', '{"type":"typing","correct_answers":["does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ she eat for breakfast?', '{"type":"typing","correct_answers":["does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'When ___ they arrive?', '{"type":"typing","correct_answers":["do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'When ___ they arrive?', '{"type":"typing","correct_answers":["do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Why ___ he look sad?', '{"type":"typing","correct_answers":["does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Why ___ he look sad?', '{"type":"typing","correct_answers":["does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ your parents work?', '{"type":"typing","correct_answers":["do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Where ___ your parents work?', '{"type":"typing","correct_answers":["do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ it mean?', '{"type":"typing","correct_answers":["does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ it mean?', '{"type":"typing","correct_answers":["does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Why ___ you always arrive late?', '{"type":"typing","correct_answers":["do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Why ___ you always arrive late?', '{"type":"typing","correct_answers":["do"],"case_sensitive":false}'::jsonb);

    -- R4: WHO/WHAT como sujeto
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ (live) here?', '{"type":"typing","correct_answers":["lives"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ (live) here?', '{"type":"typing","correct_answers":["lives"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ (happen) next?', '{"type":"typing","correct_answers":["happens"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ (happen) next?', '{"type":"typing","correct_answers":["happens"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ (teach) you English?', '{"type":"typing","correct_answers":["teaches"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ (teach) you English?', '{"type":"typing","correct_answers":["teaches"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ (know) the answer?', '{"type":"typing","correct_answers":["knows"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ (know) the answer?', '{"type":"typing","correct_answers":["knows"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ (cause) this problem?', '{"type":"typing","correct_answers":["causes"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ (cause) this problem?', '{"type":"typing","correct_answers":["causes"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ (want) more coffee?', '{"type":"typing","correct_answers":["wants"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ (want) more coffee?', '{"type":"typing","correct_answers":["wants"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ (make) you happy?', '{"type":"typing","correct_answers":["makes"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ (make) you happy?', '{"type":"typing","correct_answers":["makes"],"case_sensitive":false}'::jsonb);

    -- =========================================================
    -- TIPO 2: MULTIPLE CHOICE — 7 ejercicios por regla
    -- =========================================================

    -- R1: Palabras interrogativas básicas
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is the capital of Spain?', '{"type":"multiple_choice","options":["What","Where","When"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ is the capital of Spain?', '{"type":"multiple_choice","options":["What","Where","When"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ do you live?', '{"type":"multiple_choice","options":["Where","What","When"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ do you live?', '{"type":"multiple_choice","options":["Where","What","When"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ does the film start?', '{"type":"multiple_choice","options":["When","Where","Who"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ does the film start?', '{"type":"multiple_choice","options":["When","Where","Who"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is your teacher?', '{"type":"multiple_choice","options":["Who","What","Which"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ is your teacher?', '{"type":"multiple_choice","options":["Who","What","Which"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ are you angry?', '{"type":"multiple_choice","options":["Why","When","Where"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ are you angry?', '{"type":"multiple_choice","options":["Why","When","Where"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ dress do you prefer, the red or the blue?', '{"type":"multiple_choice","options":["Which","What","Whose"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ dress do you prefer, the red or the blue?', '{"type":"multiple_choice","options":["Which","What","Whose"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ umbrella is this? It''s mine.', '{"type":"multiple_choice","options":["Whose","Which","Who"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ umbrella is this? It''s mine.', '{"type":"multiple_choice","options":["Whose","Which","Who"],"answer":0}'::jsonb);

    -- R2: HOW + adjetivo
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is the station? – It''s 2 km away.', '{"type":"multiple_choice","options":["How far","How much","How long"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ is the station? – It''s 2 km away.', '{"type":"multiple_choice","options":["How far","How much","How long"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is the ticket? – It''s 10 euros.', '{"type":"multiple_choice","options":["How much","How many","How often"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ is the ticket? – It''s 10 euros.', '{"type":"multiple_choice","options":["How much","How many","How often"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ are you? – I''m 25.', '{"type":"multiple_choice","options":["How old","How tall","How long"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ are you? – I''m 25.', '{"type":"multiple_choice","options":["How old","How tall","How long"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ do you exercise? – Twice a week.', '{"type":"multiple_choice","options":["How often","How long","How far"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ do you exercise? – Twice a week.', '{"type":"multiple_choice","options":["How often","How long","How far"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ does the trip take? – About 3 hours.', '{"type":"multiple_choice","options":["How long","How much","How often"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ does the trip take? – About 3 hours.', '{"type":"multiple_choice","options":["How long","How much","How often"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ people are in the class?', '{"type":"multiple_choice","options":["How many","How much","How often"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ people are in the class?', '{"type":"multiple_choice","options":["How many","How much","How often"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is he? – He''s 1.80 m.', '{"type":"multiple_choice","options":["How tall","How old","How long"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ is he? – He''s 1.80 m.', '{"type":"multiple_choice","options":["How tall","How old","How long"],"answer":0}'::jsonb);

    -- R3: Estructura WH + Do/Does
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ she work?', '{"type":"multiple_choice","options":["does","do","is"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Where ___ she work?', '{"type":"multiple_choice","options":["does","do","is"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ you usually have for dinner?', '{"type":"multiple_choice","options":["do","does","are"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ you usually have for dinner?', '{"type":"multiple_choice","options":["do","does","are"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'When ___ the film start?', '{"type":"multiple_choice","options":["does","do","is"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'When ___ the film start?', '{"type":"multiple_choice","options":["does","do","is"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Why ___ they want to leave?', '{"type":"multiple_choice","options":["do","does","are"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Why ___ they want to leave?', '{"type":"multiple_choice","options":["do","does","are"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What time ___ he wake up?', '{"type":"multiple_choice","options":["does","do","is"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What time ___ he wake up?', '{"type":"multiple_choice","options":["does","do","is"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ it hurt?', '{"type":"multiple_choice","options":["does","do","is"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Where ___ it hurt?', '{"type":"multiple_choice","options":["does","do","is"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Why ___ you need a new phone?', '{"type":"multiple_choice","options":["do","does","are"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Why ___ you need a new phone?', '{"type":"multiple_choice","options":["do","does","are"],"answer":0}'::jsonb);

    -- R4: WHO/WHAT como sujeto
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ here?', '{"type":"multiple_choice","options":["lives","does live","do live"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ here?', '{"type":"multiple_choice","options":["lives","does live","do live"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ in the box?', '{"type":"multiple_choice","options":["is","does it","do it"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ in the box?', '{"type":"multiple_choice","options":["is","does it","do it"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ your English teacher?', '{"type":"multiple_choice","options":["is","does be","do be"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ your English teacher?', '{"type":"multiple_choice","options":["is","does be","do be"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ at 9 o''clock? (starts)', '{"type":"multiple_choice","options":["starts","does start","do start"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ at 9 o''clock? (starts)', '{"type":"multiple_choice","options":["starts","does start","do start"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ the tickets? (has)', '{"type":"multiple_choice","options":["has","does have","do have"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ the tickets? (has)', '{"type":"multiple_choice","options":["has","does have","do have"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ the noise? (causes)', '{"type":"multiple_choice","options":["causes","does cause","do cause"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ the noise? (causes)', '{"type":"multiple_choice","options":["causes","does cause","do cause"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who ___ your best friend?', '{"type":"multiple_choice","options":["is","does be","do be"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who ___ your best friend?', '{"type":"multiple_choice","options":["is","does be","do be"],"answer":0}'::jsonb);

    -- =========================================================
    -- TIPO 3: TRUE / FALSE — 7 ejercicios por regla
    -- =========================================================

    -- R1: Palabras interrogativas básicas
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Where is your name?» es la pregunta correcta para saber cómo se llama alguien.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Where is your name?» ist die richtige Frage, um den Namen einer Person zu erfahren.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Who is your teacher?» pregunta por una persona.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Who is your teacher?» fragt nach einer Person.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«When» se usa para preguntar por lugares.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«When» wird verwendet, um nach Orten zu fragen.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Which» se usa para elegir entre varias opciones.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Which» wird verwendet, um zwischen mehreren Optionen zu wählen.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Whose» pregunta sobre posesión (de quién es algo).', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Whose» fragt nach Besitz (wem gehört etwas).', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Why do you study English?» es una pregunta correcta.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Why do you study English?» ist eine korrekte Frage.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«What» y «Where» significan lo mismo en inglés.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«What» und «Where» bedeuten dasselbe auf Englisch.', '{"type":"true_false","answer":false}'::jsonb);

    -- R2: HOW + adjetivo
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«How much» se usa con sustantivos contables.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«How much» wird mit zählbaren Nomen verwendet.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«How many» se usa con sustantivos contables en plural.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«How many» wird mit zählbaren Nomen im Plural verwendet.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«How old are you?» pregunta por la edad.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«How old are you?» fragt nach dem Alter.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«How far» pregunta por la duración de tiempo.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«How far» fragt nach der Zeitdauer.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«How often do you exercise?» es una pregunta correcta sobre frecuencia.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«How often do you exercise?» ist eine korrekte Frage über Häufigkeit.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«How long» puede preguntar por duración de tiempo o longitud física.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«How long» kann nach Zeitdauer oder physischer Länge fragen.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«How much money do you have?» es correcto.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«How much money do you have?» ist korrekt.', '{"type":"true_false","answer":true}'::jsonb);

    -- R3: Estructura WH + Do/Does
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La pregunta «Where does she live?» es correcta.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Frage «Where does she live?» ist korrekt.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«What do he eat?» es una pregunta bien formada.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«What do he eat?» ist eine korrekt gebildete Frage.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Con I/You/We/They se usa «do» en las preguntas WH.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Mit I/You/We/They verwendet man «do» in W-Fragen.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«When does the class starts?» es correcto.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«When does the class starts?» ist korrekt.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Con He/She/It se usa «does» en las preguntas WH.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Mit He/She/It verwendet man «does» in W-Fragen.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Why do they want to leave?» está bien formada.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Why do they want to leave?» ist korrekt gebildet.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En preguntas con «Does» el verbo principal lleva -s.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'In Fragen mit «Does» bekommt das Hauptverb ein -s.', '{"type":"true_false","answer":false}'::jsonb);

    -- R4: WHO/WHAT como sujeto
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Who does live here?» es la forma correcta cuando «Who» es sujeto.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Who does live here?» ist die korrekte Form, wenn «Who» das Subjekt ist.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Cuando «Who» es el sujeto no se usa auxiliar (do/does).', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wenn «Who» das Subjekt ist, wird kein Hilfsverb (do/does) verwendet.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«What happens next?» es correcto.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«What happens next?» ist korrekt.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Who do teaches English?» es gramaticalmente correcto.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Who do teaches English?» ist grammatikalisch korrekt.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En «Who is your teacher?» «Who» es el sujeto de la oración.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'In «Who is your teacher?» ist «Who» das Subjekt des Satzes.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«What causes this problem?» sigue la misma estructura que «He causes this problem.»', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«What causes this problem?» folgt derselben Struktur wie «He causes this problem.»', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Who lives here?» y «Where does she live?» tienen la misma estructura.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Who lives here?» und «Where does she live?» haben dieselbe Struktur.', '{"type":"true_false","answer":false}'::jsonb);

    -- =========================================================
    -- TIPO 4: SCRAMBLE — 7 ejercicios por regla
    -- =========================================================

    -- R1: Palabras interrogativas básicas
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: What is your name?', '{"type":"scramble","chunks":["your name?","What","is"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: What is your name?', '{"type":"scramble","chunks":["your name?","What","is"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Where do you live?', '{"type":"scramble","chunks":["you live?","Where","do"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Where do you live?', '{"type":"scramble","chunks":["you live?","Where","do"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: When does the class start?', '{"type":"scramble","chunks":["the class start?","When","does"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: When does the class start?', '{"type":"scramble","chunks":["the class start?","When","does"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Who is your teacher?', '{"type":"scramble","chunks":["your teacher?","Who","is"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Who is your teacher?', '{"type":"scramble","chunks":["your teacher?","Who","is"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Why are you late?', '{"type":"scramble","chunks":["you late?","Why","are"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Why are you late?', '{"type":"scramble","chunks":["you late?","Why","are"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Which color do you prefer?', '{"type":"scramble","chunks":["prefer?","Which color","do you"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Which color do you prefer?', '{"type":"scramble","chunks":["prefer?","Which color","do you"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Whose bag is this?', '{"type":"scramble","chunks":["is this?","bag","Whose"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Whose bag is this?', '{"type":"scramble","chunks":["is this?","bag","Whose"],"correct_order":[2,1,0]}'::jsonb);

    -- R2: HOW + adjetivo
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: How much does it cost?', '{"type":"scramble","chunks":["cost?","How much","does it"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: How much does it cost?', '{"type":"scramble","chunks":["cost?","How much","does it"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: How many brothers do you have?', '{"type":"scramble","chunks":["have?","How many brothers","do you"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: How many brothers do you have?', '{"type":"scramble","chunks":["have?","How many brothers","do you"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: How old are you?', '{"type":"scramble","chunks":["you?","How old","are"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: How old are you?', '{"type":"scramble","chunks":["you?","How old","are"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: How far is the station?', '{"type":"scramble","chunks":["the station?","How far","is"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: How far is the station?', '{"type":"scramble","chunks":["the station?","How far","is"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: How long does it take?', '{"type":"scramble","chunks":["take?","How long","does it"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: How long does it take?', '{"type":"scramble","chunks":["take?","How long","does it"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: How often do you go?', '{"type":"scramble","chunks":["you go?","How often","do"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: How often do you go?', '{"type":"scramble","chunks":["you go?","How often","do"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: How tall is your brother?', '{"type":"scramble","chunks":["is","How tall","your brother?"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: How tall is your brother?', '{"type":"scramble","chunks":["is","How tall","your brother?"],"correct_order":[1,0,2]}'::jsonb);

    -- R3: Estructura WH + Do/Does
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Where do you live?', '{"type":"scramble","chunks":["live?","Where","do you"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Where do you live?', '{"type":"scramble","chunks":["live?","Where","do you"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: What does she eat?', '{"type":"scramble","chunks":["does she","What","eat?"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: What does she eat?', '{"type":"scramble","chunks":["does she","What","eat?"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: When do they arrive?', '{"type":"scramble","chunks":["they arrive?","When","do"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: When do they arrive?', '{"type":"scramble","chunks":["they arrive?","When","do"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Why does he look sad?', '{"type":"scramble","chunks":["look sad?","Why","does he"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Why does he look sad?', '{"type":"scramble","chunks":["look sad?","Why","does he"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: What do you want?', '{"type":"scramble","chunks":["you want?","What","do"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: What do you want?', '{"type":"scramble","chunks":["you want?","What","do"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Where does it hurt?', '{"type":"scramble","chunks":["hurt?","Where","does it"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Where does it hurt?', '{"type":"scramble","chunks":["hurt?","Where","does it"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Why do you study English?', '{"type":"scramble","chunks":["do you","Why","study English?"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Why do you study English?', '{"type":"scramble","chunks":["do you","Why","study English?"],"correct_order":[1,0,2]}'::jsonb);

    -- R4: WHO/WHAT como sujeto
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Who lives here?', '{"type":"scramble","chunks":["lives","Who","here?"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Who lives here?', '{"type":"scramble","chunks":["lives","Who","here?"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: What happens next?', '{"type":"scramble","chunks":["next?","What","happens"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: What happens next?', '{"type":"scramble","chunks":["next?","What","happens"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Who teaches English?', '{"type":"scramble","chunks":["teaches","Who","English?"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Who teaches English?', '{"type":"scramble","chunks":["teaches","Who","English?"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Who knows the answer?', '{"type":"scramble","chunks":["the answer?","knows","Who"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Who knows the answer?', '{"type":"scramble","chunks":["the answer?","knows","Who"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: What causes this problem?', '{"type":"scramble","chunks":["this problem?","What","causes"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: What causes this problem?', '{"type":"scramble","chunks":["this problem?","What","causes"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Who wants more coffee?', '{"type":"scramble","chunks":["more coffee?","wants","Who"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Who wants more coffee?', '{"type":"scramble","chunks":["more coffee?","wants","Who"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: What makes you happy?', '{"type":"scramble","chunks":["makes","What","you happy?"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: What makes you happy?', '{"type":"scramble","chunks":["makes","What","you happy?"],"correct_order":[1,0,2]}'::jsonb);

END;
$seed$;
