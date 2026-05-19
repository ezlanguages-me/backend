-- ============================================================
-- Seed: A0 English Path – STEP 4220 – Reading – understand a company memo (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El memo va dirigido a todo el personal.", "p_de": "Das Memo richtet sich an alle Mitarbeitenden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reunión mensual de equipo se cambia al jueves.", "p_de": "Das monatliche Teammeeting wird auf Donnerstag verlegt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El nuevo horario de la reunión es los martes a las 9 AM.", "p_de": "Der neue Termin des Meetings ist dienstags um 9 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cambio entra en vigor a partir del mes que viene.", "p_de": "Die Änderung tritt ab nächsten Monat in Kraft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La dirección pide confirmación de asistencia.", "p_de": "Die Geschäftsleitung bittet um Anwesenheitsbestätigung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El memo menciona que el aparcamiento estará cerrado el martes.", "p_de": "Das Memo erwähnt, dass der Parkplatz am Dienstag geschlossen sein wird.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La nueva sala de reuniones es la sala A en la planta baja.", "p_de": "Der neue Besprechungsraum ist Raum A im Erdgeschoss.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El memo está firmado por la directora de operaciones.", "p_de": "Das Memo ist von der Betriebsleiterin unterzeichnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A quién va dirigido el memo?", "p_de": "An wen richtet sich das Memo?", "s_es": {"type": "multiple_choice", "options": ["All staff", "Managers only", "New employees"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alle Mitarbeitenden", "Nur Manager", "Neue Mitarbeitende"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué cambio se anuncia?", "p_de": "Welche Änderung wird angekündigt?", "s_es": {"type": "multiple_choice", "options": ["New day for the monthly team meeting", "New office hours", "New dress code"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neuer Tag für das monatliche Teammeeting", "Neue Bürozeiten", "Neuer Dresscode"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es el nuevo horario de la reunión?", "p_de": "Wann ist der neue Termin des Meetings?", "s_es": {"type": "multiple_choice", "options": ["Tuesday at 9 AM", "Thursday at 10 AM", "Monday at 8 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dienstag um 9 Uhr", "Donnerstag um 10 Uhr", "Montag um 8 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo entra en vigor el cambio?", "p_de": "Wann tritt die Änderung in Kraft?", "s_es": {"type": "multiple_choice", "options": ["From next month", "Immediately", "In three months"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ab nächsten Monat", "Sofort", "In drei Monaten"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide la dirección al personal?", "p_de": "Was bittet die Geschäftsleitung das Personal?", "s_es": {"type": "multiple_choice", "options": ["To note the new schedule", "To confirm attendance", "To reply by email"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den neuen Zeitplan zu notieren", "Die Anwesenheit zu bestätigen", "Per E-Mail zu antworten"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué sala será la reunión?", "p_de": "In welchem Raum findet das Meeting statt?", "s_es": {"type": "multiple_choice", "options": ["Room A on the ground floor", "Room 2 on the second floor", "The boardroom upstairs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Raum A im Erdgeschoss", "Raum 2 im zweiten Stock", "Der Sitzungsraum oben"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién firmó el memo?", "p_de": "Wer hat das Memo unterzeichnet?", "s_es": {"type": "multiple_choice", "options": ["Director of Operations", "Head of HR", "CEO"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Betriebsleiterin", "Personalchef", "CEO"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tipo de documento se trata?", "p_de": "Um welche Art von Dokument handelt es sich?", "s_es": {"type": "multiple_choice", "options": ["An internal company memo", "A client invoice", "A job advertisement"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein internes Unternehmensmemo", "Eine Kundenrechnung", "Eine Stellenanzeige"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4220 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 4220 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4220, 'en', 'reading', 'professional', $content$INTERNAL MEMO

To: All Staff
From: Director of Operations
Subject: Change to Monthly Team Meeting Schedule

Please note that the monthly team meeting will now take place every Tuesday at 9 AM, starting from next month.

The new venue for the meeting is Room A on the ground floor. Please update your calendars accordingly.

Thank you for your cooperation.

Director of Operations$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un memo interno de empresa', 'Lee un memo interno con cambio de horario de reunión, nueva sala y vigencia del cambio.'),
            (v_reading_id, 'de', 'Lies ein internes Unternehmensmemo', 'Lies ein internes Memo mit Änderung des Meeting-Termins, neuem Raum und Inkrafttreten.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
