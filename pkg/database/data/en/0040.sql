-- ============================================================
-- Seed: English Path – Step 0040 – Grammar
-- Title:       Pronombres Personales de Sujeto
-- Description: Énfasis en la obligatoriedad del sujeto y la introducción del pronombre impersonal.
-- Source language: en  |  Translation: es
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_grammar_uuid UUID;
  v_rule1_uuid UUID;
  v_rule2_uuid UUID;
  v_rule3_uuid UUID;
  v_ex_uuid UUID;
BEGIN

  SELECT uuid INTO STRICT v_path_uuid
  FROM path
  WHERE source_language = 'en'
  LIMIT 1;

  INSERT INTO grammar (path_uuid, step_order, source_language, type)
  VALUES (v_path_uuid, 40, 'en', 'grammar')
  RETURNING uuid INTO v_grammar_uuid;

  INSERT INTO grammar_translation (grammar_uuid, language, title, content)
  VALUES (
    v_grammar_uuid,
    'es',
    'Pronombres Personales de Sujeto',
    to_jsonb($$
## Pronombres Personales de Sujeto

En inglés el sujeto suele ser obligatorio: cada cláusula necesita un sujeto explícito (pronombre o sustantivo). Esto contrasta con el español, donde a menudo se puede omitir.

### Pronombres personales (sujeto)
- I — yo
- You — tú / usted / vosotros
- He — él
- She — ella
- It — impersonal / ello (no se usa para personas)
- We — nosotros
- They — ellos

### Notas importantes
- El pronombre I siempre se escribe en mayúscula: "I".
- En inglés no se puede omitir el sujeto en la oración.

$$::text)
  );

  -- Regla 1: Sujeto obligatorio
  INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_uuid, 'en') RETURNING uuid INTO v_rule1_uuid;
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
  VALUES (v_rule1_uuid, 'es', 'Sujeto obligatorio', 'En inglés el sujeto no se omite: siempre incluye un pronombre o un nombre al inicio de la oración.');

  -- Regla 2: Pronombres personales (lista y correspondencia)
  INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_uuid, 'en') RETURNING uuid INTO v_rule2_uuid;
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
  VALUES (v_rule2_uuid, 'es', 'Pronombres personales (I/You/He/She/It/We/They)', 'Recuerda usar el pronombre correcto según la persona y número; "it" no se emplea para personas.');

  -- Regla 3: Capitalización de I
  INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_uuid, 'en') RETURNING uuid INTO v_rule3_uuid;
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
  VALUES (v_rule3_uuid, 'es', 'Capitalización de I', 'El pronombre I siempre debe escribirse en mayúscula: "I".');

  -- EJERCICIOS

  -- Pronoun: I (mayúscula obligatoria)
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe el pronombre sujeto en inglés para: "Yo"', '{"type":"typing","correct_answers":["I"],"case_sensitive":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', '¿Cuál es el pronombre sujeto en inglés para "Yo"?', '{"type":"multiple_choice","options":["you","I","they"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: El pronombre I siempre se escribe en mayúscula.', '{"type":"true_false","answer":true}'::jsonb);

  -- Pronoun: You
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe el pronombre sujeto en inglés para: "Tú"', '{"type":"typing","correct_answers":["you"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', '¿Cuál es el pronombre sujeto en inglés para "Tú"?', '{"type":"multiple_choice","options":["you","I","they"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena las letras para formar el pronombre de "Tú"', '{"type":"scramble","chunks":["o","u","y"],"correct_order":[2,0,1]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: La forma correcta para "Tú" es "you".', '{"type":"true_false","answer":true}'::jsonb);

  -- Pronoun: He
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe el pronombre sujeto en inglés para: "Él"', '{"type":"typing","correct_answers":["he"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', '¿Cuál es el pronombre sujeto en inglés para "Él"?', '{"type":"multiple_choice","options":["she","he","it"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena las letras para formar el pronombre de "Él"', '{"type":"scramble","chunks":["e","h"],"correct_order":[1,0]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: La forma correcta para "Él" es "he".', '{"type":"true_false","answer":true}'::jsonb);

  -- Pronoun: She
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe el pronombre sujeto en inglés para: "Ella"', '{"type":"typing","correct_answers":["she"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', '¿Cuál es el pronombre sujeto en inglés para "Ella"?', '{"type":"multiple_choice","options":["he","she","they"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena las letras para formar el pronombre de "Ella"', '{"type":"scramble","chunks":["h","e","s"],"correct_order":[2,0,1]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: La forma correcta para "Ella" es "she".', '{"type":"true_false","answer":true}'::jsonb);

  -- Pronoun: It
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "It" se usa normalmente para personas.', '{"type":"true_false","answer":false}'::jsonb);

  -- Pronoun: We
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe el pronombre sujeto en inglés para: "Nosotros"', '{"type":"typing","correct_answers":["we"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', '¿Cuál es el pronombre sujeto en inglés para "Nosotros"?', '{"type":"multiple_choice","options":["we","I","you"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena las letras para formar el pronombre de "Nosotros"', '{"type":"scramble","chunks":["e","w"],"correct_order":[1,0]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "We" se usa para hablar de un grupo que incluye al hablante.', '{"type":"true_false","answer":true}'::jsonb);

  -- Pronoun: They
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe el pronombre sujeto en inglés para: "Ellos"', '{"type":"typing","correct_answers":["they"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', '¿Cuál es el pronombre sujeto en inglés para "Ellos"?', '{"type":"multiple_choice","options":["they","we","he"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena las letras para formar el pronombre de "Ellos"', '{"type":"scramble","chunks":["y","e","h","t"],"correct_order":[3,2,1,0]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "They" se usa para hablar de más de una persona.', '{"type":"true_false","answer":true}'::jsonb);

  -- Regla: Sujeto obligatorio (v_rule1_uuid)
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: En inglés una oración necesita siempre un sujeto.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', '¿Se puede omitir el sujeto en inglés en oraciones simples?', '{"type":"multiple_choice","options":["Sí","No","A veces"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "You" puede referirse a una o varias personas según el contexto.', '{"type":"true_false","answer":true}'::jsonb);

  -- Preguntas de mapeo y resumen (no redundantes)
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', '¿Qué pronombre usarías para hablar de un grupo que incluye al hablante?', '{"type":"multiple_choice","options":["they","we","I"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', '¿A quién corresponde este pronombre? "you" (elige la mejor respuesta)', '{"type":"multiple_choice","options":["hablas con una persona","hablas con un grupo","hablas sobre ti"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "They" es singular.', '{"type":"true_false","answer":false}'::jsonb);

  -- end of exercises


END;
$seed$;
