-- ============================================================
-- Seed: A0 English Path – STEP 8500 – Writing – write an essay with only occasional difficulties for the reader, whose message can be followed throughout (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_writing_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8500 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8500 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8500 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8500 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8500 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8500 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8500 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8500 AND path_uuid=v_path_id;
        INSERT INTO writing (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,8500,'en','writing','academic')
        RETURNING uuid INTO v_writing_id;
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'es','write an essay with only occasional difficulties for the reader, whose message can be followed throughout','Produce la respuesta siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: conference findings on bilingual note-taking and memory. El contexto es a small applied linguistics conference.", "tasks": ["Presenta el tema central.", "Explica el contexto académico o profesional.", "Resume la idea principal.", "Añade una evidencia o detalle importante.", "Menciona una objeción o alternativa.", "Responde a esa objeción.", "Formula una conclusión clara.", "Cierra con una recomendación breve."]}'::jsonb);
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'de','write an essay with only occasional difficulties for the reader, whose message can be followed throughout','Erstelle die Antwort anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: conference findings on bilingual note-taking and memory. Der Kontext ist a small applied linguistics conference.", "tasks": ["Stelle das zentrale Thema vor.", "Erkläre den akademischen oder beruflichen Kontext.", "Fasse die Hauptidee zusammen.", "Nenne einen wichtigen Beleg oder ein Detail.", "Erwähne einen Einwand oder eine Alternative.", "Reagiere auf diesen Einwand.", "Formuliere eine klare Schlussfolgerung.", "Beende mit einer kurzen Empfehlung."]}'::jsonb);
    END; $seed$;
