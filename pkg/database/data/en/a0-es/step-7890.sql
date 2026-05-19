-- ============================================================
-- Seed: A0 English Path – STEP 7890 – Reading – understand evaluation/feedback form (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El formulario es sobre Easy Team Presentations.", "de": "Das Formular ist über Easy Team Presentations.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La sala es Hall C.", "de": "Der Raum ist Hall C.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La presentación empieza a las 10:00.", "de": "Die Präsentation beginnt um 10:00 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El audio es bueno.", "de": "Der Ton ist gut.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La parte más útil es la lista de control corta.", "de": "Der nützlichste Teil ist die kurze Checkliste.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El gráfico difícil es muy grande.", "de": "Die schwierige Grafik ist sehr groß.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La persona que responde quiere asistir otra vez.", "de": "Die antwortende Person möchte noch einmal teilnehmen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La petición para la próxima vez es más tiempo para preguntas.", "de": "Die Bitte für das nächste Mal ist mehr Zeit für Fragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuál es el nombre de la sesión?", "de": "Wie heißt die Sitzung?", "s_es": {"type": "multiple_choice", "options": ["Easy Team Presentations", "Fast Travel Reports", "Quiet Study Group"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Easy Team Presentations", "Fast Travel Reports", "Quiet Study Group"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué sala es la sesión?", "de": "In welchem Raum ist die Sitzung?", "s_es": {"type": "multiple_choice", "options": ["Hall C", "Room A", "Office 5"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hall C", "Raum A", "Büro 5"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora empieza?", "de": "Wann beginnt sie?", "s_es": {"type": "multiple_choice", "options": ["11:00", "10:00", "14:30"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["11:00", "10:00", "14:30"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo es el audio?", "de": "Wie ist der Ton?", "s_es": {"type": "multiple_choice", "options": ["Good", "Bad", "Very loud"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Gut", "Schlecht", "Sehr laut"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué parte es la más útil?", "de": "Welcher Teil ist am nützlichsten?", "s_es": {"type": "multiple_choice", "options": ["The short checklist", "The lunch break", "The big map"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die kurze Checkliste", "Die Mittagspause", "Die große Karte"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué parte es la más difícil?", "de": "Welcher Teil ist am schwierigsten?", "s_es": {"type": "multiple_choice", "options": ["One chart was small", "The door was locked", "The speaker was late"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Grafik war klein", "Die Tür war verschlossen", "Die Sprecherin war spät"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pide la persona para la próxima vez?", "de": "Was wünscht sich die Person für das nächste Mal?", "s_es": {"type": "multiple_choice", "options": ["Five more minutes for questions", "A free bus", "A shorter room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünf Minuten mehr für Fragen", "Einen kostenlosen Bus", "Einen kleineren Raum"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién es la persona que hace la evaluación?", "de": "Wer ist die Person, die das Formular ausfüllt?", "s_es": {"type": "multiple_choice", "options": ["Laura Kim", "Ana Lopez", "Mia Green"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Laura Kim", "Ana Lopez", "Mia Green"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7890 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7890 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7890, 'en', 'reading', 'meetings', 'Conference Feedback Form\n\nSession: Easy Team Presentations
Room: Hall C
Start time: 11:00
Audio: good
Slides: very clear
Speaker voice: calm
Most useful part: the short checklist
Most difficult part: one chart was small
Would you join again? Yes
Would you recommend it? Yes
Request for next time: five more minutes for questions
Reviewer: Laura Kim')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Entiende un formulario de evaluación', 'Lee un formulario breve de comentarios sobre una presentación y reconoce valoraciones sencillas.'),
        (v_reading_id, 'de', 'Verstehe ein Feedbackformular', 'Lies ein kurzes Feedbackformular zu einer Präsentation und erkenne einfache Bewertungen.');

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
