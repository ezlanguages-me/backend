-- ============================================================
-- Seed: A0 English Path – STEP 5470 – Speaking – give short turns in academic discussion (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5470 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5470, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Intervenir brevemente en una discusión académica', '', '{"scenario": "Quieres participar con intervenciones breves en una discusión de clase, tomando el turno con claridad y reaccionando a otras opiniones.", "tasks": ["Pide el turno o entra en la discusión con una frase breve.", "Di una opinión simple sobre el tema.", "Añade una razón corta o un ejemplo pequeño.", "Reacciona a la opinión anterior con acuerdo o desacuerdo.", "Haz una pregunta breve a otro participante.", "Conecta tu idea con el tema principal de la discusión.", "Cede el turno de forma educada.", "Mantén tu intervención breve y clara."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Kurze Beiträge in einer akademischen Diskussion geben', '', '{"scenario": "Du möchtest dich mit kurzen Beiträgen an einer Unterrichtsdiskussion beteiligen, klar das Wort nehmen und auf andere Meinungen reagieren.", "tasks": ["Bitte kurz um das Wort oder steige mit einem kurzen Satz in die Diskussion ein.", "Sag eine einfache Meinung zum Thema.", "Füge einen kurzen Grund oder ein kleines Beispiel hinzu.", "Reagiere mit Zustimmung oder Widerspruch auf die vorige Meinung.", "Stell einer anderen Person eine kurze Frage.", "Verbinde deine Idee mit dem Hauptthema der Diskussion.", "Gib das Wort höflich weiter.", "Halte deinen Beitrag kurz und klar."]}'::jsonb);
END;
$seed$;
