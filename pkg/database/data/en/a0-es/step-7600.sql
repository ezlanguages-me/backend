-- ============================================================
-- Seed: A0 English Path – STEP 7600 – Listening – follow discussion and argument with only occasional need for clarification (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El equipo decide si la formación de seguridad sigue el lunes o pasa al miércoles.", "de": "Das Team entscheidet, ob die Sicherheitsschulung am Montag bleibt oder auf Mittwoch verschoben wird.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ravi prefiere el miércoles porque los manuales nuevos llegan el martes.", "de": "Ravi bevorzugt Mittwoch, weil die neuen Handbücher am Dienstag ankommen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Dana piensa que el miércoles es mejor para el equipo de almacén.", "de": "Dana findet, Mittwoch sei besser für das Lagerteam.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La persona que dirige la reunión pide una aclaración sobre el miércoles por la mañana.", "de": "Die leitende Person bittet um eine Klärung zu Mittwochmorgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Dana dice que el equipo puede asistir el lunes pero no el miércoles por la mañana.", "de": "Dana sagt, das Team kann am Montag teilnehmen, aber nicht am Mittwochmorgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ravi propone cancelar la formación por completo.", "de": "Ravi schlägt vor, die Schulung ganz abzusagen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Al final aceptan mantener el lunes y añadir una sesión corta de actualización el jueves.", "de": "Am Ende einigen sie sich darauf, Montag zu behalten und am Donnerstag eine kurze Updatesitzung hinzuzufügen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Una opción ofrece mejor calendario y la otra mejores materiales.", "de": "Eine Option bietet bessere Terminlage und die andere bessere Materialien.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué están decidiendo?", "de": "Was entscheiden sie?", "s_es": {"type": "multiple_choice", "options": ["The day of the safety training", "The office paint colour", "The travel hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Tag der Sicherheitsschulung", "Die Farbe der Bürowände", "Das Reisehotel"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué Ravi prefiere el miércoles?", "de": "Warum bevorzugt Ravi Mittwoch?", "s_es": {"type": "multiple_choice", "options": ["Because the new manuals arrive on Tuesday", "Because the room is larger", "Because the client visits on Monday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil die neuen Handbücher am Dienstag ankommen", "Weil der Raum größer ist", "Weil der Kunde am Montag kommt"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué equipo menciona Dana?", "de": "Welches Team erwähnt Dana?", "s_es": {"type": "multiple_choice", "options": ["The warehouse team", "The sales team", "The legal team"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Lagerteam", "Das Vertriebsteam", "Das Rechtsteam"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué aclara la persona que dirige la reunión?", "de": "Was klärt die leitende Person?", "s_es": {"type": "multiple_choice", "options": ["Whether Wednesday morning is the busy time", "Whether the manuals are printed", "Whether lunch is included"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ob Mittwochmorgen die arbeitsreichste Zeit ist", "Ob die Handbücher gedruckt sind", "Ob Mittagessen dabei ist"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué propone Ravi si se mantiene el lunes?", "de": "Was schlägt Ravi vor, wenn Montag bleibt?", "s_es": {"type": "multiple_choice", "options": ["A short update session on Thursday", "A second lunch break", "A new supplier meeting"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine kurze Updatesitzung am Donnerstag", "Eine zweite Mittagspause", "Ein neues Lieferantentreffen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué problema tendría mover la formación al miércoles?", "de": "Welches Problem hätte eine Verschiebung auf Mittwoch?", "s_es": {"type": "multiple_choice", "options": ["The warehouse team is busiest then", "The manuals would be missing", "The room would be closed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Lagerteam ist dann am stärksten beschäftigt", "Die Handbücher würden fehlen", "Der Raum wäre geschlossen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué resumen hace la persona que dirige la reunión?", "de": "Welche Zusammenfassung macht die leitende Person?", "s_es": {"type": "multiple_choice", "options": ["One option gives better timing and the other better materials", "Both options are equally bad", "No option can work this week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Option bietet bessere Terminlage und die andere bessere Materialien", "Beide Optionen sind gleich schlecht", "Keine Option kann diese Woche funktionieren"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la decisión final?", "de": "Was ist die Endentscheidung?", "s_es": {"type": "multiple_choice", "options": ["Keep Monday and add a Thursday update", "Move everything to Wednesday", "Cancel the training"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Montag behalten und Donnerstag ein Update ergänzen", "Alles auf Mittwoch verschieben", "Die Schulung absagen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7600 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7600 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7600, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: A chair, Ravi, and Dana in a meeting about training plans
## "Monday or Wednesday?"

## THE SCENE: A work meeting where the team must choose the best day for a safety training session
Ravi argues for one day because of the materials.
Dana argues for the other because of team workload, and the chair asks for one short clarification.

### DIRECTOR'S NOTES
Style:
* Clear meeting discussion with simple arguments for two different options.
* One clarification moment keeps the exchange realistic without making it hard to follow.

Pace: Medium, with steady pauses before reasons, objections, and the final decision.

Accent: Neutral workplace accent.

### SAMPLE CONTEXT
Learners hear a short workplace discussion with reasons for and against two options.
The audio practises opinion, clarification, and summary language in meetings.

#### TRANSCRIPT
[opening] Chair: We need to decide if the safety training stays on Monday or moves to Wednesday.
[argument] Ravi: I prefer Wednesday because the new manuals arrive on Tuesday, and people can practise with the final version.
[concerned] Dana: I see that point, but Monday is better for the warehouse team because Wednesday is the delivery peak.
[clarifying] Chair: Sorry, Dana, do you mean the team is busiest on Wednesday morning?
[confirming] Dana: Yes, exactly. They can attend on Monday, but not on Wednesday morning.
[reasoning] Ravi: Then perhaps we keep Monday and send the manuals later.
[objecting] Dana: That would save time now, but it could confuse people.
[balancing] Chair: So one option gives better timing, and the other gives better materials.
[suggesting] Ravi: If we keep Monday, we can add a short update session on Thursday.
[concluding] Chair: Good. Let us keep Monday and add the Thursday update.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha una discusión con argumentos y una aclaración breve', 'Escucha cómo un equipo compara dos opciones, aclara un punto y toma una decisión final.'),
        (v_listening_id, 'de', 'Höre eine Diskussion mit Argumenten und kurzer Klärung', 'Höre, wie ein Team zwei Optionen vergleicht, einen Punkt klärt und eine Entscheidung trifft.');

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
