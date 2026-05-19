-- ============================================================
-- Seed: A0 English Path – STEP 3290 – Reading – understand a police report form
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La fecha del formulario es Tuesday 12 March.", "de": "Das Datum im Formular ist Tuesday 12 March.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La hora del incidente es 7:04 PM.", "de": "Die Uhrzeit des Vorfalls ist 7:04 PM.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El lugar es North Bus Station, Gate 4.", "de": "Der Ort ist North Bus Station, Gate 4.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El objeto robado es un teléfono Samsung negro con funda azul.", "de": "Der gestohlene Gegenstand ist ein schwarzes Samsung-Handy mit blauer Hülle.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El teléfono desapareció junto a la taquilla.", "de": "Das Telefon verschwand neben dem Fahrkartenschalter.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El testigo es el conductor de autobús Mr Evans.", "de": "Der Zeuge ist der Busfahrer Mr Evans.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El sospechoso llevaba una chaqueta roja.", "de": "Der Verdächtige trug eine rote Jacke.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El número del informe es P-2046.", "de": "Die Berichtsnummer ist P-2046.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué tipo de denuncia es?", "de": "Welche Art von Meldung ist das?", "s_es": {"type": "multiple_choice", "options": ["Stolen phone", "Lost passport", "Car accident"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Gestohlenes Telefon", "Verlorener Pass", "Autounfall"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién presenta la denuncia?", "de": "Wer meldet den Vorfall?", "s_es": {"type": "multiple_choice", "options": ["Laura Pérez", "Mr Evans", "The café manager"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Laura Pérez", "Mr Evans", "Der Café-Manager"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el número de contacto?", "de": "Wie lautet die Kontakttelefonnummer?", "s_es": {"type": "multiple_choice", "options": ["07700 889 114", "07700 889 141", "07000 889 114"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["07700 889 114", "07700 889 141", "07000 889 114"], "answer": 0}}'::jsonb,
        '{"es": "¿Hacia dónde corrió el sospechoso por última vez?", "de": "Wohin lief der Verdächtige zuletzt?", "s_es": {"type": "multiple_choice", "options": ["Towards King Street", "Towards River Road", "Towards Gate 1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In Richtung King Street", "In Richtung River Road", "In Richtung Tor 1"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué color era la gorra?", "de": "Welche Farbe hatte die Mütze?", "s_es": {"type": "multiple_choice", "options": ["Black", "Blue", "White"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Schwarz", "Blau", "Weiß"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde desapareció el teléfono?", "de": "Wo verschwand das Telefon?", "s_es": {"type": "multiple_choice", "options": ["From a seat near the coffee machine", "From the ticket office", "From the bus driver seat"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Von einem Sitz nahe der Kaffeemaschine", "Vom Fahrkartenschalter", "Vom Sitz des Busfahrers"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe hacer la persona al final del formulario?", "de": "Was soll die Person am Ende des Formulars tun?", "s_es": {"type": "multiple_choice", "options": ["Sign at the bottom", "Pay a fine", "Call the driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Unten unterschreiben", "Eine Strafe bezahlen", "Den Fahrer anrufen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe guardar la persona denunciante?", "de": "Was soll die meldende Person behalten?", "s_es": {"type": "multiple_choice", "options": ["The report number", "The suspect cap", "The station key"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Berichtsnummer", "Die Mütze des Verdächtigen", "Den Stationsschlüssel"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3290 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3290 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3290 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3290 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3290 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3290 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3290 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3290 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3290 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3290 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3290, 'en', 'reading', 'emergency', $content$
Police Incident Report Form. Date: Tuesday 12 March. Time: 7:40 PM. Place: North Bus Station, Gate 4.

Type of report: Stolen phone. Item: black Samsung mobile phone in a blue case. The phone disappeared from a seat near the coffee machine.

Person reporting: Laura Pérez. Contact number: 07700 889 114. Witness: bus driver Mr Evans.

Suspect details: young man, green jacket, black cap, small backpack. Last seen running towards King Street. Please sign at the bottom and keep report number P-2046.
$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Comprende un formulario de denuncia policial', 'Lee un formulario policial con fecha, lugar, objeto robado y datos del sospechoso.'),
        (v_reading_id, 'de', 'Verstehe ein Polizeiberichtsformular', 'Lies ein Polizeiformular mit Datum, Ort, gestohlenem Gegenstand und Angaben zum Verdächtigen.');

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
