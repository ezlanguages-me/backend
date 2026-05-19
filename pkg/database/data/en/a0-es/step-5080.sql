-- ============================================================
-- Seed: A0 English Path – STEP 5080 – Reading – read academic article excerpt (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El proyecto Riverside Garden empezó en un aparcamiento vacío.", "p_de": "Das Projekt Riverside Garden begann auf einem leeren Parkplatz.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hoy lo usan veinticinco familias.", "p_de": "Heute nutzen es fünfundzwanzig Familien.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El huerto solo sirve para producir verduras.", "p_de": "Der Garten dient nur dem Gemüseanbau.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El proyecto crea encuentros regulares los fines de semana.", "p_de": "Das Projekt schafft regelmäßige Treffen am Wochenende.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los investigadores dicen que mejora los lazos sociales.", "p_de": "Die Forschenden sagen, dass soziale Beziehungen verbessert werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El agua viene de un río pequeño detrás del jardín.", "p_de": "Das Wasser kommt von einem kleinen Fluss hinter dem Garten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El mantenimiento en invierno es difícil por falta de voluntarios.", "p_de": "Die Pflege im Winter ist wegen weniger Freiwilliger schwierig.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto considera que el huerto es un lugar importante de encuentro.", "p_de": "Der Text betrachtet den Garten als wichtigen Treffpunkt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Dónde empezó el proyecto?", "p_de": "Wo begann das Projekt?", "s": {"type": "multiple_choice", "options": ["On an empty parking area", "Inside a library", "At a train station"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas familias usan ahora las parcelas?", "p_de": "Wie viele Familien nutzen jetzt die Parzellen?", "s": {"type": "multiple_choice", "options": ["Twenty-five families", "Five families", "Fifty families"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué más crea el huerto además de verduras?", "p_de": "Was schafft der Garten außer Gemüse?", "s": {"type": "multiple_choice", "options": ["Regular weekend meetings", "New parking spaces", "Exam results"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué mejoran esos encuentros según los investigadores?", "p_de": "Was verbessern diese Treffen laut Forschenden?", "s": {"type": "multiple_choice", "options": ["Social ties between neighbors", "Phone reception in the area", "Hotel prices nearby"], "answer": 0}}'::jsonb,
        '{"p": "¿De dónde viene el agua para las plantas?", "p_de": "Woher kommt das Wasser für die Pflanzen?", "s": {"type": "multiple_choice", "options": ["From rain barrels", "From the cafeteria", "From a city bus"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema sigue existiendo?", "p_de": "Welches Problem besteht weiterhin?", "s": {"type": "multiple_choice", "options": ["Winter maintenance is difficult", "The garden has no entrance", "The project has no vegetables"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué es difícil el invierno?", "p_de": "Warum ist der Winter schwierig?", "s": {"type": "multiple_choice", "options": ["Fewer volunteers come", "There are too many lectures", "The library is closed"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo define el texto el huerto al final?", "p_de": "Wie beschreibt der Text den Garten am Ende?", "s": {"type": "multiple_choice", "options": ["An important local meeting place", "A private office project", "A temporary parking plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5080 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5080 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5080, 'en', 'reading', 'academic', 'Article excerpt: The Riverside Garden Project began on an empty parking area five years ago. Today, twenty-five families use small plots there every week.

The project does more than produce vegetables. The garden also creates regular weekend meetings, and researchers say this improves social ties between neighbors. Water for the plants comes from large rain barrels near the entrance.

One problem remains: winter maintenance is difficult because fewer volunteers come in cold weather. Even so, the article argues that the garden is an important local meeting place.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Extracto de artículo sobre huertos urbanos', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Artikelausschnitt über Stadtgärten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
