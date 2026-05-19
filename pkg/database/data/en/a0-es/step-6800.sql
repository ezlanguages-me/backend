-- ============================================================
-- Seed: A0 English Path – STEP 6800 – Speaking – participate in a conversation in a casual or semi-formal situation for a short time (Socialización)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6800 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6800 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6800 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6800 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6800 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6800 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6800 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6800 AND path_uuid=v_path_id;
    INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
    VALUES (v_path_id,6800,'en','speaking','socializing')
    RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'es','Hablar en una cena de bienvenida','Participa en una conversación breve.','{"scenario": "Estás en una situación social en a welcome dinner.", "tasks": ["Saluda a la otra persona.", "Di tu nombre.", "Haz una pregunta simple.", "Di algo sobre el evento.", "Menciona la hora.", "Menciona una actividad.", "Usa una frase social amable.", "Despídete de forma natural."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'de','Bei einem Willkommensabend sprechen','Nimm an einem kurzen Gespräch teil.','{"scenario": "Du bist in einer sozialen Situation bei einem Willkommensabend.", "tasks": ["Begrüße die andere Person.", "Sage deinen Namen.", "Stelle eine einfache Frage.", "Sage etwas über die Veranstaltung.", "Nenne die Uhrzeit.", "Nenne eine Aktivität.", "Benutze einen freundlichen sozialen Satz.", "Verabschiede dich natürlich."]}'::jsonb);
END; $seed$;
