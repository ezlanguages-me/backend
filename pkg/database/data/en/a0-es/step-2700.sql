-- ============================================================
-- Seed: A0 English Path – STEP 2700 – Listening – Escucha cómo tomar un medicamento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El farmacéutico dice que se toma una tableta por la mañana y otra por la noche.", "p_de": "Die Apothekerin sagt, dass man morgens und abends je eine Tablette nimmt.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que tomar las tabletas después de comer y con agua.", "p_de": "Man soll die Tabletten nach dem Essen und mit Wasser nehmen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede beber alcohol con la medicina.", "p_de": "Man kann mit dem Medikament Alkohol trinken.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que terminar los siete días completos.", "p_de": "Man soll die vollen sieben Tage beenden.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si olvidas una tableta, debes tomar dos juntas.", "p_de": "Wenn du eine Tablette vergisst, sollst du zwei zusammen nehmen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El paciente repite morning and night al final.", "p_de": "Der Patient wiederholt am Ende morning and night.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La medicina se toma solamente al mediodía.", "p_de": "Das Medikament wird nur mittags genommen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La farmacéutica confirma que el resumen del paciente es correcto.", "p_de": "Die Apothekerin bestätigt, dass die Zusammenfassung des Patienten richtig ist.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuándo se toma la medicina?", "p_de": "Wann wird das Medikament genommen?", "s": {"type": "multiple_choice", "options": ["In the morning and at night", "Only at lunch", "Every hour"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["In the morning and at night", "Only at lunch", "Every hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In the morning and at night", "Only at lunch", "Every hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Después de qué se toma?", "p_de": "Nach was wird es genommen?", "s": {"type": "multiple_choice", "options": ["After food", "After sport", "After sleep only"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["After food", "After sport", "After sleep only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["After food", "After sport", "After sleep only"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué se toma?", "p_de": "Womit wird es genommen?", "s": {"type": "multiple_choice", "options": ["With water", "With wine", "With coffee"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["With water", "With wine", "With coffee"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["With water", "With wine", "With coffee"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no se debe beber?", "p_de": "Was soll man nicht trinken?", "s": {"type": "multiple_choice", "options": ["Alcohol", "Tea", "Milk"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Alcohol", "Tea", "Milk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alcohol", "Tea", "Milk"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura el tratamiento?", "p_de": "Wie lange dauert die Behandlung?", "s": {"type": "multiple_choice", "options": ["Seven days", "Two days", "One month"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Seven days", "Two days", "One month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Seven days", "Two days", "One month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace el paciente?", "p_de": "Welche Frage stellt der Patient?", "s": {"type": "multiple_choice", "options": ["What do I do if I miss one tablet?", "Can I drive to Spain?", "Where is the station?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["What do I do if I miss one tablet?", "Can I drive to Spain?", "Where is the station?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["What do I do if I miss one tablet?", "Can I drive to Spain?", "Where is the station?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace si olvida una tableta?", "p_de": "Was macht man, wenn man eine Tablette vergisst?", "s": {"type": "multiple_choice", "options": ["Take it when you remember", "Take three together", "Stop the treatment"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Take it when you remember", "Take three together", "Stop the treatment"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Take it when you remember", "Take three together", "Stop the treatment"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace el paciente al final?", "p_de": "Was macht der Patient am Ende?", "s": {"type": "multiple_choice", "options": ["He repeats the instructions", "He asks for a taxi", "He buys a magazine"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["He repeats the instructions", "He asks for a taxi", "He buys a magazine"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["He repeats the instructions", "He asks for a taxi", "He buys a magazine"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2700 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2700 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2700, 'en', 'listening', 'health', $transcript$
# AUDIO PROFILE: A pharmacist explaining how to take tablets
## "How to Take These Tablets"

## THE SCENE: The pharmacy counter after a purchase
The pharmacist gives clear oral instructions about dose, food, water, alcohol, and missed tablets.

### DIRECTOR'S NOTES
Style:
* Short practical instructions with repeated numbers.
* Important warning language is slow and clear.

Pace: Slow and instructional.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear spoken medicine instructions and practise understanding dosage, warnings, and what to do after a missed dose.

#### TRANSCRIPT
[pharmacist] Pharmacist: Take one tablet in the morning and one at night.
[pharmacist] Pharmacist: Always take the tablets after food and with water.
[pharmacist] Pharmacist: Do not drink alcohol with this medicine.
[pharmacist] Pharmacist: Finish the full seven days.
[patient] Patient: What do I do if I miss one tablet?
[pharmacist] Pharmacist: Take it when you remember, but do not take two tablets together.
[patient] Patient: Okay. Morning and night, after food, with water.
[pharmacist] Pharmacist: Yes, that is right.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha cómo tomar un medicamento', 'Escucha a una farmacéutica que explica cómo tomar unas pastillas.'),
        (v_listening_id, 'de', 'Höre, wie man ein Medikament einnimmt', 'Höre eine Apothekerin, die erklärt, wie man Tabletten einnimmt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
