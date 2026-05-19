-- ============================================================
-- Seed: A0 English Path – STEP 3030 – Reading – book a car hire
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El servicio de alquiler está en la Terminal 2.", "de": "Der Mietservice ist in Terminal 2.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El coche familiar cuesta menos que el coche pequeño.", "de": "Der Familienwagen kostet weniger als der Kleinwagen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El seguro básico está incluido en el precio.", "de": "Die Grundversicherung ist im Preis enthalten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El GPS es gratis.", "de": "Das GPS ist kostenlos.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Para reservar, necesitas pasaporte, permiso de conducir y tarjeta bancaria.", "de": "Für die Buchung brauchst du Reisepass, Führerschein und Bankkarte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Puedes recoger el coche a las siete de la mañana.", "de": "Du kannst das Auto um sieben Uhr morgens abholen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Debes devolver el coche con medio depósito de gasolina.", "de": "Du musst das Auto mit einem halben Tank zurückgeben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Si tu vuelo llega tarde, debes llamar antes de la hora de recogida.", "de": "Wenn dein Flug spät ist, sollst du vor der Abholzeit anrufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué tipos de coche puedes reservar?", "de": "Welche Fahrzeugtypen kannst du buchen?", "s_es": {"type": "multiple_choice", "options": ["A small car, a family car, or a van", "A bike, a boat, or a taxi", "Only a family car"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Kleinwagen, einen Familienwagen oder einen Van", "Ein Fahrrad, ein Boot oder ein Taxi", "Nur einen Familienwagen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta un coche pequeño por día?", "de": "Wie viel kostet ein Kleinwagen pro Tag?", "s_es": {"type": "multiple_choice", "options": ["Thirty two pounds", "Forty six pounds", "Ten pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweiunddreißig Pfund", "Sechsundvierzig Pfund", "Zehn Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué está incluido en el precio?", "de": "Was ist im Preis enthalten?", "s_es": {"type": "multiple_choice", "options": ["Basic insurance", "A free baby seat", "Free fuel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Grundversicherung", "Ein kostenloser Kindersitz", "Kostenloser Kraftstoff"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué cosa cuesta extra?", "de": "Was kostet extra?", "s_es": {"type": "multiple_choice", "options": ["GPS", "Basic insurance", "The desk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["GPS", "Die Grundversicherung", "Der Schalter"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué documento necesitas además del pasaporte?", "de": "Welches Dokument brauchst du außer dem Reisepass?", "s_es": {"type": "multiple_choice", "options": ["A driving licence", "A train ticket", "A hotel key"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Führerschein", "Eine Fahrkarte", "Einen Hotelschlüssel"], "answer": 0}}'::jsonb,
        '{"es": "¿Entre qué horas es la recogida?", "de": "Zwischen welchen Zeiten ist die Abholung?", "s_es": {"type": "multiple_choice", "options": ["Between 8 a.m. and 10 p.m.", "Between 6 a.m. and 7 a.m.", "Only at night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwischen 8 Uhr und 22 Uhr", "Zwischen 6 Uhr und 7 Uhr", "Nur nachts"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo debes devolver el coche?", "de": "Wie musst du das Auto zurückgeben?", "s_es": {"type": "multiple_choice", "options": ["With half a tank of petrol", "With a full bag", "With no key"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einem halben Tank", "Mit einer vollen Tasche", "Ohne Schlüssel"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo debes llamar al mostrador?", "de": "Wann sollst du beim Schalter anrufen?", "s_es": {"type": "multiple_choice", "options": ["If your flight is late", "If you want coffee", "After you go home"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wenn dein Flug spät ist", "Wenn du Kaffee möchtest", "Nachdem du nach Hause gegangen bist"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3030 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3030 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3030, 'en', 'reading', 'transport', 'SkyPort Car Hire is in Terminal 2. You can book a small car, a family car, or a van. Many visitors choose the small car for city trips.

A small car costs £32 per day. A family car costs £46 per day. The price includes basic insurance. GPS and baby seats cost extra.

To book a car, bring your passport, your driving licence, and a bank card. Pick up is at the Terminal 2 desk between 8 a.m. and 10 p.m.

Please return the car with half a tank of petrol. If your flight is late, call the desk before your pick up time.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee cómo reservar un coche de alquiler en el aeropuerto', 'Lee un texto breve con precio, documentos, recogida y devolución para reservar un coche en el aeropuerto.'),
        (v_reading_id, 'de', 'Lies, wie man am Flughafen einen Mietwagen bucht', 'Lies einen kurzen Text mit Preis, Dokumenten, Abholung und Rückgabe für eine Mietwagenbuchung am Flughafen.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
