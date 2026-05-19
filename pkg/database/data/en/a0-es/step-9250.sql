-- ============================================================
-- Seed: A0 English Path – STEP 9250 – Speaking – use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9250 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9250 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9250 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9250 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9250 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9250 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9250 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9250 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9250,'en','speaking','professional')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','use the telephone confidently, even if the line is bad or the caller has a non-standard accent','Habla siguiendo las tareas indicadas.','{"scenario": "Debes trabajar en inglés sobre este tema: the caller manages a difficult phone call about a delayed delivery. El contexto es a professional phone call and logistics office.", "tasks": ["Presenta el problema o punto de partida.", "Explica tu postura principal.", "Menciona un detalle o evidencia concreta.", "Reconoce el punto de vista contrario.", "Responde al punto contrario de forma respetuosa.", "Refuerza tu argumento con otro ejemplo.", "Resume tu postura de forma clara.", "Cierra con confianza y educación."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','use the telephone confidently, even if the line is bad or the caller has a non-standard accent','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch zu diesem Thema arbeiten: the caller manages a difficult phone call about a delayed delivery. Der Kontext ist a professional phone call and logistics office.", "tasks": ["Stelle das Problem oder den Ausgangspunkt vor.", "Erkläre deine Hauptposition.", "Nenne ein konkretes Detail oder einen Beweis.", "Erkenne den gegenteiligen Standpunkt an.", "Antworte respektvoll auf den Gegenstandpunkt.", "Stärke dein Argument mit einem weiteren Beispiel.", "Fasse deine Position klar zusammen.", "Beende selbstbewusst und höflich."]}'::jsonb);
    END; $seed$;
