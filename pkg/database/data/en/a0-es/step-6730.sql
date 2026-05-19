-- ============================================================
-- Seed: A0 English Path – STEP 6730 – Speaking – describe a city using a brochure (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6730 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6730 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6730 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6730 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6730 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6730 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6730 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6730 AND path_uuid=v_path_id;
    INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
    VALUES (v_path_id,6730,'en','speaking','tourism')
    RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'es','Describir Luna City','Describe la ciudad con ayuda del folleto.','{"scenario": "Estás hablando sobre Luna City con otra persona.", "tasks": ["Di dónde está el lugar.", "Di cuándo empieza la visita.", "Di dónde empieza.", "Di cuánto dura.", "Di el precio o coste.", "Nombra el primer punto destacado.", "Nombra el segundo punto destacado.", "Da un consejo útil para visitantes."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'de','Luna City beschreiben','Beschreibe die Stadt mit Hilfe des Flyers.','{"scenario": "Du sprichst mit einer anderen Person über Luna City.", "tasks": ["Sage, wo der Ort ist.", "Sage, wann der Besuch beginnt.", "Sage, wo er beginnt.", "Sage, wie lange er dauert.", "Nenne den Preis oder die Kosten.", "Nenne den ersten Höhepunkt.", "Nenne den zweiten Höhepunkt.", "Gib einen nützlichen Tipp für Besucher."]}'::jsonb);
END; $seed$;
