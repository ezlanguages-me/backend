-- ============================================================
-- Seed: A0 English Path – STEP 5980 – Reading – Alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La factura es para Maria Ruiz.", "de": "Die Rechnung ist für Maria Ruiz.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La estancia es de dos noches.", "de": "Der Aufenthalt dauert zwei Nächte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La habitación cuesta £120.", "de": "Das Zimmer kostet 120 Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El desayuno se cobra aparte.", "de": "Das Frühstück wird separat berechnet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El aparcamiento cuesta £16.", "de": "Der Parkplatz kostet 16 Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La salida tardía cuesta £20.", "de": "Der späte Check-out kostet 20 Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tasa municipal es de £8.", "de": "Die Stadtsteuer beträgt 8 Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El total es £164.", "de": "Die Gesamtsumme beträgt 164 Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuánto cuesta la habitación?", "de": "Wie viel kostet das Zimmer?", "s_es": {"type": "multiple_choice", "options": ["£120", "£100", "£140"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["120 Pfund", "100 Pfund", "140 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta el aparcamiento?", "de": "Wie viel kostet der Parkplatz?", "s_es": {"type": "multiple_choice", "options": ["£16", "£8", "£20"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["16 Pfund", "8 Pfund", "20 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la salida tardía?", "de": "Wie viel kostet der späte Check-out?", "s_es": {"type": "multiple_choice", "options": ["£20", "£10", "£30"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20 Pfund", "10 Pfund", "30 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el total?", "de": "Wie hoch ist die Gesamtsumme?", "s_es": {"type": "multiple_choice", "options": ["£164", "£156", "£172"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["164 Pfund", "156 Pfund", "172 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué formas de pago acepta la recepción?", "de": "Welche Zahlungsmethoden akzeptiert die Rezeption?", "s_es": {"type": "multiple_choice", "options": ["Cash or card", "Only cash", "Only cheque"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bargeld oder Karte", "Nur Bargeld", "Nur Scheck"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué cargo está incluido?", "de": "Welche Leistung ist inbegriffen?", "s_es": {"type": "multiple_choice", "options": ["Breakfast", "Parking", "Late checkout"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Frühstück", "Parkplatz", "Später Check-out"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué cargo extra se menciona?", "de": "Welche Zusatzkosten werden genannt?", "s_es": {"type": "multiple_choice", "options": ["City tax", "Laundry", "Gym"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Stadtsteuer", "Wäscherei", "Fitnessraum"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se paga?", "de": "Wo bezahlt man?", "s_es": {"type": "multiple_choice", "options": ["At reception", "In the room", "At the lift"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An der Rezeption", "Im Zimmer", "Am Aufzug"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5980 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5980 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5980, 'en', 'reading', 'Alojamiento', $reading$
Riverside Hotel invoice

Guest: Maria Ruiz
Room: Twin room, 2 nights
Room charge: £120
Breakfast: included
Parking: £16
Late checkout: £20
City tax: £8
Total: £164
Payment: cash or card at reception
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee la factura del hotel', 'Lee una factura de hotel con habitación, desayuno, aparcamiento y cargos extra.'),
        (v_reading_id, 'de', 'Lies die Hotelrechnung', 'Lies eine Hotelrechnung mit Zimmer, Frühstück, Parkplatz und Zusatzkosten.');

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

