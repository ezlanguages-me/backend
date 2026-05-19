-- ============================================================
-- Seed: A0 English Path – STEP 9330 – Speaking – make critical remarks / express disagreement without causing offence (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9330 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9330 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9330 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9330 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9330 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9330 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9330 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9330 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9330,'en','speaking','academic')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','make critical remarks / express disagreement without causing offence','Habla siguiendo las tareas indicadas.','{"scenario": "Debes intervenir en inglés durante una ponencia en un congreso. No estás de acuerdo con una afirmación general del ponente y quieres expresar tu desacuerdo con respeto y apoyo en datos.", "tasks": ["Presenta brevemente el tema de la ponencia.", "Indica con cortesía cuál es el punto con el que no coincides.", "Menciona el estudio o dato alternativo.", "Explica por qué ese dato cambia la interpretación.", "Reconoce algo válido en la postura del ponente.", "Formula tu desacuerdo con precisión y sin agresividad.", "Resume la idea principal de tu intervención.", "Cierra de manera respetuosa y profesional."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','make critical remarks / express disagreement without causing offence','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst während eines Konferenzvortrags auf Englisch eingreifen. Du bist mit einer allgemeinen Aussage der vortragenden Person nicht einverstanden und möchtest deinen Widerspruch respektvoll und datenbasiert ausdrücken.", "tasks": ["Stelle kurz das Thema des Vortrags vor.", "Nenne höflich den Punkt, mit dem du nicht einverstanden bist.", "Erwähne die alternative Studie oder die Daten.", "Erkläre, warum diese Information die Interpretation verändert.", "Erkenne einen gültigen Teil der Position der vortragenden Person an.", "Formuliere deinen Widerspruch präzise und ohne Aggressivität.", "Fasse die Hauptidee deines Beitrags zusammen.", "Beende respektvoll und professionell."]}'::jsonb);
    END; $seed$;
