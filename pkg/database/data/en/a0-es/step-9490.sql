-- ============================================================
-- Seed: A0 English Path – STEP 9490 – Speaking – rebut counter-arguments (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9490 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9490 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9490 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9490 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9490 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9490 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9490 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9490 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9490,'en','speaking','academic')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','rebut counter-arguments','Habla siguiendo las tareas indicadas.','{"scenario": "Debes defender en inglés una propuesta durante un simposio de investigación. Un crítico dice que el coste inicial es demasiado alto y tú debes responder con datos sobre el ahorro a largo plazo.", "tasks": ["Presenta brevemente la propuesta.", "Expón la objeción principal sobre el coste.", "Responde con los datos de ahorro a largo plazo.", "Reconoce la preocupación por el gasto inicial.", "Explica por qué la inversión puede gestionarse por fases.", "Refuerza tu argumento con otra razón o ejemplo.", "Resume tu respuesta con claridad.", "Cierra mostrando seguridad y apertura al debate."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','rebut counter-arguments','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst während eines Forschungssymposiums auf Englisch einen Vorschlag verteidigen. Eine kritische Person sagt, dass die Anfangskosten zu hoch sind, und du sollst mit Daten zu langfristigen Einsparungen antworten.", "tasks": ["Stelle den Vorschlag kurz vor.", "Nenne den wichtigsten Einwand zu den Kosten.", "Antworte mit Daten zu den langfristigen Einsparungen.", "Erkenne die Sorge über die Anfangsausgaben an.", "Erkläre, warum die Investition schrittweise umgesetzt werden kann.", "Stärke dein Argument mit einem weiteren Grund oder Beispiel.", "Fasse deine Antwort klar zusammen.", "Beende selbstbewusst und offen für die Diskussion."]}'::jsonb);
    END; $seed$;
