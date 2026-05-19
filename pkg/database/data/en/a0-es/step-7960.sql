-- ============================================================
-- Seed: A0 English Path – STEP 7960 – Listening – listen to model Q&A answers (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El moderador pregunta de qué trata la charla.", "de": "Der Moderator fragt, worum es im Vortrag geht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La charla es sobre actualizaciones semanales cortas del equipo.", "de": "Der Vortrag ist über kurze wöchentliche Teamupdates.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La charla dura diez minutos.", "de": "Der Vortrag dauert zehn Minuten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La charla es para nuevos miembros del equipo.", "de": "Der Vortrag ist für neue Teammitglieder.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El folleto está en la mesa junto a la puerta.", "de": "Der Handzettel liegt auf dem Tisch bei der Tür.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El nuevo plan empieza el lunes.", "de": "Der neue Plan beginnt am Montag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El moderador pregunta por el precio del billete.", "de": "Der Moderator fragt nach dem Ticketpreis.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La persona dice que el folleto está en el coche.", "de": "Die Person sagt, der Handzettel liegt im Auto.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Sobre qué trata la charla?", "de": "Worum geht es im Vortrag?", "s_es": {"type": "multiple_choice", "options": ["Short weekly team updates", "City bus maps", "New coffee machines"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kurze wöchentliche Teamupdates", "Stadtbuspläne", "Neue Kaffeemaschinen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto dura la charla?", "de": "Wie lange dauert der Vortrag?", "s_es": {"type": "multiple_choice", "options": ["Six minutes", "Ten minutes", "One hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sechs Minuten", "Zehn Minuten", "Eine Stunde"], "answer": 0}}'::jsonb,
        '{"es": "¿Para quién es la charla?", "de": "Für wen ist der Vortrag?", "s_es": {"type": "multiple_choice", "options": ["For new team members", "For hotel guests", "For bus drivers"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für neue Teammitglieder", "Für Hotelgäste", "Für Busfahrer"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el folleto?", "de": "Wo ist der Handzettel?", "s_es": {"type": "multiple_choice", "options": ["At the table by the door", "In the kitchen", "Under the window"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Tisch bei der Tür", "In der Küche", "Unter dem Fenster"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el siguiente paso?", "de": "Was ist der nächste Schritt?", "s_es": {"type": "multiple_choice", "options": ["Start the new update plan on Monday", "Buy a new laptop today", "Cancel the meeting room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den neuen Updateplan am Montag starten", "Heute einen neuen Laptop kaufen", "Den Meetingraum absagen"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién hace la primera pregunta?", "de": "Wer stellt die erste Frage?", "s_es": {"type": "multiple_choice", "options": ["The moderator", "The cleaner", "The taxi driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Moderator", "Die Reinigungskraft", "Der Taxifahrer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué plan empieza el lunes?", "de": "Welcher Plan beginnt am Montag?", "s_es": {"type": "multiple_choice", "options": ["The new update plan", "The lunch plan", "The travel plan"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der neue Updateplan", "Der Mittagsplan", "Der Reiseplan"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de respuestas da la ponente?", "de": "Welche Art von Antworten gibt die Sprecherin?", "s_es": {"type": "multiple_choice", "options": ["Short model answers", "Very long stories", "Only numbers"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kurze Modellantworten", "Sehr lange Geschichten", "Nur Zahlen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7960 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7960 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7960, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Moderator and speaker during a model Q and A after a presentation
## "Model Answers After the Talk"

## THE SCENE: In a meeting room just after a short presentation
A moderator asks common audience questions.
The speaker gives short model answers with clear facts.

### DIRECTOR''S NOTES
Style:
* Question and answer rhythm with very short replies.
* Useful model sentences are repeated for confident speaking.

Pace: Slow and even.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear a simple question round about topic, time, audience, materials, and the next step.

#### TRANSCRIPT
[formal] Moderator: First question. What is your talk about?
[clear] Speaker: It is about short weekly team updates.
[formal] Moderator: How long is the talk?
[brief] Speaker: It is six minutes.
[formal] Moderator: Who is it for?
[direct] Speaker: It is for new team members.
[formal] Moderator: Where can people get the handout?
[helpful] Speaker: At the table by the door.
[formal] Moderator: What is the next step?
[positive] Speaker: We start the new update plan on Monday.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha respuestas modelo de preguntas y respuestas', 'Escucha un ejemplo corto de preguntas previsibles y respuestas claras después de una presentación.'),
        (v_listening_id, 'de', 'Höre Modellantworten in einer Fragerunde', 'Höre ein kurzes Beispiel mit vorhersehbaren Fragen und klaren Antworten nach einer Präsentation.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
