-- ============================================================
-- Seed: A0 English Path – STEP 6030 – Speaking – describe accommodation requirements
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM speaking_translation WHERE speaking_uuid IN (SELECT uuid FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 6030 AND source_language = 'en');
  DELETE FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 6030 AND source_language = 'en';
  INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
  VALUES (v_path_uuid, 6030, 'en', 'speaking', 'Alquileres')
  RETURNING uuid INTO v_speaking_uuid;
  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'Describe tus requisitos de alojamiento', 'Practica cómo explicar qué tipo de vivienda necesitas.', '{"scenario": "Vas a ver pisos de alquiler y quieres explicar exactamente lo que necesitas.", "tasks": ["Di qué tipo de vivienda buscas.", "Menciona la zona o el transporte que prefieres.", "Explica cuánto puedes pagar al mes.", "Di si necesitas que esté amueblada.", "Menciona una característica importante, como balcón o jardín.", "Di si tienes mascotas o no.", "Explica la duración del contrato que prefieres.", "Cierra diciendo cuándo podrías mudarte."]}'::jsonb),
         (v_speaking_uuid, 'de', 'Beschreibe deine Wohnungswünsche', 'Übe, wie du erklärst, welche Art von Wohnung du brauchst.', '{"scenario": "Du besichtigst Mietwohnungen und möchtest genau erklären, was du brauchst.", "tasks": ["Sag, welche Art von Wohnung du suchst.", "Nenne die Gegend oder die Verkehrsanbindung, die du bevorzugst.", "Erkläre, wie viel du pro Monat zahlen kannst.", "Sag, ob die Wohnung möbliert sein soll.", "Nenne eine wichtige Eigenschaft wie Balkon oder Garten.", "Sag, ob du Haustiere hast oder nicht.", "Erkläre, welche Vertragsdauer du bevorzugst.", "Schließe damit ab, wann du einziehen könntest."]}'::jsonb);
END;
$seed$;
