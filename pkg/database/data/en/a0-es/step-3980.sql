-- ============================================================
-- Seed: A0 English Path – STEP 3980 – Reading – understand a service contract (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Las visitas normales son los lunes y los jueves.", "p_de": "Die normalen Besuche sind montags und donnerstags.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El contrato dura 6 meses.", "p_de": "Der Vertrag dauert 6 Monate.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Para cancelar hace falta un mes de aviso por escrito.", "p_de": "Zum Kündigen braucht man einen Monat schriftliche Frist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pago vence el día 5 de cada mes.", "p_de": "Die Zahlung ist bis zum 5. Tag jedes Monats fällig.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las emergencias no tienen coste extra.", "p_de": "Notfalleinsätze haben keine Zusatzkosten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los materiales de limpieza están incluidos salvo químicos especiales.", "p_de": "Reinigungsmaterial ist enthalten, außer Spezialchemikalien.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La respuesta de emergencia empieza dentro de dos horas entre semana.", "p_de": "Die Notfallreaktion beginnt werktags innerhalb von zwei Stunden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El contrato no dice nada sobre cancelación.", "p_de": "Der Vertrag sagt nichts über Kündigung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué días son las visitas normales?", "p_de": "An welchen Tagen sind die normalen Besuche?", "s_es": {"type": "multiple_choice", "options": ["Monday and Thursday", "Tuesday and Friday", "Every day"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Montag und Donnerstag", "Dienstag und Freitag", "Jeden Tag"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura el contrato?", "p_de": "Wie lange läuft der Vertrag?", "s_es": {"type": "multiple_choice", "options": ["12 months", "6 months", "24 months"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["12 Monate", "6 Monate", "24 Monate"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto aviso hace falta para cancelar?", "p_de": "Wie viel Kündigungsfrist braucht man?", "s_es": {"type": "multiple_choice", "options": ["One month in writing", "Two days by phone", "No notice"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Monat schriftlich", "Zwei Tage per Telefon", "Keine Frist"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se paga?", "p_de": "Wann zahlt man?", "s_es": {"type": "multiple_choice", "options": ["By the 5th day of each month", "Every Monday", "At the airport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis zum 5. Tag jedes Monats", "Jeden Montag", "Am Flughafen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué coste extra aparece?", "p_de": "Welche Zusatzkosten werden genannt?", "s_es": {"type": "multiple_choice", "options": ["£60 for emergency call-outs", "£10 for towels", "£100 for maps"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£60 für Notfalleinsätze", "£10 für Handtücher", "£100 für Karten"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no está incluido en los materiales?", "p_de": "Was ist bei den Materialien nicht enthalten?", "s_es": {"type": "multiple_choice", "options": ["Special chemicals", "Basic soap", "Water"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Spezialchemikalien", "Normale Seife", "Wasser"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo empieza la respuesta de emergencia?", "p_de": "Wann beginnt die Notfallreaktion?", "s_es": {"type": "multiple_choice", "options": ["Within two hours on weekdays", "Next week", "Only on Saturday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Innerhalb von zwei Stunden werktags", "Nächste Woche", "Nur am Samstag"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata el documento?", "p_de": "Worum geht es in dem Dokument?", "s_es": {"type": "multiple_choice", "options": ["A service contract summary", "A concert ticket", "A museum map"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Vertragszusammenfassung", "Ein Konzertticket", "Einen Museumsplan"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3980 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3980 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3980, 'en', 'reading', 'professional', $content$Service Contract Summary. Standard cleaning visits take place every Monday and Thursday. The contract length is 12 months. One month's written notice is needed to cancel.

Payment is due by the 5th day of each month. Emergency call-outs have an extra fee of £60. Cleaning materials are included except special chemicals.

During weekdays, emergency response starts within two hours.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un contrato de servicio', 'Lee un resumen de contrato con visitas, duración, pago y respuesta de emergencia.'),
            (v_reading_id, 'de', 'Lies einen Servicevertrag', 'Lies eine Vertragszusammenfassung mit Besuchen, Laufzeit, Zahlung und Notfallreaktion.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
