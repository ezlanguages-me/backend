-- ============================================================
-- Seed: A0 English Path – STEP 4690 – Reading – understand standard notices at work, for example safety instructions, where these are expressed in the form of a command (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Este aviso trata sobre la seguridad de los equipos eléctricos.", "p_de": "Dieser Hinweis betrifft die Sicherheit elektrischer Geräte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los empleados deben encender todos los equipos al llegar.", "p_de": "Mitarbeitende müssen bei Ankunft alle Geräte einschalten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Los cables dañados deben comunicarse a Facilities de inmediato.", "p_de": "Beschädigte Kabel müssen sofort der Haustechnik gemeldet werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los empleados pueden reparar los equipos eléctricos por su cuenta.", "p_de": "Mitarbeitende dürfen elektrische Geräte selbst reparieren.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "No se deben sobrecargar los enchufes.", "p_de": "Steckdosen dürfen nicht überlastet werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Se puede usar equipo eléctrico cerca del agua con cuidado.", "p_de": "Elektrische Geräte dürfen mit Vorsicht in Wassernähe benutzt werden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La extensión de Facilities es la 2100.", "p_de": "Die Durchwahl der Haustechnik ist 2100.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Las infracciones pueden dar lugar a medidas disciplinarias.", "p_de": "Verstöße können disziplinarische Maßnahmen nach sich ziehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "¿Qué debe hacerse con el equipo cuando no se usa?", "p_de": "Was muss mit Geräten geschehen, wenn sie nicht benutzt werden?", "s_es": {"type": "multiple_choice", "options": ["Apagarlos", "Desenchufarlos y guardarlos", "Cubrirlos con un paño"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie ausschalten", "Sie ausstecken und wegstellen", "Sie mit einem Tuch abdecken"], "answer": 0}}'::jsonb,
            '{"p": "¿A quién deben comunicarse los cables dañados?", "p_de": "Wem sollen beschädigte Kabel gemeldet werden?", "s_es": {"type": "multiple_choice", "options": ["A Facilities", "Al gerente", "A RR. HH."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Haustechnik", "Dem Manager", "Der Personalabteilung"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué tipo de equipo puede usarse?", "p_de": "Welche Art von Geräten darf benutzt werden?", "s_es": {"type": "multiple_choice", "options": ["Solo equipo aprobado", "Cualquier equipo disponible", "Equipo personal"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nur zugelassene Geräte", "Beliebige verfügbare Geräte", "Private Geräte"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué no debe pasar con los enchufes?", "p_de": "Was darf mit Steckdosen niemals passieren?", "s_es": {"type": "multiple_choice", "options": ["No deben sobrecargarse", "No deben limpiarse", "No deben quedar encendidas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie dürfen nicht überlastet werden", "Sie dürfen nicht gereinigt werden", "Sie dürfen nicht eingeschaltet bleiben"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es la extensión de Facilities?", "p_de": "Wie lautet die Durchwahl der Haustechnik?", "s_es": {"type": "multiple_choice", "options": ["2100", "1200", "2010"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2100", "1200", "2010"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el correo de Facilities?", "p_de": "Wie lautet die E-Mail der Haustechnik?", "s_es": {"type": "multiple_choice", "options": ["facilities@office.co.uk", "safety@office.co.uk", "help@office.co.uk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["facilities@office.co.uk", "safety@office.co.uk", "help@office.co.uk"], "answer": 0}}'::jsonb,
            '{"p": "¿A quién se aplica este aviso?", "p_de": "Für wen gilt dieser Hinweis?", "s_es": {"type": "multiple_choice", "options": ["A todos los empleados y contratistas", "Solo a los empleados", "Solo a los contratistas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für alle Mitarbeitenden und Auftragnehmer", "Nur für Mitarbeitende", "Nur für Auftragnehmer"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué puede pasar si se incumple?", "p_de": "Was kann bei Verstößen passieren?", "s_es": {"type": "multiple_choice", "options": ["Medidas disciplinarias", "Una multa de 100 £", "Nada formal"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Disziplinarmaßnahmen", "Eine Strafe von 100 £", "Nichts Formelles"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4690
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4690
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4690, 'en', 'reading', 'professional', $content$WORKPLACE SAFETY NOTICE – ELECTRICAL EQUIPMENT

ALWAYS switch off electrical equipment when it is not in use. Report any damaged cables or plugs to Facilities immediately so that they can be checked and replaced if necessary. Use only equipment that has been approved by the Health and Safety team.

NEVER overload plug sockets. Do not use electrical equipment near water, and do not try to repair any item yourself. If you are unsure whether a piece of equipment is safe, stop using it and contact Facilities for advice.

If in doubt, call Facilities on extension 2100 or send an email to facilities@office.co.uk. These rules apply to all employees and contractors. Any breach of the notice may lead to disciplinary action.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un aviso de seguridad en el trabajo', 'Lee un aviso breve con órdenes de seguridad sobre equipos eléctricos.'),
            (v_reading_id, 'de', 'Lies einen Arbeitssicherheitshinweis', 'Lies einen kurzen Sicherheitshinweis mit Anweisungen zu elektrischen Geräten.');

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
