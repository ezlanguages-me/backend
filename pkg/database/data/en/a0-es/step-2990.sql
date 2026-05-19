-- ============================================================
-- Seed: A0 English Path – STEP 2990 – Reading – book bus or coach seats
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Puedes reservar asientos en la web o en el mostrador de la estación.", "de": "Du kannst Sitzplätze auf der Website oder am Schalter im Bahnhof reservieren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los asientos delanteros reservados cuestan 3 libras cada uno.", "de": "Reservierte Vordersitze kosten 3 Pfund pro Sitz.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los asientos de mesa son para dos personas.", "de": "Tischplätze sind für zwei Personen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Primero eliges la hora del autocar y después el número de pasajeros.", "de": "Zuerst wählst du die Abfahrtszeit des Reisebusses und danach die Zahl der Fahrgäste.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Una maleta grande va debajo del asiento.", "de": "Ein großer Koffer kommt unter den Sitz.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Debes llegar veinte minutos antes de la salida.", "de": "Du sollst zwanzig Minuten vor der Abfahrt da sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Tienes que imprimir el billete en la estación.", "de": "Du musst das Ticket im Bahnhof ausdrucken.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Puedes elegir asiento de ventanilla o de pasillo.", "de": "Du kannst einen Fensterplatz oder einen Gangplatz wählen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué trayecto puedes reservar?", "de": "Welche Strecke kannst du reservieren?", "s_es": {"type": "multiple_choice", "options": ["De Bristol a Leeds", "De Greenhill a Seaview", "De West Airport a River Town"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Von Bristol nach Leeds", "Von Greenhill nach Seaview", "Von West Airport nach River Town"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta un asiento delantero reservado?", "de": "Wie viel kostet ein reservierter Vordersitz?", "s_es": {"type": "multiple_choice", "options": ["2 libras", "3 libras", "Gratis"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2 Pfund", "3 Pfund", "Kostenlos"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta un asiento de mesa reservado?", "de": "Wie viel kostet ein reservierter Tischplatz?", "s_es": {"type": "multiple_choice", "options": ["3 libras", "2 libras", "5 libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["3 Pfund", "2 Pfund", "5 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué haces después de elegir la hora del autocar?", "de": "Was machst du, nachdem du die Abfahrtszeit gewählt hast?", "s_es": {"type": "multiple_choice", "options": ["Añadir el número de pasajeros", "Pagar el equipaje grande", "Llamar al conductor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Zahl der Fahrgäste eingeben", "Für das große Gepäck bezahlen", "Den Fahrer anrufen"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde va el equipaje grande?", "de": "Wohin kommt das große Gepäck?", "s_es": {"type": "multiple_choice", "options": ["En el maletero del autocar", "Debajo del asiento", "En la mesa"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In den Gepäckraum des Reisebusses", "Unter den Sitz", "Auf den Tisch"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas bolsas pequeñas pueden ir debajo del asiento?", "de": "Wie viele kleine Taschen dürfen unter den Sitz?", "s_es": {"type": "multiple_choice", "options": ["Una", "Dos", "Tres"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine", "Zwei", "Drei"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo debes llegar?", "de": "Wann sollst du da sein?", "s_es": {"type": "multiple_choice", "options": ["Veinte minutos antes de la salida", "Cinco minutos después de la salida", "Una hora antes de pagar"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwanzig Minuten vor der Abfahrt", "Fünf Minuten nach der Abfahrt", "Eine Stunde vor dem Bezahlen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo puedes mostrar el billete?", "de": "Wie kannst du das Ticket zeigen?", "s_es": {"type": "multiple_choice", "options": ["En el teléfono o impreso en casa", "Solo en papel azul", "Solo en la taquilla"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Handy oder zu Hause ausgedruckt", "Nur auf blauem Papier", "Nur am Schalter"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2990 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2990 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2990, 'en', 'reading', 'transport', $content$
CoastLine Coach booking.
You can book seats for the coach from Bristol to Leeds on our website or at the station desk. Standard seats are free to choose. Reserved front seats cost £2 each. Reserved table seats cost £3 each and are for two people.

After you choose the coach time, add the number of passengers. Then choose window or aisle seats. One small bag can stay under your seat. Large luggage goes in the coach hold.

Please arrive twenty minutes before departure. Show the ticket on your phone or print it at home.

$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee cómo reservar asientos en un autocar', 'Lee una información sencilla para reservar asiento, equipaje y llegada.'),
        (v_reading_id, 'de', 'Lies, wie man Plätze im Reisebus reserviert', 'Lies eine einfache Information zu Sitzplatzreservierung, Gepäck und Ankunftszeit.');

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
