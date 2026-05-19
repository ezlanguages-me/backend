-- ============================================================
-- Seed: A0 English Path - STEP 7760 - Listening - follow a speech with notes (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Sara dice que sus notas tienen tres datos clave.", "de": "Sara sagt, dass ihre Notizen drei Schlüsselfakten haben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El recinto tiene cuatro puntos de devolución de vasos.", "de": "Die Halle hat vier Becherrückgabestellen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los puntos azules del mapa muestran los aseos.", "de": "Die blauen Punkte auf der Karte zeigen die Toiletten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los vasos son verdes y reutilizables.", "de": "Die Becher sind grün und wiederverwendbar.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los visitantes pagan un euro y no lo recuperan.", "de": "Die Besucher zahlen einen Euro und bekommen ihn nicht zurück.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El equipo lavó 300 vasos el primer día.", "de": "Das Team wusch am ersten Tag 300 Becher.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El sistema significa menos basura y un recinto más limpio.", "de": "Das System bedeutet weniger Müll und eine sauberere Halle.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Sara tomará una pregunta factual al final.", "de": "Sara nimmt am Ende eine Sachfrage an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué muestran los puntos azules?", "de": "Was zeigen die blauen Punkte?", "s_es": {"type": "multiple_choice", "options": ["Los puntos de devolución de vasos", "Las paradas de taxi", "Los números de mesa"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Becherrückgabestellen", "Die Taxistände", "Die Tischnummern"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos puntos de devolución hay?", "de": "Wie viele Rückgabestellen gibt es?", "s_es": {"type": "multiple_choice", "options": ["Cuatro", "Uno", "Diez"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vier", "Einen", "Zehn"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué color son los vasos?", "de": "Welche Farbe haben die Becher?", "s_es": {"type": "multiple_choice", "options": ["Verdes", "Morados", "Plateados"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Grün", "Lila", "Silbern"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto dinero recuperan los visitantes?", "de": "Wie viel Geld bekommen die Besucher zurück?", "s_es": {"type": "multiple_choice", "options": ["Un euro", "Cinco euros", "Nada"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Euro", "Fünf Euro", "Nichts"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos vasos lavó el equipo el primer día?", "de": "Wie viele Becher wusch das Team am ersten Tag?", "s_es": {"type": "multiple_choice", "options": ["300", "30", "3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["300", "30", "3"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué significa el sistema?", "de": "Was bedeutet das System?", "s_es": {"type": "multiple_choice", "options": ["Menos basura", "Más papel", "Pausas más largas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weniger Müll", "Mehr Papier", "Längere Pausen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo tomará Sara una pregunta?", "de": "Wann nimmt Sara eine Frage?", "s_es": {"type": "multiple_choice", "options": ["Al final", "Al principio", "Nunca"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Ende", "Am Anfang", "Nie"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de pregunta aceptará?", "de": "Welche Art von Frage nimmt sie an?", "s_es": {"type": "multiple_choice", "options": ["Una pregunta factual", "Una pregunta de música", "Una pregunta privada"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Sachfrage", "Eine Musikfrage", "Eine private Frage"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7760 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7760 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7760, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Sara, a conference speaker, using printed notes at a green event
## "Cup Return Points"

## THE SCENE: A short speech with a note card and one map on the screen
Sara gives a simple conference speech and looks down at her notes between key facts.
She uses the map on the slide to support what she says.

### DIRECTOR'S NOTES
Style:
* Spoken from clear notes, with facts in a fixed order and short pauses.
* Important numbers are repeated once so learners can follow the speech easily.

Pace: Slow, careful, and slightly formal, like a speaker checking notes.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners follow a short speech that is guided by speaker notes and a map.
They listen for location, color, money, and one key result number.

#### TRANSCRIPT
[welcoming] Sara: Welcome. My notes are simple, so I will give three key facts.
[pointing] Sara: First, our hall has four cup return points. You can see them as blue dots on the map.
[clear] Sara: Second, the cups are green and reusable.
[steady] Sara: Visitors pay one euro, and they get it back when they return the cup.
[explaining] Sara: On day one, our team washed 300 cups.
[helpful] Sara: This means less trash and a cleaner hall.
[closing] Sara: At the end, I will take one factual question.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Seguir un discurso con notas', 'Escucha a una ponente que usa notas simples para explicar un sistema de vasos reutilizables.'),
        (v_listening_id, 'de', 'Einer Rede mit Notizen folgen', 'Höre einer Sprecherin zu, die mit einfachen Notizen ein Mehrwegbechersystem erklärt.');

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
