-- ============================================================
-- Seed: A0 English Path – STEP 9290 – Speaking – rebut criticisms without causing offence (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_speaking_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9290 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9290 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9290 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9290 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9290 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9290 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9290 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9290 AND path_uuid=v_path_id;
        INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,9290,'en','speaking','academic')
        RETURNING uuid INTO v_speaking_id;
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'es','rebut criticisms without causing offence','Habla siguiendo las tareas indicadas.','{"scenario": "Debes responder en inglés a una crítica sobre la metodología de tu investigación durante una conferencia académica. Un crítico cuestiona el tamaño de la muestra y tú debes responder con tacto y claridad.", "tasks": ["Presenta brevemente el contexto de tu estudio.", "Reconoce la crítica de forma respetuosa.", "Explica por qué el tamaño de la muestra fue limitado.", "Aclara qué conclusiones sí puedes defender.", "Añade una razón práctica o metodológica.", "Invita al crítico a ver el valor del estudio dentro de sus límites.", "Resume tu postura con calma.", "Cierra con una frase profesional y abierta al diálogo."]}'::jsonb);
        INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
        VALUES (v_speaking_id,'de','rebut criticisms without causing offence','Sprich anhand der angegebenen Aufgaben.','{"scenario": "Du sollst auf Englisch auf Kritik an der Methodik deiner Forschung während einer akademischen Konferenz antworten. Eine kritische Person hinterfragt die Stichprobengröße und du sollst taktvoll und klar reagieren.", "tasks": ["Stelle kurz den Kontext deiner Studie vor.", "Erkenne die Kritik respektvoll an.", "Erkläre, warum die Stichprobe begrenzt war.", "Mache klar, welche Schlussfolgerungen du trotzdem vertreten kannst.", "Füge einen praktischen oder methodischen Grund hinzu.", "Lade die kritische Person ein, den Wert der Studie innerhalb ihrer Grenzen zu sehen.", "Fasse deine Position ruhig zusammen.", "Beende mit einer professionellen und dialogbereiten Formulierung."]}'::jsonb);
    END; $seed$;
