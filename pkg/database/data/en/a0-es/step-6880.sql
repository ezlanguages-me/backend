-- ============================================================
-- Seed: A0 English Path – STEP 6880 – Speaking – accept or decline a social invitation (Socialización)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6880 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6880 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6880 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6880 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6880 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6880 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6880 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6880 AND path_uuid=v_path_id;
    INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
    VALUES (v_path_id,6880,'en','speaking','socializing')
    RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'es','Aceptar o rechazar una invitación','Acepta o rechaza una invitación de forma natural.','{"scenario": "Estás en una situación social en a picnic invitation.", "tasks": ["Saluda a la otra persona.", "Di tu nombre.", "Haz una pregunta simple.", "Di algo sobre el evento.", "Menciona la hora.", "Menciona una actividad.", "Usa una frase social amable.", "Despídete de forma natural."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'de','Eine Einladung annehmen oder ablehnen','Nimm eine Einladung natürlich an oder lehne sie ab.','{"scenario": "Du bist in einer sozialen Situation bei einer Picknick-Einladung.", "tasks": ["Begrüße die andere Person.", "Sage deinen Namen.", "Stelle eine einfache Frage.", "Sage etwas über die Veranstaltung.", "Nenne die Uhrzeit.", "Nenne eine Aktivität.", "Benutze einen freundlichen sozialen Satz.", "Verabschiede dich natürlich."]}'::jsonb);
END; $seed$;
