-- ============================================================
-- Seed: A0 English Path – STEP 4590 – Reading – understand the general meaning of a report even if the topic is not entirely predictable (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La auditoría es del departamento de Cuentas por Pagar.", "p_de": "Die Prüfung betrifft die Abteilung Kreditorenbuchhaltung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La auditoría cubre de octubre a diciembre.", "p_de": "Die Prüfung umfasst Oktober bis Dezember.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Se tramitaron tres facturas sin la autorización adecuada.", "p_de": "Drei Rechnungen wurden ohne ordnungsgemäße Genehmigung bearbeitet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El valor total de esas facturas fue 7.400 £.", "p_de": "Der Gesamtwert dieser Rechnungen betrug 7.400 £.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Todos los contratos de proveedores están al día.", "p_de": "Alle Lieferantenverträge sind auf dem neuesten Stand.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El archivo electrónico está incompleto para los registros de 2023.", "p_de": "Die elektronische Ablage ist für die Unterlagen von 2023 unvollständig.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El informe recomienda doble autorización para facturas superiores a 1.000 £.", "p_de": "Der Bericht empfiehlt eine doppelte Genehmigung für Rechnungen über 1.000 £.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Las revisiones de contratos deben completarse al final del primer trimestre.", "p_de": "Die Vertragsprüfungen müssen bis Ende Q1 abgeschlossen sein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Qué departamento fue auditado?", "p_de": "Welche Abteilung wurde geprüft?", "s_es": {"type": "multiple_choice", "options": ["Cuentas por Pagar", "Recursos Humanos", "Ventas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kreditorenbuchhaltung", "Personalabteilung", "Vertrieb"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué periodo cubrió la auditoría?", "p_de": "Welchen Zeitraum umfasste die Prüfung?", "s_es": {"type": "multiple_choice", "options": ["De julio a septiembre", "De enero a marzo", "De octubre a diciembre"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Von Juli bis September", "Von Januar bis März", "Von Oktober bis Dezember"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántas facturas no autorizadas se encontraron?", "p_de": "Wie viele nicht genehmigte Rechnungen wurden gefunden?", "s_es": {"type": "multiple_choice", "options": ["3", "5", "12"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["3", "5", "12"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál fue el valor total de esas facturas?", "p_de": "Wie hoch war der Gesamtwert dieser Rechnungen?", "s_es": {"type": "multiple_choice", "options": ["7.400 £", "1.000 £", "14.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["7.400 £", "1.000 £", "14.000 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué porcentaje de contratos está pendiente de revisión?", "p_de": "Welcher Prozentsatz der Verträge ist überfällig?", "s_es": {"type": "multiple_choice", "options": ["12 %", "5 %", "20 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["12 %", "5 %", "20 %"], "answer": 0}}'::jsonb,
            '{"p": "¿De qué año falta archivo electrónico?", "p_de": "Für welches Jahr ist die elektronische Ablage unvollständig?", "s_es": {"type": "multiple_choice", "options": ["2022", "2023", "2021"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2022", "2023", "2021"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué importe activa la doble autorización?", "p_de": "Ab welchem Betrag gilt die doppelte Genehmigung?", "s_es": {"type": "multiple_choice", "options": ["1.000 £", "500 £", "2.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["1.000 £", "500 £", "2.000 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Para cuándo deben completarse las revisiones de contratos?", "p_de": "Bis wann müssen die Vertragsprüfungen abgeschlossen sein?", "s_es": {"type": "multiple_choice", "options": ["Final del cuarto trimestre", "Final del primer trimestre", "Final del segundo trimestre"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis Ende Q4", "Bis Ende Q1", "Bis Ende Q2"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4590
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4590
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4590, 'en', 'reading', 'professional', $content$Internal Audit Report – Accounts Payable

This internal audit reviewed the Accounts Payable department for the period July to September. The audit found that 3 invoices, with a combined value of £7,400, were processed without the correct level of authorisation. Although the number of cases was limited, the finding shows a weakness in current approval controls.

The audit also noted that 12% of supplier contracts are overdue for formal review. In addition, the electronic filing system remains incomplete for records from 2022, which makes it harder to confirm whether supporting documents are available for all transactions.

The report recommends introducing dual authorisation for every invoice above £1,000. It also recommends that all overdue contract reviews be completed by the end of Q4. Management has been asked to provide an action plan within two weeks.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un informe de auditoría interna', 'Lee las conclusiones de una auditoría interna con incidencias y recomendaciones.'),
            (v_reading_id, 'de', 'Lies einen internen Prüfungsbericht', 'Lies die Ergebnisse einer internen Prüfung mit Feststellungen und Empfehlungen.');

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
