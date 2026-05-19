-- ============================================================
-- Seed: A0 English Path – STEP 3150 – Reading – understand customs and border control forms (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Hay que usar letras mayusculas y bolígrafo azul o negro.", "de": "Man soll Blockbuchstaben und einen blauen oder schwarzen Stift benutzen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Una familia completa usa un solo formulario.", "de": "Eine ganze Familie benutzt nur ein Formular.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los niños pueden ir en el formulario de uno de los padres.", "de": "Kinder können auf dem Formular eines Elternteils stehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Debes escribir apellido, nombre, fecha de nacimiento, nacionalidad y número de pasaporte.", "de": "Man soll Nachname, Vorname, Geburtsdatum, Nationalität und Passnummer eintragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El número del autobús va en la casilla del hotel.", "de": "Die Busnummer kommt in das Hotelfeld.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay que escribir la dirección de la primera noche en el país.", "de": "Man soll die Adresse der ersten Nacht im Land schreiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay que marcar yes si llevas comida, plantas o más de un litro de alcohol.", "de": "Man soll yes ankreuzen, wenn man Essen, Pflanzen oder mehr als einen Liter Alkohol dabei hat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se firma y se pone la fecha en la parte superior.", "de": "Man unterschreibt und datiert oben auf dem Formular.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué colores de bolígrafo se pueden usar?", "de": "Welche Stiftfarben kann man benutzen?", "s_es": {"type": "multiple_choice", "options": ["Blue or black", "Red or green", "Yellow only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blau oder schwarz", "Rot oder grün", "Nur gelb"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién necesita un formulario propio?", "de": "Wer braucht ein eigenes Formular?", "s_es": {"type": "multiple_choice", "options": ["Each adult traveller", "Only the driver", "Only children"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Jeder erwachsene Reisende", "Nur der Fahrer", "Nur Kinder"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué formulario pueden ir los niños?", "de": "Auf welchem Formular können Kinder stehen?", "s_es": {"type": "multiple_choice", "options": ["On one parent form", "On the bus ticket", "On a food list"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Formular eines Elternteils", "Auf dem Busticket", "Auf einer Essensliste"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué se escribe en la casilla travel number si llegas en autobús?", "de": "Was schreibt man in das Feld travel number, wenn man mit dem Bus kommt?", "s_es": {"type": "multiple_choice", "options": ["The coach number", "The hotel name", "The seat colour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Busnummer", "Den Hotelnamen", "Die Farbe des Sitzes"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dirección hay que escribir?", "de": "Welche Adresse soll man schreiben?", "s_es": {"type": "multiple_choice", "options": ["The address of the first night", "The address of the old school", "The address of the bus station cafe"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Adresse der ersten Nacht", "Die Adresse der alten Schule", "Die Adresse des Cafés am Busbahnhof"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo se marca yes?", "de": "Wann kreuzt man yes an?", "s_es": {"type": "multiple_choice", "options": ["When you bring food, plants, or more than one litre of alcohol", "When you only have a toothbrush", "When you have no bag"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wenn man Essen, Pflanzen oder mehr als einen Liter Alkohol dabei hat", "Wenn man nur eine Zahnbürste hat", "Wenn man keine Tasche hat"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué se entrega al agente?", "de": "Was gibt man dem Beamten?", "s_es": {"type": "multiple_choice", "options": ["The form and the passport", "A train map and a sandwich", "A bank card only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Formular und den Reisepass", "Einen Zugplan und ein Sandwich", "Nur eine Bankkarte"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se firma y se pone la fecha?", "de": "Wo unterschreibt und datiert man?", "s_es": {"type": "multiple_choice", "options": ["At the bottom", "At the top", "On the back of the passport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Unten", "Oben", "Auf der Rückseite des Reisepasses"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3150 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3150 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3150, 'en', 'reading', 'transport', $content$
Border Entry Form

Please use block letters and a blue or black pen. Write one form for each adult traveller. Children can go on the form of one parent.

Write your family name, first name, date of birth, nationality, and passport number. If you arrive by coach, write the coach number in the travel number box.

Write the address of your first night in the country. Tick yes if you bring food, plants, or more than one litre of alcohol. Tick no if you have nothing to declare.

Sign and date the form at the bottom. Give the form and your passport to the officer at the desk.
$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee formularios de aduana y frontera', 'Lee instrucciones simples de un formulario de entrada en la frontera y entiende qué datos debes completar.'),
        (v_reading_id, 'de', 'Lies Formulare für Zoll und Grenzkontrolle', 'Lies einfache Anweisungen zu einem Einreiseformular an der Grenze und verstehe, welche Angaben du ausfüllen musst.');

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
