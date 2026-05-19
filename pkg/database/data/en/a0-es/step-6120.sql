-- ============================================================
-- Seed: A0 English Path – STEP 6120 – Listening – listen to property maintenance advice
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_listening_uuid UUID;
  v_exercise_uuid UUID;
  ex JSONB;
  v_exercises JSONB[] := ARRAY[
    '{"es": "La presión de la caldera está baja.", "de": "Der Druck des Boilers ist niedrig.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Si el grifo gotea, debes cerrar la válvula.", "de": "Wenn der Wasserhahn tropft, sollst du das Ventil schließen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Si el pestillo de la ventana está roto, no lo fuerces.", "de": "Wenn der Fensterverschluss kaputt ist, sollst du ihn nicht zwingen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Si la alarma pita cada minuto, debes cambiar la pila.", "de": "Wenn der Alarm jede Minute piept, musst du die Batterie wechseln.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Para un fregadero atascado, usa agua caliente y no productos fuertes.", "de": "Bei einem verstopften Waschbecken nimm heißes Wasser und keine starken Chemikalien.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Si la fuga llega al techo, llama al número de emergencia.", "de": "Wenn das Leck die Decke erreicht, rufe die Notrufnummer an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes informar del problema en las primeras 24 horas.", "de": "Du sollst das Problem innerhalb von 24 Stunden melden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes guardar fotos y el número de la habitación.", "de": "Du sollst Fotos und die Zimmernummer aufbewahren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿A cuánto debes subir la presión de la caldera?", "de": "Auf wie viel musst du den Druck des Boilers bringen?", "s_es": {"type": "multiple_choice", "options": ["1 bar", "3 bar", "5 bar"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["1 bar", "3 bar", "5 bar"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué haces si el grifo gotea?", "de": "Was machst du, wenn der Wasserhahn tropft?", "s_es": {"type": "multiple_choice", "options": ["Cerrarla válvula y avisar si sigue", "Abrir otra ventana", "Apagar la nevera"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Ventil schließen und Bescheid sagen, wenn es weiter tropft", "Ein anderes Fenster öffnen", "Den Kühlschrank ausschalten"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes hacer con el pestillo roto?", "de": "Was sollst du mit dem kaputten Verschluss tun?", "s_es": {"type": "multiple_choice", "options": ["No forzarlo", "Pintarlo de rojo", "Sacarlo con un martillo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nicht zwingen", "Rot anmalen", "Mit einem Hammer herausnehmen"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué haces si la alarma pita?", "de": "Was machst du, wenn der Alarm piept?", "s_es": {"type": "multiple_choice", "options": ["Cambiar la pila", "Cerrar la cocina", "Llamar a un taxista"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Batterie wechseln", "Die Küche schließen", "Einen Taxifahrer anrufen"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué usas para un fregadero atascado?", "de": "Was benutzt du bei einem verstopften Waschbecken?", "s_es": {"type": "multiple_choice", "options": ["Agua caliente", "Pintura", "Arena"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Heißes Wasser", "Farbe", "Sand"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuándo llamas al número de emergencia?", "de": "Wann rufst du die Notrufnummer an?", "s_es": {"type": "multiple_choice", "options": ["Si la fuga llega al techo", "Si compras pan", "Si abres una carta"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wenn das Leck die Decke erreicht", "Wenn du Brot kaufst", "Wenn du einen Brief öffnest"], "answer": 0}}'::jsonb,
    '{"es": "¿En cuánto tiempo debes informar?", "de": "Innerhalb welcher Zeit musst du melden?", "s_es": {"type": "multiple_choice", "options": ["24 horas", "Una semana", "Un mes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["24 Stunden", "Eine Woche", "Ein Monat"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes guardar?", "de": "Was sollst du aufbewahren?", "s_es": {"type": "multiple_choice", "options": ["Fotos y el número de la habitación", "Solo el título de la casa", "La receta del médico"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fotos und die Zimmernummer", "Nur den Hausnamen", "Das Rezept des Arztes"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN listening t ON t.uuid = e.target_uuid WHERE t.path_uuid = v_path_uuid AND t.step_order = 6120 AND t.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6120 AND source_language = 'en');
  DELETE FROM listening_translation WHERE listening_uuid IN (SELECT uuid FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6120 AND source_language = 'en');
  DELETE FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6120 AND source_language = 'en';
  INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
  VALUES (v_path_uuid, 6120, 'en', 'listening', 'Alquileres', $transcript$
The maintenance team says to check the boiler pressure first and bring it up to 1 bar.

If a tap drips, close the valve and report it if the leak continues. If a window latch is broken, do not force it.

If the alarm beeps every minute, change the battery. For a blocked sink, use hot water, not strong chemicals. If the leak reaches the ceiling, call the emergency number and report the issue within 24 hours.
$transcript$)
  RETURNING uuid INTO v_listening_uuid;
  INSERT INTO listening_translation (listening_uuid, language, title, description)
  VALUES (v_listening_uuid, 'es', 'Escucha consejos de mantenimiento de la vivienda', 'Escucha consejos prácticos sobre pequeñas averías y cuándo avisar.'),
         (v_listening_uuid, 'de', 'Höre Wartungstipps für die Unterkunft', 'Höre praktische Tipps zu kleinen Schäden und wann man Bescheid sagen soll.');

  FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_listening_uuid, NULL)
    RETURNING uuid INTO v_exercise_uuid;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
      (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
      (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;
