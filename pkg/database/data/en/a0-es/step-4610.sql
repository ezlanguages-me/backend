-- ============================================================
-- Seed: A0 English Path – STEP 4610 – Reading – understand the reports that (s)he is likely to come across, including the finer points, implications etc. of a complex report (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El código del proyecto es CRM-2023.", "p_de": "Der Projektcode lautet CRM-2023.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El proyecto duró 12 meses como estaba previsto.", "p_de": "Das Projekt dauerte wie geplant 12 Monate.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El coste total se mantuvo dentro del presupuesto.", "p_de": "Die Gesamtkosten blieben im Budget.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La formación del personal se retrasó 3 semanas.", "p_de": "Die Schulung der Mitarbeitenden lag 3 Wochen hinter dem Plan.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La migración de datos se completó a tiempo.", "p_de": "Die Datenmigration wurde termingerecht abgeschlossen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Hubo 5 errores menores después de la implantación.", "p_de": "Nach der Einführung gab es 5 kleinere Fehler.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La satisfacción del cliente fue del 91 %.", "p_de": "Die Kundenzufriedenheit lag bei 91 %.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Se recomienda añadir un margen de tiempo del 20 % para la formación.", "p_de": "Es wird empfohlen, für Schulungen einen Zeitpuffer von 20 % einzuplanen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "¿Cuál fue el código del proyecto?", "p_de": "Wie lautete der Projektcode?", "s_es": {"type": "multiple_choice", "options": ["CRM-2023", "CRM-2022", "CRM-2024"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["CRM-2023", "CRM-2022", "CRM-2024"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos meses más duró el proyecto de lo previsto?", "p_de": "Wie viele Monate länger dauerte das Projekt als geplant?", "s_es": {"type": "multiple_choice", "options": ["2 meses", "1 mes", "3 meses"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2 Monate", "1 Monat", "3 Monate"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál era el presupuesto del proyecto?", "p_de": "Wie hoch war das Projektbudget?", "s_es": {"type": "multiple_choice", "options": ["160.000 £", "184.000 £", "200.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["160.000 £", "184.000 £", "200.000 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Por qué se pasó del presupuesto?", "p_de": "Warum wurde das Budget überschritten?", "s_es": {"type": "multiple_choice", "options": ["Por honorarios extra de consultoría", "Por horas extra del personal", "Por costes de equipamiento"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wegen zusätzlicher Beratungskosten", "Wegen Überstunden des Personals", "Wegen Gerätekosten"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué tarea se retrasó?", "p_de": "Welche Aufgabe war verspätet?", "s_es": {"type": "multiple_choice", "options": ["La formación del personal", "La migración de datos", "La integración del sistema"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Schulung des Personals", "Die Datenmigration", "Die Systemintegration"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos fallos hubo tras la implantación?", "p_de": "Wie viele Fehler traten nach der Einführung auf?", "s_es": {"type": "multiple_choice", "options": ["2", "5", "10"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2", "5", "10"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál fue la satisfacción del cliente?", "p_de": "Wie hoch war die Kundenzufriedenheit?", "s_es": {"type": "multiple_choice", "options": ["91 %", "85 %", "78 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["91 %", "85 %", "78 %"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué porcentaje de margen se recomienda para futuras formaciones?", "p_de": "Welcher Puffer wird für zukünftige Schulungsphasen empfohlen?", "s_es": {"type": "multiple_choice", "options": ["20 %", "10 %", "30 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20 %", "10 %", "30 %"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4610
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4610
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4610, 'en', 'reading', 'professional', $content$Project Completion Report – CRM System Implementation

Project CRM-2023 has now been completed after a total duration of 14 months. The original estimate was 12 months, so delivery was 2 months later than planned. Final project cost reached £184,000 against an approved budget of £160,000. The main reason for the overspend was the need for additional consultancy fees during the integration phase.

In terms of deliverables, data migration was completed on time, and system integration also finished as planned. Staff training, however, ended 3 weeks behind schedule because several business teams were unavailable during the original training window. After implementation, the client reported 2 minor bugs, both of which were resolved within 30 days.

Overall client satisfaction was 91%. The main lesson learned is to allow a 20% time buffer for future training phases.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un informe detallado de proyecto', 'Lee un informe de cierre de proyecto con desviaciones, incidencias y lecciones aprendidas.'),
            (v_reading_id, 'de', 'Lies einen detaillierten Projektbericht', 'Lies einen Projektabschlussbericht mit Abweichungen, Problemen und gewonnenen Erkenntnissen.');

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
