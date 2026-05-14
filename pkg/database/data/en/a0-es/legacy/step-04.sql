-- ============================================================
-- Seed: A0 English Path – STEP 6: Grammar – Pronombres Personales
-- Source language: Spanish
-- ============================================================

DO $$
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
  INSERT INTO grammar (path_id, step_order, source_language, type)
  VALUES (
    v_path_id,
    4,
    'en',
    'grammar'
  )
  RETURNING uuid INTO v_grammar1_id;

  INSERT INTO grammar_translation (grammar_id, language, title, description, content)
  VALUES (
    v_grammar1_id,
    'es',
    'Pronombres Personales: Sujeto y Objeto',
    'Aprende los pronombres personales en inglés y cuándo usar cada uno.',
    to_jsonb('## Grammar Lesson: Personal Pronouns

Aprende a diferenciar quién hace la acción (Sujeto) y quién la recibe (Objeto). En inglés americano, a diferencia del español, **siempre** es obligatorio mencionar al sujeto para que la frase sea clara.

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

### Usos Prácticos (Real-life Context) 🇺🇸
En el día a día americano, usamos los pronombres de objeto para ser eficientes y evitar repetir nombres propios:

* **En el café:** "I''ll take the latte. Please, give **it** to **me** with oat milk."
* **Presentando amigos:** "This is Sarah. I work with **her**."
* **En el gym:** "Those weights are heavy. Don''t lift **them** alone!'::text)
  );

  -- REGLA 1: El sujeto nunca se omite
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id;
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Sujeto Obligatorio', 'En inglés no existe el sujeto tácito. Debes incluir siempre un pronombre (ej: It is raining) antes del verbo.');

-- REGLA 2: Pronombre "I" siempre en mayúscula
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id;
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Mayúscula en el pronombre I', 'El pronombre "I" (yo) siempre debe escribirse en mayúscula, sin importar si está al inicio o en medio de la oración.');


-- REGLA 3: Posición del Pronombre de Objeto
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id;
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Posición del Objeto', 'Los pronombres de objeto (me, him, her, etc.) deben ir después del verbo o de una preposición (ej: call me / for him).');

-- REGLA 4: Uso de "It" para neutros
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id;
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Uso de It (Neutro)', 'Usa "It" para referirte a objetos, animales o situaciones. No uses "He" o "She" para cosas inanimadas.');

-- REGLA 5: Pronombres tras preposiciones
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule5_id;
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Objetos tras Preposiciones', 'Después de preposiciones como "between", "with" o "for", debes usar siempre el pronombre de objeto (ej: between you and me).');

-- REGLA 6: Confusión Sujeto vs Objeto
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule6_id;
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule6_id, 'es', 'Sujeto vs Objeto', 'No confundas la función: usa Subject Pronouns para quien hace la acción y Object Pronouns para quien la recibe.');

-- ==========================================
-- REGLA 1: SUJETO OBLIGATORIO (v_rule1_id) - 17 Ejercicios
-- ==========================================

-- 1. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ am a student."', '{"type":"typing","correct_answers":["I"],"case_sensitive":false}'::jsonb);

-- 2. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '¿Cómo se dice "Está nevando"?', '{"type":"multiple_choice","options":["Is snowing","It is snowing","Snowing"],"answer":1}'::jsonb);

-- 3. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ellos son amables"', '{"type":"scramble","chunks":["kind","They","are"],"correct_order":[1,2,0]}'::jsonb);

-- 4. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'En inglés se puede omitir el sujeto si ya se sabe de quién hablamos.', '{"type":"true_false","answer":false}'::jsonb);

-- 5. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Traduce el sujeto: "___ (Ella) is my boss."', '{"type":"typing","correct_answers":["She"],"case_sensitive":false}'::jsonb);

-- 6. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"___ are from Spain." (Nosotros)', '{"type":"multiple_choice","options":["Us","We","Our"],"answer":1}'::jsonb);

-- 7. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Tú eres genial"', '{"type":"scramble","chunks":["great","are","You"],"correct_order":[2,1,0]}'::jsonb);

-- 8. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'La frase "Is 5 o''clock" es correcta.', '{"type":"true_false","answer":false}'::jsonb);

-- 9. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Él) works in New York."', '{"type":"typing","correct_answers":["He"],"case_sensitive":false}'::jsonb);

-- 10. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"___ is very hot outside." (Hace calor)', '{"type":"multiple_choice","options":["It","He","Is"],"answer":0}'::jsonb);

-- 11. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Yo vivo aquí"', '{"type":"scramble","chunks":["live","I","here"],"correct_order":[1,0,2]}'::jsonb);

-- 12. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Traduce: "___ (Ustedes) are invited."', '{"type":"typing","correct_answers":["You"],"case_sensitive":false}'::jsonb);

-- 13. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"___ play soccer." (Ellas)', '{"type":"multiple_choice","options":["Them","They","Her"],"answer":1}'::jsonb);

-- 14. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ella corre rápido"', '{"type":"scramble","chunks":["fast","runs","She"],"correct_order":[2,1,0]}'::jsonb);

-- 15. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Sujeto + Verbo es la estructura básica obligatoria.', '{"type":"true_false","answer":true}'::jsonb);

-- 16. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '___ (Nosotros) love English.', '{"type":"multiple_choice","options":["Us","We","They"],"answer":1}'::jsonb);

-- 17. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Él) is my father."', '{"type":"typing","correct_answers":["He"],"case_sensitive":false}'::jsonb);

-- ==========================================
-- REGLA 2: MAYÚSCULA EN "I" (v_rule2_id) - 16 Ejercicios
-- ==========================================

-- 18. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Escribe el pronombre "yo" correctamente:', '{"type":"typing","correct_answers":["I"],"case_sensitive":true}'::jsonb);

-- 19. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Identifica la correcta:', '{"type":"multiple_choice","options":["i am happy","I am happy","am I happy"],"answer":1}'::jsonb);

-- 20. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Yo nado"', '{"type":"scramble","chunks":["swim","I"],"correct_order":[1,0]}'::jsonb);

-- 21. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'El pronombre "i" puede ir en minúscula si está en medio de la frase.', '{"type":"true_false","answer":false}'::jsonb);

-- 22. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Corrige: "my brother and i"', '{"type":"typing","correct_answers":["my brother and I"],"case_sensitive":true}'::jsonb);

-- 23. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '¿Cómo escribes "Yo"?', '{"type":"multiple_choice","options":["i","I"],"answer":1}'::jsonb);

-- 24. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Tú y yo"', '{"type":"scramble","chunks":["I","and","You"],"correct_order":[2,1,0]}'::jsonb);

-- 25. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'El pronombre "I" siempre es mayúscula.', '{"type":"true_false","answer":true}'::jsonb);

-- 26. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "Can ___ help you?" (¿Puedo ayudarte?)', '{"type":"typing","correct_answers":["I"],"case_sensitive":true}'::jsonb);

-- 27. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Selecciona la correcta:', '{"type":"multiple_choice","options":["Yes, i do","Yes, I do"],"answer":1}'::jsonb);

-- 28. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Yo pienso"', '{"type":"scramble","chunks":["think","I"],"correct_order":[1,0]}'::jsonb);

-- 29. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Escribe "Yo" en inglés:', '{"type":"typing","correct_answers":["I"],"case_sensitive":true}'::jsonb);

-- 30. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"___ am here." (Yo)', '{"type":"multiple_choice","options":["i","I","me"],"answer":1}'::jsonb);

-- 31. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Él y yo"', '{"type":"scramble","chunks":["and","He","I"],"correct_order":[1,0,2]}'::jsonb);

-- 32. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'El pronombre "me" es siempre mayúscula.', '{"type":"true_false","answer":false}'::jsonb);

-- 33. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Corrige: "am i late?"', '{"type":"typing","correct_answers":["Am I late?"],"case_sensitive":true}'::jsonb);

-- ==========================================
-- REGLA 3: POSICIÓN DEL OBJETO (v_rule3_id) - 17 Ejercicios
-- ==========================================

-- 34. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "Call ___ (a mí) later."', '{"type":"typing","correct_answers":["me"],"case_sensitive":false}'::jsonb);

-- 35. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'I see ___ (a él) every day.', '{"type":"multiple_choice","options":["he","him","his"],"answer":1}'::jsonb);

-- 36. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Búscala"', '{"type":"scramble","chunks":["her","Look","for"],"correct_order":[1,2,0]}'::jsonb);

-- 37. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'El pronombre de objeto va después del verbo.', '{"type":"true_false","answer":true}'::jsonb);

-- 38. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Traduce: "Escúchanos" -> "Listen to ___"', '{"type":"typing","correct_answers":["us"],"case_sensitive":false}'::jsonb);

-- 39. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'I know ___ (a ellas).', '{"type":"multiple_choice","options":["they","them","their"],"answer":1}'::jsonb);

-- 40. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ayúdalos"', '{"type":"scramble","chunks":["Them","Help"],"correct_order":[1,0]}'::jsonb);

-- 41. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "I love ___ (a ella)."', '{"type":"typing","correct_answers":["her"],"case_sensitive":false}'::jsonb);

-- 42. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Tell ___ the truth. (a nosotros)', '{"type":"multiple_choice","options":["we","us","our"],"answer":1}'::jsonb);

-- 43. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Te escucho"', '{"type":"scramble","chunks":["hear","I","you"],"correct_order":[1,0,2]}'::jsonb);

-- 44. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"He likes I" es gramaticalmente correcto.', '{"type":"true_false","answer":false}'::jsonb);

-- 45. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "Watch ___ (a él)."', '{"type":"typing","correct_answers":["him"],"case_sensitive":false}'::jsonb);

-- 46. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Did you see ___? (a nosotros)', '{"type":"multiple_choice","options":["we","us"],"answer":1}'::jsonb);

-- 47. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Bésame"', '{"type":"scramble","chunks":["me","Kiss"],"correct_order":[1,0]}'::jsonb);

-- 48. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Traduce: "Entiéndelo" -> "Understand ___"', '{"type":"typing","correct_answers":["it"],"case_sensitive":false}'::jsonb);

-- 49. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Call ___ (a ellos) tonight.', '{"type":"multiple_choice","options":["them","they"],"answer":0}'::jsonb);

-- 50. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Confía en mí"', '{"type":"scramble","chunks":["me","Trust"],"correct_order":[1,0]}'::jsonb);

-- ==========================================
-- REGLA 4: USO DE "IT" NEUTRO (v_rule4_id) - 17 Ejercicios
-- ==========================================

-- 51. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Pronombre para "the book":', '{"type":"typing","correct_answers":["it"],"case_sensitive":false}'::jsonb);

-- 52. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"The car is fast. ___ is red."', '{"type":"multiple_choice","options":["He","She","It"],"answer":2}'::jsonb);

-- 53. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Es un perro"', '{"type":"scramble","chunks":["a","is","dog","It"],"correct_order":[3,1,0,2]}'::jsonb);

-- 54. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"It" se usa para personas desconocidas.', '{"type":"true_false","answer":false}'::jsonb);

-- 55. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Pronombre para "the table":', '{"type":"typing","correct_answers":["it"],"case_sensitive":false}'::jsonb);

-- 56. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Look at the moon. ___ is beautiful."', '{"type":"multiple_choice","options":["It","She","He"],"answer":0}'::jsonb);

-- 57. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Cómelo"', '{"type":"scramble","chunks":["it","Eat"],"correct_order":[1,0]}'::jsonb);

-- 58. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "The water is hot. Don''t drink ___."', '{"type":"typing","correct_answers":["it"],"case_sensitive":false}'::jsonb);

-- 59. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '¿Cómo dirías "Es fácil"?', '{"type":"multiple_choice","options":["He is easy","It is easy","Is easy"],"answer":1}'::jsonb);

-- 60. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Patea la pelota" -> "Kick it"', '{"type":"scramble","chunks":["it","Kick"],"correct_order":[1,0]}'::jsonb);

-- 61. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Las cosas en inglés tienen género masculino o femenino.', '{"type":"true_false","answer":false}'::jsonb);

-- 62. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Pronombre para "the rain":', '{"type":"typing","correct_answers":["it"],"case_sensitive":false}'::jsonb);

-- 63. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"I found a wallet. I gave ___ to the police."', '{"type":"multiple_choice","options":["him","it","her"],"answer":1}'::jsonb);

-- 64. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Léelo"', '{"type":"scramble","chunks":["it","Read"],"correct_order":[1,0]}'::jsonb);

-- 65. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "The cake is for you. Eat ___!"', '{"type":"typing","correct_answers":["it"],"case_sensitive":false}'::jsonb);

-- 66. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Where is my phone?" -> "I have ___."', '{"type":"multiple_choice","options":["it","him","me"],"answer":0}'::jsonb);

-- 67. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ábrelo"', '{"type":"scramble","chunks":["Open","it"],"correct_order":[0,1]}'::jsonb);

-- ==========================================
-- REGLA 5: PREPOSICIONES + OBJETO (v_rule5_id) - 16 Ejercicios
-- ==========================================

-- 68. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "Between you and ___ (yo)"', '{"type":"typing","correct_answers":["me"],"case_sensitive":false}'::jsonb);

-- 69. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Wait for ___ (él).', '{"type":"multiple_choice","options":["he","him"],"answer":1}'::jsonb);

-- 70. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ven con nosotros"', '{"type":"scramble","chunks":["with","us","Come"],"correct_order":[2,0,1]}'::jsonb);

-- 71. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Después de "for" se puede usar "I".', '{"type":"true_false","answer":false}'::jsonb);

-- 72. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "This is for ___ (ella)."', '{"type":"typing","correct_answers":["her"],"case_sensitive":false}'::jsonb);

-- 73. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Look at ___ (ellos).', '{"type":"multiple_choice","options":["them","they"],"answer":0}'::jsonb);

-- 74. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Escucha a él"', '{"type":"scramble","chunks":["him","to","Listen"],"correct_order":[2,1,0]}'::jsonb);

-- 75. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "I went with ___ (ellos)."', '{"type":"typing","correct_answers":["them"],"case_sensitive":false}'::jsonb);

-- 76. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Give it to ___ (a mí).', '{"type":"multiple_choice","options":["I","me"],"answer":1}'::jsonb);

-- 77. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Siéntate cerca de mí"', '{"type":"scramble","chunks":["me","near","Sit"],"correct_order":[2,1,0]}'::jsonb);

-- 78. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Las preposiciones exigen pronombres de objeto.', '{"type":"true_false","answer":true}'::jsonb);

-- 79. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "Talk to ___ (a nosotros)."', '{"type":"typing","correct_answers":["us"],"case_sensitive":false}'::jsonb);

-- 80. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Are you for or against ___ (nosotros)?', '{"type":"multiple_choice","options":["we","us"],"answer":1}'::jsonb);

-- 81. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Vete con ella"', '{"type":"scramble","chunks":["Go","her","with"],"correct_order":[0,2,1]}'::jsonb);

-- 82. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "I''m thinking of ___ (ti)."', '{"type":"typing","correct_answers":["you"],"case_sensitive":false}'::jsonb);

-- 83. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'He is behind ___ (ellos).', '{"type":"multiple_choice","options":["them","they"],"answer":0}'::jsonb);

-- ==========================================
-- REGLA 6: SUJETO VS OBJETO (v_rule6_id) - 17 Ejercicios
-- ==========================================

-- 84. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '___ (Él) saw ___ (a mí).', '{"type":"multiple_choice","options":["He / me","Him / I","He / I"],"answer":0}'::jsonb);

-- 85. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Ellos) invited ___ (a nosotros)."', '{"type":"typing","correct_answers":["They invited us"],"case_sensitive":false}'::jsonb);

-- 86. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Nosotros lo conocemos"', '{"type":"scramble","chunks":["know","him","We"],"correct_order":[2,0,1]}'::jsonb);

-- 87. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Me like them" es correcto en lenguaje informal.', '{"type":"true_false","answer":false}'::jsonb);

-- 88. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '___ (Ella) loves ___ (a él).', '{"type":"multiple_choice","options":["She / him","Her / he","She / he"],"answer":0}'::jsonb);

-- 89. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Yo) want ___ (eso)."', '{"type":"typing","correct_answers":["I want it"],"case_sensitive":false}'::jsonb);

-- 90. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Él te ve"', '{"type":"scramble","chunks":["you","He","sees"],"correct_order":[1,2,0]}'::jsonb);

-- 91. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '"Us are here" es incorrecto porque "us" es objeto.', '{"type":"true_false","answer":true}'::jsonb);

-- 92. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '___ (Ustedes) called ___ (a ella).', '{"type":"multiple_choice","options":["You / her","You / she","Them / her"],"answer":0}'::jsonb);

-- 93. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Nosotros) miss ___ (a ellos)."', '{"type":"typing","correct_answers":["We miss them"],"case_sensitive":false}'::jsonb);

-- 94. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Ella nos odia"', '{"type":"scramble","chunks":["us","hates","She"],"correct_order":[2,1,0]}'::jsonb);

-- 95. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '¿Cómo respondes "Soy yo" al teléfono?', '{"type":"multiple_choice","options":["It''s I","It''s me"],"answer":1}'::jsonb);

-- 96. Typing
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Completa: "___ (Ellos) found ___ (a mí)."', '{"type":"typing","correct_answers":["They found me"],"case_sensitive":false}'::jsonb);

-- 97. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Tú los necesitas"', '{"type":"scramble","chunks":["need","them","You"],"correct_order":[2,0,1]}'::jsonb);

-- 98. True/False
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Los Subject Pronouns inician la mayoría de las oraciones.', '{"type":"true_false","answer":true}'::jsonb);

-- 99. Multiple Choice
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', '___ (Nosotros) need ___ (a ti).', '{"type":"multiple_choice","options":["We / you","Us / you"],"answer":0}'::jsonb);

-- 100. Scramble
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES 
(v_ex_id, 'es', 'Ordena: "Yo te amo"', '{"type":"scramble","chunks":["love","I","you"],"correct_order":[1,0,2]}'::jsonb);

END;
$$;
