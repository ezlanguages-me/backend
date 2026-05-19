-- ============================================================
-- Seed: A0 English Path – STEP 6090 – Listening – listen to utility setup instructions
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
    '{"es": "La cuenta de luz se abre el día de la mudanza.", "de": "Das Stromkonto wird am Einzugstag eröffnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes anotar las lecturas del contador.", "de": "Du musst die Zählerstände notieren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La empresa de gas necesita el número del piso y el código de acceso.", "de": "Die Gasfirma braucht die Wohnungsnummer und den Zugangscode.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La cuenta de agua se abre por teléfono.", "de": "Das Wasserkonto wird telefonisch eröffnet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "La instalación de internet es el jueves por la mañana.", "de": "Die Internetinstallation ist am Donnerstagmorgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El impuesto municipal necesita los nombres completos de los adultos.", "de": "Die Gemeindesteuer braucht die vollständigen Namen der erwachsenen Bewohner.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes guardar los correos de confirmación.", "de": "Du musst die Bestätigungs-E-Mails aufbewahren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Debes llamar a la línea de ayuda si la caldera pierde presión.", "de": "Du sollst die Hotline anrufen, wenn der Boiler keinen Druck hat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuándo se abre la cuenta de luz?", "de": "Wann wird das Stromkonto eröffnet?", "s_es": {"type": "multiple_choice", "options": ["El día de la mudanza", "Una semana después", "El mes siguiente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Einzugstag", "Eine Woche später", "Im nächsten Monat"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes anotar?", "de": "Was musst du notieren?", "s_es": {"type": "multiple_choice", "options": ["Las lecturas del contador", "Los nombres de los vecinos", "La hora del autobús"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Zählerstände", "Die Namen der Nachbarn", "Die Buszeit"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué necesita la empresa de gas?", "de": "Was braucht die Gasfirma?", "s_es": {"type": "multiple_choice", "options": ["El número del piso y el código de acceso", "Solo tu correo electrónico", "La matrícula del coche"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Wohnungsnummer und den Zugangscode", "Nur deine E-Mail", "Das Autokennzeichen"], "answer": 0}}'::jsonb,
    '{"es": "¿Cómo se abre la cuenta de agua?", "de": "Wie wird das Wasserkonto eröffnet?", "s_es": {"type": "multiple_choice", "options": ["En línea", "Por carta", "En la oficina de correos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Online", "Per Brief", "Im Postamt"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuándo es la instalación de internet?", "de": "Wann ist die Internetinstallation?", "s_es": {"type": "multiple_choice", "options": ["el jueves por la mañana", "El viernes por la tarde", "El lunes al mediodía"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["am Donnerstagmorgen", "Am Freitagabend", "Am Montagmittag"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué nombres necesita el impuesto municipal?", "de": "Welche Namen braucht die Gemeindesteuer?", "s_es": {"type": "multiple_choice", "options": ["Los nombres completos de los adultos", "Solo el apodo", "Solo el nombre del propietario"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die vollständigen Namen der Erwachsenen", "Nur den Spitznamen", "Nur den Namen des Eigentümers"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debes guardar?", "de": "Was musst du aufbewahren?", "s_es": {"type": "multiple_choice", "options": ["Los correos de confirmación", "Un mapa de la ciudad", "Un vale de comida"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Bestätigungs-E-Mails", "Einen Stadtplan", "Einen Essensgutschein"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuándo llamas a la línea de ayuda?", "de": "Wann rufst du die Hotline an?", "s_es": {"type": "multiple_choice", "options": ["Si la caldera pierde presión", "Si llega un paquete", "Si compras comida"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wenn der Boiler keinen Druck hat", "Wenn ein Paket ankommt", "Wenn du Essen kaufst"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN listening t ON t.uuid = e.target_uuid WHERE t.path_uuid = v_path_uuid AND t.step_order = 6090 AND t.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6090 AND source_language = 'en');
  DELETE FROM listening_translation WHERE listening_uuid IN (SELECT uuid FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6090 AND source_language = 'en');
  DELETE FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6090 AND source_language = 'en';
  INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
  VALUES (v_path_uuid, 6090, 'en', 'listening', 'Alquileres', $transcript$
Before you open the accounts, write down the meter readings and keep the confirmation emails.

The electric account starts on move-in day. The gas company needs the flat number and access code, and the water account is opened online.

Internet installation is on Thursday morning. Council tax uses the full names of the adult tenants. If the boiler has no pressure, call the helpline.
$transcript$)
  RETURNING uuid INTO v_listening_uuid;
  INSERT INTO listening_translation (listening_uuid, language, title, description)
  VALUES (v_listening_uuid, 'es', 'Escucha las instrucciones para dar de alta los suministros', 'Escucha cómo organizar la luz, el agua, el gas y el internet.'),
         (v_listening_uuid, 'de', 'Höre die Anweisungen zum Einrichten der Versorgungen', 'Höre, wie Strom, Wasser, Gas und Internet eingerichtet werden.');

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
