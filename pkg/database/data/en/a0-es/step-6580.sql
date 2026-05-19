-- ============================================================
-- Seed: A0 English Path – STEP 6580 – Speaking – describe an entertainment event (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6580 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6580 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6580 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6580 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6580 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6580 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6580 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6580 AND path_uuid=v_path_id;
    INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
    VALUES (v_path_id,6580,'en','speaking','tourism')
    RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'es','Describir Summer Lights Concert','Describe el evento.','{"scenario": "Vas a describir el evento Summer Lights Concert.", "tasks": ["Di el nombre del evento.", "Di el lugar.", "Di el día.", "Di la hora de inicio.", "Di el precio.", "Nombra al primer artista o acto.", "Nombra al segundo artista o acto.", "Explica un detalle especial del evento."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'de','Summer Lights Concert beschreiben','Beschreibe die Veranstaltung.','{"scenario": "Du beschreibst die Veranstaltung Summer Lights Concert.", "tasks": ["Nenne den Namen der Veranstaltung.", "Nenne den Ort.", "Nenne den Tag.", "Nenne die Startzeit.", "Nenne den Preis.", "Nenne den ersten Künstler oder Programmpunkt.", "Nenne den zweiten Künstler oder Programmpunkt.", "Erkläre ein besonderes Detail der Veranstaltung."]}'::jsonb);
END; $seed$;
