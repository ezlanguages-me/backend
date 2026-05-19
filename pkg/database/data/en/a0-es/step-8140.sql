-- ============================================================
-- Seed: A0 English Path – STEP 8140 – Speaking – make a seminar contribution (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8140 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8140 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8140 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8140 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8140 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8140 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8140 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8140 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,8140,'en','speaking','academic')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','make a seminar contribution','Habla siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: guidelines for joining a research seminar respectfully. El contexto es the first ethics seminar of the term.", "tasks": ["Presenta el tema central.", "Explica el contexto académico o profesional.", "Resume la idea principal.", "Añade una evidencia o detalle importante.", "Menciona una objeción o alternativa.", "Responde a esa objeción.", "Formula una conclusión clara.", "Cierra con una recomendación breve."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','make a seminar contribution','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: guidelines for joining a research seminar respectfully. Der Kontext ist the first ethics seminar of the term.", "tasks": ["Stelle das zentrale Thema vor.", "Erkläre den akademischen oder beruflichen Kontext.", "Fasse die Hauptidee zusammen.", "Nenne einen wichtigen Beleg oder ein Detail.", "Erwähne einen Einwand oder eine Alternative.", "Reagiere auf diesen Einwand.", "Formuliere eine klare Schlussfolgerung.", "Beende mit einer kurzen Empfehlung."]}'::jsonb);
    END; $seed$;
