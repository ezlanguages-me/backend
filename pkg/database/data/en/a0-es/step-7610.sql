-- ============================================================
-- Seed: A0 English Path – STEP 7610 – Reading – read an argument structure (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La afirmación principal es mantener una actualización semanal con el cliente.", "de": "Die Hauptaussage ist, ein wöchentliches Kundenupdate beizubehalten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La primera razón es que así se evita que pequeños problemas crezcan.", "de": "Der erste Grund ist, dass kleine Probleme so nicht größer werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La segunda razón es que el cliente recibe menos reuniones y más cadenas largas de correo.", "de": "Der zweite Grund ist, dass der Kunde weniger Treffen und mehr lange E Mail Ketten bekommt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La evidencia dice que los proyectos con actualización semanal cerraron preguntas más rápido.", "de": "Die Evidenz sagt, dass Projekte mit wöchentlichem Update Fragen schneller klärten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La objeción es que la reunión semanal quita demasiado tiempo.", "de": "Der Einwand ist, dass das wöchentliche Treffen zu viel Zeit kostet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La respuesta dice que la reunión dura una hora completa.", "de": "Die Antwort sagt, das Treffen dauere eine ganze Stunde.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La conclusión afirma que el coste de tiempo es pequeño y el beneficio de planificación es claro.", "de": "Die Schlussfolgerung sagt, der Zeitaufwand sei klein und der Planungsvorteil klar.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El texto incluye afirmación principal, razones, evidencia, objeción, respuesta y conclusión.", "de": "Der Text enthält Hauptaussage, Gründe, Evidenz, Einwand, Antwort und Schlussfolgerung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué reunión propone mantener el texto?", "de": "Welches Treffen soll laut Text bleiben?", "s_es": {"type": "multiple_choice", "options": ["A short weekly client update", "A daily lunch meeting", "A monthly travel review"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein kurzes wöchentliches Kundenupdate", "Ein tägliches Mittagstreffen", "Eine monatliche Reisekontrolle"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué evita la primera razón?", "de": "Was verhindert der erste Grund?", "s_es": {"type": "multiple_choice", "options": ["Small issues growing", "The room closing", "The budget rising"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dass kleine Probleme größer werden", "Dass der Raum schließt", "Dass das Budget steigt"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ofrece la segunda razón al cliente?", "de": "Was bietet der zweite Grund dem Kunden?", "s_es": {"type": "multiple_choice", "options": ["A regular place to ask questions", "A longer contract", "A new office desk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen regelmäßigen Ort für Fragen", "Einen längeren Vertrag", "Einen neuen Schreibtisch"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué muestra la evidencia del mes pasado?", "de": "Was zeigt die Evidenz aus dem letzten Monat?", "s_es": {"type": "multiple_choice", "options": ["Projects with weekly updates closed questions faster", "Projects without meetings were cheaper", "Clients asked for longer emails"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Projekte mit wöchentlichen Updates klärten Fragen schneller", "Projekte ohne Treffen waren billiger", "Kunden wollten längere E Mails"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la objeción principal?", "de": "Was ist der Haupteinwand?", "s_es": {"type": "multiple_choice", "options": ["The update meeting takes too much time", "The client dislikes email", "The team lacks a screen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Update Treffen kostet zu viel Zeit", "Der Kunde mag keine E Mails", "Dem Team fehlt ein Bildschirm"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo responde el texto a esa objeción?", "de": "Wie antwortet der Text auf diesen Einwand?", "s_es": {"type": "multiple_choice", "options": ["The meeting is only fifteen minutes and replaces separate messages", "The meeting can last all morning", "The client pays for the time"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Treffen dauert nur fünfzehn Minuten und ersetzt einzelne Nachrichten", "Das Treffen kann den ganzen Morgen dauern", "Der Kunde bezahlt die Zeit"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo describe la conclusión el equilibrio final?", "de": "Wie beschreibt die Schlussfolgerung das Endergebnis?", "s_es": {"type": "multiple_choice", "options": ["Small time cost and clear planning benefit", "Large time cost and weak result", "No cost and no benefit"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kleiner Zeitaufwand und klarer Planungsvorteil", "Großer Zeitaufwand und schwaches Ergebnis", "Kein Aufwand und kein Vorteil"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de texto estás leyendo?", "de": "Was für einen Text liest du?", "s_es": {"type": "multiple_choice", "options": ["An argument structure", "A room booking form", "A holiday email"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Argumentationsstruktur", "Ein Raumreservierungsformular", "Eine Urlaubs E Mail"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7610 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7610 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7610, 'en', 'reading', 'meetings', 'Argument structure. Main claim: the team should keep a short weekly client update. Reason one: a weekly update stops small issues from growing. Reason two: it gives the client a regular place to ask questions, which reduces long email chains. Evidence: during the last month, projects with a weekly update closed questions faster than projects without one.\n\nCounterargument: some team members say the update meeting takes too much time. Response: the meeting only lasts fifteen minutes, and it replaces many separate messages. Conclusion: the time cost is small, but the planning benefit is clear.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee la estructura de un argumento', 'Lee un texto breve con afirmación principal, razones, evidencia, objeción y conclusión.'),
        (v_reading_id, 'de', 'Lies die Struktur eines Arguments', 'Lies einen kurzen Text mit Hauptaussage, Gründen, Evidenz, Einwand und Schlussfolgerung.');

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
