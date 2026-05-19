-- ============================================================
-- Seed: A0 English Path - STEP 7730 - Dialogue - discuss visual presentation content (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Ana", "text": "Did you see the slide with the three colors?", "es": "¿Viste la diapositiva con los tres colores?", "de": "Hast du die Folie mit den drei Farben gesehen?"}'::jsonb,
        '{"character": "Ben", "text": "Yes. Green was open, yellow was busy, and red was full.", "es": "Sí. Green era abierta, yellow era ocupada y red era llena.", "de": "Ja. Green war offen, yellow war besetzt und red war voll."}'::jsonb,
        '{"character": "Ana", "text": "I liked the photo of the library doors.", "es": "Me gustó la foto de las puertas de la biblioteca.", "de": "Mir gefiel das Foto der Bibliothekstüren."}'::jsonb,
        '{"character": "Ben", "text": "Me too. The chart with 40 students was easy to read.", "es": "A mí también. La gráfica con 40 estudiantes era fácil de leer.", "de": "Mir auch. Das Diagramm mit 40 Studierenden war leicht zu lesen."}'::jsonb,
        '{"character": "Ana", "text": "The speaker said students found a room faster.", "es": "La ponente dijo que los estudiantes encontraron una sala más rápido.", "de": "Die Sprecherin sagte, dass die Studierenden schneller einen Raum fanden."}'::jsonb,
        '{"character": "Ben", "text": "Yes, and the desk staff had fewer questions.", "es": "Sí, y el personal del mostrador tuvo menos preguntas.", "de": "Ja, und das Personal am Schalter hatte weniger Fragen."}'::jsonb,
        '{"character": "Ana", "text": "My favorite part was the red card for full rooms.", "es": "Mi parte favorita fue la tarjeta roja para las salas llenas.", "de": "Mein Lieblingsteil war die rote Karte für volle Räume."}'::jsonb,
        '{"character": "Ben", "text": "I also liked that the slide had very little text.", "es": "También me gustó que la diapositiva tuviera muy poco texto.", "de": "Mir gefiel auch, dass die Folie sehr wenig Text hatte."}'::jsonb,
        '{"character": "Ana", "text": "Do you think schools can use the same idea?", "es": "¿Crees que las escuelas pueden usar la misma idea?", "de": "Glaubst du, dass Schulen dieselbe Idee nutzen können?"}'::jsonb,
        '{"character": "Ben", "text": "Yes. It is simple and cheap.", "es": "Sí. Es simple y barata.", "de": "Ja. Sie ist einfach und günstig."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Hablan de una diapositiva con tres colores.", "de": "Sie sprechen über eine Folie mit drei Farben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ben dice que la gráfica con 40 estudiantes era fácil de leer.", "de": "Ben sagt, dass das Diagramm mit 40 Studierenden leicht zu lesen war.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ana dice que la diapositiva tenía demasiado texto.", "de": "Ana sagt, dass die Folie zu viel Text hatte.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Dicen que el personal del mostrador tuvo menos preguntas.", "de": "Sie sagen, dass das Personal am Schalter weniger Fragen hatte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Piensan que la idea es simple y barata.", "de": "Sie denken, dass die Idee einfach und günstig ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué parte le gustó a Ana?", "de": "Welcher Teil gefiel Ana?", "s_es": {"type": "multiple_choice", "options": ["La foto de las puertas de la biblioteca", "El vídeo largo", "La mesa del café"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Foto der Bibliothekstüren", "Das lange Video", "Der Kaffeetisch"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué número era fácil de leer en la gráfica?", "de": "Welche Zahl war im Diagramm leicht zu lesen?", "s_es": {"type": "multiple_choice", "options": ["40 estudiantes", "90 profesores", "2 autobuses"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["40 Studierende", "90 Lehrkräfte", "2 Busse"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué encontraron más rápido los estudiantes?", "de": "Was fanden die Studierenden schneller?", "s_es": {"type": "multiple_choice", "options": ["Una sala", "Un taxi", "Una cafetería"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Raum", "Ein Taxi", "Ein Café"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué le gustó a Ben sobre el texto de la diapositiva?", "de": "Was gefiel Ben am Text der Folie?", "s_es": {"type": "multiple_choice", "options": ["Era muy corto", "Era muy largo", "Era solo rojo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er war sehr kurz", "Er war sehr lang", "Er war nur rot"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué creen que pueden hacer las escuelas?", "de": "Was glauben sie, können Schulen tun?", "s_es": {"type": "multiple_choice", "options": ["Usar la misma idea", "Cerrar la biblioteca", "Comprar sillas nuevas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dieselbe Idee nutzen", "Die Bibliothek schließen", "Neue Stühle kaufen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7730 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7730 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7730, 'en', 'dialogue', 'meetings', '[{"name": "Ana", "gender": "female", "avatarURL": "https://example.com/avatars/ana.png"}, {"name": "Ben", "gender": "male", "avatarURL": "https://example.com/avatars/ben.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Hablar sobre el contenido visual de una presentación', 'Lee una conversación entre dos asistentes que comentan una diapositiva de conferencia.'),
        (v_dialogue_id, 'de', 'Über den visuellen Inhalt einer Präsentation sprechen', 'Lies ein Gespräch zwischen zwei Teilnehmenden, die eine Konferenzfolie besprechen.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
