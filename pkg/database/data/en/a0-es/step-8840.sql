-- ============================================================
-- Seed: A0 English Path – STEP 8840 – Speaking – argue/complain effectively about most problem areas that are likely to occur (Alquileres)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8840 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8840 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8840 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8840 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8840 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8840 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8840 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8840 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,8840,'en','speaking','rental')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','argue/complain effectively about most problem areas that are likely to occur','Habla siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: the landlord refuses to return the deposit after the tenant leaves the flat. El contexto es a flat rental office and phone call.", "tasks": ["Presenta el problema principal.", "Indica el producto o documento implicado.", "Explica un detalle concreto del caso.", "Menciona la otra preocupación o límite.", "Pide una solución clara.", "Negocia una condición o confirma un requisito.", "Resume el acuerdo o el siguiente paso.", "Cierra de forma educada y profesional."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','argue/complain effectively about most problem areas that are likely to occur','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: the landlord refuses to return the deposit after the tenant leaves the flat. Der Kontext ist a flat rental office and phone call.", "tasks": ["Stelle das Hauptproblem vor.", "Nenne das betroffene Produkt oder Dokument.", "Erkläre ein konkretes Detail des Falls.", "Erwähne die andere Sorge oder Grenze.", "Bitte um eine klare Lösung.", "Verhandle eine Bedingung oder bestätige eine Anforderung.", "Fasse die Vereinbarung oder den nächsten Schritt zusammen.", "Schließe höflich und professionell ab."]}'::jsonb);
    END; $seed$;
