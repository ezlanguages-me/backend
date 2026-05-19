-- ============================================================
-- Seed: A0 English Path – STEP 3650 – Reading – understand terms and conditions (Alojamiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El check-in empieza a las 3 PM.", "p_de": "Der Check-in beginnt um 15 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las saver rooms se pueden cancelar gratis.", "p_de": "Saver rooms kann man kostenlos stornieren.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se permiten mascotas.", "p_de": "Haustiere sind erlaubt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Una cama extra cuesta £20 por noche.", "p_de": "Ein Zustellbett kostet £20 pro Nacht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que bajar el ruido después de las 10 PM.", "p_de": "Nach 22 Uhr soll man leise sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La piscina cierra a las 10 PM.", "p_de": "Der Pool schließt um 22 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Una key card perdida cuesta £15.", "p_de": "Eine verlorene Schlüsselkarte kostet £15.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El hotel paga todos los daños de la habitación.", "p_de": "Das Hotel bezahlt alle Zimmerschäden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuándo empieza el check-in?", "p_de": "Wann beginnt der Check-in?", "s_es": {"type": "multiple_choice", "options": ["At 3 PM", "At noon", "At 11 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 15 Uhr", "Um 12 Uhr", "Um 11 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de habitación no es reembolsable?", "p_de": "Welche Zimmerart ist nicht erstattbar?", "s_es": {"type": "multiple_choice", "options": ["Saver rooms", "Family rooms", "Pool rooms"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Saver rooms", "Familienzimmer", "Poolzimmer"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué animales acepta el hotel?", "p_de": "Welche Tiere akzeptiert das Hotel?", "s_es": {"type": "multiple_choice", "options": ["No pets", "Only cats", "Only dogs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Keine Haustiere", "Nur Katzen", "Nur Hunde"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta una cama extra?", "p_de": "Wie viel kostet ein Zustellbett?", "s_es": {"type": "multiple_choice", "options": ["£20 per night", "£15 per night", "£20 total"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£20 pro Nacht", "£15 pro Nacht", "£20 insgesamt"], "answer": 0}}'::jsonb,
        '{"p": "¿Después de qué hora debe haber poco ruido?", "p_de": "Nach welcher Uhrzeit soll es leise sein?", "s_es": {"type": "multiple_choice", "options": ["After 10 PM", "After 8 PM", "After midnight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach 22 Uhr", "Nach 20 Uhr", "Nach Mitternacht"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo cierra la piscina?", "p_de": "Wann schließt der Pool?", "s_es": {"type": "multiple_choice", "options": ["At 9 PM", "At 10 PM", "At 7 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 21 Uhr", "Um 22 Uhr", "Um 19 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué cuesta £15?", "p_de": "Was kostet £15?", "s_es": {"type": "multiple_choice", "options": ["A lost key card", "An extra towel", "A late breakfast"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine verlorene Schlüsselkarte", "Ein extra Handtuch", "Ein spätes Frühstück"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién paga los daños graves de la habitación?", "p_de": "Wer bezahlt schwere Zimmerschäden?", "s_es": {"type": "multiple_choice", "options": ["The guest", "The hotel", "The city"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Gast", "Das Hotel", "Die Stadt"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid FROM reading WHERE step_order = 3650 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading'
        );
        DELETE FROM reading WHERE step_order = 3650 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3650, 'en', 'reading', 'accommodation', $content$Silver Coast Hotel Terms and Conditions. Check-in starts at 3 PM. Saver rooms are non-refundable. Pets are not allowed.

An extra bed costs £20 per night. Please keep noise low after 10 PM. The pool closes at 9 PM.

Lost key cards cost £15. Guests pay for any serious room damage.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee términos y condiciones del hotel', 'Lee normas básicas del hotel sobre check-in, devoluciones, llaves y ruido.'),
            (v_reading_id, 'de', 'Lies Hotel-AGB', 'Lies einfache Hotelregeln zu Check-in, Rückerstattung, Schlüsseln und Lärm.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
