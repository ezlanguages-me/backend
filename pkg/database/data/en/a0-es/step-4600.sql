-- ============================================================
-- Seed: A0 English Path – STEP 4600 – Reading – CAN, within a reasonably short time, understand most reports that (s)he is likely to come across (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Los ingresos totales fueron 2,4 millones de libras.", "p_de": "Der Gesamtumsatz betrug 2,4 Millionen Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los ingresos aumentaron un 10 % respecto al año anterior.", "p_de": "Der Umsatz stieg gegenüber dem Vorjahr um 10 %.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Los costes operativos fueron 1,9 millones de libras.", "p_de": "Die Betriebskosten betrugen 1,9 Millionen Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El beneficio operativo fue 500.000 £.", "p_de": "Der Betriebsgewinn betrug 500.000 £.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Se abrieron dos oficinas nuevas.", "p_de": "Es wurden zwei neue Büros eröffnet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La plantilla creció de 45 a 62 personas.", "p_de": "Die Belegschaft wuchs von 45 auf 62 Mitarbeitende.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Se firmaron contratos con ocho grandes clientes nuevos.", "p_de": "Es wurden Verträge mit acht großen Neukunden abgeschlossen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El objetivo de ingresos para 2024 es 3,5 millones de libras.", "p_de": "Das Umsatzziel für 2024 beträgt 3,5 Millionen Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Cuál fue el ingreso total del ejercicio 2023?", "p_de": "Wie hoch war der Gesamtumsatz im Geschäftsjahr 2023?", "s_es": {"type": "multiple_choice", "options": ["2,4 millones de libras", "1,9 millones de libras", "3 millones de libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2,4 Millionen Pfund", "1,9 Millionen Pfund", "3 Millionen Pfund"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuánto aumentaron los ingresos?", "p_de": "Um wie viel stieg der Umsatz?", "s_es": {"type": "multiple_choice", "options": ["12 %", "8 %", "15 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["12 %", "8 %", "15 %"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál fue el beneficio operativo?", "p_de": "Wie hoch war der Betriebsgewinn?", "s_es": {"type": "multiple_choice", "options": ["500.000 £", "300.000 £", "700.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["500.000 £", "300.000 £", "700.000 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué ciudad NO fue una de las nuevas oficinas?", "p_de": "Welche Stadt gehörte NICHT zu den neuen Standorten?", "s_es": {"type": "multiple_choice", "options": ["Birmingham", "Manchester", "Bristol"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Birmingham", "Manchester", "Bristol"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos empleados tenía la empresa al final de 2023?", "p_de": "Wie viele Mitarbeitende hatte das Unternehmen Ende 2023?", "s_es": {"type": "multiple_choice", "options": ["62", "45", "77"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["62", "45", "77"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos grandes clientes nuevos firmaron contrato?", "p_de": "Mit wie vielen großen Neukunden wurden Verträge abgeschlossen?", "s_es": {"type": "multiple_choice", "options": ["8", "5", "12"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8", "5", "12"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué proyecto se completó?", "p_de": "Welches Projekt wurde abgeschlossen?", "s_es": {"type": "multiple_choice", "options": ["La transformación digital", "La renovación de oficinas", "El lanzamiento de producto"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die digitale Transformation", "Die Bürosanierung", "Die Produkteinführung"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el objetivo de ingresos para 2024?", "p_de": "Wie lautet das Umsatzziel für 2024?", "s_es": {"type": "multiple_choice", "options": ["3 millones de libras", "2,4 millones de libras", "3,5 millones de libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["3 Millionen Pfund", "2,4 Millionen Pfund", "3,5 Millionen Pfund"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4600
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4600
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4600, 'en', 'reading', 'professional', $content$Annual Company Summary – FY2023

The company closed FY2023 with total revenue of £2.4 million, representing a 12% increase compared with the previous year. Operating costs reached £1.9 million, which resulted in an operating profit of £500,000. The leadership team described the year as one of controlled expansion and stronger commercial performance.

During the year, the business opened three new offices in Manchester, Bristol and Leeds. Staff numbers grew from 45 to 62, reflecting both the regional expansion and growing client demand. The sales team also signed new contracts with 8 major clients, strengthening the company’s position in key sectors.

Another important achievement was the completion of the digital transformation project, which modernised internal systems. The target for FY2024 is to reach £3 million in revenue and recruit 15 additional staff members.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee el resumen del informe anual', 'Lee un resumen anual con resultados, aperturas y metas de crecimiento.'),
            (v_reading_id, 'de', 'Lies die Zusammenfassung des Jahresberichts', 'Lies eine Jahresübersicht mit Ergebnissen, Neueröffnungen und Wachstumszielen.');

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
