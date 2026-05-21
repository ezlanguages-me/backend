-- ============================================================
-- Seed: A0 English Path – STEP 1770 – Grammar – Cuantificadores: Much, Many, Some, Any
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

            DELETE FROM grammar WHERE step_order = 1770 AND path_uuid = v_path_id;

            INSERT INTO grammar (path_uuid, step_order, source_language, type)
            VALUES (v_path_id, 1770, 'en', 'grammar')
            RETURNING uuid INTO v_grammar_id;

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'es',
                'Much, Many, Some, Any',
                to_jsonb($content_1770_es$## Cuantificadores: Much, Many, Some, Any

Los cuantificadores ayudan a hablar de cantidad. En este nivel es importante distinguir entre nombres **contables** y **incontables**, porque eso cambia la palabra correcta: **much, many, some** o **any**. **Much** y **many** hablan de cantidad; **some** y **any** dependen además del tipo de frase.

---

##### 1. MUCH con incontables

**Much** se usa con nombres que no contamos en unidades normales.

* much water
* much time
* much money
* much information

Suele aparecer sobre todo en preguntas y negativas.

---

##### 2. MANY con contables en plural

**Many** se usa con nombres que sí podemos contar y van en plural.

* many books
* many people
* many hours
* many chairs

Piensa: si puedes decir **one book / two books**, entonces normalmente va **many**.

---

##### 3. SOME en afirmativas y ofertas

**Some** aparece mucho en frases afirmativas y también en ofertas o peticiones educadas.

* I have **some** bread.
* There is **some** water.
* Would you like **some** tea?
* Can I have **some** rice?

En ofertas y peticiones, **some** suena natural aunque la frase sea una pregunta. En cambio, en preguntas neutrales sin oferta solemos preferir **any**.

---

##### 4. ANY en negativas y preguntas

**Any** es muy común en negativas y preguntas normales.

* Do you have **any** milk?
* I don't have **any** money.
* Are there **any** questions?
* She doesn't need **any** help.

---

##### 5. Consejo útil

Primero decide si el nombre es contable o incontable. Después mira si la frase es afirmativa, negativa o pregunta. Así es mucho más fácil elegir bien. Por ejemplo, **people** y **hours** son contables, pero **money** y **information** no lo son. Hacer esta clasificación primero evita la mayoría de errores con estas cuatro palabras. Después solo necesitas fijarte en si la oración es afirmativa, negativa o una pregunta.

---

##### 6. Error frecuente

* ❌ much books  
  ✅ **many books**

* ❌ many water  
  ✅ **much water**

* ❌ I don't have some money.  
  ✅ I don't have **any** money.$content_1770_es$::text)
            );

            INSERT INTO grammar_translation (grammar_uuid, language, title, content)
            VALUES (
                v_grammar_id,
                'de',
                'Much, Many, Some, Any',
                to_jsonb($content_1770_de$## Quantifizierer: Much, Many, Some, Any

Mit Quantifizierern spricht man über Mengen. Auf diesem Niveau ist es wichtig, zwischen **zählbaren** und **unzählbaren** Nomen zu unterscheiden, denn davon hängt ab, ob man **much, many, some** oder **any** benutzt. **Much** und **many** beschreiben Mengen; **some** und **any** hängen zusätzlich von der Satzart ab.

---

##### 1. MUCH mit unzählbaren Nomen

**Much** benutzt man mit Nomen, die man normalerweise nicht einzeln zählt.

* much water
* much time
* much money
* much information

Es erscheint besonders oft in Fragen und Verneinungen.

---

##### 2. MANY mit zählbaren Nomen im Plural

**Many** benutzt man mit Nomen, die man zählen kann und die im Plural stehen.

* many books
* many people
* many hours
* many chairs

Wenn du **one book / two books** sagen kannst, passt normalerweise **many**.

---

##### 3. SOME in Aussagen und Angeboten

**Some** kommt oft in positiven Sätzen vor und auch in höflichen Angeboten oder Bitten.

* I have **some** bread.
* There is **some** water.
* Would you like **some** tea?
* Can I have **some** rice?

In Angeboten und Bitten klingt **some** auch in Fragen ganz natürlich. In neutralen Fragen ohne Angebot benutzt man dagegen meistens **any**.

---

##### 4. ANY in Verneinungen und Fragen

**Any** ist sehr häufig in Verneinungen und normalen Fragen.

* Do you have **any** milk?
* I don't have **any** money.
* Are there **any** questions?
* She doesn't need **any** help.

---

##### 5. Praktischer Tipp

Entscheide zuerst, ob das Nomen zählbar oder unzählbar ist. Danach schaust du, ob der Satz positiv, negativ oder eine Frage ist. So wählst du leichter das richtige Wort. Zum Beispiel sind **people** und **hours** zählbar, **money** und **information** aber nicht. Wenn du diese Einteilung zuerst machst, vermeidest du die meisten Fehler mit diesen vier Wörtern. Danach musst du nur noch auf positive, negative oder fragende Satzform achten.

---

##### 6. Häufiger Fehler

* ❌ much books  
  ✅ **many books**

* ❌ many water  
  ✅ **much water**

* ❌ I don't have some money.  
  ✅ I don't have **any** money.$content_1770_de$::text)
            );


-- Rule 1
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'es', 'MUCH + incontable', 'Usa much con nombres incontables: ❌ many water → ✅ much water.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule1_id, 'de', 'MUCH + unzählbar', 'Benutze much mit unzählbaren Nomen: ❌ many water → ✅ much water.');


-- Rule 2
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'es', 'MANY + plural contable', 'Usa many con nombres contables en plural: ❌ much books → ✅ many books.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule2_id, 'de', 'MANY + zählbarer Plural', 'Benutze many mit zählbaren Nomen im Plural: ❌ much books → ✅ many books.');


-- Rule 3
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'es', 'SOME en afirmativas y ofertas', 'Usa some en afirmativas y en ofertas o peticiones amables: ❌ Would you like any tea? → ✅ Would you like some tea?');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule3_id, 'de', 'SOME in Aussagen und Angeboten', 'Benutze some in positiven Sätzen und in höflichen Angeboten oder Bitten: ❌ Would you like any tea? → ✅ Would you like some tea?');


-- Rule 4
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'es', 'ANY en negativas y preguntas', 'Usa any en negativas y preguntas normales: ❌ I don''t have some money → ✅ I don''t have any money.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
VALUES (v_rule4_id, 'de', 'ANY in Verneinungen und Fragen', 'Benutze any in Verneinungen und normalen Fragen: ❌ I don''t have some money → ✅ I don''t have any money.');


-- =========================================================
-- TYPING — 7 exercises per rule
-- =========================================================

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ water do you drink?', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ water do you drink?', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We do not have ___ time.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We do not have ___ time.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There is not ___ milk in the fridge.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There is not ___ milk in the fridge.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She spends too ___ money on clothes.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She spends too ___ money on clothes.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ sugar do you want?', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ sugar do you want?', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I do not need ___ help today.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I do not need ___ help today.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They do not have ___ information yet.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They do not have ___ information yet.', '{"type": "typing", "correct_answers": ["much"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ books do you have?', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ books do you have?', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There are ___ people in the park.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There are ___ people in the park.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We do not need ___ chairs.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We do not need ___ chairs.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She has ___ friends at school.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She has ___ friends at school.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How ___ hours do you work?', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How ___ hours do you work?', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They bought ___ apples at the market.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They bought ___ apples at the market.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I do not see ___ cars on this street.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I do not see ___ cars on this street.', '{"type": "typing", "correct_answers": ["many"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I have ___ bread at home.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I have ___ bread at home.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She wants ___ water, please.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She wants ___ water, please.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We need ___ eggs for dinner.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We need ___ eggs for dinner.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Would you like ___ tea?', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Would you like ___ tea?', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Can I have ___ rice, please?', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Can I have ___ rice, please?', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They bought ___ fruit after class.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They bought ___ fruit after class.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There is ___ soup in the kitchen.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There is ___ soup in the kitchen.', '{"type": "typing", "correct_answers": ["some"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Do you have ___ milk?', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Do you have ___ milk?', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I do not have ___ money.', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I do not have ___ money.', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Are there ___ questions?', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Are there ___ questions?', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She does not need ___ help.', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She does not need ___ help.', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We do not see ___ buses today.', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We do not see ___ buses today.', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is there ___ bread left?', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Is there ___ bread left?', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);

INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He does not drink ___ coffee at night.', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He does not drink ___ coffee at night.', '{"type": "typing", "correct_answers": ["any"], "case_sensitive": false}'::jsonb);

        END;
        $seed$;
