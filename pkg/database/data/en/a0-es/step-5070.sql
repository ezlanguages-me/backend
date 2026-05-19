-- ============================================================
-- Seed: A0 English Path – STEP 5070 – Speaking – ask questions for reasons and clarification (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5070 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5070, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Hacer preguntas para pedir razones y aclaraciones', '', '{"scenario": "Estás en una clase o una conferencia y quieres pedir razones, definiciones y aclaraciones de una forma clara y educada.", "tasks": ["Pide la palabra de forma breve y educada.", "Pregunta qué significa una palabra o un concepto.", "Pregunta por qué el profesor o la ponente da un ejemplo concreto.", "Pide que repitan una cifra, una fecha o un dato.", "Pregunta si dos ideas del tema son diferentes o iguales.", "Pide una explicación más simple con tus propias palabras.", "Confirma que has entendido la respuesta.", "Da las gracias y termina tu turno."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Fragen nach Gründen und Klärung stellen', '', '{"scenario": "Du bist in einer Vorlesung oder auf einer Konferenz und möchtest höflich und klar nach Gründen, Definitionen und Erklärungen fragen.", "tasks": ["Bitte kurz und höflich um das Wort.", "Frag, was ein Wort oder ein Begriff bedeutet.", "Frag, warum der Dozent oder die Referentin ein bestimmtes Beispiel gibt.", "Bitte darum, eine Zahl, ein Datum oder eine Information zu wiederholen.", "Frag, ob zwei Ideen des Themas gleich oder verschieden sind.", "Bitte um eine einfachere Erklärung mit anderen Worten.", "Bestätige, dass du die Antwort verstanden hast.", "Bedanke dich und beende deinen Beitrag."]}'::jsonb);
END;
$seed$;
