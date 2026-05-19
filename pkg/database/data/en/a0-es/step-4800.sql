-- ============================================================
-- Seed: A0 English Path – STEP 4800 – Reading – take or leave routine messages, ask for clarification (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El mensaje es para la señora Rachel Green.", "p_de": "Die Nachricht ist für Frau Rachel Green.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El mensaje se tomó un miércoles.", "p_de": "Die Nachricht wurde an einem Mittwoch aufgenommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Quien llama es el señor Oliver Park de Park & Webb Ltd.", "p_de": "Der Anrufer ist Herr Oliver Park von Park & Webb Ltd.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El número de pedido es 7720.", "p_de": "Die Bestellnummer lautet 7720.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El señor Park quiere cambiar la dirección de entrega.", "p_de": "Herr Park möchte die Lieferadresse ändern.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La dirección de entrega es Warehouse B, 23 Canal Road.", "p_de": "Die Lieferadresse ist Warehouse B, 23 Canal Road.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El señor Park quiere la entrega antes de las 15:00 del viernes.", "p_de": "Herr Park möchte die Lieferung vor 15 Uhr am Freitag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El señor Park volverá a llamar mañana por la tarde si no recibe respuesta.", "p_de": "Herr Park wird morgen Nachmittag erneut anrufen, falls er keine Antwort erhält.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Para quién es el mensaje?", "p_de": "Für wen ist die Nachricht?", "s_es": {"type": "multiple_choice", "options": ["Para la señora Rachel Green", "Para el señor Oliver Park", "Para la recepcionista"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für Frau Rachel Green", "Für Herrn Oliver Park", "Für die Empfangskraft"], "answer": 0}}'::jsonb,
            '{"p": "¿A qué hora se tomó el mensaje?", "p_de": "Um wie viel Uhr wurde die Nachricht aufgenommen?", "s_es": {"type": "multiple_choice", "options": ["A las 11:30", "A las 9:45", "A las 14:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 11:30 Uhr", "Um 9:45 Uhr", "Um 14 Uhr"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el número de pedido?", "p_de": "Wie lautet die Bestellnummer?", "s_es": {"type": "multiple_choice", "options": ["7720", "7200", "7270"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["7720", "7200", "7270"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué quiere confirmar el señor Park?", "p_de": "Was möchte Herr Park bestätigen?", "s_es": {"type": "multiple_choice", "options": ["La dirección de entrega", "El precio", "La fecha de entrega"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Lieferadresse", "Den Preis", "Das Lieferdatum"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es la dirección de entrega?", "p_de": "Wie lautet die Lieferadresse?", "s_es": {"type": "multiple_choice", "options": ["Warehouse B, 23 Canal Road", "Warehouse A, 32 Canal Road", "Warehouse B, 32 Canal Road"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Warehouse B, 23 Canal Road", "Warehouse A, 32 Canal Road", "Warehouse B, 32 Canal Road"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuándo quiere la entrega?", "p_de": "Bis wann möchte er die Lieferung?", "s_es": {"type": "multiple_choice", "options": ["Antes de las 15:00 del viernes", "Antes de las 17:00 del viernes", "Antes del mediodía del viernes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor 15 Uhr am Freitag", "Vor 17 Uhr am Freitag", "Vor Freitagmittag"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuándo volverá a llamar si no recibe respuesta?", "p_de": "Wann ruft er erneut an, wenn er keine Antwort erhält?", "s_es": {"type": "multiple_choice", "options": ["Mañana por la mañana", "Mañana por la tarde", "El próximo lunes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Morgen früh", "Morgen Nachmittag", "Am nächsten Montag"], "answer": 0}}'::jsonb,
            '{"p": "¿Antes de cuándo debe devolver la llamada la señora Green?", "p_de": "Bis wann soll Frau Green zurückrufen?", "s_es": {"type": "multiple_choice", "options": ["Antes de las 16:00 de hoy", "Antes de las 17:00 de hoy", "Antes del mediodía de hoy"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor 16 Uhr heute", "Vor 17 Uhr heute", "Vor heute Mittag"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4800
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4800
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4800, 'en', 'reading', 'professional', $content$Phone Message Note

To: Ms. Rachel Green, Sales Manager.
Date: Tuesday 12 September.
Time: 11:30 am.
From: Mr. Oliver Park, Park & Webb Ltd.
Phone: 01223-456-789.

Message:
Mr. Park called about order number 7720. He wants to confirm that the delivery address is still Warehouse B, 23 Canal Road. He also asked whether the delivery can be made before 3pm on Friday. If he does not hear from you today, he will call back tomorrow morning. Please return his call before 4pm today.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una nota de recado telefónico rutinario', 'Lee un recado telefónico sobre una entrega y una devolución de llamada.'),
            (v_reading_id, 'de', 'Lies eine routinemäßige Telefonnotiz', 'Lies eine Telefonnotiz über eine Lieferung und einen Rückruf.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_reading_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
