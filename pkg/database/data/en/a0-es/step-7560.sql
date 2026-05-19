-- ============================================================
-- Seed: A0 English Path – STEP 7560 – Listening – follow discussion on action points (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Sofia quiere confirmar los puntos de acción antes de salir.", "de": "Sofia will die Aktionspunkte vor dem Gehen bestätigen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Malik enviará el cronograma revisado a las tres.", "de": "Malik schickt den überarbeiteten Zeitplan um drei Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ana reservará la sala de pruebas después de comer.", "de": "Ana reserviert den Testraum nach dem Mittagessen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Todavía hace falta una persona para llamar a la imprenta.", "de": "Es wird noch eine Person gebraucht, die die Druckerei anruft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Malik puede llamar a la imprenta si recibe antes el tamaño final del póster.", "de": "Malik kann die Druckerei anrufen, wenn er vorher das endgültige Posterformat bekommt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Jin enviará el tamaño final mañana por la mañana.", "de": "Jin schickt das Endformat morgen früh.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Malik pide aclaración sobre si Sofia dijo this hour o this afternoon.", "de": "Malik bittet um Klärung, ob Sofia this hour oder this afternoon gesagt hat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Al final Malik actualizará la lista de acciones.", "de": "Am Ende wird Malik die Aktionsliste aktualisieren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué quiere confirmar Sofia?", "de": "Was möchte Sofia bestätigen?", "s_es": {"type": "multiple_choice", "options": ["The action points", "The lunch menu", "The visitor badges"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Aktionspunkte", "Das Mittagsmenü", "Die Besucherausweise"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué enviará Malik a las tres?", "de": "Was wird Malik um drei Uhr schicken?", "s_es": {"type": "multiple_choice", "options": ["The revised timeline", "The final invoice", "The room key"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den überarbeiteten Zeitplan", "Die Endrechnung", "Den Raumschlüssel"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué reservará Ana?", "de": "Was wird Ana reservieren?", "s_es": {"type": "multiple_choice", "options": ["The test room", "The shuttle bus", "The client lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Testraum", "Den Shuttlebus", "Das Kundenmittagessen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué empresa necesita una llamada?", "de": "Welches Unternehmen muss angerufen werden?", "s_es": {"type": "multiple_choice", "options": ["The printer", "The bank", "The hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Druckerei", "Die Bank", "Das Hotel"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué necesita Malik antes de llamar?", "de": "Was braucht Malik vor dem Anruf?", "s_es": {"type": "multiple_choice", "options": ["The final poster size", "The taxi receipt", "The speaker list"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das endgültige Posterformat", "Die Taxiquittung", "Die Rednerliste"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién enviará ese dato?", "de": "Wer wird diese Information schicken?", "s_es": {"type": "multiple_choice", "options": ["Jin", "Ana", "Sofia"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Jin", "Ana", "Sofia"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué duda aclara Malik?", "de": "Welche Frage klärt Malik?", "s_es": {"type": "multiple_choice", "options": ["Whether Sofia said this hour or this afternoon", "Whether the room is open on Monday", "Whether the meeting is online"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ob Sofia this hour oder this afternoon gesagt hat", "Ob der Raum am Montag offen ist", "Ob das Treffen online ist"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hará Malik al final?", "de": "Was wird Malik am Ende tun?", "s_es": {"type": "multiple_choice", "options": ["Update the action list", "Print the posters", "Cancel the test room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Aktionsliste aktualisieren", "Die Poster drucken", "Den Testraum absagen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7560 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7560 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7560, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Sofia and Malik, two colleagues reviewing action points after a planning meeting
## "Who Takes Which Action?"

## THE SCENE: A small meeting room just after the weekly project review
Sofia wants to leave with a clear list of who will do what.
Malik answers point by point, and the pair briefly pause to clarify one detail.

### DIRECTOR'S NOTES
Style:
* Practical meeting language with clear ownership and deadlines.
* One short clarification moment helps learners follow real discussion flow.

Pace: Slow to medium, with small pauses before times, names, and actions.

Accent: Neutral workplace accent.

### SAMPLE CONTEXT
Learners hear colleagues confirm action points after a meeting.
The audio practises responsibility, timing, and brief clarification in a work discussion.

#### TRANSCRIPT
[focused] Sofia: Before we leave, let us confirm the action points.
[practical] Malik: Good idea. I will send the revised timeline by three o clock.
[checking] Sofia: And Ana will book the test room for Thursday, right?
[confirming] Malik: Yes. She said she can do that before lunch.
[noticing] Sofia: We still need one person to call the printer.
[helpful] Malik: I can call them, but I need the final poster size first.
[clear] Sofia: Fine. Jin will message you the size in the next hour.
[clarifying] Malik: Sorry, did you say this hour or this afternoon?
[repeating] Sofia: This hour. Then you can call the printer today.
[closing] Malik: Perfect. I will update the action list after that.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha una revisión de puntos de acción', 'Escucha a dos compañeros repartir tareas, confirmar tiempos y aclarar un detalle breve.'),
        (v_listening_id, 'de', 'Höre eine Besprechung von Aktionspunkten', 'Höre zwei Kollegen, die Aufgaben verteilen, Zeiten bestätigen und ein Detail kurz klären.');

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
