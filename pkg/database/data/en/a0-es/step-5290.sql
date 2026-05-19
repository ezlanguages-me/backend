-- ============================================================
-- Seed: A0 English Path – STEP 5290 – Listening – understand a visual presentation (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La línea azul muestra las visitas a la biblioteca de lunes a viernes.", "p_de": "Die blaue Linie zeigt Bibliotheksbesuche von Montag bis Freitag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La línea alcanza su punto más alto el miércoles por la tarde.", "p_de": "Die Linie erreicht ihren höchsten Punkt am Mittwochnachmittag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las visitas suben mucho el viernes.", "p_de": "Die Besuche steigen am Freitag stark an.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La sala silenciosa es la zona más usada toda la semana.", "p_de": "Der stille Raum ist die meistgenutzte Zone der ganzen Woche.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las visitas del fin de semana aparecen en un gráfico pequeño aparte.", "p_de": "Die Wochenendbesuche erscheinen in einem kleinen separaten Diagramm.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El mensaje principal es que los lunes por la mañana son el momento más ocupado.", "p_de": "Die Hauptaussage ist, dass Montagmorgen die vollste Zeit ist.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La presentación explica un patrón visual.", "p_de": "Die Präsentation erklärt ein visuelles Muster.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación no menciona ningún gráfico.", "p_de": "Die Aufnahme erwähnt kein Diagramm.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué muestra la línea azul?", "p_de": "Was zeigt die blaue Linie?", "s": {"type": "multiple_choice", "options": ["Visits to the library from Monday to Friday", "A map of the campus", "A list of phone numbers"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo llega al punto más alto?", "p_de": "Wann erreicht sie den höchsten Punkt?", "s": {"type": "multiple_choice", "options": ["On Wednesday afternoon", "On Monday morning", "On Friday evening"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa el jueves y el viernes?", "p_de": "Was passiert am Donnerstag und Freitag?", "s": {"type": "multiple_choice", "options": ["Visits fall after Wednesday", "Visits double every day", "The chart ends completely"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué zona se usa más?", "p_de": "Welcher Bereich wird am meisten genutzt?", "s": {"type": "multiple_choice", "options": ["The quiet room", "The parking lot", "The cafeteria door"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde aparecen las visitas del fin de semana?", "p_de": "Wo erscheinen die Wochenendbesuche?", "s": {"type": "multiple_choice", "options": ["In a separate small chart", "On the back of a badge", "In the phone script"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el mensaje principal?", "p_de": "Was ist die Hauptbotschaft?", "s": {"type": "multiple_choice", "options": ["Midweek afternoons are busiest", "Fridays are always empty", "Weekend visits are highest"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de presentación es?", "p_de": "Was für eine Präsentation ist das?", "s": {"type": "multiple_choice", "options": ["A visual presentation with a chart", "A difficult complaint call", "A seminar reading list"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo ayuda la persona que presenta?", "p_de": "Wie hilft die präsentierende Person?", "s": {"type": "multiple_choice", "options": ["By pointing to parts of the chart", "By changing the room", "By asking for invoice numbers"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5290 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5290 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5290, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Presenter describing a chart
## THE SCENE: A visual presentation with a simple graph
A speaker describes a chart about library visits and explains the key pattern.

### DIRECTOR'S NOTES
Style:
* Visual guidance language such as look here and this line shows.
* The speaker highlights one main trend and one comparison.

Pace: Clear and slightly slow.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise matching spoken explanations to information shown in a visual presentation.

#### TRANSCRIPT
[guiding] On this slide, the blue line shows visits to the library from Monday to Friday.
[clear] The line rises on Tuesday and reaches its highest point on Wednesday afternoon.
[informative] After that, visits fall a little on Thursday and more clearly on Friday.
[explaining] The quiet room is the most used area in every part of the week.
[practical] Weekend visits are much lower, so they are shown in a separate small chart.
[concluding] The main message is simple: midweek afternoons are the busiest study time.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Presentación con gráfico sobre visitas a la biblioteca', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Präsentation mit Diagramm über Bibliotheksbesuche', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
