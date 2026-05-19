-- ============================================================
-- Seed: A0 English Path – STEP 3010 – Dialogue – understand cost per hour and per day
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
        '{"character": "Clerk", "text": "Hello. Do you want a bike today?", "es": "Hola. ¿Quiere una bicicleta para hoy?", "de": "Hallo. Möchten Sie heute ein Fahrrad?"}'::jsonb,
        '{"character": "Tourist", "text": "Yes, please. How much is it per hour?", "es": "Sí, por favor. ¿Cuánto cuesta por hora?", "de": "Ja, bitte. Wie viel kostet es pro Stunde?"}'::jsonb,
        '{"character": "Clerk", "text": "It is four pounds per hour.", "es": "Cuesta cuatro libras por hora.", "de": "Es kostet vier Pfund pro Stunde."}'::jsonb,
        '{"character": "Tourist", "text": "And how much is it for one day?", "es": "¿Y cuánto cuesta por un día?", "de": "Und wie viel kostet es für einen Tag?"}'::jsonb,
        '{"character": "Clerk", "text": "It is eighteen pounds for the day.", "es": "Cuesta dieciocho libras por el día.", "de": "Es kostet achtzehn Pfund für den Tag."}'::jsonb,
        '{"character": "Tourist", "text": "Is a helmet included?", "es": "¿Está incluido un casco?", "de": "Ist ein Helm dabei?"}'::jsonb,
        '{"character": "Clerk", "text": "Yes, one helmet is included.", "es": "Sí, un casco está incluido.", "de": "Ja, ein Helm ist inklusive."}'::jsonb,
        '{"character": "Tourist", "text": "Good. I want the bike for three hours.", "es": "Bien. Quiero la bicicleta por tres horas.", "de": "Gut. Ich möchte das Fahrrad für drei Stunden."}'::jsonb,
        '{"character": "Clerk", "text": "No problem. Please bring it back before six o clock.", "es": "No hay problema. Por favor, tráigala de vuelta antes de las seis.", "de": "Kein Problem. Bitte bringen Sie es vor sechs Uhr zurück."}'::jsonb,
        '{"character": "Tourist", "text": "Great. I can pay now.", "es": "Estupendo. Puedo pagar ahora.", "de": "Super. Ich kann jetzt bezahlen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El turista quiere una bicicleta para hoy.", "de": "Der Tourist möchte heute ein Fahrrad.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La bicicleta cuesta cuatro libras por hora.", "de": "Das Fahrrad kostet vier Pfund pro Stunde.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El precio por día es doce libras.", "de": "Der Tagespreis beträgt zwölf Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Un casco está incluido.", "de": "Ein Helm ist inklusive.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El turista quiere la bicicleta por tres días.", "de": "Der Tourist möchte das Fahrrad für drei Tage.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué pregunta primero el turista?", "de": "Was fragt der Tourist zuerst?", "s_es": {"type": "multiple_choice", "options": ["The price per hour", "The colour of the bike", "The bus time"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Preis pro Stunde", "Die Farbe des Fahrrads", "Die Buszeit"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la bicicleta por un día?", "de": "Wie viel kostet das Fahrrad für einen Tag?", "s_es": {"type": "multiple_choice", "options": ["Eighteen pounds", "Four pounds", "Twenty pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Achtzehn Pfund", "Vier Pfund", "Zwanzig Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué está incluido?", "de": "Was ist inklusive?", "s_es": {"type": "multiple_choice", "options": ["One helmet", "A map", "Lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Helm", "Eine Karte", "Mittagessen"], "answer": 0}}'::jsonb,
        '{"es": "¿Durante cuánto tiempo quiere la bicicleta?", "de": "Für wie lange möchte er das Fahrrad?", "s_es": {"type": "multiple_choice", "options": ["Three hours", "One hour", "Three days"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Stunden", "Eine Stunde", "Drei Tage"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo debe devolver la bicicleta?", "de": "Wann soll er das Fahrrad zurückbringen?", "s_es": {"type": "multiple_choice", "options": ["Before six o clock", "At midnight", "Next week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor sechs Uhr", "Um Mitternacht", "Nächste Woche"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3010 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 3010 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3010, 'en', 'dialogue', 'transport', '[{"name": "Clerk", "gender": "female", "avatarURL": "https://example.com/avatars/clerk.png"}, {"name": "Tourist", "gender": "male", "avatarURL": "https://example.com/avatars/tourist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Entiende el precio por hora y por día en un alquiler de bicicletas', 'Lee un diálogo simple en un puesto de alquiler de bicicletas con precio por hora, precio por día y devolución.'),
        (v_dialogue_id, 'de', 'Verstehe den Preis pro Stunde und pro Tag bei einem Fahrradverleih', 'Lies einen einfachen Dialog an einem Fahrradverleih mit Stundenpreis, Tagespreis und Rückgabezeit.');

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
