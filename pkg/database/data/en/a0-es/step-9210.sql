-- ============================================================
-- Seed: A0 English Path – STEP 9210 – Writing – write quite lengthy reports with only the occasional, minor error, and without taking much longer than a native speaker (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_writing_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9210 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9210 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9210 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9210 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9210 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9210 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9210 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9210 AND path_uuid=v_path_id;
        INSERT INTO writing (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9210,'en','writing','professional')
        RETURNING uuid INTO v_writing_id;
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'es','write quite lengthy reports with only the occasional, minor error, and without taking much longer than a native speaker','Produce la respuesta siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: writing a comprehensive annual review report for a business department. El contexto es a senior management office.", "tasks": ["Indica el objetivo o tema principal del texto.", "Describe el contexto o los participantes.", "Explica el punto más importante.", "Resume un detalle o resultado clave.", "Comenta una dificultad o limitación.", "Relaciona el contenido con el objetivo inicial.", "Formula una conclusión clara.", "Cierra con una recomendación o próximo paso."]}'::jsonb);
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'de','write quite lengthy reports with only the occasional, minor error, and without taking much longer than a native speaker','Erstelle die Antwort anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: writing a comprehensive annual review report for a business department. Der Kontext ist a senior management office.", "tasks": ["Nenne das Ziel oder Hauptthema des Textes.", "Beschreibe den Kontext oder die Teilnehmenden.", "Erkläre den wichtigsten Punkt.", "Fasse ein wichtiges Detail oder Ergebnis zusammen.", "Nenne eine Schwierigkeit oder Einschränkung.", "Verbinde den Inhalt mit dem ursprünglichen Ziel.", "Formuliere eine klare Schlussfolgerung.", "Beende mit einer Empfehlung oder einem nächsten Schritt."]}'::jsonb);
    END; $seed$;
