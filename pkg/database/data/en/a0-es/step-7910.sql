-- ============================================================
-- Seed: A0 English Path – STEP 7910 – Reading – read speaker preparation checklist (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Hay que revisar la sala a las 8:30.", "de": "Man soll den Raum um 8:30 Uhr prüfen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "No hace falta probar el proyector.", "de": "Der Projektor muss nicht getestet werden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Tu nombre va en la última diapositiva.", "de": "Dein Name kommt auf die letzte Folie.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay que imprimir 12 folletos.", "de": "Man soll 12 Handzettel drucken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La frase inicial se practica dos veces.", "de": "Der Eröffnungssatz wird zweimal geübt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La charla debe durar 15 minutos.", "de": "Der Vortrag soll 15 Minuten dauern.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay que dejar 3 minutos para preguntas.", "de": "Man soll 3 Minuten für Fragen lassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay que llevar agua y un bolígrafo.", "de": "Man soll Wasser und einen Stift mitbringen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿A qué hora hay que revisar la sala?", "de": "Um wie viel Uhr soll man den Raum prüfen?", "s_es": {"type": "multiple_choice", "options": ["At 8:30", "At 10:30", "At noon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 8:30 Uhr", "Um 10:30 Uhr", "Um zwölf Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué equipo hay que probar?", "de": "Welche Geräte soll man testen?", "s_es": {"type": "multiple_choice", "options": ["The laptop and projector", "The coffee machine and fan", "The door and lamp"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Laptop und den Projektor", "Die Kaffeemaschine und den Ventilator", "Die Tür und die Lampe"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué diapositiva va tu nombre?", "de": "Auf welche Folie kommt dein Name?", "s_es": {"type": "multiple_choice", "options": ["The first slide", "The last slide", "A blank slide"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf die erste Folie", "Auf die letzte Folie", "Auf eine leere Folie"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos folletos hay que imprimir?", "de": "Wie viele Handzettel soll man drucken?", "s_es": {"type": "multiple_choice", "options": ["12", "5", "20"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["12", "5", "20"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas veces se practica la frase inicial?", "de": "Wie oft übt man den Eröffnungssatz?", "s_es": {"type": "multiple_choice", "options": ["Two times", "One time", "Six times"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweimal", "Einmal", "Sechsmal"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto debe durar la charla?", "de": "Wie lang soll der Vortrag sein?", "s_es": {"type": "multiple_choice", "options": ["5 minutes", "15 minutes", "30 minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["5 Minuten", "15 Minuten", "30 Minuten"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos ejemplos fáciles hay que preparar?", "de": "Wie viele leichte Beispiele soll man vorbereiten?", "s_es": {"type": "multiple_choice", "options": ["Two", "Four", "Ten"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Vier", "Zehn"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hay que llevar?", "de": "Was soll man mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Water and a pen", "A sandwich and a map", "A bike and a key"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wasser und einen Stift", "Ein Sandwich und eine Karte", "Ein Fahrrad und einen Schlüssel"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7910 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7910 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7910, 'en', 'reading', 'meetings', 'Speaker Preparation Checklist\n\nBefore the talk:
1. Check the room at 8:30.
2. Test the laptop and projector.
3. Put your name on the first slide.
4. Print 12 handouts.
5. Practice the opening line two times.
6. Keep the talk to 5 minutes.
7. Prepare two easy examples.
8. Leave 3 minutes for questions.
9. Bring water and a pen.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee una lista de preparación del ponente', 'Lee una lista breve de acciones antes de una presentación y reconoce instrucciones simples.'),
        (v_reading_id, 'de', 'Lies eine Vorbereitungsliste für Vortragende', 'Lies eine kurze Liste mit Schritten vor einer Präsentation und erkenne einfache Anweisungen.');

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
