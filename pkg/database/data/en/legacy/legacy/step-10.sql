-- ============================================================
-- Seed: A0 English Path – STEP 15: Grammar – El Imperativo Simple en Inglés
-- Source language: Spanish
-- ============================================================

DO $$
DECLARE
  v_path_id  UUID;
  v_grammar15_id UUID;
  v_rule1_id UUID;
  v_rule2_id UUID;
  v_rule3_id UUID;
  v_rule4_id UUID;
  v_ex_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- ── STEP 15: Grammar – El Imperativo Simple en Inglés ───────────────────────
-- ============================================================================

INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 15, 'en', 'grammar') 
RETURNING uuid INTO v_grammar15_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
  v_grammar15_id, 
  'es', 
  'El Imperativo Simple', 
  'Aprende a dar órdenes, instrucciones, consejos y a hacer sugerencias utilizando el modo imperativo en inglés.', 
  to_jsonb( '# Grammar Lesson: The Simple Imperative

El **Imperativo** se utiliza en inglés para dar órdenes, instrucciones, advertencias o consejos directos. Es una de las formas gramaticales más sencillas porque **no utiliza un pronombre de sujeto** (como *you*, *he*, *we*) y el verbo no cambia.

--------------------------------------------------------------------------------

#### 1. Affirmative Imperative (Imperativo Afirmativo)
Para decirle a alguien que haga algo, simplemente usamos el verbo en su forma base (infinitivo sin "to") directamente al principio de la frase.

| Estructura | Ejemplo | Español |
| :--- | :--- | :--- |
| **Verbo base** + complemento | **Come** here! | ¡Ven aquí! |
| **Verbo base** + complemento | **Listen** to me. | Escúchame. |
| **Verbo base** + complemento | **Open** your book. | Abre tu libro. |

*   *Dato clave:* Aunque le estés hablando a una persona (tú) o a varias (vosotros/ustedes), la forma es exactamente la misma.

--------------------------------------------------------------------------------

#### 2. Negative Imperative (Imperativo Negativo)
Para decirle a alguien que **NO** haga algo, siempre utilizamos **"Do not"** o su contracción mucho más común: **"Don''t"**, seguido del verbo en su forma base.

| Estructura | Ejemplo | Español |
| :--- | :--- | :--- |
| **Don''t** + Verbo base | **Don''t** touch that! | ¡No toques eso! |
| **Don''t** + Verbo base | **Don''t** be late. | No llegues tarde. |
| **Do not** + Verbo base | **Do not** smoke here. | No fume aquí. (Más formal) |

--------------------------------------------------------------------------------

#### 3. Polite Requests (Peticiones Educadas)
El imperativo puede sonar muy rudo o autoritario. Para suavizar la orden y convertirla en una petición amable, simplemente añadimos la palabra **"Please"** (por favor) al principio o al final de la frase.

*   **Please**, sit down. (Por favor, siéntate).
*   Help me, **please**. (Ayúdame, por favor).
*   **Please**, don''t talk loudly. (Por favor, no hables fuerte).

--------------------------------------------------------------------------------

#### 4. Suggestions with "Let''s" (Sugerencias incluyéndote a ti)
Si quieres dar una orden o sugerencia en la que **tú también estás incluido** (equivalente a "Nosotros"), utilizamos **"Let''s"** (que es la contracción de *Let us*).

*   **Afirmativo:** Let''s + verbo base.
    *   **Let''s** go! (¡Vámonos! / ¡Vamos!)
    *   **Let''s** eat pizza tonight. (Comamos pizza esta noche).

*   **Negativo:** Let''s + not + verbo base.
    *   **Let''s not** argue. (No discutamos).
    *   **Let''s not** wait. (No esperemos).
'::text) 
);

-- ============================================================================
-- Insertando las Reglas de la Gramática (Usando CTE para generación masiva)
-- ============================================================================
WITH gr AS (
  INSERT INTO grammar_rule (grammar_id, source_language) 
  VALUES 
    (v_grammar15_id, 'en'),
    (v_grammar15_id, 'en'),
    (v_grammar15_id, 'en'),
    (v_grammar15_id, 'en')
  RETURNING uuid
), 
gr_numbered AS (
  SELECT uuid, ROW_NUMBER() OVER () as rn FROM gr
)
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback)
SELECT uuid, 'es',
  CASE rn 
    WHEN 1 THEN 'Ausencia de sujeto explícito' 
    WHEN 2 THEN 'Negación con Don''t' 
    WHEN 3 THEN 'Peticiones amables con Please' 
    WHEN 4 THEN 'Sugerencias con Let''s' 
  END,
  CASE rn 
    WHEN 1 THEN 'En el imperativo NUNCA se usa el pronombre (ej: "You open the door" es incorrecto como orden. Lo correcto es "Open the door").' 
    WHEN 2 THEN 'Para dar una orden negativa siempre debes usar "Don''t" antes del verbo (ej: "Don''t run", no "No run").' 
    WHEN 3 THEN 'Si la orden suena muy brusca, recuerda usar "please" al inicio o al final de la frase para hacerla educada.' 
    WHEN 4 THEN 'Usa "Let''s" cuando quieras proponer una acción que también te incluya a ti (ej: "Let''s go to the park"). Su forma negativa es "Let''s not".' 
  END
FROM gr_numbered;


-- ============================================================================
-- >>> EJERCICIOS PARA STEP 15: EL IMPERATIVO SIMPLE <<<
-- ============================================================================

-- 0. Recuperar los UUIDs de las reglas del Imperativo (Grammar 15)
SELECT grammar_rule_id INTO v_rule1_id FROM grammar_rule_translation WHERE title = 'Ausencia de sujeto explícito' LIMIT 1;
SELECT grammar_rule_id INTO v_rule2_id FROM grammar_rule_translation WHERE title = 'Negación con Don''t' LIMIT 1;
SELECT grammar_rule_id INTO v_rule3_id FROM grammar_rule_translation WHERE title = 'Peticiones amables con Please' LIMIT 1;
SELECT grammar_rule_id INTO v_rule4_id FROM grammar_rule_translation WHERE title = 'Sugerencias con Let''s' LIMIT 1;

-- 1. Escritura (Typing)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el verbo correcto para dar la orden: ___ (abrir) the door.', '{"type":"typing","correct_answers":["open","Open"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa con la negación correcta: ___ touch that.', '{"type":"typing","correct_answers":["don''t","do not"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa la sugerencia (Vamos a la playa): ___ go to the beach.', '{"type":"typing","correct_answers":["let''s","lets"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Haz que la orden "Help me" sea educada añadiendo una palabra al final:', '{"type":"typing","correct_answers":["please"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe la forma negativa para "Be late" (llegar tarde): ___ be late.', '{"type":"typing","correct_answers":["don''t","do not"],"case_sensitive":false}'::jsonb);

-- 2. Selección Múltiple (Multiple Choice)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se dice correctamente "Siéntate"?', '{"type":"multiple_choice","options":["You sit down","Sit down","Sitting down"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es la forma correcta de decir "No corras"?', '{"type":"multiple_choice","options":["No run","Not run","Don''t run"],"answer":2}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo sugieres "Comamos"?', '{"type":"multiple_choice","options":["We eat","Let''s eat","Eat we"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la petición educada correcta:', '{"type":"multiple_choice","options":["Listen please you","Please listen","Listen you please"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la palabra correcta: "___ quiet!" (¡Guarda silencio!)', '{"type":"multiple_choice","options":["You be","Are","Be"],"answer":2}'::jsonb);

-- 3. Verdadero o Falso (True/False)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En una oración imperativa es obligatorio incluir el pronombre "You" (ej. You come here).', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para dar una orden negativa en inglés siempre utilizamos "Don''t".', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Usamos "Let''s" cuando queremos hacer una sugerencia que nos incluye a nosotros mismos.', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Decir "No smoke" es la forma gramaticalmente correcta de prohibir fumar.', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Añadir "please" al principio o final de un imperativo suaviza la orden.', '{"type":"true_false","answer":true}'::jsonb);

-- 4. Ordenar (Scramble)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena las palabras para formar la orden: "Cierra la puerta."', '{"type":"scramble","chunks":["the","door.","Close"],"answer":[10, 11]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena las palabras para formar la prohibición: "No corras adentro."', '{"type":"scramble","chunks":["inside.","Don''t","run"],"answer":[10, 11]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena las palabras para formar la petición amable:', '{"type":"scramble","chunks":["me.","Please","help"],"answer":[10, 11]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena las palabras para formar la sugerencia: "Vámonos a casa."', '{"type":"scramble","chunks":["home.","go","Let''s"],"answer":[10, 11]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar15_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena las palabras para formar la advertencia: "No llegues tarde."', '{"type":"scramble","chunks":["be","late.","Don''t"],"answer":[10, 11]}'::jsonb);

END;
$$;
