-- ============================================================
-- Seed: A0 English Path – STEP 9410 – Speaking – deal with hostile questioning confidently (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9410 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9410 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9410 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9410 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9410 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9410 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9410 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9410 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9410,'en','speaking','academic')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','deal with hostile questioning confidently','Habla siguiendo las tareas indicadas.','{"scenario": "Debes responder en inglés a una pregunta hostil después de una presentación de proyecto. La persona que pregunta exige una explicación del presupuesto y tú debes contestar con firmeza y honestidad.", "tasks": ["Presenta brevemente el proyecto.", "Escucha y reformula la pregunta crítica sin perder la calma.", "Explica la causa principal del aumento del presupuesto.", "Menciona el problema de la cadena de suministro.", "Reconoce cualquier error o limitación real.", "Defiende las decisiones más importantes con claridad.", "Resume tu respuesta de forma segura y transparente.", "Cierra con un tono profesional y sereno."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','deal with hostile questioning confidently','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch auf eine feindselige Frage nach einer Projektpräsentation antworten. Die fragende Person verlangt eine Erklärung zum Budget und du sollst fest und ehrlich reagieren.", "tasks": ["Stelle das Projekt kurz vor.", "Höre die kritische Frage und formuliere sie ruhig neu.", "Erkläre die Hauptursache der Budgeterhöhung.", "Erwähne das Problem in der Lieferkette.", "Erkenne echte Fehler oder Grenzen an.", "Verteidige die wichtigsten Entscheidungen klar.", "Fasse deine Antwort sicher und transparent zusammen.", "Beende in einem professionellen und ruhigen Ton."]}'::jsonb);
    END; $seed$;
