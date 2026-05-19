-- ============================================================
-- Seed: A0 English Path - STEP 7820 - Listening - follow Q&A exchange (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El moderador pide dos preguntas cortas.", "de": "Der Moderator bittet um zwei kurze Fragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Omar pregunta dónde están los puntos de devolución.", "de": "Omar fragt, wo die Rückgabestellen sind.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Sara dice que los puntos están solo junto al escenario.", "de": "Sara sagt, dass die Stellen nur neben der Bühne sind.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los visitantes recuperan un euro.", "de": "Die Besucher bekommen einen Euro zurück.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El equipo lavó 300 vasos el primer día.", "de": "Das Team wusch am ersten Tag 300 Becher.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Lina pregunta por libros.", "de": "Lina fragt nach Büchern.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Todos los vasos reutilizables son verdes.", "de": "Alle wiederverwendbaren Becher sind grün.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El moderador dice que pueden pasar a la siguiente charla.", "de": "Der Moderator sagt, dass sie zum nächsten Vortrag gehen können.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Quién pregunta por los puntos de devolución?", "de": "Wer fragt nach den Rückgabestellen?", "s_es": {"type": "multiple_choice", "options": ["Omar", "Lina", "Sara"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Omar", "Lina", "Sara"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está uno de los puntos de devolución?", "de": "Wo ist eine der Rückgabestellen?", "s_es": {"type": "multiple_choice", "options": ["Junto al café", "En el tejado", "En el aparcamiento"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Beim Café", "Auf dem Dach", "Auf dem Parkplatz"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto dinero se devuelve?", "de": "Wie viel Geld wird zurückgegeben?", "s_es": {"type": "multiple_choice", "options": ["Un euro", "Dos euros", "Nada"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Euro", "Zwei Euro", "Nichts"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos vasos lavó el equipo?", "de": "Wie viele Becher wusch das Team?", "s_es": {"type": "multiple_choice", "options": ["300", "30", "3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["300", "30", "3"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué color son los vasos?", "de": "Welche Farbe haben die Becher?", "s_es": {"type": "multiple_choice", "options": ["Verdes", "Naranjas", "Negros"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Grün", "Orange", "Schwarz"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién pregunta por los vasos del primer día?", "de": "Wer fragt nach den Bechern vom ersten Tag?", "s_es": {"type": "multiple_choice", "options": ["Lina", "Omar", "El moderador"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lina", "Omar", "Der Moderator"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pasa después de las respuestas?", "de": "Was passiert nach den Antworten?", "s_es": {"type": "multiple_choice", "options": ["Pasan a la siguiente charla", "Cantan una canción", "Cierran el recinto"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie gehen zum nächsten Vortrag", "Sie singen ein Lied", "Sie schließen die Halle"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de preguntas hay?", "de": "Welche Art von Fragen gibt es?", "s_es": {"type": "multiple_choice", "options": ["Preguntas cortas", "Exámenes de matemáticas", "Llamadas privadas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kurze Fragen", "Matheprüfungen", "Private Anrufe"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7820 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7820 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7820, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: A moderator, two audience members, and a speaker after a conference talk
## "Questions About the Cup System"

## THE SCENE: A short Q&A after a practical presentation
The audience asks direct factual questions about a reusable cup system.
The speaker answers with locations, money, numbers, and color details.

### DIRECTOR'S NOTES
Style:
* Direct Q&A turns with one clear fact in each answer.
* Places and numbers are easy to hear because the speaker pauses between items.

Pace: Slow and organized, like a moderator-led conference session.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners follow a factual exchange after a presentation and identify simple key details.
The questions focus on where, how much, how many, and what color.

#### TRANSCRIPT
[moderator] Moderator: Two short questions, please.
[attentive] Omar: Where are the cup return points?
[clear] Sara: They are near the café, the main door, the stairs, and Hall B.
[curious] Omar: How much money do visitors get back?
[steady] Sara: They get one euro back.
[interested] Lina: How many cups did your team wash on day one?
[clear] Sara: We washed 300 cups on day one.
[checking] Lina: Are all the cups green?
[confirming] Sara: Yes, all the reusable cups are green.
[closing] Moderator: Thank you. We can move to the next talk.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Seguir un intercambio de preguntas y respuestas', 'Escucha un breve turno de preguntas y respuestas con datos concretos sobre un proyecto.'),
        (v_listening_id, 'de', 'Einem Frage-Antwort-Austausch folgen', 'Höre eine kurze Fragerunde mit konkreten Informationen zu einem Projekt.');

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
