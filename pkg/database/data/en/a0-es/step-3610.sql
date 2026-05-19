-- ============================================================
-- Seed: A0 English Path – STEP 3610 – Reading – understand hotel confirmation details (Alojamiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El número de reserva es NB-4721.", "p_de": "Die Buchungsnummer ist NB-4721.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La estancia es del 15 al 17 de julio.", "p_de": "Der Aufenthalt ist vom 15. bis 17. Juli.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La habitación es individual.", "p_de": "Das Zimmer ist ein Einzelzimmer.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El desayuno está incluido.", "p_de": "Das Frühstück ist inklusive.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tasa municipal ya está incluida en el precio.", "p_de": "Die City Tax ist schon im Preis enthalten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se paga en el hotel.", "p_de": "Man bezahlt im Hotel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cancelación gratis es hasta el 13 de julio a las 6 PM.", "p_de": "Kostenlose Stornierung ist bis 13. Juli um 18 Uhr möglich.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Para late check-in hay que llamar después de llegar.", "p_de": "Für einen späten Check-in muss man erst nach der Ankunft anrufen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué hotel aparece en la confirmación?", "p_de": "Welches Hotel steht in der Bestätigung?", "s_es": {"type": "multiple_choice", "options": ["North Bay Hotel", "Silver Coast Hotel", "Green Tower Hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["North Bay Hotel", "Silver Coast Hotel", "Green Tower Hotel"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de habitación es?", "p_de": "Welche Zimmerart ist es?", "s_es": {"type": "multiple_choice", "options": ["Double room", "Single room", "Family suite"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Doppelzimmer", "Einzelzimmer", "Familiensuite"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo empieza el check-in?", "p_de": "Wann beginnt der Check-in?", "s_es": {"type": "multiple_choice", "options": ["After 3 PM", "At 11 AM", "After 8 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach 15 Uhr", "Um 11 Uhr", "Nach 20 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué comida está incluida?", "p_de": "Welche Mahlzeit ist inklusive?", "s_es": {"type": "multiple_choice", "options": ["Breakfast", "Lunch", "Dinner"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Frühstück", "Mittagessen", "Abendessen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no está incluido en el precio de la habitación?", "p_de": "Was ist nicht im Zimmerpreis enthalten?", "s_es": {"type": "multiple_choice", "options": ["City tax", "Wi-Fi", "Towels"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["City Tax", "WLAN", "Handtücher"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se paga la reserva?", "p_de": "Wo bezahlt man die Buchung?", "s_es": {"type": "multiple_choice", "options": ["At the hotel", "At the airport", "Online only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Hotel", "Am Flughafen", "Nur online"], "answer": 0}}'::jsonb,
        '{"p": "¿Hasta cuándo es la cancelación gratis?", "p_de": "Bis wann ist kostenlose Stornierung möglich?", "s_es": {"type": "multiple_choice", "options": ["13 July at 6 PM", "15 July at 3 PM", "17 July at 11 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["13. Juli um 18 Uhr", "15. Juli um 15 Uhr", "17. Juli um 11 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay que hacer si necesitas late check-in?", "p_de": "Was muss man für einen späten Check-in tun?", "s_es": {"type": "multiple_choice", "options": ["Send an email before arrival", "Buy a new ticket", "Pay the city tax first"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor der Ankunft eine E-Mail senden", "Ein neues Ticket kaufen", "Zuerst die City Tax zahlen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid FROM reading WHERE step_order = 3610 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading'
        );
        DELETE FROM reading WHERE step_order = 3610 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3610, 'en', 'reading', 'accommodation', $content$Reservation confirmation: North Bay Hotel. Reservation number: NB-4721. Guest: Elena Cruz.

Stay: 15 July to 17 July. Room type: double room. Check-in is after 3 PM. Breakfast is included.

City tax is not included in the room price. You pay at the hotel during your stay. Free cancellation is possible until 13 July at 6 PM.

If you need late check-in, please send an email before arrival.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una confirmación de hotel', 'Lee una confirmación con número de reserva, fechas, desayuno, pago y cancelación.'),
            (v_reading_id, 'de', 'Lies eine Hotelbestätigung', 'Lies eine Bestätigung mit Buchungsnummer, Daten, Frühstück, Zahlung und Stornierung.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
