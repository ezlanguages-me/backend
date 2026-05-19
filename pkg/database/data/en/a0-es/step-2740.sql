-- ============================================================
-- Seed: A0 English Path – STEP 2740 – Listening – Escucha instrucciones después de una operación
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La enfermera dice que el paciente puede irse a casa.", "p_de": "Die Krankenschwester sagt, dass der Patient nach Hause gehen kann.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe descansar dos días.", "p_de": "Er soll zwei Tage ruhen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Puede mojar el vendaje.", "p_de": "Er kann den Verband nass machen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "No debe conducir hoy ni llevar bolsas pesadas.", "p_de": "Er soll heute nicht fahren und keine schweren Taschen tragen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Esta noche debe comer comida ligera y beber agua.", "p_de": "Heute Abend soll er leichte Kost essen und Wasser trinken.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe volver el próximo miércoles para quitar los puntos.", "p_de": "Er soll nächsten Mittwoch zurückkommen, um die Fäden entfernen zu lassen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si tiene fiebre, no hace falta llamar.", "p_de": "Wenn er Fieber hat, muss er nicht anrufen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El paciente repite las instrucciones principales al final.", "p_de": "Der Patient wiederholt am Ende die wichtigsten Anweisungen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué puede hacer el paciente ahora?", "p_de": "Was kann der Patient jetzt tun?", "s": {"type": "multiple_choice", "options": ["Go home", "Drive to work", "Go swimming"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Go home", "Drive to work", "Go swimming"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Go home", "Drive to work", "Go swimming"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto debe descansar?", "p_de": "Wie lange soll er ruhen?", "s": {"type": "multiple_choice", "options": ["For two days", "For two weeks", "For ten minutes"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["For two days", "For two weeks", "For ten minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["For two days", "For two weeks", "For ten minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo debe estar el vendaje?", "p_de": "Wie soll der Verband sein?", "s": {"type": "multiple_choice", "options": ["Dry and clean", "Wet and open", "Hot and red"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Dry and clean", "Wet and open", "Hot and red"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dry and clean", "Wet and open", "Hot and red"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no debe hacer hoy?", "p_de": "Was soll er heute nicht tun?", "s": {"type": "multiple_choice", "options": ["Drive and carry heavy bags", "Drink water", "Sleep"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Drive and carry heavy bags", "Drink water", "Sleep"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drive and carry heavy bags", "Drink water", "Sleep"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo vuelve para los puntos?", "p_de": "Wann kommt er für die Fäden zurück?", "s": {"type": "multiple_choice", "options": ["Next Wednesday", "Tomorrow night", "Next month"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Next Wednesday", "Tomorrow night", "Next month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Next Wednesday", "Tomorrow night", "Next month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué señal de alarma menciona la enfermera?", "p_de": "Welches Warnzeichen nennt die Krankenschwester?", "s": {"type": "multiple_choice", "options": ["Bleeding", "A small cough only", "Hungry stomach"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Bleeding", "A small cough only", "Hungry stomach"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bleeding", "A small cough only", "Hungry stomach"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace el paciente al final?", "p_de": "Was macht der Patient am Ende?", "s": {"type": "multiple_choice", "options": ["He repeats the instructions", "He asks for a taxi", "He buys flowers"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["He repeats the instructions", "He asks for a taxi", "He buys flowers"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["He repeats the instructions", "He asks for a taxi", "He buys flowers"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué responde la enfermera?", "p_de": "Was antwortet die Krankenschwester?", "s": {"type": "multiple_choice", "options": ["Yes, that is correct.", "No, that is wrong.", "I am not sure."], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Yes, that is correct.", "No, that is wrong.", "I am not sure."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Yes, that is correct.", "No, that is wrong.", "I am not sure."], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2740 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2740 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2740, 'en', 'listening', 'health', $transcript$
# AUDIO PROFILE: A nurse giving discharge instructions after a small operation
## "What To Do At Home"

## THE SCENE: The nurse station before the patient leaves the hospital
The nurse explains rest, food, bandage care, and warning signs.

### DIRECTOR'S NOTES
Style:
* Calm discharge language with short, practical sentences.
* Warning signs are emphasized clearly.

Pace: Slow and reassuring.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear simple follow-up instructions after an operation and practise understanding care at home.

#### TRANSCRIPT
[nurse] Nurse: You can go home now, but please rest for two days.
[nurse] Nurse: Keep the bandage dry and clean.
[nurse] Nurse: Do not drive today and do not carry heavy bags.
[nurse] Nurse: This evening, eat light food and drink water.
[nurse] Nurse: Come back next Wednesday to remove the stitches.
[nurse] Nurse: Call us if you have bleeding, fever, or strong pain.
[patient] Patient: Okay. Rest, dry bandage, no driving, and come back on Wednesday.
[nurse] Nurse: Yes, that is correct.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha instrucciones después de una operación', 'Escucha a una enfermera que explica cuidados sencillos después del alta.'),
        (v_listening_id, 'de', 'Höre Anweisungen nach einer Operation', 'Höre eine Krankenschwester, die einfache Pflegehinweise nach der Entlassung erklärt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
