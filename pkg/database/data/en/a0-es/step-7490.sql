-- ============================================================
-- Seed: A0 English Path – STEP 7490 – Listening – follow a problem-solving discussion (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La impresora está en la sala B.", "de": "Der Drucker ist in Raum B.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La bandeja de papel está vacía.", "de": "Das Papierfach ist leer.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Lena ya revisó la bandeja.", "de": "Lena hat das Fach schon geprüft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La puerta trasera está abierta.", "de": "Die hintere Klappe ist offen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Nora dice que compren una impresora nueva.", "de": "Nora sagt, sie sollen einen neuen Drucker kaufen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Si el problema sigue, deben llamar a IT.", "de": "Wenn das Problem bleibt, sollen sie die IT anrufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Lena va a probar la impresora ahora.", "de": "Lena wird den Drucker jetzt testen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hablan del menú del almuerzo.", "de": "Sie sprechen über das Mittagsmenü.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿En qué sala está la impresora?", "de": "In welchem Raum ist der Drucker?", "s_es": {"type": "multiple_choice", "options": ["Room B", "Room A", "Room C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Raum B", "Raum A", "Raum C"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace la impresora?", "de": "Was macht der Drucker?", "s_es": {"type": "multiple_choice", "options": ["It stops after one page", "It prints too fast", "It is too loud"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er stoppt nach einer Seite", "Er druckt zu schnell", "Er ist zu laut"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién revisó la bandeja?", "de": "Wer hat das Fach geprüft?", "s_es": {"type": "multiple_choice", "options": ["Lena", "Marco", "Nora"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lena", "Marco", "Nora"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo está la bandeja?", "de": "Wie ist das Fach?", "s_es": {"type": "multiple_choice", "options": ["It is full", "It is empty", "It is broken"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Es ist voll", "Es ist leer", "Es ist kaputt"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué parte puede estar abierta?", "de": "Welcher Teil könnte offen sein?", "s_es": {"type": "multiple_choice", "options": ["The back door", "The window", "The top screen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die hintere Klappe", "Das Fenster", "Der obere Bildschirm"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué deben imprimir otra vez?", "de": "Was sollen sie noch einmal drucken?", "s_es": {"type": "multiple_choice", "options": ["The meeting notes", "The lunch list", "The visitor map"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Meetingnotizen", "Die Mittagliste", "Die Besucherkarte"], "answer": 0}}'::jsonb,
        '{"es": "¿A quién llaman si sigue el problema?", "de": "Wen rufen sie an, wenn das Problem bleibt?", "s_es": {"type": "multiple_choice", "options": ["IT", "The driver", "The visitors"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die IT", "Den Fahrer", "Die Besucher"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace Lena ahora?", "de": "Was macht Lena jetzt?", "s_es": {"type": "multiple_choice", "options": ["She tests it now", "She leaves the room", "She opens the meeting"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie testet es jetzt", "Sie verlässt den Raum", "Sie eröffnet das Meeting"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7490 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7490 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7490, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Lena, Marco and Nora in a quick office discussion
## "The Printer Stops Again"

## THE SCENE: Three colleagues solve a simple problem before a meeting
They need to print meeting notes, but the printer in one room is not working well.
Each speaker checks one possible reason and suggests one next step.

### DIRECTOR'S NOTES
Style:
* Practical problem-solving language with short turns.
* Each idea is concrete and easy to follow.

Pace: Slow and methodical, like colleagues checking a problem together.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how colleagues describe a problem, reject one idea, and choose the next action.
The audio is useful for simple troubleshooting in meetings.

#### TRANSCRIPT
[worried] Lena: The printer in Room B stops after one page.
[guessing] Marco: I think the paper tray is empty.
[careful] Lena: I checked it. The tray is full.
[thinking] Marco: Then maybe the back door is open.
[noticing] Lena: Yes, you are right. The back door is open.
[practical] Nora: Please close it and print the meeting notes again.
[helpful] Marco: If it still stops, call IT.
[ready] Lena: Okay. I will close it and test it now.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha una discusión para resolver un problema', 'Escucha a un equipo resolver un problema sencillo con una impresora antes de una reunión.'),
        (v_listening_id, 'de', 'Höre eine Problemlösungsdiskussion', 'Höre, wie ein Team vor einem Meeting ein einfaches Druckerproblem löst.');

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
