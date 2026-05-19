-- ============================================================
-- Seed: A0 English Path – STEP 5320 – Listening – follow feedback session (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La tutora dice que la introducción es clara.", "p_de": "Die Tutorin sagt, dass die Einleitung klar ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El ejemplo de Madrid funciona bien.", "p_de": "Das Beispiel aus Madrid funktioniert gut.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El párrafo sobre el coste necesita menos detalle.", "p_de": "Der Absatz über Kosten braucht weniger Details.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay algunos errores de tiempo verbal en el segundo párrafo.", "p_de": "Es gibt einige Zeitfehler im zweiten Absatz.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una cita necesita número de página.", "p_de": "Ein Zitat braucht eine Seitenzahl.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tutora pide acortar la conclusión.", "p_de": "Die Tutorin bittet darum, den Schluss zu kürzen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La nueva versión debe estar lista antes del viernes.", "p_de": "Die neue Version soll vor Freitag fertig sein.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se ofrece revisar el nuevo borrador el miércoles.", "p_de": "Es wird angeboten, den neuen Entwurf am Mittwoch anzuschauen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué parte valora la tutora al principio?", "p_de": "Welchen Teil lobt die Tutorin zuerst?", "s": {"type": "multiple_choice", "options": ["The introduction", "The bibliography", "The title page"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ejemplo menciona como bueno?", "p_de": "Welches Beispiel nennt sie als gut?", "s": {"type": "multiple_choice", "options": ["The one from Madrid", "The one from a hotel", "The one from the bus schedule"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué necesita el párrafo sobre el coste?", "p_de": "Was braucht der Absatz über Kosten?", "s": {"type": "multiple_choice", "options": ["More detail and one more source", "A new photo", "No changes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema lingüístico encuentra?", "p_de": "Welches Sprachproblem findet sie?", "s": {"type": "multiple_choice", "options": ["Some tense mistakes", "No English words", "Too many questions"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué necesita una cita?", "p_de": "Was braucht ein Zitat?", "s": {"type": "multiple_choice", "options": ["A page number", "A parking pass", "A new speaker"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer el estudiante con la conclusión?", "p_de": "Was soll der Studierende mit dem Schluss machen?", "s": {"type": "multiple_choice", "options": ["Expand it a little", "Delete it completely", "Translate it into German"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo puede revisar la tutora el nuevo borrador?", "p_de": "Wann kann die Tutorin den neuen Entwurf prüfen?", "s": {"type": "multiple_choice", "options": ["On Wednesday", "On Sunday", "Next month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["A feedback session", "A conference opening", "A phone complaint"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5320 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5320 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5320, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Tutor and student
## THE SCENE: A short feedback meeting after an essay submission
A tutor explains the strengths of a student essay and the main points for revision.

### DIRECTOR'S NOTES
Style:
* Calm academic feedback with direct but supportive language.
* The tutor groups comments into strengths, problems, and next step.

Pace: Slow and supportive.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following spoken academic feedback on structure, language, and revision tasks.

#### TRANSCRIPT
[supportive] Tutor: Your introduction is clear, and the example from Madrid works very well.
[focused] Tutor: The paragraph on cost needs more detail and one more source.
[careful] Tutor: I also found a few tense mistakes in the second paragraph.
[practical] Tutor: One citation needs a page number.
[guiding] Tutor: Please expand the conclusion a little before Friday.
[friendly] Tutor: If you want, we can look at the new draft together on Wednesday.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Sesión de feedback sobre un ensayo', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Feedbackgespräch über einen Aufsatz', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
