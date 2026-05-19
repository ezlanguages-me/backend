-- ============================================================
-- Seed: A0 English Path – STEP 9370 – Speaking – take an active part in most kinds of seminars or tutorials (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9370 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9370 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9370 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9370 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9370 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9370 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9370 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9370 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9370,'en','speaking','academic')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','take an active part in most kinds of seminars or tutorials','Habla siguiendo las tareas indicadas.','{"scenario": "Debes participar en inglés en un seminario universitario sobre sostenibilidad. Quieres intervenir con una pregunta bien informada sobre los programas de compensación de carbono y responder a otra persona que cuestiona tu interpretación.", "tasks": ["Presenta brevemente el tema del seminario.", "Formula tu pregunta principal sobre los programas de compensación.", "Explica por qué la pregunta es relevante.", "Menciona un dato o idea del texto leído.", "Responde a la objeción de otra persona participante.", "Añade una reflexión propia que haga avanzar la discusión.", "Resume tu contribución con claridad.", "Cierra mostrando disposición a seguir escuchando y aprendiendo."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','take an active part in most kinds of seminars or tutorials','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch an einem Universitätsseminar über Nachhaltigkeit teilnehmen. Du möchtest eine gut informierte Frage zu CO2-Kompensationsprogrammen stellen und auf eine Person reagieren, die deine Interpretation hinterfragt.", "tasks": ["Stelle kurz das Thema des Seminars vor.", "Formuliere deine Hauptfrage zu den Kompensationsprogrammen.", "Erkläre, warum die Frage relevant ist.", "Nenne eine Information oder Idee aus dem gelesenen Text.", "Reagiere auf den Einwand einer anderen teilnehmenden Person.", "Füge einen eigenen Gedanken hinzu, der die Diskussion weiterbringt.", "Fasse deinen Beitrag klar zusammen.", "Beende so, dass du Offenheit zum Weiterhören und Lernen zeigst."]}'::jsonb);
    END; $seed$;
