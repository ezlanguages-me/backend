-- ============================================================
-- Seed: A0 English Path – STEP 7870 – Dialogue – discuss conference takeaways (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Nora", "text": "That conference session was clear.", "es": "Esa sesión de la conferencia fue clara.", "de": "Diese Konferenzsitzung war klar."}'::jsonb,
        '{"character": "Leo", "text": "Yes, I liked the three point summary.", "es": "Sí, me gustó el resumen de tres puntos.", "de": "Ja, mir gefiel die Zusammenfassung in drei Punkten."}'::jsonb,
        '{"character": "Nora", "text": "The speaker talked about short team updates.", "es": "La ponente habló sobre actualizaciones cortas del equipo.", "de": "Die Sprecherin sprach über kurze Teamupdates."}'::jsonb,
        '{"character": "Leo", "text": "And the checklist was easy to follow.", "es": "Y la lista de control era fácil de seguir.", "de": "Und die Checkliste war leicht zu verstehen."}'::jsonb,
        '{"character": "Nora", "text": "My favorite part was the simple example from Monday morning.", "es": "Mi parte favorita fue el ejemplo sencillo del lunes por la mañana.", "de": "Mein Lieblingsteil war das einfache Beispiel vom Montagmorgen."}'::jsonb,
        '{"character": "Leo", "text": "Mine too. It showed a ten minute meeting.", "es": "La mía también. Mostraba una reunión de diez minutos.", "de": "Meine auch. Es zeigte ein zehnminütiges Treffen."}'::jsonb,
        '{"character": "Nora", "text": "Did you hear the question about shared notes?", "es": "¿Escuchaste la pregunta sobre las notas compartidas?", "de": "Hast du die Frage zu geteilten Notizen gehört?"}'::jsonb,
        '{"character": "Leo", "text": "Yes, the speaker said email notes after the meeting.", "es": "Sí, la ponente dijo que se enviaran las notas por correo después de la reunión.", "de": "Ja, die Sprecherin sagte, man soll die Notizen nach dem Treffen per E-Mail senden."}'::jsonb,
        '{"character": "Nora", "text": "I can use that idea at work.", "es": "Puedo usar esa idea en el trabajo.", "de": "Ich kann diese Idee bei der Arbeit nutzen."}'::jsonb,
        '{"character": "Leo", "text": "Me too. It is a good takeaway.", "es": "Yo también. Es una buena idea clave.", "de": "Ich auch. Das ist eine gute Erkenntnis."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Nora dice que la sesión fue clara.", "de": "Nora sagt, dass die Sitzung klar war.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Leo habla de un resumen de tres puntos.", "de": "Leo spricht von einer Zusammenfassung in drei Punkten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La ponente habla de informes de viaje largos.", "de": "Die Sprecherin spricht über lange Reiseberichte.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay una pregunta sobre notas compartidas.", "de": "Es gibt eine Frage über geteilte Notizen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Leo piensa que la idea no es útil.", "de": "Leo denkt, dass die Idee nicht nützlich ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué le gusta a Leo?", "de": "Was gefällt Leo?", "s_es": {"type": "multiple_choice", "options": ["The three point summary", "The lunch menu", "The new projector"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Zusammenfassung in drei Punkten", "Das Mittagsmenü", "Der neue Projektor"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué muestra el ejemplo sencillo?", "de": "Was zeigt das einfache Beispiel?", "s_es": {"type": "multiple_choice", "options": ["A ten minute meeting", "A new train line", "A hotel room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein zehnminütiges Treffen", "Eine neue Zuglinie", "Ein Hotelzimmer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice la ponente sobre las notas?", "de": "Was sagt die Sprecherin über die Notizen?", "s_es": {"type": "multiple_choice", "options": ["Email notes after the meeting", "Throw the notes away", "Write notes on the wall"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Notizen nach dem Treffen per E-Mail senden", "Die Notizen wegwerfen", "Notizen an die Wand schreiben"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde puede usar Nora la idea?", "de": "Wo kann Nora die Idee nutzen?", "s_es": {"type": "multiple_choice", "options": ["At work", "At the airport", "At the beach"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bei der Arbeit", "Am Flughafen", "Am Strand"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo describe Leo la idea final?", "de": "Wie beschreibt Leo die letzte Idee?", "s_es": {"type": "multiple_choice", "options": ["A good takeaway", "A loud problem", "A closed room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine gute Erkenntnis", "Ein lautes Problem", "Ein geschlossener Raum"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7870 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7870 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7870, 'en', 'dialogue', 'meetings', '[{"name": "Nora", "gender": "female", "avatarURL": "https://example.com/avatars/nora.png"}, {"name": "Leo", "gender": "male", "avatarURL": "https://example.com/avatars/leo.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Comenta las ideas clave de una conferencia', 'Lee un diálogo corto entre dos asistentes que comentan lo más útil de una sesión de conferencia.'),
        (v_dialogue_id, 'de', 'Besprich die wichtigsten Erkenntnisse einer Konferenz', 'Lies einen kurzen Dialog zwischen zwei Teilnehmenden, die das Nützlichste aus einer Konferenzsitzung besprechen.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
