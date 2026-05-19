-- ============================================================
-- Seed: A0 English Path – STEP 6840 – Speaking – introduce yourself at a social event (Socialización)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6840 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6840 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6840 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6840 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6840 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6840 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6840 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6840 AND path_uuid=v_path_id;
    INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
    VALUES (v_path_id,6840,'en','speaking','socializing')
    RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'es','Presentarte en un evento social','Preséntate en el evento.','{"scenario": "Estás en una situación social en a student party.", "tasks": ["Saluda a la otra persona.", "Di tu nombre.", "Haz una pregunta simple.", "Di algo sobre el evento.", "Menciona la hora.", "Menciona una actividad.", "Usa una frase social amable.", "Despídete de forma natural."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'de','Dich bei einer sozialen Veranstaltung vorstellen','Stelle dich bei der Veranstaltung vor.','{"scenario": "Du bist in einer sozialen Situation bei einer Studentenparty.", "tasks": ["Begrüße die andere Person.", "Sage deinen Namen.", "Stelle eine einfache Frage.", "Sage etwas über die Veranstaltung.", "Nenne die Uhrzeit.", "Nenne eine Aktivität.", "Benutze einen freundlichen sozialen Satz.", "Verabschiede dich natürlich."]}'::jsonb);
END; $seed$;
