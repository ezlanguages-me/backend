-- ============================================================
-- Seed: A0 English Path – STEP 9450 – Speaking – get and hold on to his/her turn to speak (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9450 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9450 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9450 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9450 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9450 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9450 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9450 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9450 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9450,'en','speaking','academic')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','get and hold on to his/her turn to speak','Habla siguiendo las tareas indicadas.','{"scenario": "Debes intervenir en inglés durante una mesa redonda. Levantas la mano para pedir la palabra, otra persona intenta seguir hablando y tú necesitas mantener tu turno con cortesía.", "tasks": ["Presenta brevemente el tema del debate.", "Pide la palabra de forma educada.", "Indica cuál es tu punto principal.", "Mantén el turno cuando otra persona intente continuar.", "Explica tu idea de forma breve y relevante.", "Conecta tu comentario con algo dicho antes.", "Resume tu contribución con claridad.", "Cierra agradeciendo el turno recibido."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','get and hold on to his/her turn to speak','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst während einer Podiumsdiskussion auf Englisch eingreifen. Du hebst die Hand, um das Wort zu bekommen, eine andere Person versucht weiterzusprechen und du musst deinen Beitrag höflich sichern.", "tasks": ["Stelle kurz das Thema der Diskussion vor.", "Bitte höflich um das Wort.", "Nenne deinen Hauptpunkt.", "Halte deinen Redezug, wenn eine andere Person weiterreden will.", "Erkläre deine Idee kurz und relevant.", "Verbinde deinen Kommentar mit etwas, das vorher gesagt wurde.", "Fasse deinen Beitrag klar zusammen.", "Beende, indem du dich für das erteilte Wort bedankst."]}'::jsonb);
    END; $seed$;
