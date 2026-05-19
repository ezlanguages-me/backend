-- ============================================================
-- Seed: A0 English Path – STEP 8070 – Speaking – give coherent explanations of a theoretical nature (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8070 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8070 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8070 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8070 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8070 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8070 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8070 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8070 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,8070,'en','speaking','academic')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','give coherent explanations of a theoretical nature','Habla siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: an analysis of library usage data after new quiet zones were created. El contexto es a study skills course.", "tasks": ["Presenta el tema central.", "Explica el contexto académico o profesional.", "Resume la idea principal.", "Añade una evidencia o detalle importante.", "Menciona una objeción o alternativa.", "Responde a esa objeción.", "Formula una conclusión clara.", "Cierra con una recomendación breve."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','give coherent explanations of a theoretical nature','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: an analysis of library usage data after new quiet zones were created. Der Kontext ist a study skills course.", "tasks": ["Stelle das zentrale Thema vor.", "Erkläre den akademischen oder beruflichen Kontext.", "Fasse die Hauptidee zusammen.", "Nenne einen wichtigen Beleg oder ein Detail.", "Erwähne einen Einwand oder eine Alternative.", "Reagiere auf diesen Einwand.", "Formuliere eine klare Schlussfolgerung.", "Beende mit einer kurzen Empfehlung."]}'::jsonb);
    END; $seed$;
