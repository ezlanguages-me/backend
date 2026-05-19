-- ============================================================
-- Seed: A0 English Path – STEP 7550 – Reading – read meeting follow-up actions (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El equipo enumera cuatro acciones de seguimiento.", "de": "Das Team nennt vier Folgeaufgaben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Priya envía la tabla de acciones antes del miércoles a las 11:00.", "de": "Priya schickt die Aktionsliste vor Mittwoch um 11:00 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Tomas habla con el cliente sobre las cajas de muestra retrasadas.", "de": "Tomas spricht mit dem Kunden über die verspäteten Musterkartons.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Nina prepara tres diapositivas para la llamada con el cliente.", "de": "Nina bereitet drei Folien für den Kundenanruf vor.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Omar pone las preguntas abiertas en el documento compartido hoy.", "de": "Omar trägt die offenen Fragen heute in das gemeinsame Dokument ein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La revisión de la sala se mueve al jueves por la mañana.", "de": "Die Raumkontrolle wird auf Donnerstagmorgen verschoben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Todo el mundo debe leer el documento compartido después de la llamada.", "de": "Alle sollen das gemeinsame Dokument nach dem Anruf lesen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El objetivo es llegar a la llamada del viernes sin puntos de acción abiertos.", "de": "Das Ziel ist, ohne offene Aktionspunkte in den Freitagsanruf zu gehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué actualiza Priya?", "de": "Was aktualisiert Priya?", "s_es": {"type": "multiple_choice", "options": ["The action table", "The travel plan", "The visitor list"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Aktionsliste", "Den Reiseplan", "Die Besucherliste"], "answer": 0}}'::jsonb,
        '{"es": "¿Con quién habla Tomas?", "de": "Mit wem spricht Tomas?", "s_es": {"type": "multiple_choice", "options": ["The supplier", "The client", "The driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit dem Lieferanten", "Mit dem Kunden", "Mit dem Fahrer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué prepara Nina?", "de": "Was bereitet Nina vor?", "s_es": {"type": "multiple_choice", "options": ["Three slides", "A budget table", "A room map"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Folien", "Eine Budgettabelle", "Einen Raumplan"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde pone Omar las preguntas abiertas?", "de": "Wo legt Omar die offenen Fragen ab?", "s_es": {"type": "multiple_choice", "options": ["In the shared document", "On the whiteboard", "In a printed folder"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im gemeinsamen Dokument", "Auf dem Whiteboard", "In einer gedruckten Mappe"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo es la revisión de la sala?", "de": "Wann ist die Raumkontrolle?", "s_es": {"type": "multiple_choice", "options": ["Thursday morning", "Wednesday afternoon", "Friday evening"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Donnerstagmorgen", "Mittwochnachmittag", "Freitagabend"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe hacer una persona si su tarea va con retraso?", "de": "Was soll eine Person tun, wenn ihre Aufgabe verspätet ist?", "s_es": {"type": "multiple_choice", "options": ["Post a short status note in the team chat", "Cancel the client call", "Ask for a new room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine kurze Statusnotiz im Teamchat posten", "Den Kundenanruf absagen", "Einen neuen Raum anfragen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe leer todo el mundo antes de la llamada?", "de": "Was sollen alle vor dem Anruf lesen?", "s_es": {"type": "multiple_choice", "options": ["The shared document", "The old contract", "The hotel menu"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das gemeinsame Dokument", "Den alten Vertrag", "Die Hotelkarte"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el objetivo de la llamada del viernes?", "de": "Was ist das Ziel des Freitagsanrufs?", "s_es": {"type": "multiple_choice", "options": ["No open action points", "A new office party", "A longer agenda"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Keine offenen Aktionspunkte", "Eine neue Bürofeier", "Eine längere Agenda"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7550 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7550 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7550, 'en', 'reading', 'meetings', 'Meeting follow-up actions. After the weekly operations meeting, the team listed four follow-up actions. Priya will update the action table and send it before Wednesday at 11:00. Tomas will speak to the supplier about the late sample boxes and report back after lunch. Nina will prepare three slides for the client call and check the final numbers with Omar. Omar will place all open questions in the shared document today.\n\nThe group also decided to move the room check to Thursday morning. Everyone should read the shared document before the client call on Friday. If a task looks late, the person responsible must post a short status note in the team chat. The goal is to enter the Friday call with no open action points.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee acciones de seguimiento de una reunión', 'Lee una nota interna con responsables, plazos y próximos pasos después de una reunión de trabajo.'),
        (v_reading_id, 'de', 'Lies Folgeaufgaben nach einer Besprechung', 'Lies eine interne Notiz mit Zuständigkeiten, Fristen und nächsten Schritten nach einer Arbeitsbesprechung.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
