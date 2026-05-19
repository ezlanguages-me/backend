-- ============================================================
-- Seed: A0 English Path – STEP 3350 – Reading – read about natural world/environment
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        $json${"p": "La reserva tiene un pequeño bosque.", "p_de": "Das Reservat hat einen kleinen Wald.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "En Green Valley no hay río.", "p_de": "In Green Valley gibt es keinen Fluss.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Las flores silvestres crecen junto al camino principal.", "p_de": "Die Wildblumen wachsen neben dem Hauptweg.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Los visitantes solo pueden caminar por una carretera para coches.", "p_de": "Besucher können nur auf einer Autostraße gehen.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Las papeleras de reciclaje están junto al centro de visitantes.", "p_de": "Die Recyclingbehälter stehen neben dem Besucherzentrum.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Los voluntarios plantan árboles jóvenes el sábado por la mañana.", "p_de": "Die Freiwilligen pflanzen am Samstagmorgen junge Bäume.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El centro abre a las 8 de la mañana.", "p_de": "Das Zentrum öffnet um 8 Uhr morgens.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "En el centro se venden mapas y listas de aves.", "p_de": "Im Zentrum werden Karten und Vogellisten verkauft.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "¿Qué lugares naturales hay en Green Valley?", "p_de": "Welche Naturorte gibt es in Green Valley?", "s": {"type": "multiple_choice", "options": ["A small forest, a river, and a wet meadow", "A desert and a volcano", "Only a beach"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde viven muchas aves?", "p_de": "Wo leben viele Vögel?", "s": {"type": "multiple_choice", "options": ["Near the water", "Inside the car park", "On the roof of the centre"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué no deben dejar los visitantes en el suelo?", "p_de": "Was sollen Besucher nicht auf den Boden werfen?", "s": {"type": "multiple_choice", "options": ["Plastic or paper", "Maps or birds", "Wooden bridges"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde están las papeleras de reciclaje?", "p_de": "Wo sind die Recyclingbehälter?", "s": {"type": "multiple_choice", "options": ["Next to the visitor centre", "Behind the hill", "In the river"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cuándo plantan árboles los voluntarios?", "p_de": "Wann pflanzen die Freiwilligen Bäume?", "s": {"type": "multiple_choice", "options": ["On Saturday morning", "Every night", "On Monday afternoon"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué plantan los voluntarios?", "p_de": "Was pflanzen die Freiwilligen?", "s": {"type": "multiple_choice", "options": ["Young trees", "Large rocks", "New roads"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿A qué hora abre el centro?", "p_de": "Um wie viel Uhr öffnet das Zentrum?", "s": {"type": "multiple_choice", "options": ["9 AM", "8 AM", "10 PM"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué se puede comprar allí?", "p_de": "Was kann man dort kaufen?", "s": {"type": "multiple_choice", "options": ["Maps and bird lists", "Rain boots and tents", "Boat tickets only"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3350 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3350 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3350, 'en', 'reading', 'nature', $reading$Green Valley Nature Reserve

Green Valley has a small forest, a river, and a wet meadow. Many birds live near the water, and wildflowers grow beside the main path.

Visitors can use marked trails and wooden bridges. Please do not leave plastic or paper on the ground. Recycling bins are next to the visitor centre.

On Saturday morning, volunteers plant young trees near the river. The centre opens at 9 AM and sells simple maps and bird lists.$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Leer sobre la naturaleza y el medio ambiente', 'Lee un texto breve sobre una reserva natural, senderos y hábitos responsables con el entorno.');

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Über Natur und Umwelt lesen', 'Lies einen kurzen Text über ein Naturschutzgebiet, Wege und verantwortungsvolles Verhalten in der Umwelt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
