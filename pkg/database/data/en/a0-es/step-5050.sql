-- ============================================================
-- Seed: A0 English Path – STEP 5050 – Listening – listen to academic discussion (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La profesora pregunta por la idea principal del artículo.", "p_de": "Die Professorin fragt nach der Hauptidee des Artikels.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Un estudiante dice que los parques pequeños mejoran la vida diaria.", "p_de": "Ein Student sagt, dass kleine Parks das tägliche Leben verbessern.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Nadie menciona un ejemplo subrayado.", "p_de": "Niemand erwähnt ein markiertes Beispiel.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Un ejemplo habla de niños y personas mayores usando el mismo espacio verde.", "p_de": "Ein Beispiel spricht von Kindern und älteren Menschen im selben Grünraum.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La autora compara tres barrios con niveles distintos de alquiler.", "p_de": "Die Autorin vergleicht drei Viertel mit unterschiedlichen Mietniveaus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clase debe traer un ejemplo de ciudad el viernes.", "p_de": "Die Klasse soll am Freitag ein Stadtbeispiel mitbringen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La discusión continúa el miércoles.", "p_de": "Die Diskussion geht am Mittwoch weiter.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación es una discusión académica breve.", "p_de": "Die Aufnahme ist eine kurze akademische Diskussion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué pregunta hace primero la profesora?", "p_de": "Welche Frage stellt die Professorin zuerst?", "s": {"type": "multiple_choice", "options": ["What is the main idea of the article?", "Where is your office badge?", "Who called the printer technician?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué mejoran los parques pequeños según el estudiante?", "p_de": "Was verbessern kleine Parks laut dem Studenten?", "s": {"type": "multiple_choice", "options": ["Daily life in crowded neighborhoods", "The price of books", "Train times to campus"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ejemplo subraya la segunda estudiante?", "p_de": "Welches Beispiel markiert die zweite Studentin?", "s": {"type": "multiple_choice", "options": ["Children and older people using the same green space", "A phone call about delivery", "A class trip to the museum"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos barrios compara la autora?", "p_de": "Wie viele Viertel vergleicht die Autorin?", "s": {"type": "multiple_choice", "options": ["Three neighborhoods", "Two neighborhoods", "Five neighborhoods"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué niveles son diferentes en esos barrios?", "p_de": "Welche Werte sind in diesen Vierteln unterschiedlich?", "s": {"type": "multiple_choice", "options": ["Rent levels", "Phone numbers", "Exam dates"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo deben traer un ejemplo de ciudad?", "p_de": "Wann sollen sie ein Stadtbeispiel mitbringen?", "s": {"type": "multiple_choice", "options": ["On Wednesday", "On Friday night", "Next month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["A short academic discussion", "A hotel complaint", "A conference registration call"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién dirige la conversación?", "p_de": "Wer leitet das Gespräch?", "s": {"type": "multiple_choice", "options": ["The professor", "A taxi driver", "A hotel manager"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5050 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5050 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5050, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Professor and two students
## THE SCENE: A guided class discussion about an article
A professor asks two students about an article on small parks and city life.

### DIRECTOR'S NOTES
Style:
* Light academic discussion with clear turn-taking.
* Key ideas are repeated in simple words.

Pace: Moderate classroom pace.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following a short academic discussion about an article, examples, and class preparation.

#### TRANSCRIPT
[teacherly] Professor: What is the main idea of the article for today?
[thoughtful] Student 1: It says small parks improve daily life in crowded neighborhoods.
[clear] Professor: Good. Which example did you underline?
[helpful] Student 2: I underlined the part about children and older people using the same green space.
[reflective] Professor: Yes, and the author also compares three neighborhoods with different rent levels.
[organized] Professor: Please bring one city example on Wednesday so we can continue the discussion.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Debate corto sobre una lectura', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Kurze Diskussion über eine Lektüre', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
