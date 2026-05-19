-- ============================================================
-- Seed: A0 English Path – STEP 4930 – Speaking – ask questions at a conference (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4930 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4930, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Hacer preguntas en una conferencia', '', '{"scenario": "Has escuchado una presentación en una conferencia y quieres hacer preguntas claras y cortas sobre el tema, el horario o los materiales.", "tasks": ["Saluda o pide la palabra de forma cortés.", "Di a qué charla o parte de la conferencia te refieres.", "Haz una pregunta sencilla sobre una idea principal.", "Haz otra pregunta sobre un dato, una cifra o un ejemplo.", "Pregunta dónde puedes encontrar las diapositivas o el material.", "Aclara una palabra o expresión que no entendiste.", "Da las gracias por la respuesta.", "Cierra tu participación con una frase breve y educada."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Fragen auf einer Konferenz stellen', '', '{"scenario": "Du hast einen Vortrag auf einer Konferenz gehört und möchtest kurze klare Fragen zum Thema, Zeitplan oder Material stellen.", "tasks": ["Begrüße die Person oder bitte höflich um das Wort.", "Sag, auf welchen Vortrag oder welchen Teil der Konferenz du dich beziehst.", "Stell eine einfache Frage zu einer Hauptidee.", "Stell eine weitere Frage zu einer Zahl, einem Datum oder einem Beispiel.", "Frag, wo du die Folien oder das Material finden kannst.", "Klär ein Wort oder einen Ausdruck, den du nicht verstanden hast.", "Bedanke dich für die Antwort.", "Beende deinen Beitrag mit einem kurzen höflichen Satz."]}'::jsonb);
END;
$seed$;
