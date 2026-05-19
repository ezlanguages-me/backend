-- ============================================================
-- Seed: A0 English Path – STEP 7850 – Reading – understand a conference summary (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El resumen es sobre una sesión del lunes por la mañana.", "de": "Die Zusammenfassung ist über eine Sitzung am Montagmorgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La ponente es Ana Lopez.", "de": "Die Sprecherin ist Ana Lopez.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La charla trata sobre cinco informes largos.", "de": "Der Vortrag handelt von fünf langen Berichten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La ponente usa tres diapositivas cortas.", "de": "Die Sprecherin benutzt drei kurze Folien.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Asisten 42 personas.", "de": "Es nehmen 42 Personen teil.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Las preguntas son sobre la duración de la reunión y el intercambio de notas.", "de": "Die Fragen gehen über die Dauer des Treffens und das Teilen von Notizen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los comentarios son negativos.", "de": "Die Rückmeldungen sind negativ.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El equipo va a probar una actualización de diez minutos el próximo mes.", "de": "Das Team wird nächsten Monat ein zehnminütiges Update ausprobieren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué debe decir un resumen final?", "de": "Was soll eine Abschlusszusammenfassung sagen?", "s_es": {"type": "multiple_choice", "options": ["The topic, three key points, and one next step", "Only the speaker name", "A long personal story"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Thema, drei Kernpunkte und einen nächsten Schritt", "Nur den Namen der Sprecherin", "Eine lange persönliche Geschichte"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién es la ponente?", "de": "Wer ist die Sprecherin?", "s_es": {"type": "multiple_choice", "options": ["Ana Lopez", "Mia Green", "Laura Kim"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ana Lopez", "Mia Green", "Laura Kim"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas diapositivas usa la ponente?", "de": "Wie viele Folien benutzt die Sprecherin?", "s_es": {"type": "multiple_choice", "options": ["Three", "Six", "Ten"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Sechs", "Zehn"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas personas forman la audiencia?", "de": "Wie viele Personen sind im Publikum?", "s_es": {"type": "multiple_choice", "options": ["24", "42", "12"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["24", "42", "12"], "answer": 0}}'::jsonb,
        '{"es": "¿Sobre qué son las preguntas?", "de": "Worüber sind die Fragen?", "s_es": {"type": "multiple_choice", "options": ["Meeting length and note sharing", "Food and music", "Travel and hotels"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Treffendauer und Teilen von Notizen", "Essen und Musik", "Reisen und Hotels"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué son positivos los comentarios?", "de": "Warum sind die Rückmeldungen positiv?", "s_es": {"type": "multiple_choice", "options": ["The checklist was clear and the examples were easy", "The room was dark and cold", "The talk was very long"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Checkliste war klar und die Beispiele waren leicht", "Der Raum war dunkel und kalt", "Der Vortrag war sehr lang"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la próxima acción?", "de": "Was ist die nächste Aktion?", "s_es": {"type": "multiple_choice", "options": ["Try a 10 minute Friday update", "Buy a new projector", "Cancel all meetings"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein zehnminütiges Freitagsupdate ausprobieren", "Einen neuen Projektor kaufen", "Alle Treffen absagen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo va a probar el equipo la nueva actualización?", "de": "Wann wird das Team das neue Update ausprobieren?", "s_es": {"type": "multiple_choice", "options": ["Next month", "This evening", "Last week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nächsten Monat", "Heute Abend", "Letzte Woche"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7850 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7850 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7850, 'en', 'reading', 'meetings', 'Conference Summary\n\nSession: Simple Conference Wrap-Ups
Speaker: Ana Lopez
Time: Monday morning
Main idea: a wrap-up should say the topic, three key points, and one next step.
The speaker used three short slides and two simple examples.
Audience: 24 people.
Questions were about meeting length and note sharing.
Feedback was positive because the checklist was clear and the examples were easy.
Next action: the team will try a 10 minute Friday update next month.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Entiende un resumen de una conferencia', 'Lee un resumen breve de una sesión de conferencia con ideas clave, preguntas y una próxima acción.'),
        (v_reading_id, 'de', 'Verstehe eine Konferenzzusammenfassung', 'Lies eine kurze Zusammenfassung einer Konferenzsitzung mit Kernideen, Fragen und einem nächsten Schritt.');

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
