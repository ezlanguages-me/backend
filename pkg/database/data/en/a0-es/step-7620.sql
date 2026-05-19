-- ============================================================
-- Seed: A0 English Path – STEP 7620 – Listening – listen to structured argument in discussion (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Leila propone usar un panel compartido para todas las acciones de reunión.", "de": "Leila schlägt vor, ein gemeinsames Dashboard für alle Besprechungsaktionen zu nutzen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Su primer motivo es que los plazos se ven para todo el mundo.", "de": "Ihr erster Grund ist, dass alle die Fristen sehen können.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El segundo motivo es crear más listas separadas en correo y chat.", "de": "Der zweite Grund ist, mehr getrennte Listen in Mail und Chat zu schaffen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El tercer motivo es que las personas nuevas pueden ver decisiones antiguas en un solo lugar.", "de": "Der dritte Grund ist, dass neue Personen alte Entscheidungen an einem Ort sehen können.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Martin resume que el punto principal es la claridad para todo el equipo.", "de": "Martin fasst zusammen, dass der Hauptpunkt Klarheit für das ganze Team ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Una preocupación es que actualizar el panel pueda llevar tiempo extra.", "de": "Eine Sorge ist, dass das Aktualisieren des Dashboards zusätzliche Zeit kosten könnte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Leila responde que una actualización rápida ahorra muchas preguntas después.", "de": "Leila antwortet, dass ein kurzes Update später viele Fragen spart.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Al final acuerdan probar el panel compartido durante dos semanas.", "de": "Am Ende vereinbaren sie, das gemeinsame Dashboard zwei Wochen lang zu testen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué propone Leila?", "de": "Was schlägt Leila vor?", "s_es": {"type": "multiple_choice", "options": ["One shared dashboard for all meeting actions", "A new travel policy", "A larger meeting room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein gemeinsames Dashboard für alle Besprechungsaktionen", "Eine neue Reiserichtlinie", "Einen größeren Besprechungsraum"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace visible el primer motivo?", "de": "Was macht der erste Grund sichtbar?", "s_es": {"type": "multiple_choice", "options": ["Deadlines for everyone", "Only lunch orders", "Private notes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fristen für alle", "Nur Mittagsbestellungen", "Private Notizen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué reduce el segundo motivo?", "de": "Was reduziert der zweite Grund?", "s_es": {"type": "multiple_choice", "options": ["Duplicate lists in email and chat", "Meeting chairs", "Project budgets"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Doppelte Listen in Mail und Chat", "Besprechungsleitungen", "Projektbudgets"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pueden ver las personas nuevas?", "de": "Was können neue Personen sehen?", "s_es": {"type": "multiple_choice", "options": ["Old decisions in one place", "The office keys", "Only the lunch menu"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alte Entscheidungen an einem Ort", "Die Büroschlüssel", "Nur das Mittagsmenü"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo resume Martin el argumento principal?", "de": "Wie fasst Martin das Hauptargument zusammen?", "s_es": {"type": "multiple_choice", "options": ["Clarity for the whole team", "Lower rent costs", "Longer meetings"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Klarheit für das ganze Team", "Niedrigere Mietkosten", "Längere Treffen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué preocupación menciona Martin?", "de": "Welche Sorge nennt Martin?", "s_es": {"type": "multiple_choice", "options": ["Updating the dashboard takes extra time", "The screen is broken", "No one likes charts"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Aktualisieren des Dashboards kostet extra Zeit", "Der Bildschirm ist kaputt", "Niemand mag Diagramme"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué respuesta da Leila?", "de": "Welche Antwort gibt Leila?", "s_es": {"type": "multiple_choice", "options": ["One quick update saves many later questions", "The dashboard updates itself", "The task can wait until next year"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein kurzes Update spart später viele Fragen", "Das Dashboard aktualisiert sich selbst", "Die Aufgabe kann bis nächstes Jahr warten"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué decisión toman al final?", "de": "Welche Entscheidung treffen sie am Ende?", "s_es": {"type": "multiple_choice", "options": ["Test the shared dashboard for two weeks", "Remove all action lists", "Buy new laptops"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das gemeinsame Dashboard zwei Wochen testen", "Alle Aktionslisten entfernen", "Neue Laptops kaufen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7620 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7620 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7620, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Leila and Martin in a project discussion about meeting follow up
## "One Dashboard for All Actions"

## THE SCENE: A structured work discussion where one colleague presents a clear case for a new process
Leila gives her opinion in three clear parts.
Martin listens, checks the main idea, raises one concern, and helps move the discussion to a trial decision.

### DIRECTOR'S NOTES
Style:
* Organised argument with signposted reasons that are easy to follow.
* Calm response to one concern shows how structured discussion sounds in a meeting.

Pace: Medium and steady, with slight pauses before each numbered reason.

Accent: Neutral professional accent.

### SAMPLE CONTEXT
Learners hear a structured argument inside a workplace discussion.
The audio practises reasons, summary, concern, reply, and a short trial agreement.

#### TRANSCRIPT
[organised] Leila: I think we should use one shared dashboard for all meeting actions.
[structured] Leila: First, one dashboard makes deadlines visible to everyone.
[structured] Leila: Second, it reduces duplicate lists in email and chat.
[structured] Leila: Third, new team members can see old decisions in one place.
[checking] Martin: So your main point is clarity for the whole team?
[confirming] Leila: Yes, clarity and less repeated work.
[concerned] Martin: Some people worry that updating the dashboard takes extra time.
[replying] Leila: That is true at first, but one quick update saves many later questions.
[practical] Martin: If we try it, we need a simple template.
[closing] Leila: Agreed. Let us test the shared dashboard for two weeks.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha un argumento estructurado en una discusión', 'Escucha una propuesta con razones ordenadas, una objeción breve y una decisión de prueba.'),
        (v_listening_id, 'de', 'Höre ein strukturiertes Argument in einer Diskussion', 'Höre einen Vorschlag mit geordneten Gründen, einem kurzen Einwand und einer Testentscheidung.');

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
