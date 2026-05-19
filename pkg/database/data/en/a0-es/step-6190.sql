-- ============================================================
-- Seed: A0 English Path – STEP 6190 – Reading – understand a move-in checklist
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
  v_exercise_uuid UUID;
  ex JSONB;
  v_exercises JSONB[] := ARRAY[
    '{"es": "Debes llevar tu documento de identidad y el recibo de la fianza.", "de": "Du sollst deinen Ausweis und den Kautionsbeleg mitbringen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes anotar las lecturas del contador y hacer fotos.", "de": "Du sollst die Zählerstände notieren und Fotos machen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes probar las alarmas de humo y las llaves de las ventanas.", "de": "Du sollst die Rauchmelder und die Fensterschlüssel testen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Puedes ignorar las marcas o daños pequeños.", "de": "Kleine Flecken oder Schäden kannst du ignorieren.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "Debes firmar el inventario.", "de": "Du sollst das Inventar unterschreiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes poner en marcha internet y el impuesto municipal.", "de": "Du sollst Internet und die Gemeindesteuer einrichten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes guardar los números de emergencia.", "de": "Du sollst die Notrufnummern aufbewahren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes comprobar la calefacción y el agua.", "de": "Du sollst die Heizung und das Wasser prüfen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Qué debes llevar?", "de": "Was musst du mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Tu documento de identidad y el recibo de la fianza", "Una bicicleta nueva", "Solo una taza"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Deinen Ausweis und den Kautionsbeleg", "Ein neues Fahrrad", "Nur eine Tasse"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes anotar?", "de": "Was musst du notieren?", "s_es": {"type": "multiple_choice", "options": ["Las lecturas del contador", "La receta de la cena", "El nombre de la ciudad"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Zählerstände", "Das Abendessen-Rezept", "Den Stadtnamen"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes probar?", "de": "Was sollst du testen?", "s_es": {"type": "multiple_choice", "options": ["Las alarmas de humo y las llaves de las ventanas", "La televisión y el sofá", "El coche y la radio"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Rauchmelder und die Fensterschlüssel", "Den Fernseher und das Sofa", "Das Auto und das Radio"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes hacer con las marcas?", "de": "Was sollst du mit Flecken tun?", "s_es": {"type": "multiple_choice", "options": ["Hacer fotos de ellas", "Pintarlas de azul", "Esconderlas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fotos davon machen", "Blau anmalen", "Verstecken"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes firmar?", "de": "Was sollst du unterschreiben?", "s_es": {"type": "multiple_choice", "options": ["El inventario", "La factura del taxi", "El menú"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Inventar", "Die Taxirechnung", "Die Speisekarte"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes poner en marcha?", "de": "Was sollst du einrichten?", "s_es": {"type": "multiple_choice", "options": ["Internet y el impuesto municipal", "Solo la radio", "Solo la nevera"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Internet und die Gemeindesteuer", "Nur das Radio", "Nur den Kühlschrank"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes guardar?", "de": "Was sollst du aufbewahren?", "s_es": {"type": "multiple_choice", "options": ["Los números de emergencia", "Las entradas del cine", "La lista de la compra"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Notrufnummern", "Die Kinokarten", "Die Einkaufsliste"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes comprobar?", "de": "Was sollst du prüfen?", "s_es": {"type": "multiple_choice", "options": ["La calefacción y el agua", "El metro y el autobús", "La hora del almuerzo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Heizung und das Wasser", "Die U-Bahn und den Bus", "Die Mittagspause"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN reading t ON t.uuid = e.target_uuid WHERE t.path_uuid = v_path_uuid AND t.step_order = 6190 AND t.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6190 AND source_language = 'en');
  DELETE FROM reading_translation WHERE reading_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6190 AND source_language = 'en');
  DELETE FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6190 AND source_language = 'en';
  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (v_path_uuid, 6190, 'en', 'reading', 'Alquileres', $content$
Move-in checklist: bring your ID and deposit receipt, and take meter readings and photos.

Test the smoke alarms and window keys. Photograph any marks or damage, and sign the inventory.

Set up internet and council tax, store the emergency numbers, and check the heating and the water.
$content$)
  RETURNING uuid INTO v_reading_uuid;
  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'Comprende una lista de comprobación para la mudanza', 'Lee la lista de comprobación para el primer día en la vivienda.'),
         (v_reading_uuid, 'de', 'Verstehe eine Einzugs-Checkliste', 'Lies die Checkliste für den ersten Tag in der Unterkunft.');

  FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_reading_uuid, NULL)
    RETURNING uuid INTO v_exercise_uuid;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
      (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
      (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;
