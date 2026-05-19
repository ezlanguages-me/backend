-- ============================================================
-- Seed: A0 English Path – STEP 6180 – Speaking – explain house rules to a flatmate
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM speaking_translation WHERE speaking_uuid IN (SELECT uuid FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 6180 AND source_language = 'en');
  DELETE FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 6180 AND source_language = 'en';
  INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
  VALUES (v_path_uuid, 6180, 'en', 'speaking', 'Alquileres')
  RETURNING uuid INTO v_speaking_uuid;
  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'Explícale las normas de la casa a tu compañero de piso', 'Practica cómo explicar reglas básicas de convivencia a un nuevo compañero.', '{"scenario": "Tu nuevo compañero de piso llega hoy y tú le explicas las normas básicas de la casa.", "tasks": ["Explica la hora de silencio por la noche.", "Di cómo se usan las zonas comunes.", "Menciona qué pasa con los invitados.", "Explica dónde se deja la basura.", "Di qué hacer con los zapatos o la ropa mojada.", "Menciona la lavandería o la cocina compartida.", "Di cómo se paga la renta o los gastos compartidos.", "Termina diciendo que puede preguntarte dudas cuando quiera."]}'::jsonb),
         (v_speaking_uuid, 'de', 'Erkläre deinem Mitbewohner die Hausregeln', 'Übe, wie du einem neuen Mitbewohner die wichtigsten Wohnregeln erklärst.', '{"scenario": "Dein neuer Mitbewohner kommt heute an und du erklärst die grundlegenden Hausregeln.", "tasks": ["Erkläre die Nachtruhe.", "Sag, wie die Gemeinschaftsbereiche benutzt werden.", "Erwähne, was mit Gästen gilt.", "Erkläre, wo der Müll hingehört.", "Sag, was mit Schuhen oder nasser Kleidung passiert.", "Erwähne die Waschküche oder die gemeinsame Küche.", "Sag, wie Miete oder gemeinsame Kosten bezahlt werden.", "Schließe damit ab, dass er dich jederzeit fragen kann."]}'::jsonb);
END;
$seed$;
