-- ============================================================
-- Seed: A0 English Path – STEP 5840 – Reading – Gestión del Estudio y Trámites
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La biblioteca abre de 8 AM a 8 PM entre semana.", "de": "Die Bibliothek ist werktags von 8 bis 20 Uhr geöffnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "En la sala de estudio silencioso se puede hablar alto.", "de": "Im stillen Lernraum darf man laut sprechen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Se pueden sacar hasta cuatro libros.", "de": "Man kann bis zu vier Bücher ausleihen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El préstamo dura tres semanas.", "de": "Die Leihfrist beträgt drei Wochen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los libros se pueden renovar en línea.", "de": "Bücher können online verlängert werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La comida está permitida en toda la biblioteca.", "de": "Essen ist in der ganzen Bibliothek erlaubt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los portátiles están permitidos en la zona de ordenadores.", "de": "Laptops sind im Computerbereich erlaubt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los libros se pueden devolver en el mostrador principal.", "de": "Bücher können am Haupterschalter zurückgegeben werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿A qué hora abre la biblioteca entre semana?", "de": "Wann öffnet die Bibliothek werktags?", "s_es": {"type": "multiple_choice", "options": ["8 AM", "7 AM", "9 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8 Uhr", "7 Uhr", "9 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos libros se pueden sacar?", "de": "Wie viele Bücher kann man ausleihen?", "s_es": {"type": "multiple_choice", "options": ["Four", "Two", "Six"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vier", "Zwei", "Sechs"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto dura el préstamo?", "de": "Wie lange dauert die Ausleihe?", "s_es": {"type": "multiple_choice", "options": ["Three weeks", "One week", "Four weeks"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Wochen", "Eine Woche", "Vier Wochen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué se debe poner en silencio?", "de": "Was muss stumm gestellt werden?", "s_es": {"type": "multiple_choice", "options": ["Mobile phones", "Printers", "Windows"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mobiltelefone", "Drucker", "Fenster"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se permite el portátil?", "de": "Wo ist ein Laptop erlaubt?", "s_es": {"type": "multiple_choice", "options": ["Computer area", "Silent study room", "Book box"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Computerbereich", "Stiller Lernraum", "Bücherkasten"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué no está permitido?", "de": "Was ist nicht erlaubt?", "s_es": {"type": "multiple_choice", "options": ["Food and drinks", "Books", "ID cards"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Essen und Getränke", "Bücher", "Ausweise"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se devuelven los libros?", "de": "Wo gibt man Bücher zurück?", "s_es": {"type": "multiple_choice", "options": ["Front desk or book box", "Only at the café", "Only in class"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Schalter oder im Bücherkasten", "Nur im Café", "Nur im Unterricht"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo se deben renovar los libros?", "de": "Wann soll man die Bücher verlängern?", "s_es": {"type": "multiple_choice", "options": ["Before the due date", "After two months", "Only on weekends"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor dem Abgabetermin", "Nach zwei Monaten", "Nur am Wochenende"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5840 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5840 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5840, 'en', 'reading', 'Gestión del Estudio y Trámites', $reading$
East Hall Library is open from 8 AM to 8 PM on weekdays.

Please speak quietly in the silent study room. Mobile phones must be on silent.

You can borrow up to four books for three weeks. Renew books online before the due date if you need more time.

Laptops are allowed in the computer area, but food and drinks are not allowed anywhere in the library.

Return books at the front desk or in the book box near the entrance.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee las normas de la biblioteca', 'Lee un aviso con las normas básicas de uso, préstamo y silencio en la biblioteca.'),
        (v_reading_id, 'de', 'Lies die Bibliotheksregeln', 'Lies einen Aushang mit grundlegenden Regeln für Nutzung, Ausleihe und Ruhe in der Bibliothek.');

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
