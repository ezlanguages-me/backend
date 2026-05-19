-- ============================================================
-- Seed: A0 English Path – STEP 8580 – Writing – write an account of an experiment with only occasional errors, and support conclusions adequately (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_writing_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8580 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8580 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8580 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8580 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8580 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8580 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8580 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8580 AND path_uuid=v_path_id;
        INSERT INTO writing (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,8580,'en','writing','academic')
        RETURNING uuid INTO v_writing_id;
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'es','write an account of an experiment with only occasional errors, and support conclusions adequately','Produce la respuesta siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: an experiment on background music and reading speed. El contexto es a simple classroom experiment.", "tasks": ["Indica el objetivo del experimento.", "Describe los materiales o participantes.", "Explica el método principal.", "Resume un resultado importante.", "Comenta una limitación.", "Relaciona el resultado con la teoría o la pregunta inicial.", "Presenta una conclusión prudente.", "Cierra con una recomendación o siguiente paso."]}'::jsonb);
        INSERT INTO writing_translation (writing_uuid,language,title,description,prompt)
        VALUES (v_writing_id,'de','write an account of an experiment with only occasional errors, and support conclusions adequately','Erstelle die Antwort anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: an experiment on background music and reading speed. Der Kontext ist a simple classroom experiment.", "tasks": ["Nenne das Ziel des Experiments.", "Beschreibe die Materialien oder Teilnehmenden.", "Erkläre die wichtigste Methode.", "Fasse ein wichtiges Ergebnis zusammen.", "Nenne eine Einschränkung.", "Verbinde das Ergebnis mit der Theorie oder Ausgangsfrage.", "Formuliere eine vorsichtige Schlussfolgerung.", "Beende mit einer Empfehlung oder einem nächsten Schritt."]}'::jsonb);
    END; $seed$;
