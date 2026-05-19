-- ============================================================
-- Seed: A0 English Path – STEP 5210 – Listening – listen to detailed academic presentation (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El estudio siguió a cuarenta estudiantes de primer año.", "p_de": "Die Studie begleitete vierzig Erstsemester.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La media diaria de lectura fue de sesenta y cinco minutos.", "p_de": "Der tägliche Durchschnitt des Lesens lag bei fünfundsechzig Minuten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los estudiantes de ciencias leían textos más largos en menos días.", "p_de": "Studierende der Naturwissenschaften lasen längere Texte an weniger Tagen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los estudiantes de humanidades suelen leer textos más largos en menos días.", "p_de": "Geisteswissenschaftliche Studierende lesen oft längere Texte an weniger Tagen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Muchos participantes dijeron que el móvil era su principal distracción.", "p_de": "Viele Teilnehmende sagten, dass das Handy ihre Hauptablenkung war.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las salas silenciosas de la biblioteca se relacionan con mejor concentración.", "p_de": "Ruhige Bibliotheksräume stehen mit besserer Konzentration in Verbindung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El próximo semestre probarán una nueva cafetería.", "p_de": "Im nächsten Semester testen sie eine neue Cafeteria.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La grabación resume resultados de una investigación.", "p_de": "Die Aufnahme fasst Forschungsergebnisse zusammen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A cuántos estudiantes siguió el estudio?", "p_de": "Wie viele Studierende begleitete die Studie?", "s": {"type": "multiple_choice", "options": ["Forty students", "Sixty-five students", "Twenty students"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál fue la media diaria de lectura?", "p_de": "Wie hoch war der tägliche Lesedurchschnitt?", "s": {"type": "multiple_choice", "options": ["Sixty-five minutes", "Thirty minutes", "Two hours and thirty minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué patrón tenían los estudiantes de ciencias?", "p_de": "Welches Muster hatten die Naturwissenschafts-Studierenden?", "s": {"type": "multiple_choice", "options": ["Shorter texts every day", "Longer texts on fewer days", "No reading at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué patrón tenían los estudiantes de humanidades?", "p_de": "Welches Muster hatten die Geisteswissenschafts-Studierenden?", "s": {"type": "multiple_choice", "options": ["Longer texts on fewer days", "Only short texts at night", "The same pattern as science students"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál fue la distracción principal?", "p_de": "Was war die Hauptablenkung?", "s": {"type": "multiple_choice", "options": ["Phones", "Coffee", "Weather"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ayudó a concentrarse mejor?", "p_de": "Was half bei besserer Konzentration?", "s": {"type": "multiple_choice", "options": ["Quiet library rooms", "Loud group spaces", "Late-night phone calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué piensan probar el próximo semestre?", "p_de": "Was wollen sie im nächsten Semester testen?", "s": {"type": "multiple_choice", "options": ["A simple reading app", "A new parking system", "An online exam rule"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["A detailed academic presentation", "A difficult phone call", "A restaurant order"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5210 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5210 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5210, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Student researcher
## THE SCENE: A detailed presentation of study results
A student researcher explains the main findings from a study on reading habits.

### DIRECTOR'S NOTES
Style:
* Result-focused talk with clear comparisons.
* Numbers are repeated slowly for easy comprehension.

Pace: Moderate and precise.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following a detailed academic presentation with sample size, comparison, and future action.

#### TRANSCRIPT
[formal] Our study followed forty first-year students from science and humanities.
[clear] On average, students read for sixty-five minutes per day.
[comparative] Science students usually read shorter texts every day, while humanities students often read longer texts on fewer days.
[observing] Many participants said that phones were their main distraction.
[practical] Students who used the quiet library rooms reported better focus.
[forward-looking] Next semester, we plan to test a simple reading app to support regular study.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Presentación detallada sobre hábitos de lectura', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Detaillierte Präsentation über Lesegewohnheiten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
