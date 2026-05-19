-- ============================================================
-- Seed: A0 English Path – STEP 9200 – Writing – write a report that communicates the desired message (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_writing_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9200 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9200 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9200 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9200 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9200 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9200 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9200 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9200 AND path_uuid=v_path_id;
        INSERT INTO writing (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9200,'en','writing','professional')
        RETURNING uuid INTO v_writing_id;
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'es','write a report that communicates the desired message','Produce la respuesta siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: writing a progress report on a client project for senior management. El contexto es a project management office.", "tasks": ["Indica el objetivo o tema principal del texto.", "Describe el contexto o los participantes.", "Explica el punto más importante.", "Resume un detalle o resultado clave.", "Comenta una dificultad o limitación.", "Relaciona el contenido con el objetivo inicial.", "Formula una conclusión clara.", "Cierra con una recomendación o próximo paso."]}'::jsonb);
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'de','write a report that communicates the desired message','Erstelle die Antwort anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: writing a progress report on a client project for senior management. Der Kontext ist a project management office.", "tasks": ["Nenne das Ziel oder Hauptthema des Textes.", "Beschreibe den Kontext oder die Teilnehmenden.", "Erkläre den wichtigsten Punkt.", "Fasse ein wichtiges Detail oder Ergebnis zusammen.", "Nenne eine Schwierigkeit oder Einschränkung.", "Verbinde den Inhalt mit dem ursprünglichen Ziel.", "Formuliere eine klare Schlussfolgerung.", "Beende mit einer Empfehlung oder einem nächsten Schritt."]}'::jsonb);
    END; $seed$;
