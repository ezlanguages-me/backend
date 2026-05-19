-- ============================================================
-- Seed: A0 English Path – STEP 5160 – Listening – follow complex academic lecture (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Los edificios universitarios antiguos pierden mucho calor en invierno.", "p_de": "Alte Universitätsgebäude verlieren im Winter viel Wärme.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las luces y los ordenadores siempre se apagan por la noche.", "p_de": "Lichter und Computer werden nachts immer ausgeschaltet.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La biblioteca usó un dieciocho por ciento menos de energía tras el aislamiento nuevo.", "p_de": "Die Bibliothek verbrauchte nach neuer Isolierung achtzehn Prozent weniger Energie.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los estudiantes pueden ayudar cerrando ventanas y apagando ordenadores.", "p_de": "Studierende können helfen, indem sie Fenster schließen und Computer ausschalten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La siguiente fase estudiará las residencias universitarias.", "p_de": "Die nächste Phase untersucht die Wohnheime.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La solución solo depende de una reparación del edificio.", "p_de": "Die Lösung hängt nur von einer Gebäudereparatur ab.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La clase conecta problemas del edificio con el comportamiento diario.", "p_de": "Die Vorlesung verbindet Bauprobleme mit täglichem Verhalten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación trata de jardines urbanos.", "p_de": "Die Aufnahme handelt von Stadtgärten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué pierden mucho los edificios antiguos en invierno?", "p_de": "Was verlieren alte Gebäude im Winter stark?", "s": {"type": "multiple_choice", "options": ["Heat", "Books", "Phone numbers"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se queda muchas veces encendido por la noche?", "p_de": "Was bleibt nachts oft eingeschaltet?", "s": {"type": "multiple_choice", "options": ["Lights and computers", "The cafeteria menu", "The bus station"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto menos energía usó la biblioteca?", "p_de": "Wie viel weniger Energie verbrauchte die Bibliothek?", "s": {"type": "multiple_choice", "options": ["Eighteen percent", "Eight percent", "Thirty percent"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pueden hacer los estudiantes al salir?", "p_de": "Was können Studierende beim Verlassen tun?", "s": {"type": "multiple_choice", "options": ["Shut windows and turn off computers", "Move the lecture hall", "Print more posters"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se estudiará en la siguiente fase?", "p_de": "Was wird in der nächsten Phase untersucht?", "s": {"type": "multiple_choice", "options": ["Dormitory buildings", "Conference badges", "Phone messages"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué mezcla propone la conclusión?", "p_de": "Welche Mischung schlägt der Schluss vor?", "s": {"type": "multiple_choice", "options": ["Building repair and daily user behavior", "Only library rules", "Only online exams"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["A complex academic lecture", "A difficult work call", "A restaurant complaint"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo presenta la información el profesor?", "p_de": "Wie präsentiert der Professor die Informationen?", "s": {"type": "multiple_choice", "options": ["From problem to evidence to action", "Only with jokes and songs", "Without any examples"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5160 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5160 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5160, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: University lecturer
## THE SCENE: A more detailed lecture on campus energy use
A lecturer explains several causes of energy loss and outlines a plan for future building improvements.

### DIRECTOR'S NOTES
Style:
* Slightly denser lecture language with clear examples.
* The lecturer moves from problem to evidence to future action.

Pace: Moderate and focused.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following a more detailed academic lecture with causes, results, and a planned next phase.

#### TRANSCRIPT
[focused] Our data show that older university buildings lose a great deal of heat in winter.
[clear] We also found that lights and computers often stay on overnight in study rooms.
[informative] After new insulation was added, the library used eighteen percent less energy last year.
[practical] Students can help by shutting windows and turning off computers when they leave.
[organized] The next phase of the project will study the dormitory buildings in detail.
[concluding] So the solution is a mix of building repair and daily user behavior.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Clase compleja sobre energía en edificios universitarios', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Komplexere Vorlesung über Energie in Uni-Gebäuden', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
