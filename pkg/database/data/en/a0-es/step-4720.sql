-- ============================================================
-- Seed: A0 English Path – STEP 4720 – Reading – understand the intention of instructions etc. outside own immediate job area (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El correo de bienvenida se envía antes de la fecha de inicio.", "p_de": "Die Willkommens-E-Mail wird vor dem Startdatum gesendet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El equipo informático se prepara el primer día.", "p_de": "Die IT-Ausstattung wird am ersten Tag vorbereitet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La inducción de salud y seguridad es el primer día.", "p_de": "Die Sicherheitsunterweisung findet am ersten Tag statt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La nómina se configura en la primera semana.", "p_de": "Die Gehaltsdaten werden in der ersten Woche eingerichtet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El manual del empleado se entrega el primer día.", "p_de": "Das Mitarbeiterhandbuch wird am ersten Tag ausgehändigt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La formación obligatoria debe completarse en la primera semana.", "p_de": "Die Pflichtschulungen müssen in der ersten Woche abgeschlossen werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El periodo de prueba dura 6 meses.", "p_de": "Die Probezeit dauert 6 Monate.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La lista es del departamento de TI.", "p_de": "Die Checkliste stammt von der IT-Abteilung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Cuándo se envía el correo de bienvenida?", "p_de": "Wann wird die Willkommens-E-Mail verschickt?", "s_es": {"type": "multiple_choice", "options": ["Antes de la fecha de inicio", "El primer día", "En la primera semana"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor dem Startdatum", "Am ersten Tag", "In der ersten Woche"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué más se prepara antes del inicio además del equipo de TI?", "p_de": "Was wird vor dem Start zusätzlich zur IT-Ausstattung vorbereitet?", "s_es": {"type": "multiple_choice", "options": ["La tarjeta de acceso al edificio", "La nómina", "La pensión"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Gebäudeausweis", "Die Gehaltsabrechnung", "Die Rentendaten"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué pasa con el equipo de TI el primer día?", "p_de": "Was geschieht am ersten Tag mit der IT-Ausstattung?", "s_es": {"type": "multiple_choice", "options": ["Se entrega al empleado", "Se encarga", "TI la prueba"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie wird dem Mitarbeitenden ausgehändigt", "Sie wird bestellt", "Die IT testet sie"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué formación obligatoria se completa en la primera semana?", "p_de": "Welche Pflichtschulungen werden in der ersten Woche absolviert?", "s_es": {"type": "multiple_choice", "options": ["RGPD y Salud y Seguridad", "Finanzas y RR. HH.", "Nómina y pensión"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["DSGVO und Arbeitssicherheit", "Finanzen und Personal", "Gehalts- und Rentenwesen"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuándo se fijan los objetivos del periodo de prueba de 3 meses?", "p_de": "Wann werden die Ziele für die dreimonatige Probezeit festgelegt?", "s_es": {"type": "multiple_choice", "options": ["En la primera semana", "El primer día", "Antes de empezar"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In der ersten Woche", "Am ersten Tag", "Vor dem Start"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué ocurre al final del periodo de prueba?", "p_de": "Was passiert am Ende der Probezeit?", "s_es": {"type": "multiple_choice", "options": ["Una revisión del rendimiento", "Una subida salarial", "Un contrato nuevo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Leistungsbeurteilung", "Eine Gehaltserhöhung", "Ein neuer Vertrag"], "answer": 0}}'::jsonb,
            '{"p": "¿Quién hace la reunión individual de la primera semana?", "p_de": "Wer führt das Einzelgespräch in der ersten Woche?", "s_es": {"type": "multiple_choice", "options": ["El jefe directo", "El director de RR. HH.", "El director general"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die direkte Führungskraft", "Der Personalleiter", "Der Geschäftsführer"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué significa ampliar el periodo de prueba?", "p_de": "Was bedeutet es, die Probezeit zu verlängern?", "s_es": {"type": "multiple_choice", "options": ["Que la prueba dura más tiempo", "Que despiden al empleado", "Que empieza un puesto nuevo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dass die Probezeit länger andauert", "Dass die Person entlassen wird", "Dass eine neue Stelle beginnt"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4720
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4720
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4720, 'en', 'reading', 'professional', $content$NEW EMPLOYEE ONBOARDING CHECKLIST – HR Department

Before the employee’s start date, HR must send a welcome email with the start time and office location. IT equipment must be prepared in advance, the user account must be created and the building access pass must be ready. These steps ensure that the employee can begin work without delay.

On Day 1, HR and the line manager introduce the new employee to the team, carry out a health and safety induction, set up payroll and pension details, issue IT equipment and login credentials, and provide the employee handbook. During Week 1, a one-to-one meeting with the line manager must be arranged, mandatory GDPR and Health and Safety training must be completed, and 3-month probation objectives must be agreed.

At the end of probation, performance is reviewed and the company either confirms permanent employment or extends probation if necessary.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una lista de verificación de incorporación de RRHH', 'Lee una lista de incorporación con tareas antes del inicio, el primer día y la primera semana.'),
            (v_reading_id, 'de', 'Lies eine HR-Onboarding-Checkliste', 'Lies eine Onboarding-Checkliste mit Aufgaben vor dem Start, am ersten Tag und in der ersten Woche.');

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
