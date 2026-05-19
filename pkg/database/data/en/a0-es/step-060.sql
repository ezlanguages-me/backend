-- ============================================================
-- Seed: A0 English Path – STEP 60 – Grammar – Presente Simple
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
    VALUES (v_path_id, 60, 'en', 'grammar')
    RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES (
        v_grammar_id,
        'es',
        'El Presente Simple',
        '',
        to_jsonb($content$## El Presente Simple

El Presente Simple es el tiempo verbal más usado en inglés. Expresa **hábitos, rutinas, verdades generales, estados permanentes y horarios fijos**.

---

##### 1. Forma Afirmativa

| Sujeto | Verbo |
|--------|-------|
| I / You / We / They | verbo base |
| He / She / It | verbo base + **-s** |

*   I **work** every day. *(Yo trabajo todos los días.)*
*   She **works** every day. *(Ella trabaja todos los días.)*

> ⚠️ **¡Importante!** Con He / She / It el verbo lleva siempre **-S** al final. Es el error más común de los hispanohablantes.

---

##### 2. Forma Negativa

Utiliza el auxiliar **do not (don't)** o **does not (doesn't)**:

| Sujeto | Auxiliar | Verbo |
|--------|----------|-------|
| I / You / We / They | **don't** | verbo base |
| He / She / It | **doesn't** | verbo base |

*   I **don't** like coffee. *(No me gusta el café.)*
*   He **doesn't** like coffee. *(A él no le gusta el café.)*

> ⚠️ Con **doesn't**, el verbo vuelve a su forma base sin -s.
> ❌ He doesn't **works** → ✅ He doesn't **work**

---

##### 3. Forma Interrogativa

Coloca **Do** o **Does** delante del sujeto:

| Auxiliar | Sujeto | Verbo |
|----------|--------|-------|
| **Do** | I / you / we / they | verbo base + ? |
| **Does** | he / she / it | verbo base + ? |

*   **Do** you **speak** English? *(¿Hablas inglés?)*
*   **Does** she **speak** English? *(¿Habla ella inglés?)*

---

##### 4. Usos Principales

*   **Hábitos y rutinas:** *I go to the gym every Monday.*
*   **Verdades generales y hechos científicos:** *Water boils at 100°C.*
*   **Preferencias y sentimientos:** *He loves pizza.*
*   **Horarios fijos:** *The train leaves at 8:00 AM.*

---

##### 5. Spelling: terminaciones especiales al añadir -s

| Terminación del verbo | Regla | Resultado |
|-----------------------|-------|-----------|
| -s, -sh, -ch, -x, -z | añade **-es** | wash → wash**es** |
| consonante + -y | cambia **y → ies** | study → stud**ies** |
| -o | añade **-es** | go → go**es**, do → do**es** |
| el resto | añade **-s** | play → play**s** |

> 💡 Irregulares: **have → has** / **be → is**$content$::text)
    );

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES (
        v_grammar_id,
        'de',
        'Das Simple Present',
        '',
        to_jsonb($content_de$## Das Simple Present

Das Simple Present ist die am häufigsten verwendete Zeitform im Englischen. Es drückt **Gewohnheiten, Routinen, allgemeine Wahrheiten und feste Pläne** aus.

---

##### 1. Bejahende Form

| Subjekt | Verb |
|---------|------|
| I / You / We / They | Grundform |
| He / She / It | Grundform + **-s** |

*   I **work** every day.
*   She **works** every day.

> ⚠️ Bei He / She / It bekommt das Verb immer ein **-s** am Ende.

---

##### 2. Verneinende Form

Verwende **do not (don't)** oder **does not (doesn't)**:

*   I **don't** like coffee.
*   He **doesn't** like coffee.

> ⚠️ Nach **doesn't** steht das Verb wieder in der Grundform (ohne -s).

---

##### 3. Frageform

Stelle **Do** oder **Does** vor das Subjekt:

*   **Do** you **speak** English?
*   **Does** she **speak** English?

---

##### 4. Hauptverwendungen

*   **Gewohnheiten:** *I go to the gym every Monday.*
*   **Allgemeine Wahrheiten:** *Water boils at 100°C.*
*   **Vorlieben:** *He loves pizza.*
*   **Fahrpläne:** *The train leaves at 8:00 AM.*$content_de$::text)
    );

    -- =========================================================
    -- REGLAS GRAMATICALES
    -- =========================================================

    -- Regla 1: He / She / It añade -S
    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule1_id, 'es', 'He / She / It añade -S', 'Recuerda: con He, She o It el verbo siempre lleva -S al final. ❌ He work → ✅ He works.');
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule1_id, 'de', 'He / She / It + -S', 'Denke daran: Bei He, She oder It bekommt das Verb immer ein -S am Ende. ❌ He work → ✅ He works.');

    -- Regla 2: Negación con don't / doesn't
    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule2_id, 'es', 'Negación: don''t / doesn''t', 'Usa "don''t" con I/You/We/They y "doesn''t" con He/She/It. Con "doesn''t" el verbo vuelve a su forma base: ❌ She doesn''t works → ✅ She doesn''t work.');
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule2_id, 'de', 'Verneinung: don''t / doesn''t', 'Verwende "don''t" mit I/You/We/They und "doesn''t" mit He/She/It. Nach "doesn''t" steht das Verb in der Grundform: ❌ She doesn''t works → ✅ She doesn''t work.');

    -- Regla 3: Interrogación con Do / Does
    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule3_id, 'es', 'Preguntas: Do / Does', 'Coloca "Do" delante de I/You/We/They y "Does" delante de He/She/It para formar preguntas. El verbo principal siempre va en forma base.');
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule3_id, 'de', 'Fragen: Do / Does', 'Stelle "Do" vor I/You/We/They und "Does" vor He/She/It um Fragen zu bilden. Das Hauptverb steht immer in der Grundform.');

    -- Regla 4: Spelling especial (-es, -ies)
    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule4_id, 'es', 'Spelling especial de la -S', 'Verbos en -s/-sh/-ch/-x/-z añaden -ES (watches). Consonante + -y cambia a -IES (studies). Verbos en -o añaden -ES (goes, does). El resto solo añade -S.');
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES (v_rule4_id, 'de', 'Besondere Schreibweisen mit -S', 'Verben auf -s/-sh/-ch/-x/-z bekommen -ES (watches). Konsonant + -y wird zu -IES (studies). Verben auf -o bekommen -ES (goes, does). Alle anderen bekommen nur -S.');

    -- =========================================================
    -- TIPO 1: TYPING — 7 ejercicios por regla
    -- =========================================================

    -- R1: He/She/It + -S
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ (work) every day.', '{"type":"typing","correct_answers":["works"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ (work) every day.', '{"type":"typing","correct_answers":["works"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ (play) football on Saturdays.', '{"type":"typing","correct_answers":["plays"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ (play) football on Saturdays.', '{"type":"typing","correct_answers":["plays"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My mother ___ (cook) dinner at 7.', '{"type":"typing","correct_answers":["cooks"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My mother ___ (cook) dinner at 7.', '{"type":"typing","correct_answers":["cooks"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The cat ___ (sleep) a lot.', '{"type":"typing","correct_answers":["sleeps"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The cat ___ (sleep) a lot.', '{"type":"typing","correct_answers":["sleeps"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ (go) to school by bus.', '{"type":"typing","correct_answers":["goes"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ (go) to school by bus.', '{"type":"typing","correct_answers":["goes"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ (study) English every evening.', '{"type":"typing","correct_answers":["studies"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ (study) English every evening.', '{"type":"typing","correct_answers":["studies"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ (rain) a lot in winter.', '{"type":"typing","correct_answers":["rains"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It ___ (rain) a lot in winter.', '{"type":"typing","correct_answers":["rains"],"case_sensitive":false}'::jsonb);

    -- R2: Negación don't / doesn't
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ like coffee.', '{"type":"typing","correct_answers":["don''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ like coffee.', '{"type":"typing","correct_answers":["don''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ eat meat.', '{"type":"typing","correct_answers":["doesn''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ eat meat.', '{"type":"typing","correct_answers":["doesn''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ live here.', '{"type":"typing","correct_answers":["don''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ live here.', '{"type":"typing","correct_answers":["don''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ understand the question.', '{"type":"typing","correct_answers":["doesn''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ understand the question.', '{"type":"typing","correct_answers":["doesn''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ have a car.', '{"type":"typing","correct_answers":["don''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ have a car.', '{"type":"typing","correct_answers":["don''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My cat ___ like dogs.', '{"type":"typing","correct_answers":["doesn''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My cat ___ like dogs.', '{"type":"typing","correct_answers":["doesn''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ snow here in summer.', '{"type":"typing","correct_answers":["doesn''t"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It ___ snow here in summer.', '{"type":"typing","correct_answers":["doesn''t"],"case_sensitive":false}'::jsonb);

    -- R3: Interrogación Do / Does
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you like pizza?', '{"type":"typing","correct_answers":["Do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you like pizza?', '{"type":"typing","correct_answers":["Do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ she speak French?', '{"type":"typing","correct_answers":["Does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ she speak French?', '{"type":"typing","correct_answers":["Does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they have a dog?', '{"type":"typing","correct_answers":["Do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ they have a dog?', '{"type":"typing","correct_answers":["Do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he work here?', '{"type":"typing","correct_answers":["Does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ he work here?', '{"type":"typing","correct_answers":["Does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ your parents live nearby?', '{"type":"typing","correct_answers":["Do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ your parents live nearby?', '{"type":"typing","correct_answers":["Do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ it hurt?', '{"type":"typing","correct_answers":["Does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ it hurt?', '{"type":"typing","correct_answers":["Does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ we need an umbrella?', '{"type":"typing","correct_answers":["Do"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ we need an umbrella?', '{"type":"typing","correct_answers":["Do"],"case_sensitive":false}'::jsonb);

    -- R4: Spelling especial
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'wash → she ___', '{"type":"typing","correct_answers":["washes"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'wash → she ___', '{"type":"typing","correct_answers":["washes"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'study → he ___', '{"type":"typing","correct_answers":["studies"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'study → he ___', '{"type":"typing","correct_answers":["studies"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'go → it ___', '{"type":"typing","correct_answers":["goes"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'go → it ___', '{"type":"typing","correct_answers":["goes"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'watch → she ___', '{"type":"typing","correct_answers":["watches"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'watch → she ___', '{"type":"typing","correct_answers":["watches"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'fly → it ___', '{"type":"typing","correct_answers":["flies"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'fly → it ___', '{"type":"typing","correct_answers":["flies"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'do → he ___', '{"type":"typing","correct_answers":["does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'do → he ___', '{"type":"typing","correct_answers":["does"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'teach → she ___', '{"type":"typing","correct_answers":["teaches"],"case_sensitive":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'teach → she ___', '{"type":"typing","correct_answers":["teaches"],"case_sensitive":false}'::jsonb);

    -- =========================================================
    -- TIPO 2: MULTIPLE CHOICE — 7 ejercicios por regla
    -- =========================================================

    -- R1: He/She/It + -S
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ English every day.', '{"type":"multiple_choice","options":["speaks","speak","is speak"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ English every day.', '{"type":"multiple_choice","options":["speaks","speak","is speak"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ a lot at work.', '{"type":"multiple_choice","options":["works","work","working"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ a lot at work.', '{"type":"multiple_choice","options":["works","work","working"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My sister ___ in London.', '{"type":"multiple_choice","options":["lives","live","is live"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My sister ___ in London.', '{"type":"multiple_choice","options":["lives","live","is live"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The train ___ at 8 AM.', '{"type":"multiple_choice","options":["leaves","leave","is leave"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The train ___ at 8 AM.', '{"type":"multiple_choice","options":["leaves","leave","is leave"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ coffee every morning.', '{"type":"multiple_choice","options":["drinks","drink","is drinking"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ coffee every morning.', '{"type":"multiple_choice","options":["drinks","drink","is drinking"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ to music when she studies.', '{"type":"multiple_choice","options":["listens","listen","listening"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ to music when she studies.', '{"type":"multiple_choice","options":["listens","listen","listening"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ a lot here in November.', '{"type":"multiple_choice","options":["rains","rain","is rain"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It ___ a lot here in November.', '{"type":"multiple_choice","options":["rains","rain","is rain"],"answer":0}'::jsonb);

    -- R2: Negación don't / doesn't
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ eat fish.', '{"type":"multiple_choice","options":["doesn''t","don''t","isn''t"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ eat fish.', '{"type":"multiple_choice","options":["doesn''t","don''t","isn''t"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ have a big house.', '{"type":"multiple_choice","options":["don''t","doesn''t","aren''t"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ have a big house.', '{"type":"multiple_choice","options":["don''t","doesn''t","aren''t"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ play tennis.', '{"type":"multiple_choice","options":["doesn''t","don''t","isn''t"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ play tennis.', '{"type":"multiple_choice","options":["doesn''t","don''t","isn''t"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ understand that word.', '{"type":"multiple_choice","options":["don''t","doesn''t","am not"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ understand that word.', '{"type":"multiple_choice","options":["don''t","doesn''t","am not"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My parents ___ speak English.', '{"type":"multiple_choice","options":["don''t","doesn''t","aren''t"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My parents ___ speak English.', '{"type":"multiple_choice","options":["don''t","doesn''t","aren''t"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ work. (corrige: She doesn''t works)', '{"type":"multiple_choice","options":["doesn''t work","doesn''t works","don''t work"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ work. (korrigiere: She doesn''t works)', '{"type":"multiple_choice","options":["doesn''t work","doesn''t works","don''t work"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ rain much in summer here.', '{"type":"multiple_choice","options":["doesn''t","don''t","isn''t"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It ___ rain much in summer here.', '{"type":"multiple_choice","options":["doesn''t","don''t","isn''t"],"answer":0}'::jsonb);

    -- R3: Preguntas Do / Does
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ she play the piano?', '{"type":"multiple_choice","options":["Does","Do","Is"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ she play the piano?', '{"type":"multiple_choice","options":["Does","Do","Is"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you speak Spanish?', '{"type":"multiple_choice","options":["Do","Does","Are"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ you speak Spanish?', '{"type":"multiple_choice","options":["Do","Does","Are"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he like sushi?', '{"type":"multiple_choice","options":["Does","Do","Is"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ he like sushi?', '{"type":"multiple_choice","options":["Does","Do","Is"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they live in London?', '{"type":"multiple_choice","options":["Do","Does","Are"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ they live in London?', '{"type":"multiple_choice","options":["Do","Does","Are"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ your brother work here?', '{"type":"multiple_choice","options":["Does","Do","Is"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ your brother work here?', '{"type":"multiple_choice","options":["Does","Do","Is"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ it snow here in winter?', '{"type":"multiple_choice","options":["Does","Do","Is"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ it snow here in winter?', '{"type":"multiple_choice","options":["Does","Do","Is"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ I need a ticket?', '{"type":"multiple_choice","options":["Do","Does","Am"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ I need a ticket?', '{"type":"multiple_choice","options":["Do","Does","Am"],"answer":0}'::jsonb);

    -- R4: Spelling especial
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ TV every night. (watch)', '{"type":"multiple_choice","options":["watches","watchs","watch"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ TV every night. (watch)', '{"type":"multiple_choice","options":["watches","watchs","watch"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ to school. (go)', '{"type":"multiple_choice","options":["goes","gos","go"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ to school. (go)', '{"type":"multiple_choice","options":["goes","gos","go"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ hard. (study)', '{"type":"multiple_choice","options":["studies","studys","study"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ hard. (study)', '{"type":"multiple_choice","options":["studies","studys","study"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ the dishes after dinner. (wash)', '{"type":"multiple_choice","options":["washes","washs","wash"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ the dishes after dinner. (wash)', '{"type":"multiple_choice","options":["washes","washs","wash"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The bird ___ south in winter. (fly)', '{"type":"multiple_choice","options":["flies","flys","fly"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The bird ___ south in winter. (fly)', '{"type":"multiple_choice","options":["flies","flys","fly"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ the early bus every day. (catch)', '{"type":"multiple_choice","options":["catches","catchs","catch"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ the early bus every day. (catch)', '{"type":"multiple_choice","options":["catches","catchs","catch"],"answer":0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ science at the university. (teach)', '{"type":"multiple_choice","options":["teaches","teachs","teach"],"answer":0}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ science at the university. (teach)', '{"type":"multiple_choice","options":["teaches","teachs","teach"],"answer":0}'::jsonb);

    -- =========================================================
    -- TIPO 3: TRUE / FALSE — 7 ejercicios por regla
    -- =========================================================

    -- R1: He/She/It + -S
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«She work every day.» es correcto en Presente Simple.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«She work every day.» ist korrekt im Simple Present.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«He plays football.» tiene la forma correcta del verbo.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«He plays football.» hat die richtige Verbform.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«The cat sleeps a lot.» está bien escrito.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«The cat sleeps a lot.» ist richtig geschrieben.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«My brother work in a hospital.» es una frase correcta.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«My brother work in a hospital.» ist ein korrekter Satz.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Con He/She/It los verbos regulares añaden -s o -es al final.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Bei He/She/It bekommen regelmäßige Verben am Ende -s oder -es.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«It rain every day.» es correcto en Presente Simple.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«It rain every day.» ist korrekt im Simple Present.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«She studys hard.» es la forma correcta de 3ª persona de «study».', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«She studys hard.» ist die korrekte 3. Person von «study».', '{"type":"true_false","answer":false}'::jsonb);

    -- R2: Negación don't / doesn't
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«She doesn''t works here.» es correcto.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«She doesn''t works here.» ist korrekt.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«They don''t like fish.» es correcto.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«They don''t like fish.» ist korrekt.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Con He/She/It la negación usa «doesn''t».', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Bei He/She/It wird die Verneinung mit «doesn''t» gebildet.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«He don''t understand.» es una frase correcta.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«He don''t understand.» ist ein korrekter Satz.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«We doesn''t have a car.» está bien escrito.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«We doesn''t have a car.» ist richtig geschrieben.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Después de «doesn''t» el verbo va en su forma base sin -s.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Nach «doesn''t» steht das Verb in der Grundform ohne -s.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«I doesn''t like coffee.» es correcto.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«I doesn''t like coffee.» ist korrekt.', '{"type":"true_false","answer":false}'::jsonb);

    -- R3: Interrogación Do / Does
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La pregunta «Does she like coffee?» es correcta.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Frage «Does she like coffee?» ist korrekt.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Do he work here?» es la forma correcta de preguntar.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Do he work here?» ist die korrekte Frageform.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar con He/She/It se usa «Does».', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Für Fragen mit He/She/It verwendet man «Does».', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Does they play tennis?» está bien formada.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Does they play tennis?» ist korrekt gebildet.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En preguntas con «Does» el verbo principal lleva -s.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'In Fragen mit «Does» bekommt das Hauptverb ein -s.', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '«Do you speak English?» es una pregunta correcta.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '«Do you speak English?» ist eine korrekte Frage.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Después de «Does» el verbo va en su forma base.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Nach «Does» steht das Verb in der Grundform.', '{"type":"true_false","answer":true}'::jsonb);

    -- R4: Spelling especial
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La 3ª persona de «watch» es «watchs».', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die 3. Person von «watch» ist «watchs».', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La 3ª persona de «study» es «studies».', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die 3. Person von «study» ist «studies».', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La 3ª persona de «go» es «gos».', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die 3. Person von «go» ist «gos».', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los verbos en -y precedida de consonante cambian a -ies en 3ª persona.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Verben auf Konsonant + -y werden in der 3. Person zu -ies.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La 3ª persona de «play» es «playes».', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die 3. Person von «play» ist «playes».', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los verbos en -sh, -ch, -x o -z añaden -es en 3ª persona.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Verben auf -sh, -ch, -x oder -z bekommen -es in der 3. Person.', '{"type":"true_false","answer":true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La 3ª persona de «fly» es «flys».', '{"type":"true_false","answer":false}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die 3. Person von «fly» ist «flys».', '{"type":"true_false","answer":false}'::jsonb);

    -- =========================================================
    -- TIPO 4: SCRAMBLE — 7 ejercicios por regla
    -- =========================================================

    -- R1: He/She/It + -S
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She works every day.', '{"type":"scramble","chunks":["every day","She","works"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: She works every day.', '{"type":"scramble","chunks":["every day","She","works"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: He plays football.', '{"type":"scramble","chunks":["football","plays","He"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: He plays football.', '{"type":"scramble","chunks":["football","plays","He"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: It rains here.', '{"type":"scramble","chunks":["rains","here","It"],"correct_order":[2,0,1]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: It rains here.', '{"type":"scramble","chunks":["rains","here","It"],"correct_order":[2,0,1]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: My cat sleeps a lot.', '{"type":"scramble","chunks":["a lot","My cat","sleeps"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: My cat sleeps a lot.', '{"type":"scramble","chunks":["a lot","My cat","sleeps"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She goes to school.', '{"type":"scramble","chunks":["She","to school","goes"],"correct_order":[0,2,1]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: She goes to school.', '{"type":"scramble","chunks":["She","to school","goes"],"correct_order":[0,2,1]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: He drinks coffee.', '{"type":"scramble","chunks":["coffee","He","drinks"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: He drinks coffee.', '{"type":"scramble","chunks":["coffee","He","drinks"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She studies English.', '{"type":"scramble","chunks":["English","studies","She"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: She studies English.', '{"type":"scramble","chunks":["English","studies","She"],"correct_order":[2,1,0]}'::jsonb);

    -- R2: Negación don't / doesn't
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She doesn''t eat meat.', '{"type":"scramble","chunks":["meat","She","doesn''t eat"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: She doesn''t eat meat.', '{"type":"scramble","chunks":["meat","She","doesn''t eat"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: I don''t like coffee.', '{"type":"scramble","chunks":["I","coffee","don''t like"],"correct_order":[0,2,1]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: I don''t like coffee.', '{"type":"scramble","chunks":["I","coffee","don''t like"],"correct_order":[0,2,1]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: He doesn''t work on Sundays.', '{"type":"scramble","chunks":["doesn''t work","on Sundays","He"],"correct_order":[2,0,1]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: He doesn''t work on Sundays.', '{"type":"scramble","chunks":["doesn''t work","on Sundays","He"],"correct_order":[2,0,1]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: They don''t live here.', '{"type":"scramble","chunks":["live here","don''t","They"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: They don''t live here.', '{"type":"scramble","chunks":["live here","don''t","They"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: We don''t have a car.', '{"type":"scramble","chunks":["a car","We","don''t have"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: We don''t have a car.', '{"type":"scramble","chunks":["a car","We","don''t have"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She doesn''t like dogs.', '{"type":"scramble","chunks":["She","doesn''t like","dogs"],"correct_order":[0,1,2]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: She doesn''t like dogs.', '{"type":"scramble","chunks":["She","doesn''t like","dogs"],"correct_order":[0,1,2]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: It doesn''t rain in summer.', '{"type":"scramble","chunks":["rain in summer","doesn''t","It"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: It doesn''t rain in summer.', '{"type":"scramble","chunks":["rain in summer","doesn''t","It"],"correct_order":[2,1,0]}'::jsonb);

    -- R3: Interrogación Do / Does
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Do you like pizza?', '{"type":"scramble","chunks":["pizza?","you like","Do"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Do you like pizza?', '{"type":"scramble","chunks":["pizza?","you like","Do"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Does she speak English?', '{"type":"scramble","chunks":["Does","English?","she speak"],"correct_order":[0,2,1]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Does she speak English?', '{"type":"scramble","chunks":["Does","English?","she speak"],"correct_order":[0,2,1]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Do they have a dog?', '{"type":"scramble","chunks":["a dog?","Do","they have"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Do they have a dog?', '{"type":"scramble","chunks":["a dog?","Do","they have"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Does he work here?', '{"type":"scramble","chunks":["here?","Does he","work"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Does he work here?', '{"type":"scramble","chunks":["here?","Does he","work"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Does it rain here?', '{"type":"scramble","chunks":["here?","rain","Does it"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Does it rain here?', '{"type":"scramble","chunks":["here?","rain","Does it"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Do we need a ticket?', '{"type":"scramble","chunks":["need","a ticket?","Do we"],"correct_order":[2,0,1]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Do we need a ticket?', '{"type":"scramble","chunks":["need","a ticket?","Do we"],"correct_order":[2,0,1]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: Do your parents live here?', '{"type":"scramble","chunks":["your parents","live here?","Do"],"correct_order":[2,0,1]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: Do your parents live here?', '{"type":"scramble","chunks":["your parents","live here?","Do"],"correct_order":[2,0,1]}'::jsonb);

    -- R4: Spelling especial
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She watches TV every night.', '{"type":"scramble","chunks":["every night","watches TV","She"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: She watches TV every night.', '{"type":"scramble","chunks":["every night","watches TV","She"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: He goes to school by bus.', '{"type":"scramble","chunks":["goes","He","to school by bus"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: He goes to school by bus.', '{"type":"scramble","chunks":["goes","He","to school by bus"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She studies English every day.', '{"type":"scramble","chunks":["studies","She","English every day"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: She studies English every day.', '{"type":"scramble","chunks":["studies","She","English every day"],"correct_order":[1,0,2]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: He teaches at a school.', '{"type":"scramble","chunks":["at a school","teaches","He"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: He teaches at a school.', '{"type":"scramble","chunks":["at a school","teaches","He"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: The bird flies south.', '{"type":"scramble","chunks":["south","flies","The bird"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: The bird flies south.', '{"type":"scramble","chunks":["south","flies","The bird"],"correct_order":[2,1,0]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: She catches the bus.', '{"type":"scramble","chunks":["catches","the bus","She"],"correct_order":[2,0,1]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: She catches the bus.', '{"type":"scramble","chunks":["catches","the bus","She"],"correct_order":[2,0,1]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar: He washes the dishes.', '{"type":"scramble","chunks":["the dishes","He","washes"],"correct_order":[1,2,0]}'::jsonb);
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne um zu bilden: He washes the dishes.', '{"type":"scramble","chunks":["the dishes","He","washes"],"correct_order":[1,2,0]}'::jsonb);

END;
$seed$;
