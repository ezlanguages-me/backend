-- ============================================================
-- Seed: A0 English Path – STEP 7100 – Speaking – participate in a simple phone conversation with a known person on a predictable topic (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7100 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7100 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7100 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7100 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7100 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7100 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7100 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7100 AND path_uuid=v_path_id;
    INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
    VALUES (v_path_id,7100,'en','speaking','phone_correspondence')
    RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'es','Confirmar planes por teléfono','Confirma los planes por teléfono.','{"scenario": "Estás al teléfono hablando sobre Seville.", "tasks": ["Saluda a la otra persona.", "Di el destino o plan principal.", "Menciona el día.", "Menciona la hora.", "Di el medio de transporte.", "Di el lugar de encuentro.", "Haz una petición simple.", "Confirma el plan al final."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'de','Pläne am Telefon bestätigen','Bestätige die Pläne am Telefon.','{"scenario": "Du telefonierst über Seville.", "tasks": ["Begrüße die andere Person.", "Nenne das Ziel oder den Hauptplan.", "Nenne den Tag.", "Nenne die Uhrzeit.", "Nenne das Verkehrsmittel.", "Nenne den Treffpunkt.", "Stelle eine einfache Bitte.", "Bestätige den Plan am Ende."]}'::jsonb);
END; $seed$;
