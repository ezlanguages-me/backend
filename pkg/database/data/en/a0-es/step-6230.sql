-- ============================================================
-- Seed: A0 English Path – STEP 6230 – Speaking – habla con compañeros de forma informal (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 6230 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 6230, 'en', 'speaking', 'Convivencia')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'habla con compañeros de forma informal', 'Practica pequeñas interacciones para sonar cercano, natural y educado cuando hablas con compañeros.', '{"scenario": "Estás en el campus y te encuentras con varios compañeros antes de irte a casa. Tienes unos minutos para hablar con naturalidad y sonar amable.","tasks": ["Saluda y pregunta cómo va el día.","Comenta algo breve sobre la clase o el tiempo.","Pregunta si la otra persona tiene planes para esta tarde.","Sugiere tomar un café, caminar o estudiar un rato.","Di algo sencillo sobre tu propia rutina, por ejemplo I am free after lunch.","Haz una pregunta de seguimiento sobre el fin de semana.","Responde con educación si la otra persona no puede quedarse.","Termina con una despedida amable y natural."],"de": {"scenario": "Du bist auf dem Campus und triffst vor dem Heimweg einige Mitschüler. Du hast ein paar Minuten Zeit für ein natürliches, freundliches Gespräch.","tasks": ["Begrüße die andere Person und frage, wie der Tag läuft.","Mach eine kurze Bemerkung über den Unterricht oder das Wetter.","Frage, ob die andere Person heute Nachmittag Pläne hat.","Schlage vor, einen Kaffee zu trinken, spazieren zu gehen oder eine Weile zu lernen.","Sag etwas Einfaches über deine eigene Routine, zum Beispiel I am free after lunch.","Stelle eine Anschlussfrage zum Wochenende.","Antworte höflich, wenn die andere Person nicht bleiben kann.","Beende das Gespräch mit einer freundlichen Verabschiedung."]}}'::jsonb),
        (v_speaking_id, 'de', 'sprich locker mit Mitschülern', 'Übe kurze Gespräche, damit du bei Mitschülern nahbar, natürlich und höflich klingst.', '{"scenario": "Du bist auf dem Campus und triffst vor dem Heimweg einige Mitschüler. Du hast ein paar Minuten Zeit für ein natürliches, freundliches Gespräch.","tasks": ["Begrüße die andere Person und frage, wie der Tag läuft.","Mach eine kurze Bemerkung über den Unterricht oder das Wetter.","Frage, ob die andere Person heute Nachmittag Pläne hat.","Schlage vor, einen Kaffee zu trinken, spazieren zu gehen oder eine Weile zu lernen.","Sag etwas Einfaches über deine eigene Routine, zum Beispiel I am free after lunch.","Stelle eine Anschlussfrage zum Wochenende.","Antworte höflich, wenn die andere Person nicht bleiben kann.","Beende das Gespräch mit einer freundlichen Verabschiedung."]}'::jsonb);
END;
$seed$;
