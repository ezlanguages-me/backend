-- ============================================================
-- Seed: A0 English Path – STEP 7590 – Reading – understand a presentation brief (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La presentación trata sobre el nuevo servicio de asistencia.", "de": "Die Präsentation handelt vom neuen Supportdienst.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El público son nuevos miembros del equipo y directivos visitantes.", "de": "Das Publikum sind neue Teammitglieder und besuchende Führungskräfte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La charla dura doce minutos más preguntas.", "de": "Der Vortrag dauert zwölf Minuten plus Fragen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Solo se deben usar cuatro diapositivas.", "de": "Es sollen nur vier Folien verwendet werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La primera diapositiva presenta el problema.", "de": "Die erste Folie stellt das Problem vor.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tabla detallada del presupuesto debe aparecer en la presentación.", "de": "Die detaillierte Budgettabelle soll in der Präsentation erscheinen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La persona que presenta debe hablar a un ritmo constante.", "de": "Die präsentierende Person soll in gleichmäßigem Tempo sprechen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La acción final para el público es probar el formulario nuevo esta semana.", "de": "Die letzte Aktion für das Publikum ist, diese Woche das neue Formular zu testen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuál es el tema de la presentación?", "de": "Was ist das Thema der Präsentation?", "s_es": {"type": "multiple_choice", "options": ["How the new support desk works", "How to book flights", "How to decorate the office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wie der neue Supportdesk funktioniert", "Wie man Flüge bucht", "Wie man das Büro dekoriert"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién es el público?", "de": "Wer ist das Publikum?", "s_es": {"type": "multiple_choice", "options": ["New team members and visiting managers", "Only clients", "Only suppliers"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neue Teammitglieder und besuchende Führungskräfte", "Nur Kunden", "Nur Lieferanten"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto dura la presentación?", "de": "Wie lange dauert die Präsentation?", "s_es": {"type": "multiple_choice", "options": ["Eight minutes plus two minutes for questions", "Twelve minutes plus ten minutes for questions", "Five minutes with no questions"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Acht Minuten plus zwei Minuten für Fragen", "Zwölf Minuten plus zehn Minuten für Fragen", "Fünf Minuten ohne Fragen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas diapositivas se permiten?", "de": "Wie viele Folien sind erlaubt?", "s_es": {"type": "multiple_choice", "options": ["Four", "Six", "Ten"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vier", "Sechs", "Zehn"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué muestran las diapositivas dos y tres?", "de": "Was zeigen Folie zwei und drei?", "s_es": {"type": "multiple_choice", "options": ["The new process and one short example", "The full budget table", "Three customer complaints"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den neuen Ablauf und ein kurzes Beispiel", "Die vollständige Budgettabelle", "Drei Kundenbeschwerden"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué no debe incluir la persona que presenta?", "de": "Was soll die präsentierende Person nicht einbauen?", "s_es": {"type": "multiple_choice", "options": ["A detailed budget table", "Clear visuals", "Short sentences"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine detaillierte Budgettabelle", "Klare Visuals", "Kurze Sätze"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde debe situarse la persona que presenta?", "de": "Wo soll die präsentierende Person stehen?", "s_es": {"type": "multiple_choice", "options": ["Near the screen", "At the back door", "Outside the room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nahe am Bildschirm", "An der hinteren Tür", "Außerhalb des Raums"], "answer": 0}}'::jsonb,
        '{"es": "¿Con qué acción debe terminar la presentación?", "de": "Mit welcher Aktion soll die Präsentation enden?", "s_es": {"type": "multiple_choice", "options": ["Test the new desk form this week", "Print the old manual today", "Cancel the next meeting"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Diese Woche das neue Formular testen", "Heute das alte Handbuch drucken", "Das nächste Treffen absagen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7590 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7590 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7590, 'en', 'reading', 'meetings', 'Presentation brief. Speaker: Helen Grant. Topic: How the new support desk works. Audience: new team members and visiting managers. Length: eight minutes plus two minutes for questions. Use four slides only. Slide one introduces the problem. Slides two and three show the new process and one short example. Slide four gives the main result and next step.\n\nThe brief asks for clear visuals, short sentences, and no detailed budget table. The presenter should stand near the screen, speak at a steady pace, and finish with one action for the audience: test the new desk form this week.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Comprende un briefing de presentación', 'Lee un encargo breve con tema, público, duración y pautas para una presentación.'),
        (v_reading_id, 'de', 'Verstehe ein Präsentationsbriefing', 'Lies einen kurzen Auftrag mit Thema, Publikum, Dauer und Vorgaben für eine Präsentation.');

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
