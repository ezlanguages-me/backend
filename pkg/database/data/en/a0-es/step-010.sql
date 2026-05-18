-- ============================================================
-- Seed: A0 English Path – STEP 10 – Grammar – Pronombres (Personales y de Sujeto)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_id  UUID;
  v_grammar1_id UUID;
  v_grammar_rule_id UUID;
  v_rule1_id UUID;
  v_rule2_id UUID;
  v_rule3_id UUID;
  v_rule4_id UUID;
  v_rule5_id UUID;
  v_rule6_id UUID;
  v_ex_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

  -- ── STEP 6: Grammar – Pronombres Personales ───────────────────────────
  INSERT INTO grammar (path_uuid, step_order, source_language, type)
  VALUES (
    v_path_id,
    10,
    'en',
    'grammar'
  )
  RETURNING uuid INTO v_grammar1_id;

  INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
  VALUES (
    v_grammar1_id,
    'es',
    'Los Pronombres',
    '',
    to_jsonb('## Los Pronombres

Aprende a diferenciar quién hace la acción (Sujeto) y quién la recibe (Objeto). En inglés, a diferencia del español, **siempre** es obligatorio mencionar al sujeto para que la frase sea clara.

---

### 1. Subject Pronouns (Sujeto)
Son los protagonistas de la oración. Van **antes** del verbo.

| Español / Ítem | Inglés | Tip de Pronunciación / Nota |
| :--- | :--- | :--- |
| Yo | **I** | /aí/ (Siempre en **MAYÚSCULA**) |
| Tú / Usted | **You** | /iú/ |
| Él | **He** | /jí/ (La "h" suena como "j" suave) |
| Ella | **She** | /shí/ |
| Eso (Cosa/Animal) | **It** | /it/ (Vocal corta y seca) |
| Nosotros/as | **We** | /uí/ |
| Ustedes | **You** | /iú/ |
| Ellos/as | **They** | /**déi**/ (Lengua entre los dientes) |

✅ **I** play tennis. (Yo juego tenis).
❌ Play tennis. (En inglés, el sujeto nunca se omite).

---

### 2. Object Pronouns (Objeto)
Son los que reciben el impacto de la acción. Van **después** del verbo o de preposiciones (*with, for, to*).

| Español / Ítem | Inglés | Tip de Pronunciación / Nota |
| :--- | :--- | :--- |
| Mí / Me | **Me** | /mí/ |
| Ti / Te / Usted | **You** | /iú/ |
| Él / Lo / Le | **Him** | /jim/ |
| Ella / La / Le | **Her** | /jer/ (La "r" es suave, al estilo USA) |
| Eso / Lo / La | **It** | /it/ (Igual al sujeto) |
| Nos / Nosotros | **Us** | /**as**/ (La "u" suena como "a") |
| Ustedes / Los | **You** | /iú/ |
| Ellos / Los / Les | **Them** | /**dem**/ |

✅ She loves **me**. (Ella me ama).
❌ She loves **I**. (Nunca uses sujeto después de un verbo).

---

### Reglas Hiper-Concisas
* **Ubicación:** Sujeto **+** Verbo **+** Objeto.
* **Preposiciones:** Después de palabras como *for, with, between, to*, siempre usa **Object Pronouns**.
* **El comodín "It":** Úsalo para todo lo que no sea humano (clima, objetos, situaciones).

✅ This gift is for **them**. (Este regalo es para ellos).
❌ This gift is for **they**.

---

> ### ⚠️ El Error de la "Persona Invisible"
> En español decimos "Está lloviendo". En inglés, el clima no puede ser un sujeto invisible.
> * ✅ **It** is raining.
> * ❌ Is raining.
> 
> **¿Quién es?** Al responder el teléfono o la puerta:
> * ✅ It''s **me**. (Soy yo).
> * ❌ It''s **I**. (Demasiado formal/incorrecto en el habla diaria).

---

### Usos Prácticos (Real-life Context)
En el día a día, usamos los pronombres de objeto para ser eficientes y evitar repetir nombres propios:

* **En el café:** "I''ll take the latte. Please, give **it** to **me** with oat milk."
* **Presentando amigos:** "This is Sarah. I work with **her**."
* **En el gym:** "Those weights are heavy. Don''t lift **them** alone!'::text)
  );

  INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
  VALUES (
    v_grammar1_id,
    'de',
    'Die Pronomen',
    '',
    to_jsonb('## Die Pronomen

Lerne, wer die Handlung ausführt (Subjekt) und wer sie empfängt (Objekt). Im Englischen ist es – anders als im Deutschen – **immer** obligatorisch, das Subjekt zu nennen, damit der Satz klar ist.

---

### 1. Subject Pronouns (Subjektpronomen)
Das sind die Hauptpersonen des Satzes. Sie stehen **vor** dem Verb.

| Deutsch | Englisch | Aussprache / Hinweis |
| :--- | :--- | :--- |
| Ich | **I** | /AI/ (Immer **GROSSGESCHRIEBEN**) |
| Du / Sie (formal) | **You** | /JUU/ |
| Er | **He** | /HIE/ (Das "h" ist hörbar) |
| Sie (weibl.) | **She** | /SCHIE/ |
| Es (Sache/Tier) | **It** | /IT/ (Kurzer, knapper Vokal) |
| Wir | **We** | /WIE/ |
| Ihr / Sie (pl.) | **You** | /JUU/ |
| Sie (pl.) / sie | **They** | /**DEI**/ (Zunge zwischen die Zähne) |

✅ **I** play tennis. (Ich spiele Tennis).
❌ Play tennis. (Im Englischen wird das Subjekt nie weggelassen).

---

### 2. Object Pronouns (Objektpronomen)
Diese empfangen die Auswirkung der Handlung. Sie stehen **nach** dem Verb oder nach Präpositionen (*with, for, to*).

| Deutsch | Englisch | Aussprache / Hinweis |
| :--- | :--- | :--- |
| Mir / Mich | **Me** | /MIE/ |
| Dir / Dich / Sie | **You** | /JUU/ |
| Ihm / Ihn | **Him** | /HIM/ |
| Ihr / Sie (weibl.) | **Her** | /HÖÖ/ (Das "r" ist weich) |
| Es / Ihn / Sie | **It** | /IT/ (Gleich wie das Subjekt) |
| Uns | **Us** | /**AS**/ (Das "u" klingt wie "a") |
| Euch / Sie (pl.) | **You** | /JUU/ |
| Ihnen / Sie / sie | **Them** | /**DEM**/ |

✅ She loves **me**. (Sie liebt mich).
❌ She loves **I**. (Nie Subjektpronomen nach einem Verb verwenden).

---

### Kurzregeln
* **Reihenfolge:** Subjekt **+** Verb **+** Objekt.
* **Präpositionen:** Nach Wörtern wie *for, with, between, to* immer **Objektpronomen** verwenden.
* **Das Allzweck-"It":** Verwende es für alles Nicht-Menschliche (Wetter, Objekte, Situationen).

✅ This gift is for **them**. (Dieses Geschenk ist für sie).
❌ This gift is for **they**.

---

> ### ⚠️ Der Fehler des "unsichtbaren Subjekts"
> Auf Deutsch sagen wir "Es regnet". Im Englischen kann das Wetter kein unsichtbares Subjekt haben.
> * ✅ **It** is raining.
> * ❌ Is raining.
> 
> **Wer ist da?** Beim Abnehmen des Telefons oder Öffnen der Tür:
> * ✅ It''s **me**. (Ich bin''s).
> * ❌ It''s **I**. (Zu formell/im Alltag falsch).

---

### Alltagskontext
Im Alltag verwenden wir Objektpronomen, um Eigennamen nicht zu wiederholen:

* **Im Café:** "I''ll take the latte. Please, give **it** to **me** with oat milk."
* **Freunde vorstellen:** "This is Sarah. I work with **her**."
* **Im Fitnessstudio:** "Those weights are heavy. Don''t lift **them** alone!"
'::text)
  );

  -- REGLA 1: El sujeto nunca se omite
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Sujeto Obligatorio', 'En inglés no existe el sujeto tácito. Debes incluir siempre un pronombre (ej: It is raining) antes del verbo.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'de', 'Pflichtsubjekt', 'Im Englischen gibt es kein ausgelassenes Subjekt. Du musst immer ein Pronomen (z.B.: It is raining) vor das Verb setzen.');

-- REGLA 2: Pronombre "I" siempre en mayúscula
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Mayúscula en el pronombre I', 'El pronombre "I" (yo) siempre debe escribirse en mayúscula, sin importar si está al inicio o en medio de la oración.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'de', 'Großschreibung des Pronomens I', 'Das Pronomen "I" (ich) wird immer großgeschrieben, egal ob es am Satzanfang oder in der Mitte steht.');


-- REGLA 3: Posición del Pronombre de Objeto
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Posición del Objeto', 'Los pronombres de objeto (me, him, her, etc.) deben ir después del verbo o de una preposición (ej: call me / for him).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'de', 'Position des Objekts', 'Objektpronomen (me, him, her, usw.) müssen nach dem Verb oder nach einer Präposition stehen (z.B.: call me / for him).');

-- REGLA 4: Uso de "It" para neutros
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Uso de It (Neutro)', 'Usa "It" para referirte a objetos, animales o situaciones. No uses "He" o "She" para cosas inanimadas.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'de', 'Verwendung von It (Neutrum)', 'Verwende "It" für Objekte, Tiere oder Situationen. Benutze nicht "He" oder "She" für unbelebte Dinge.');

-- REGLA 5: Pronombres tras preposiciones
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule5_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Objetos tras Preposiciones', 'Después de preposiciones como "between", "with" o "for", debes usar siempre el pronombre de objeto (ej: between you and me).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'de', 'Objekte nach Präpositionen', 'Nach Präpositionen wie "between", "with" oder "for" musst du immer das Objektpronomen verwenden (z.B.: between you and me).');

-- REGLA 6: Confusión Sujeto vs Objeto
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule6_id;
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule6_id, 'es', 'Sujeto vs Objeto', 'No confundas la función: usa Subject Pronouns para quien hace la acción y Object Pronouns para quien la recibe.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule6_id, 'de', 'Subjekt vs. Objekt', 'Verwechsle die Funktion nicht: Subjektpronomen für denjenigen, der handelt, und Objektpronomen für denjenigen, der die Handlung empfängt.');

-- ==========================================
-- REGLA 1: SUJETO OBLIGATORIO (v_rule1_id)
-- ==========================================

-- 1. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Ella) is my teacher."', '{"type":"typing","correct_answers":["She"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "___ (Sie/weibl.) is my teacher."', '{"type":"typing","correct_answers":["She"],"case_sensitive":false}'::jsonb);

-- 2. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Él) works in a bank."', '{"type":"typing","correct_answers":["He"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "___ (Er) works in a bank."', '{"type":"typing","correct_answers":["He"],"case_sensitive":false}'::jsonb);

-- 3. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Traduce el sujeto: "___ is raining." (Está lloviendo)', '{"type":"typing","correct_answers":["It"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Übersetze das Subjekt: "___ is raining." (Es regnet)', '{"type":"typing","correct_answers":["It"],"case_sensitive":false}'::jsonb);

-- 4. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '¿Cómo se dice "Está nevando"?', '{"type":"multiple_choice","options":["Is snowing","It is snowing","Snowing"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Wie sagt man "Es schneit"?', '{"type":"multiple_choice","options":["Is snowing","It is snowing","Snowing"],"answer":1}'::jsonb);

-- 5. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"___ play soccer." (Ellos)', '{"type":"multiple_choice","options":["Them","They","Their"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"___ play soccer." (Sie/pl.)', '{"type":"multiple_choice","options":["Them","They","Their"],"answer":1}'::jsonb);

-- 6. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"___ are from Mexico." (Nosotros)', '{"type":"multiple_choice","options":["Us","We","Our"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"___ are from Mexico." (Wir)', '{"type":"multiple_choice","options":["Us","We","Our"],"answer":1}'::jsonb);

-- 7. Scramble: chunks:["together","They","work"] correct_order:[1,2,0]
-- pos0=chunk[1]="They", pos1=chunk[2]="work", pos2=chunk[0]="together" -> "They work together"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ellas trabajan juntas"', '{"type":"scramble","chunks":["together","They","work"],"correct_order":[1,2,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Sie arbeiten zusammen"', '{"type":"scramble","chunks":["together","They","work"],"correct_order":[1,2,0]}'::jsonb);

-- 8. Scramble: chunks:["the boss","He","is"] correct_order:[1,2,0]
-- pos0=chunk[1]="He", pos1=chunk[2]="is", pos2=chunk[0]="the boss" -> "He is the boss"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Él es el jefe"', '{"type":"scramble","chunks":["the boss","He","is"],"correct_order":[1,2,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Er ist der Chef"', '{"type":"scramble","chunks":["the boss","He","is"],"correct_order":[1,2,0]}'::jsonb);

-- 9. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'En inglés se puede omitir el sujeto si el contexto lo aclara.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Im Englischen kann das Subjekt ausgelassen werden, wenn der Kontext es klärt.', '{"type":"true_false","answer":false}'::jsonb);

-- 10. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Is raining" es una oración incorrecta en inglés.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"Is raining" ist ein falscher Satz im Englischen.', '{"type":"true_false","answer":true}'::jsonb);

-- ==========================================
-- REGLA 2: MAYÚSCULA EN "I" (v_rule2_id)
-- ==========================================

-- 11. Typing (case_sensitive)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Escribe el pronombre "yo" en inglés:', '{"type":"typing","correct_answers":["I"],"case_sensitive":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Schreibe das Pronomen "ich" auf Englisch:', '{"type":"typing","correct_answers":["I"],"case_sensitive":true}'::jsonb);

-- 12. Typing (case_sensitive)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Corrige: "my sister and i are friends"', '{"type":"typing","correct_answers":["my sister and I are friends"],"case_sensitive":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Korrigiere: "my sister and i are friends"', '{"type":"typing","correct_answers":["my sister and I are friends"],"case_sensitive":true}'::jsonb);

-- 13. Typing (case_sensitive)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "Can ___ help you?" (¿Puedo ayudarte?)', '{"type":"typing","correct_answers":["I"],"case_sensitive":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "Can ___ help you?" (Kann ich dir helfen?)', '{"type":"typing","correct_answers":["I"],"case_sensitive":true}'::jsonb);

-- 14. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Identifica la opción correcta:', '{"type":"multiple_choice","options":["i am happy","I am happy","am I happy"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Identifiziere die richtige Option:', '{"type":"multiple_choice","options":["i am happy","I am happy","am I happy"],"answer":1}'::jsonb);

-- 15. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"___ am 25 years old." (Yo)', '{"type":"multiple_choice","options":["i","I","me"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"___ am 25 years old." (Ich)', '{"type":"multiple_choice","options":["i","I","me"],"answer":1}'::jsonb);

-- 16. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Selecciona la respuesta correcta:', '{"type":"multiple_choice","options":["Yes, i think so","Yes, I think so"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Wähle die richtige Antwort:', '{"type":"multiple_choice","options":["Yes, i think so","Yes, I think so"],"answer":1}'::jsonb);

-- 17. Scramble: chunks:["hungry","am","I"] correct_order:[2,1,0]
-- pos0=chunk[2]="I", pos1=chunk[1]="am", pos2=chunk[0]="hungry" -> "I am hungry"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Yo tengo hambre"', '{"type":"scramble","chunks":["hungry","am","I"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Ich habe Hunger"', '{"type":"scramble","chunks":["hungry","am","I"],"correct_order":[2,1,0]}'::jsonb);

-- 18. Scramble: chunks:["and I","are friends","She"] correct_order:[2,0,1]
-- pos0=chunk[2]="She", pos1=chunk[0]="and I", pos2=chunk[1]="are friends" -> "She and I are friends"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ella y yo somos amigas"', '{"type":"scramble","chunks":["and I","are friends","She"],"correct_order":[2,0,1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Sie und ich sind Freundinnen"', '{"type":"scramble","chunks":["and I","are friends","She"],"correct_order":[2,0,1]}'::jsonb);

-- 19. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"I" se escribe en minúscula cuando está en medio de la oración.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"I" wird kleingeschrieben, wenn es in der Mitte des Satzes steht.', '{"type":"true_false","answer":false}'::jsonb);

-- 20. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Yesterday, i went to school" contiene un error ortográfico.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"Yesterday, i went to school" enthält einen Rechtschreibfehler.', '{"type":"true_false","answer":true}'::jsonb);

-- ==========================================
-- REGLA 3: POSICIÓN DEL OBJETO (v_rule3_id)
-- ==========================================

-- 21. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "Call ___ (a mí) later."', '{"type":"typing","correct_answers":["me"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "Call ___ (mich) later."', '{"type":"typing","correct_answers":["me"],"case_sensitive":false}'::jsonb);

-- 22. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Traduce: "Escúchala" -> "Listen to ___"', '{"type":"typing","correct_answers":["her"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Übersetze: "Hör ihr zu" -> "Listen to ___"', '{"type":"typing","correct_answers":["her"],"case_sensitive":false}'::jsonb);

-- 23. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "I need ___ (a ellos) now."', '{"type":"typing","correct_answers":["them"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "I need ___ (sie/pl.) now."', '{"type":"typing","correct_answers":["them"],"case_sensitive":false}'::jsonb);

-- 24. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'I see ___ (a él) every day.', '{"type":"multiple_choice","options":["he","him","his"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'I see ___ (ihn) every day.', '{"type":"multiple_choice","options":["he","him","his"],"answer":1}'::jsonb);

-- 25. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Tell ___ the truth. (a nosotros)', '{"type":"multiple_choice","options":["we","us","our"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Tell ___ the truth. (uns)', '{"type":"multiple_choice","options":["we","us","our"],"answer":1}'::jsonb);

-- 26. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'She invited ___ (a mí).', '{"type":"multiple_choice","options":["I","me","my"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'She invited ___ (mich).', '{"type":"multiple_choice","options":["I","me","my"],"answer":1}'::jsonb);

-- 27. Scramble: chunks:["her","Help"] correct_order:[1,0]
-- pos0=chunk[1]="Help", pos1=chunk[0]="her" -> "Help her"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ayúdala"', '{"type":"scramble","chunks":["her","Help"],"correct_order":[1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Hilf ihr"', '{"type":"scramble","chunks":["her","Help"],"correct_order":[1,0]}'::jsonb);

-- 28. Scramble: chunks:["you","hear","I"] correct_order:[2,1,0]
-- pos0=chunk[2]="I", pos1=chunk[1]="hear", pos2=chunk[0]="you" -> "I hear you"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Yo te escucho"', '{"type":"scramble","chunks":["you","hear","I"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Ich höre dich"', '{"type":"scramble","chunks":["you","hear","I"],"correct_order":[2,1,0]}'::jsonb);

-- 29. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'El pronombre de objeto va siempre antes del verbo.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Das Objektpronomen steht immer vor dem Verb.', '{"type":"true_false","answer":false}'::jsonb);

-- 30. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"She knows him" es una oración correcta.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"She knows him" ist ein korrekter Satz.', '{"type":"true_false","answer":true}'::jsonb);

-- ==========================================
-- REGLA 4: USO DE "IT" NEUTRO (v_rule4_id)
-- ==========================================

-- 31. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ is raining today." (Está lloviendo)', '{"type":"typing","correct_answers":["It"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "___ is raining today." (Es regnet)', '{"type":"typing","correct_answers":["It"],"case_sensitive":false}'::jsonb);

-- 32. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ is Monday today." (Hoy es lunes)', '{"type":"typing","correct_answers":["It"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "___ is Monday today." (Heute ist Montag)', '{"type":"typing","correct_answers":["It"],"case_sensitive":false}'::jsonb);

-- 33. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "The coffee is hot. Don''t drink ___."', '{"type":"typing","correct_answers":["it"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "The coffee is hot. Don''t drink ___."', '{"type":"typing","correct_answers":["it"],"case_sensitive":false}'::jsonb);

-- 34. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"The car is fast. ___ is also expensive."', '{"type":"multiple_choice","options":["He","She","It"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"The car is fast. ___ is also expensive."', '{"type":"multiple_choice","options":["He","She","It"],"answer":2}'::jsonb);

-- 35. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '¿Cómo dirías "Es tarde"?', '{"type":"multiple_choice","options":["He is late","It is late","Is late"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Wie würdest du "Es ist spät" sagen?', '{"type":"multiple_choice","options":["He is late","It is late","Is late"],"answer":1}'::jsonb);

-- 36. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"I found a cat. ___ is very small."', '{"type":"multiple_choice","options":["He","She","It"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"I found a cat. ___ is very small."', '{"type":"multiple_choice","options":["He","She","It"],"answer":2}'::jsonb);

-- 37. Scramble: chunks:["snowing","is","It"] correct_order:[2,1,0]
-- pos0=chunk[2]="It", pos1=chunk[1]="is", pos2=chunk[0]="snowing" -> "It is snowing"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Está nevando"', '{"type":"scramble","chunks":["snowing","is","It"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Es schneit"', '{"type":"scramble","chunks":["snowing","is","It"],"correct_order":[2,1,0]}'::jsonb);

-- 38. Scramble: chunks:["it","Buy"] correct_order:[1,0]
-- pos0=chunk[1]="Buy", pos1=chunk[0]="it" -> "Buy it"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Cómpralo"', '{"type":"scramble","chunks":["it","Buy"],"correct_order":[1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Kauf es"', '{"type":"scramble","chunks":["it","Buy"],"correct_order":[1,0]}'::jsonb);

-- 39. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Los objetos inanimados como "la silla" o "el libro" usan "it" en inglés.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Unbelebte Objekte wie "der Stuhl" oder "das Buch" verwenden im Englischen "it".', '{"type":"true_false","answer":true}'::jsonb);

-- 40. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Está lloviendo" se traduce como "He is raining".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"Es regnet" wird als "He is raining" übersetzt.', '{"type":"true_false","answer":false}'::jsonb);

-- ==========================================
-- REGLA 5: OBJETOS TRAS PREPOSICIONES (v_rule5_id)
-- ==========================================

-- 41. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "Between you and ___ (yo)."', '{"type":"typing","correct_answers":["me"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "Between you and ___ (mir)."', '{"type":"typing","correct_answers":["me"],"case_sensitive":false}'::jsonb);

-- 42. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "This gift is for ___ (ella)."', '{"type":"typing","correct_answers":["her"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "This gift is for ___ (ihr)."', '{"type":"typing","correct_answers":["her"],"case_sensitive":false}'::jsonb);

-- 43. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "I''m thinking of ___ (ti)."', '{"type":"typing","correct_answers":["you"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "I''m thinking of ___ (dich)."', '{"type":"typing","correct_answers":["you"],"case_sensitive":false}'::jsonb);

-- 44. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Wait for ___ (él).', '{"type":"multiple_choice","options":["he","him"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Wait for ___ (ihn).', '{"type":"multiple_choice","options":["he","him"],"answer":1}'::jsonb);

-- 45. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Come with ___ (nosotros).', '{"type":"multiple_choice","options":["we","us"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Come with ___ (uns).', '{"type":"multiple_choice","options":["we","us"],"answer":1}'::jsonb);

-- 46. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'He is angry at ___ (ellos).', '{"type":"multiple_choice","options":["they","them"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'He is angry at ___ (sie/pl.).', '{"type":"multiple_choice","options":["they","them"],"answer":1}'::jsonb);

-- 47. Scramble: chunks:["me","near","Sit"] correct_order:[2,1,0]
-- pos0=chunk[2]="Sit", pos1=chunk[1]="near", pos2=chunk[0]="me" -> "Sit near me"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Siéntate cerca de mí"', '{"type":"scramble","chunks":["me","near","Sit"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Setz dich neben mich"', '{"type":"scramble","chunks":["me","near","Sit"],"correct_order":[2,1,0]}'::jsonb);

-- 48. Scramble: chunks:["them","Talk","to"] correct_order:[1,2,0]
-- pos0=chunk[1]="Talk", pos1=chunk[2]="to", pos2=chunk[0]="them" -> "Talk to them"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Habla con ellos"', '{"type":"scramble","chunks":["them","Talk","to"],"correct_order":[1,2,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Sprich mit ihnen"', '{"type":"scramble","chunks":["them","Talk","to"],"correct_order":[1,2,0]}'::jsonb);

-- 49. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Después de preposiciones como "for" o "with" se usa pronombre de sujeto.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Nach Präpositionen wie "for" oder "with" verwendet man das Subjektpronomen.', '{"type":"true_false","answer":false}'::jsonb);

-- 50. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Look at they" es incorrecto; lo correcto es "Look at them".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"Look at they" ist falsch; richtig ist "Look at them".', '{"type":"true_false","answer":true}'::jsonb);

-- ==========================================
-- REGLA 6: SUJETO VS OBJETO (v_rule6_id)
-- ==========================================

-- 51. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Ellos) invited ___ (a nosotros)."', '{"type":"typing","correct_answers":["They invited us"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "___ (Sie/pl.) invited ___ (uns)."', '{"type":"typing","correct_answers":["They invited us"],"case_sensitive":false}'::jsonb);

-- 52. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Yo) want ___ (eso)."', '{"type":"typing","correct_answers":["I want it"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "___ (Ich) want ___ (es)."', '{"type":"typing","correct_answers":["I want it"],"case_sensitive":false}'::jsonb);

-- 53. Typing
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Nosotros) miss ___ (a ellos)."', '{"type":"typing","correct_answers":["We miss them"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ergänze: "___ (Wir) miss ___ (sie/pl.)."', '{"type":"typing","correct_answers":["We miss them"],"case_sensitive":false}'::jsonb);

-- 54. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '___ (Él) saw ___ (a mí).', '{"type":"multiple_choice","options":["He / me","Him / I","He / I"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '___ (Er) saw ___ (mich).', '{"type":"multiple_choice","options":["He / me","Him / I","He / I"],"answer":0}'::jsonb);

-- 55. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '___ (Ella) loves ___ (a él).', '{"type":"multiple_choice","options":["She / him","Her / he","She / he"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '___ (Sie/weibl.) loves ___ (ihn).', '{"type":"multiple_choice","options":["She / him","Her / he","She / he"],"answer":0}'::jsonb);

-- 56. Multiple Choice
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '___ (Nosotros) need ___ (a ti).', '{"type":"multiple_choice","options":["We / you","Us / you","We / your"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '___ (Wir) need ___ (dich).', '{"type":"multiple_choice","options":["We / you","Us / you","We / your"],"answer":0}'::jsonb);

-- 57. Scramble: chunks:["know","him","We"] correct_order:[2,0,1]
-- pos0=chunk[2]="We", pos1=chunk[0]="know", pos2=chunk[1]="him" -> "We know him"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Nosotros lo conocemos"', '{"type":"scramble","chunks":["know","him","We"],"correct_order":[2,0,1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Wir kennen ihn"', '{"type":"scramble","chunks":["know","him","We"],"correct_order":[2,0,1]}'::jsonb);

-- 58. Scramble: chunks:["us","hates","She"] correct_order:[2,1,0]
-- pos0=chunk[2]="She", pos1=chunk[1]="hates", pos2=chunk[0]="us" -> "She hates us"
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ella nos odia"', '{"type":"scramble","chunks":["us","hates","She"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', 'Ordne: "Sie hasst uns"', '{"type":"scramble","chunks":["us","hates","She"],"correct_order":[2,1,0]}'::jsonb);

-- 59. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Me like them" es correcto en inglés informal.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"Me like them" ist im informellen Englisch korrekt.', '{"type":"true_false","answer":false}'::jsonb);

-- 60. True/False
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Us are here" es incorrecto porque "us" es pronombre de objeto.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES 
(v_ex_id, 'de', '"Us are here" ist falsch, weil "us" ein Objektpronomen ist.', '{"type":"true_false","answer":true}'::jsonb);

END;
$seed$;
