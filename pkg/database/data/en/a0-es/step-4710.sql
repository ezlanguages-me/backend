-- ============================================================
-- Seed: A0 English Path – STEP 4710 – Reading – understand instructions, procedures etc. within own job area (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El primer paso es registrar la incidencia en ServiceDesk.", "p_de": "Der erste Schritt ist, den Vorfall im ServiceDesk zu erfassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Hay que responder al usuario por teléfono en una hora.", "p_de": "Der Nutzer muss innerhalb einer Stunde telefonisch informiert werden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Se intenta el diagnóstico remoto antes de una visita presencial.", "p_de": "Vor einem Vor-Ort-Termin wird eine Ferndiagnose versucht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Las visitas presenciales se programan en 48 horas para incidencias urgentes.", "p_de": "Vor-Ort-Termine werden bei dringenden Vorfällen innerhalb von 48 Stunden geplant.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Un ticket puede cerrarse sin confirmación del usuario.", "p_de": "Ein Ticket kann ohne Bestätigung des Nutzers geschlossen werden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Las incidencias de prioridad baja deben resolverse en 5 días laborables.", "p_de": "Vorfälle mit niedriger Priorität müssen innerhalb von 5 Arbeitstagen gelöst werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Las incidencias de prioridad alta deben resolverse en 4 horas.", "p_de": "Vorfälle mit hoher Priorität müssen innerhalb von 4 Stunden gelöst werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los niveles de urgencia son baja, media y alta.", "p_de": "Die Dringlichkeitsstufen sind niedrig, mittel und hoch.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "¿Dónde se registran las incidencias?", "p_de": "Wo werden Vorfälle erfasst?", "s_es": {"type": "multiple_choice", "options": ["En el sistema ServiceDesk", "En una hoja de Excel", "En un formulario en papel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im ServiceDesk-System", "In einer Excel-Tabelle", "Auf einem Papierformular"], "answer": 0}}'::jsonb,
            '{"p": "¿En cuánto tiempo debe confirmarse la recepción al usuario?", "p_de": "Wie schnell muss dem Nutzer der Eingang bestätigt werden?", "s_es": {"type": "multiple_choice", "options": ["En 1 hora", "En 30 minutos", "En 24 horas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Innerhalb von 1 Stunde", "Innerhalb von 30 Minuten", "Innerhalb von 24 Stunden"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué información se registra?", "p_de": "Welche Informationen werden erfasst?", "s_es": {"type": "multiple_choice", "options": ["Usuario, fecha y hora, descripción y urgencia", "Solo el nombre y la fecha", "Solo la descripción del problema"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nutzer, Datum und Uhrzeit, Beschreibung und Dringlichkeit", "Nur Name und Datum", "Nur die Problembeschreibung"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuándo se programa una visita presencial?", "p_de": "Wann wird ein Vor-Ort-Termin geplant?", "s_es": {"type": "multiple_choice", "options": ["Cuando falla el diagnóstico remoto", "Siempre", "Solo para prioridad alta"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wenn die Ferndiagnose scheitert", "Immer", "Nur bei hoher Priorität"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué debe pasar antes de cerrar un ticket?", "p_de": "Was muss geschehen, bevor ein Ticket geschlossen wird?", "s_es": {"type": "multiple_choice", "options": ["El usuario confirma que se resolvió", "Lo aprueba un gerente", "Pasan 5 días"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Nutzer bestätigt die Lösung", "Ein Manager genehmigt es", "5 Tage vergehen"], "answer": 0}}'::jsonb,
            '{"p": "¿En cuántos días laborables debe resolverse una incidencia media?", "p_de": "Innerhalb wie vieler Arbeitstage muss ein mittlerer Vorfall gelöst werden?", "s_es": {"type": "multiple_choice", "options": ["2", "5", "1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2", "5", "1"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el SLA para prioridad alta?", "p_de": "Wie lautet das SLA für hohe Priorität?", "s_es": {"type": "multiple_choice", "options": ["4 horas", "2 horas", "8 horas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["4 Stunden", "2 Stunden", "8 Stunden"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el último paso del procedimiento?", "p_de": "Was ist der letzte Schritt des Verfahrens?", "s_es": {"type": "multiple_choice", "options": ["Cerrar el ticket tras la confirmación del usuario", "Registrar la incidencia", "Programar una visita"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Ticket nach Nutzerbestätigung schließen", "Den Vorfall erfassen", "Einen Termin planen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4710
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4710
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4710, 'en', 'reading', 'professional', $content$IT HELP DESK – INCIDENT RESPONSE PROCEDURE

When a user reports an IT problem, the first step is to log the incident in the ServiceDesk system. The record must include the user name, date and time, a description of the issue and the urgency level: Low, Medium or High. The help desk must acknowledge the incident by email within 1 hour.

Staff should attempt remote diagnosis before arranging any visit. If remote diagnosis fails, an on-site visit must be scheduled within 24 hours for Medium and High priority incidents. After resolving the issue, the technician updates the log and confirms the solution with the user.

A ticket can only be closed after the user confirms that the problem has been resolved. SLA targets are 5 working days for Low, 2 working days for Medium and 4 hours for High priority issues.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee el procedimiento del servicio de asistencia de TI', 'Lee un procedimiento del help desk con tiempos de respuesta y cierre de tickets.'),
            (v_reading_id, 'de', 'Lies die IT-Helpdesk-Verfahrensanweisung', 'Lies ein Helpdesk-Verfahren mit Reaktionszeiten und Ticketabschluss.');

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
