-- ============================================================
-- Seed: A0 English Path – STEP 5710 – Reading – assess appropriacy of source material quickly and reliably (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- 8 true_false exercises first
        '{"p": "El primer control es ver si la fuente ha pasado revisión por pares o una edición académica fiable.", "p_de": "Der erste Schritt ist zu prüfen, ob die Quelle peer reviewed ist oder von einem verlässlichen Wissenschaftsverlag bearbeitet wurde.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La revisión por pares garantiza que el texto es perfecto.", "p_de": "Peer Review garantiert, dass der Text perfekt ist.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Un libro introductorio puede servir para contexto y términos clave.", "p_de": "Ein Einführungslehrbuch kann für Hintergrund und Schlüsselbegriffe nützlich sein.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Un artículo avanzado puede ser mejor para pruebas detalladas.", "p_de": "Ein fortgeschrittener Forschungsartikel kann für detaillierte Belege besser sein.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una fuente puede ser buena y aun así no encajar con tu tarea actual.", "p_de": "Eine Quelle kann gut sein und trotzdem nicht zu deiner aktuellen Aufgabe passen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto recomienda ignorar el sesgo o la opinión sin pruebas.", "p_de": "Der Text empfiehlt, Verzerrung oder unbelegte Meinung zu ignorieren.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El material adecuado presenta afirmaciones con cuidado y muestra de dónde viene la evidencia.", "p_de": "Geeignetes Material formuliert Behauptungen vorsichtig und zeigt, woher die Belege kommen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto propone revisar estado de revisión, nivel y sesgo.", "p_de": "Der Text schlägt vor, Prüfstatus, Niveau und Verzerrung zu überprüfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        -- 8 multiple_choice exercises (answer ALWAYS 0)
        '{"p": "¿Qué debes comprobar primero?", "p_de": "Was sollte man zuerst prüfen?", "s": {"type": "multiple_choice", "options": ["Peer review or a reliable academic publisher", "Only the cover color", "Only the page count"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve un libro introductorio?", "p_de": "Wofür ist ein Einführungsbuch nützlich?", "s": {"type": "multiple_choice", "options": ["Background and key terms", "Laboratory access", "Equipment booking"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué puede servir mejor un artículo avanzado?", "p_de": "Wofür kann ein fortgeschrittener Artikel besser sein?", "s": {"type": "multiple_choice", "options": ["Detailed evidence", "Bus schedules", "Pronunciation practice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede hacer una fuente buena pero inadecuada?", "p_de": "Was kann eine gute, aber ungeeignete Quelle sein?", "s": {"type": "multiple_choice", "options": ["Unsuitable for the current task", "Always the best option", "A library catalogue entry"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema debes vigilar al final?", "p_de": "Welches Problem sollte man am Ende beachten?", "s": {"type": "multiple_choice", "options": ["Bias or unsupported opinion", "Shelf color", "Room temperature"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo presenta sus afirmaciones un material apropiado?", "p_de": "Wie präsentiert geeignetes Material seine Behauptungen?", "s": {"type": "multiple_choice", "options": ["Carefully and with evidence", "As jokes only", "Without any source"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tres elementos recomienda revisar el texto?", "p_de": "Welche drei Elemente empfiehlt der Text zu prüfen?", "s": {"type": "multiple_choice", "options": ["Review status, level, and bias", "Map, ticket, and code", "Volume, accent, and speed"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve esta comprobación rápida?", "p_de": "Wofür dient diese schnelle Prüfung?", "s": {"type": "multiple_choice", "options": ["To avoid weak source choices", "To reserve a study room", "To shorten an abstract"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5710 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5710 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5710, 'en', 'reading', 'academic', 'To assess appropriacy quickly, first check whether the source has been peer reviewed or edited by a reliable academic publisher. Peer review does not guarantee perfection, but it usually means the work has passed a basic quality check.

Next, decide whether the level matches your needs. An introductory textbook is useful for background and key terms, while an advanced research article may be better for detailed evidence. A source can be good but still unsuitable if it is far above or below your current task.

Finally, watch for bias, unsupported opinion, or language that pushes one position without evidence. Appropriate material presents claims carefully and makes clear where the evidence comes from. A quick check for review status, level, and bias often prevents weak source choices.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Valorar rápidamente la adecuación de una fuente', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Die Eignung von Quellen schnell bewerten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
