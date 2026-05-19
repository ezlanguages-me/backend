-- ============================================================
-- Seed: A0 English Path – STEP 9500 – Writing – write down some information, provided that this is more or less dictated (for example, further reading matter) and time is given for writing (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_writing_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9500 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9500 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9500 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9500 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9500 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9500 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9500 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9500 AND path_uuid=v_path_id;
        INSERT INTO writing (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9500,'en','writing','academic')
        RETURNING uuid INTO v_writing_id;
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'es','write down some information, provided that this is more or less dictated (for example, further reading matter) and time is given for writing','Produce la respuesta siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: writing down references and further reading given at the end of a lecture. El contexto es a university lecture hall.", "tasks": ["Anota el título o tema principal del contenido.", "Escribe el punto de partida o el argumento inicial.", "Apunta los detalles más importantes.", "Registra cualquier ejemplo o dato clave.", "Toma nota del punto de vista contrario o excepción.", "Anota la conclusión o la resolución principal.", "Escribe cualquier referencia o material adicional sugerido.", "Revisa tus notas y añade aclaraciones si es necesario."]}'::jsonb);
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'de','write down some information, provided that this is more or less dictated (for example, further reading matter) and time is given for writing','Erstelle die Antwort anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: writing down references and further reading given at the end of a lecture. Der Kontext ist a university lecture hall.", "tasks": ["Notiere den Titel oder das Hauptthema.", "Schreibe den Ausgangspunkt oder das erste Argument auf.", "Halte die wichtigsten Details fest.", "Notiere Beispiele oder wichtige Daten.", "Halte den Gegenstandpunkt oder die Ausnahme fest.", "Schreibe die Schlussfolgerung oder die Hauptlösung auf.", "Notiere empfohlene Quellen oder weiterführende Materialien.", "Lies deine Notizen durch und füge Erklärungen hinzu, falls nötig."]}'::jsonb);
    END; $seed$;
