-- ============================================================
-- Seed: A0 English Path – STEP 7000 – Speaking – understand in detail an argument in a discussion programme (Medios de Comunicación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7000 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7000 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7000 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7000 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7000 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7000 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7000 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7000 AND path_uuid=v_path_id;
    INSERT INTO speaking (path_uuid,step_order,source_language,type,category)
    VALUES (v_path_id,7000,'en','speaking','media')
    RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'es','Explicar un argumento de TV Plus','Explica un argumento escuchado en un programa de debate.','{"scenario": "Quieres hablar sobre un tema de medios: a debate about phones in schools.", "tasks": ["Di el tema principal.", "Di dónde o en qué programa aparece.", "Di una hora o momento.", "Menciona a una persona importante.", "Explica un detalle.", "Da una opinión simple.", "Di por qué es interesante.", "Haz un cierre breve y claro."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid,language,title,description,prompt)
    VALUES (v_speaking_id,'de','Ein Argument aus TV Plus erklären','Erkläre ein gehörtes Argument aus einer Diskussionssendung.','{"scenario": "Du möchtest über ein Medienthema sprechen: a debate about phones in schools.", "tasks": ["Nenne das Hauptthema.", "Sage, wo oder in welcher Sendung es vorkommt.", "Nenne eine Uhrzeit oder einen Zeitpunkt.", "Nenne eine wichtige Person.", "Erkläre ein Detail.", "Gib eine einfache Meinung.", "Sage, warum es interessant ist.", "Schließe kurz und klar ab."]}'::jsonb);
END; $seed$;
