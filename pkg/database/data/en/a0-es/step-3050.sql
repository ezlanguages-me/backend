-- ============================================================
-- Seed: A0 English Path – STEP 3050 – Dialogue – book a car hire
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Agent", "text": "Hello. How can I help you?", "es": "Hola. ¿En qué puedo ayudarle?", "de": "Hallo. Wie kann ich Ihnen helfen?"}'::jsonb,
        '{"character": "Visitor", "text": "I want to book a small car for tomorrow.", "es": "Quiero reservar un coche pequeño para mañana.", "de": "Ich möchte für morgen einen Kleinwagen buchen."}'::jsonb,
        '{"character": "Agent", "text": "Yes. We have one small car from nine a.m.", "es": "Sí. Tenemos un coche pequeño desde las nueve de la mañana.", "de": "Ja. Wir haben ab neun Uhr einen Kleinwagen."}'::jsonb,
        '{"character": "Visitor", "text": "How much is it for one day?", "es": "¿Cuánto cuesta por un día?", "de": "Wie viel kostet es für einen Tag?"}'::jsonb,
        '{"character": "Agent", "text": "It is forty pounds for the day.", "es": "Cuesta cuarenta libras por el día.", "de": "Es kostet vierzig Pfund für den Tag."}'::jsonb,
        '{"character": "Visitor", "text": "Can I return it in the evening?", "es": "¿Puedo devolverlo por la tarde?", "de": "Kann ich es am Abend zurückgeben?"}'::jsonb,
        '{"character": "Agent", "text": "Yes, please bring it back by eight p.m.", "es": "Sí, por favor, tráigalo de vuelta antes de las ocho de la tarde.", "de": "Ja, bitte bringen Sie es bis acht Uhr abends zurück."}'::jsonb,
        '{"character": "Visitor", "text": "Good. I need a child seat too.", "es": "Bien. También necesito una silla infantil.", "de": "Gut. Ich brauche auch einen Kindersitz."}'::jsonb,
        '{"character": "Agent", "text": "No problem. Please bring your driving licence.", "es": "No hay problema. Por favor, traiga su permiso de conducir.", "de": "Kein Problem. Bitte bringen Sie Ihren Führerschein mit."}'::jsonb,
        '{"character": "Visitor", "text": "Thank you. I will book it now.", "es": "Gracias. Lo reservaré ahora.", "de": "Danke. Ich buche es jetzt."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El visitante quiere reservar un coche pequeño para mañana.", "de": "Der Besucher möchte für morgen einen Kleinwagen buchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El coche está disponible desde las nueve de la mañana.", "de": "Das Auto ist ab neun Uhr morgens verfügbar.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El precio por un día es de treinta libras.", "de": "Der Preis für einen Tag beträgt dreißig Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El visitante puede devolver el coche antes de las ocho de la tarde.", "de": "Der Besucher kann das Auto bis acht Uhr abends zurückgeben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La agente dice que no hace falta permiso de conducir.", "de": "Die Agentin sagt, dass kein Führerschein nötig ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué quiere reservar el visitante?", "de": "Was möchte der Besucher buchen?", "s_es": {"type": "multiple_choice", "options": ["A small car", "A hotel room", "A bike"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Kleinwagen", "Ein Hotelzimmer", "Ein Fahrrad"], "answer": 0}}'::jsonb,
        '{"es": "¿Para cuándo quiere el coche?", "de": "Für wann möchte er das Auto?", "s_es": {"type": "multiple_choice", "options": ["For tomorrow", "For next month", "For tonight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für morgen", "Für nächsten Monat", "Für heute Abend"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta por un día?", "de": "Wie viel kostet es für einen Tag?", "s_es": {"type": "multiple_choice", "options": ["Forty pounds", "Nine pounds", "Eighty pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vierzig Pfund", "Neun Pfund", "Achtzig Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué extra necesita el visitante?", "de": "Welche Zusatzoption braucht der Besucher?", "s_es": {"type": "multiple_choice", "options": ["A child seat", "A map", "A second driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Kindersitz", "Eine Karte", "Einen zweiten Fahrer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué documento debe llevar?", "de": "Welches Dokument soll er mitbringen?", "s_es": {"type": "multiple_choice", "options": ["His driving licence", "His train ticket", "His school book"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Seinen Führerschein", "Seine Fahrkarte", "Sein Schulbuch"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3050 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 3050 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3050, 'en', 'dialogue', 'transport', '[{"name": "Agent", "gender": "female", "avatarURL": "https://example.com/avatars/agent.png"}, {"name": "Visitor", "gender": "male", "avatarURL": "https://example.com/avatars/visitor.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Reserva un coche de alquiler en una oficina turística', 'Lee un diálogo sencillo para reservar un coche pequeño para mañana con precio, hora y documento.'),
        (v_dialogue_id, 'de', 'Buche einen Mietwagen in einem Touristenbüro', 'Lies einen einfachen Dialog zur Buchung eines Kleinwagens für morgen mit Preis, Uhrzeit und Dokument.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
