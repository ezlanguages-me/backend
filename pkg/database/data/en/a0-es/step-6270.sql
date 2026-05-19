-- ============================================================
-- Seed: A0 English Path – STEP 6270 – Speaking – sugiere actividades sociales (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 6270 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 6270, 'en', 'speaking', 'Convivencia')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'sugiere actividades sociales', 'Practica cómo proponer planes sencillos y responder a preferencias distintas de forma natural.', '{"scenario": "Estás con tus compañeros después de clase y quieres proponer algo para pasar un rato juntos sin complicarlo demasiado.","tasks": ["Propón una actividad social sencilla, como café, paseo o cine.","Pregunta qué prefieren las otras personas.","Sugiere una hora concreta para quedar.","Di si puedes ir a pie, en bus o en bici.","Comenta si el plan depende del tiempo o del presupuesto.","Ofrece una alternativa por si el primer plan no funciona.","Invita a otra persona a unirse al plan.","Termina confirmando el día y despidiéndote con educación."],"de": {"scenario": "Du bist nach dem Unterricht mit Mitschülern zusammen und möchtest etwas Einfaches vorschlagen, um gemeinsam Zeit zu verbringen.","tasks": ["Schlage eine einfache soziale Aktivität vor, zum Beispiel Kaffee, Spaziergang oder Kino.","Frage, was die anderen bevorzugen.","Nenne eine konkrete Uhrzeit zum Treffen.","Sag, ob du zu Fuß, mit dem Bus oder mit dem Fahrrad kommen kannst.","Erwähne, ob der Plan vom Wetter oder Budget abhängt.","Biete eine Alternative an, falls der erste Plan nicht klappt.","Lade eine weitere Person ein, mitzukommen.","Bestätige am Ende den Tag und verabschiede dich höflich."]}}'::jsonb),
        (v_speaking_id, 'de', 'schlage soziale Aktivitäten vor', 'Übe, wie du einfache Pläne vorschlägst und natürlich auf unterschiedliche Vorlieben reagierst.', '{"scenario": "Du bist nach dem Unterricht mit Mitschülern zusammen und möchtest etwas Einfaches vorschlagen, um gemeinsam Zeit zu verbringen.","tasks": ["Schlage eine einfache soziale Aktivität vor, zum Beispiel Kaffee, Spaziergang oder Kino.","Frage, was die anderen bevorzugen.","Nenne eine konkrete Uhrzeit zum Treffen.","Sag, ob du zu Fuß, mit dem Bus oder mit dem Fahrrad kommen kannst.","Erwähne, ob der Plan vom Wetter oder Budget abhängt.","Biete eine Alternative an, falls der erste Plan nicht klappt.","Lade eine weitere Person ein, mitzukommen.","Bestätige am Ende den Tag und verabschiede dich höflich."]}'::jsonb);
END;
$seed$;
