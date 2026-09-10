-- ============================================================
-- Seed: A0 English Path – STEP 1740 – Grammar – Formación -ING
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

            DELETE FROM grammar WHERE step_order = 1740 AND path_uuid = v_path_id;

            INSERT INTO grammar (path_uuid, step_order, source_language, type)
            VALUES (v_path_id, 1740, 'en', 'grammar')
            RETURNING uuid INTO v_grammar_id;

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'es',
                'Formación -ING',
                to_jsonb($content_1740_es$## Formación -ING

La forma **-ing** aparece sobre todo en el **presente continuo** y en otras estructuras como **I like reading**. Para escribirla bien, no basta con añadir **-ing** siempre: algunos verbos cambian su ortografía antes de añadir esa terminación.

---

##### 1. Regla general

En muchos verbos simplemente añadimos **-ing**.

* play → **playing**
* eat → **eating**
* read → **reading**
* listen → **listening**

Esta es la forma más frecuente y la primera que debes probar. Antes de escribir, mira el final del verbo para decidir si realmente necesitas cambiar algo.

---

##### 2. Verbos con -e muda

Si el verbo termina en **-e** muda, normalmente quitamos esa **e** y añadimos **-ing**.

* make → **making**
* write → **writing**
* dance → **dancing**
* ride → **riding**

> 💡 No escribas **makeing** o **writeing**.

---

##### 3. Doble consonante

En algunos verbos cortos con patrón consonante + vocal + consonante, duplicamos la consonante final.

* run → **running**
* sit → **sitting**
* swim → **swimming**
* stop → **stopping**

Esto suele pasar con verbos cortos y sílaba final fuerte. No todos los verbos terminados en consonante duplican: por ejemplo, **open → opening**, no **openning**.

---

##### 4. Cambio de -ie a -ying

Si el verbo termina en **-ie**, cambiamos **ie** por **y** antes de añadir **-ing**.

* die → **dying**
* lie → **lying**
* tie → **tying**

Es una regla pequeña, pero muy importante porque estas formas son irregulares. Memorizar estos tres verbos te evita muchos errores en niveles iniciales. Cuando dudes, piensa primero en la forma base y después aplica la regla correcta con calma, paso a paso.

---

##### 5. Cuándo la necesitas

Usa la forma **-ing** con **am / is / are** en el presente continuo.

* She is **reading**.
* They are **making** dinner.
* He is **running** fast.

También aparece después de algunos verbos y preposiciones, pero en este paso nos concentramos en la escritura. Una estrategia útil es mirar siempre las últimas letras del verbo: **-e**, consonante-vocal-consonante o **-ie**.

---

##### 6. Error frecuente

* ❌ makeing  
  ✅ **making**

* ❌ runing  
  ✅ **running**

* ❌ lieing  
  ✅ **lying**$content_1740_es$::text)
            );

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'de',
                'Bildung der -ING-Form',
                to_jsonb($content_1740_de$## Bildung der -ING-Form

Die **-ing-Form** erscheint vor allem im **Present Continuous**, aber auch in anderen Strukturen wie **I like reading**. Man kann nicht immer einfach nur **-ing** anhängen: Manche Verben verändern ihre Schreibweise, bevor die Endung dazukommt.

---

##### 1. Grundregel

Bei vielen Verben fügt man einfach **-ing** hinzu.

* play → **playing**
* eat → **eating**
* read → **reading**
* listen → **listening**

Das ist die häufigste Form und meistens der erste richtige Gedanke. Schau trotzdem immer auf das Ende des Verbs, bevor du die Form aufschreibst.

---

##### 2. Verben mit stummem -e

Endet das Verb auf ein stummes **-e**, lässt man dieses **e** normalerweise weg und fügt **-ing** an.

* make → **making**
* write → **writing**
* dance → **dancing**
* ride → **riding**

> 💡 Schreibe nicht **makeing** oder **writeing**.

---

##### 3. Doppelter Endkonsonant

Bei manchen kurzen Verben mit dem Muster Konsonant + Vokal + Konsonant verdoppelt man den letzten Konsonanten.

* run → **running**
* sit → **sitting**
* swim → **swimming**
* stop → **stopping**

Das passiert oft bei kurzen Verben mit betonter letzter Silbe. Nicht jedes Verb auf Konsonant verdoppelt sich: zum Beispiel **open → opening**, nicht **openning**.

---

##### 4. Wechsel von -ie zu -ying

Endet das Verb auf **-ie**, wird **ie** zu **y**, bevor **-ing** angehängt wird.

* die → **dying**
* lie → **lying**
* tie → **tying**

Diese kleine Regel ist wichtig, weil diese Formen unregelmäßig aussehen. Wenn du dir diese drei Verben merkst, vermeidest du viele typische Anfängerfehler. Wenn du unsicher bist, denke zuerst an die Grundform und wähle dann bewusst die passende Regel, Schritt für Schritt, ganz ruhig.

---

##### 5. Wann braucht man die Form?

Man benutzt die **-ing-Form** mit **am / is / are** im Present Continuous.

* She is **reading**.
* They are **making** dinner.
* He is **running** fast.

Sie kommt auch nach manchen Verben und Präpositionen vor, aber hier konzentrieren wir uns auf die Schreibweise. Eine gute Strategie ist, immer auf die letzten Buchstaben zu schauen: **-e**, Konsonant-Vokal-Konsonant oder **-ie**.

---

##### 6. Häufiger Fehler

* ❌ makeing  
  ✅ **making**

* ❌ runing  
  ✅ **running**

* ❌ lieing  
  ✅ **lying**$content_1740_de$::text)
            );


-- Rule 1
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'es', 'Regla general: añadir -ING', 'En muchos verbos solo añades -ing: ❌ playng → ✅ playing; ❌ eatting → ✅ eating.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'de', 'Grundregel: -ING hinzufügen', 'Bei vielen Verben fügst du einfach -ing hinzu: ❌ playng → ✅ playing; ❌ eatting → ✅ eating.');


-- Rule 2
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'es', 'Quitar la -E muda', 'Si el verbo termina en e muda, quita la e antes de añadir -ing: ❌ makeing → ✅ making; ❌ danceing → ✅ dancing.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'de', 'Stummes -E weglassen', 'Wenn das Verb auf stummes e endet, fällt das e vor -ing weg: ❌ makeing → ✅ making; ❌ danceing → ✅ dancing.');


-- Rule 3
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'es', 'Doble consonante final', 'En algunos verbos cortos duplicamos la consonante final antes de -ing: ❌ runing → ✅ running; ❌ siting → ✅ sitting.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'de', 'Letzten Konsonanten verdoppeln', 'Bei manchen kurzen Verben verdoppelt man den letzten Konsonanten vor -ing: ❌ runing → ✅ running; ❌ siting → ✅ sitting.');


-- Rule 4
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'es', 'Cambiar -IE por -YING', 'Con verbos terminados en -ie cambia ie por y antes de añadir -ing: ❌ lieing → ✅ lying; ❌ tieing → ✅ tying.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'de', 'Aus -IE wird -YING', 'Bei Verben auf -ie wird ie vor -ing zu y: ❌ lieing → ✅ lying; ❌ tieing → ✅ tying.');


-- =========================================================
-- TYPING — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They are ___ in the park. (play)', '{"type": "typing", "correct_answers": ["playing"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They are ___ in the park. (play)', '{"type": "typing", "correct_answers": ["playing"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I am ___ breakfast now. (eat)', '{"type": "typing", "correct_answers": ["eating"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I am ___ breakfast now. (eat)', '{"type": "typing", "correct_answers": ["eating"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is ___ a book on the sofa. (read)', '{"type": "typing", "correct_answers": ["reading"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She is ___ a book on the sofa. (read)', '{"type": "typing", "correct_answers": ["reading"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We are ___ to music. (listen)', '{"type": "typing", "correct_answers": ["listening"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We are ___ to music. (listen)', '{"type": "typing", "correct_answers": ["listening"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is ___ the window. (open)', '{"type": "typing", "correct_answers": ["opening"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He is ___ the window. (open)', '{"type": "typing", "correct_answers": ["opening"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The baby is ___ softly. (cry)', '{"type": "typing", "correct_answers": ["crying"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The baby is ___ softly. (cry)', '{"type": "typing", "correct_answers": ["crying"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You are ___ very hard today. (work)', '{"type": "typing", "correct_answers": ["working"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You are ___ very hard today. (work)', '{"type": "typing", "correct_answers": ["working"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is ___ a cake for dinner. (make)', '{"type": "typing", "correct_answers": ["making"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She is ___ a cake for dinner. (make)', '{"type": "typing", "correct_answers": ["making"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is ___ an email now. (write)', '{"type": "typing", "correct_answers": ["writing"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He is ___ an email now. (write)', '{"type": "typing", "correct_answers": ["writing"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They are ___ in the living room. (dance)', '{"type": "typing", "correct_answers": ["dancing"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They are ___ in the living room. (dance)', '{"type": "typing", "correct_answers": ["dancing"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I am ___ a bicycle to school. (ride)', '{"type": "typing", "correct_answers": ["riding"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I am ___ a bicycle to school. (ride)', '{"type": "typing", "correct_answers": ["riding"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We are ___ near the lake. (drive)', '{"type": "typing", "correct_answers": ["driving"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We are ___ near the lake. (drive)', '{"type": "typing", "correct_answers": ["driving"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The dog is ___ under the table. (hide)', '{"type": "typing", "correct_answers": ["hiding"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The dog is ___ under the table. (hide)', '{"type": "typing", "correct_answers": ["hiding"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is ___ the new app today. (use)', '{"type": "typing", "correct_answers": ["using"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She is ___ the new app today. (use)', '{"type": "typing", "correct_answers": ["using"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is ___ to the bus stop. (run)', '{"type": "typing", "correct_answers": ["running"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He is ___ to the bus stop. (run)', '{"type": "typing", "correct_answers": ["running"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The child is ___ on the chair. (sit)', '{"type": "typing", "correct_answers": ["sitting"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The child is ___ on the chair. (sit)', '{"type": "typing", "correct_answers": ["sitting"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They are ___ in the pool. (swim)', '{"type": "typing", "correct_answers": ["swimming"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They are ___ in the pool. (swim)', '{"type": "typing", "correct_answers": ["swimming"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I am ___ the big box on the table. (put)', '{"type": "typing", "correct_answers": ["putting"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I am ___ the big box on the table. (put)', '{"type": "typing", "correct_answers": ["putting"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The cat is ___ on the rug. (nap)', '{"type": "typing", "correct_answers": ["napping"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The cat is ___ on the rug. (nap)', '{"type": "typing", "correct_answers": ["napping"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We are ___ the test now. (begin)', '{"type": "typing", "correct_answers": ["beginning"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We are ___ the test now. (begin)', '{"type": "typing", "correct_answers": ["beginning"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The bus is ___ near the station. (stop)', '{"type": "typing", "correct_answers": ["stopping"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The bus is ___ near the station. (stop)', '{"type": "typing", "correct_answers": ["stopping"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The old plant is ___ because it has no water. (die)', '{"type": "typing", "correct_answers": ["dying"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The old plant is ___ because it has no water. (die)', '{"type": "typing", "correct_answers": ["dying"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is ___ on the sofa again. (lie)', '{"type": "typing", "correct_answers": ["lying"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He is ___ on the sofa again. (lie)', '{"type": "typing", "correct_answers": ["lying"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is ___ the ribbon now. (tie)', '{"type": "typing", "correct_answers": ["tying"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She is ___ the ribbon now. (tie)', '{"type": "typing", "correct_answers": ["tying"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My little brother is ___ about his age. (lie)', '{"type": "typing", "correct_answers": ["lying"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My little brother is ___ about his age. (lie)', '{"type": "typing", "correct_answers": ["lying"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The leaves are ___ in the hot sun. (die)', '{"type": "typing", "correct_answers": ["dying"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The leaves are ___ in the hot sun. (die)', '{"type": "typing", "correct_answers": ["dying"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The climber is ___ the rope carefully. (tie)', '{"type": "typing", "correct_answers": ["tying"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The climber is ___ the rope carefully. (tie)', '{"type": "typing", "correct_answers": ["tying"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The dog is ___ in the sun. (lie)', '{"type": "typing", "correct_answers": ["lying"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The dog is ___ in the sun. (lie)', '{"type": "typing", "correct_answers": ["lying"], "case_sensitive": false}'::jsonb);

        END;
        $seed$;
