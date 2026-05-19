-- ============================================================
-- Seed: A0 English Path – STEP 7330 – Speaking – sustain a casual conversation on abstract topics
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7330 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7330, 'en', 'speaking', 'social')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Sostén una conversación casual sobre temas abstractos', 'Practica cómo mantener una conversación relajada con una familia anfitriona sobre costumbres, opiniones y temas culturales.', '{"scenario": "Estás en casa de tu familia anfitriona después de cenar. La conversación sigue en la mesa y todos hablan de costumbres, festivales, silencio al conversar y otras ideas culturales.", "tasks": ["Saluda y retoma un tema de la cena con una frase amable.", "Comenta una costumbre de tu casa o de tu ciudad.", "Pregunta por una fiesta local, una tradición o una costumbre familiar.", "Compara cómo se habla en tu entorno y en la casa anfitriona.", "Da tu opinión sobre llegar exactamente a tiempo o llegar un poco más tarde.", "Responde con educación a una opinión diferente y añade una razón.", "Haz una pregunta de seguimiento sobre poesía, música o humor.", "Cierra la conversación dando las gracias y diciendo que te gustaría seguir hablando otro día."]}'::jsonb),
        (v_speaking_id, 'de', 'Führe ein lockeres Gespräch über abstrakte Themen', 'Übe, wie du mit einer Gastfamilie entspannt über Gewohnheiten, Meinungen und kulturelle Themen sprichst.', '{"scenario": "Du sitzt nach dem Abendessen noch mit deiner Gastfamilie am Tisch. Das Gespräch geht weiter und alle sprechen über Gewohnheiten, Feste, Schweigen im Gespräch und andere kulturelle Ideen.", "tasks": ["Begrüße die anderen und greife freundlich ein Thema vom Abendessen wieder auf.", "Nenne eine Gewohnheit aus deiner Familie oder deiner Stadt.", "Frage nach einem lokalen Fest, einer Tradition oder einer Familiengewohnheit.", "Vergleiche, wie man bei dir und in der Gastfamilie miteinander spricht.", "Sag deine Meinung dazu, ob man ganz pünktlich oder etwas später kommt.", "Reagiere höflich auf eine andere Meinung und gib einen Grund.", "Stelle eine Anschlussfrage zu Poesie, Musik oder Humor.", "Beende das Gespräch mit einem Dank und sage, dass du gern ein anderes Mal weiterreden möchtest."]}'::jsonb);
END;
$seed$;
