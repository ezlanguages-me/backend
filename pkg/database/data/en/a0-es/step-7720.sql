-- ============================================================
-- Seed: A0 English Path - STEP 7720 - Listening - follow a presentation with visuals (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Nora habla sobre señales para salas de estudio silenciosas.", "de": "Nora spricht über Schilder für ruhige Lernräume.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La foto de la diapositiva muestra tres puertas de biblioteca.", "de": "Das Foto auf der Folie zeigt drei Bibliothekstüren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Green significa busy.", "de": "Green bedeutet busy.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Cuarenta estudiantes usaron las salas en una semana.", "de": "Vierzig Studierende nutzten die Räume in einer Woche.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La gráfica muestra que los estudiantes encontraron una sala más despacio.", "de": "Das Diagramm zeigt, dass Studierende einen Raum langsamer fanden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El personal del mostrador respondió menos preguntas.", "de": "Das Personal am Schalter beantwortete weniger Fragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La idea ayuda a la gente en una biblioteca concurrida.", "de": "Die Idee hilft Menschen in einer belebten Bibliothek.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El mensaje principal es que una ayuda visual simple ahorra tiempo.", "de": "Die Hauptaussage ist, dass eine einfache visuelle Hilfe Zeit spart.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué se ve en la pantalla?", "de": "Was sieht man auf dem Bildschirm?", "s_es": {"type": "multiple_choice", "options": ["Una diapositiva sobre señales para salas de estudio", "Un mapa de paradas de autobús", "La factura de un hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Folie über Schilder für Lernräume", "Einen Plan von Bushaltestellen", "Eine Hotelrechnung"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué significa yellow?", "de": "Was bedeutet yellow?", "s_es": {"type": "multiple_choice", "options": ["Ocupada", "Abierta", "Vacía"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Besetzt", "Offen", "Leer"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos estudiantes usaron las salas?", "de": "Wie viele Studierende nutzten die Räume?", "s_es": {"type": "multiple_choice", "options": ["40", "14", "3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["40", "14", "3"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué muestra el resultado?", "de": "Was zeigt das Ergebnis?", "s_es": {"type": "multiple_choice", "options": ["Una gráfica de barras", "Una tarjeta de receta", "Un mapa del tiempo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Balkendiagramm", "Eine Rezeptkarte", "Eine Wetterkarte"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién respondió menos preguntas?", "de": "Wer beantwortete weniger Fragen?", "s_es": {"type": "multiple_choice", "options": ["El personal del mostrador", "Los conductores de autobús", "Los profesores"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Personal am Schalter", "Die Busfahrer", "Die Lehrkräfte"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde ayuda la idea a moverse mejor?", "de": "Wo hilft die Idee, sich besser zu bewegen?", "s_es": {"type": "multiple_choice", "options": ["En una biblioteca concurrida", "En un campo deportivo", "En una panadería"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In einer belebten Bibliothek", "Auf einem Sportfeld", "In einer Bäckerei"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué trata principalmente la diapositiva?", "de": "Worum geht es auf der Folie hauptsächlich?", "s_es": {"type": "multiple_choice", "options": ["De ayuda visual simple", "De formularios largos en papel", "De música nueva para la biblioteca"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Von einfacher visueller Hilfe", "Von langen Papierformularen", "Von neuer Musik für die Bibliothek"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué color significa full?", "de": "Welche Farbe bedeutet full?", "s_es": {"type": "multiple_choice", "options": ["Rojo", "Blanco", "Azul"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rot", "Weiß", "Blau"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7720 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7720 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7720, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Nora, a conference speaker, presenting to a small audience
## "Color Signs on the Screen"

## THE SCENE: A short conference talk with one clear slide and a simple chart
Nora stands at the front of a small room and explains what the audience can see on the screen.
She points to a photo, three colors, and one bar chart while she speaks.

### DIRECTOR'S NOTES
Style:
* Clear conference language with short sentences and repeated visual references.
* The speaker names each color and each number slowly for beginner listeners.

Pace: Slow and steady, with small pauses when the speaker points to the slide.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners follow the main meaning of a presentation when the talk is supported by visuals.
They listen for color words, numbers, and the main result on the slide.

#### TRANSCRIPT
[welcoming] Nora: Hello everyone. On the screen you can see our slide about quiet study room signs.
[pointing] Nora: The photo shows three library doors.
[clear] Nora: Green means open, yellow means busy, and red means full.
[steady] Nora: In one week, 40 students used the rooms in our test.
[explaining] Nora: The bar chart shows that students found a room faster after we added the color cards.
[practical] Nora: Staff at the desk answered fewer simple questions.
[calm] Nora: The idea is small, but it helps people move in a busy library.
[closing] Nora: So the main message of this slide is simple visual help saves time.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Seguir una presentación con apoyo visual', 'Escucha una presentación breve de conferencia que explica una diapositiva con colores, foto y gráfico.'),
        (v_listening_id, 'de', 'Einer Präsentation mit visueller Hilfe folgen', 'Höre eine kurze Konferenzpräsentation, die eine Folie mit Farben, Foto und Diagramm erklärt.');

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
