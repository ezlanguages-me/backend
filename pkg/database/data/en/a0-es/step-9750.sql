    -- ============================================================
    -- Seed: A0 English Path – STEP 9750 – Speaking – understand jokes, colloquial asides and cultural allusions (Conferencias, Seminarios y Clases)
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9750 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9750 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9750 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9750 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9750 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9750 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9750 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9750 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9750,'en','speaking','social')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','understand jokes, colloquial asides and cultural allusions','Habla siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: a foreign student catches a dry humour joke in a British TV comedy. El contexto es a student common room.", "tasks": ["Describe la situación social o cultural.", "Explica el elemento de humor, ironía o referencia cultural.", "Interpreta el significado implícito.", "Menciona cómo lo entendería un hablante nativo.", "Explica por qué puede ser difícil para alguien de otra cultura.", "Da otro ejemplo similar.", "Resume qué has aprendido sobre el uso del inglés en este contexto.", "Cierra con una reflexión personal o recomendación."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','understand jokes, colloquial asides and cultural allusions','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: a foreign student catches a dry humour joke in a British TV comedy. Der Kontext ist a student common room.", "tasks": ["Beschreibe die soziale oder kulturelle Situation.", "Erkläre das Element des Humors, der Ironie oder der Kulturanspielung.", "Interpretiere die implizite Bedeutung.", "Erkläre, wie ein Muttersprachler es verstehen würde.", "Erkläre, warum es für jemanden aus einer anderen Kultur schwierig sein könnte.", "Gib ein weiteres ähnliches Beispiel.", "Fasse zusammen, was du über den Sprachgebrauch gelernt hast.", "Beende mit einer persönlichen Reflexion oder Empfehlung."]}'::jsonb);
    END; $seed$;
