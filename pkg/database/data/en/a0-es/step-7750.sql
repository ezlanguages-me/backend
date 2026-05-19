-- ============================================================
-- Seed: A0 English Path - STEP 7750 - Reading - understand a speaker''s notes (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Las notas son para una charla en el Green Forum.", "de": "Die Notizen sind für einen Vortrag beim Green Forum.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La diapositiva muestra un icono azul de vaso y un mapa del recinto.", "de": "Die Folie zeigt ein blaues Bechersymbol und eine Hallenkarte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay 4 puntos de devolución en el recinto.", "de": "Es gibt 4 Rückgabestellen in der Halle.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los vasos son de un solo uso.", "de": "Die Becher sind nur für einen Gebrauch.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los visitantes pagan 1 euro y luego lo recuperan.", "de": "Die Besucher zahlen 1 Euro und bekommen ihn später zurück.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El equipo lavó 30 vasos el primer día.", "de": "Das Team wusch am ersten Tag 30 Becher.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El ponente debe señalar la zona del café en el mapa.", "de": "Der Sprecher soll auf den Cafébereich auf der Karte zeigen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El cierre dice More trash, cleaner hall.", "de": "Der Schluss sagt More trash, cleaner hall.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué debe mostrar el ponente al empezar?", "de": "Was soll der Sprecher am Anfang zeigen?", "s_es": {"type": "multiple_choice", "options": ["Un icono azul de vaso y un mapa del recinto", "Un billete de tren", "Una habitación de hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein blaues Bechersymbol und eine Hallenkarte", "Eine Zugfahrkarte", "Ein Hotelzimmer"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos puntos de devolución hay?", "de": "Wie viele Rückgabestellen gibt es?", "s_es": {"type": "multiple_choice", "options": ["4", "2", "14"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["4", "2", "14"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué color son los vasos?", "de": "Welche Farbe haben die Becher?", "s_es": {"type": "multiple_choice", "options": ["Verdes", "Rojos", "Negros"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Grün", "Rot", "Schwarz"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué recuperan los visitantes?", "de": "Was bekommen die Besucher zurück?", "s_es": {"type": "multiple_choice", "options": ["1 euro", "Un cuaderno", "Una acreditación"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["1 Euro", "Ein Notizbuch", "Ein Namensschild"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos vasos lavó el equipo el primer día?", "de": "Wie viele Becher wusch das Team am ersten Tag?", "s_es": {"type": "multiple_choice", "options": ["300", "30", "13"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["300", "30", "13"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué zona debe señalar el ponente en el mapa?", "de": "Auf welchen Bereich soll der Sprecher auf der Karte zeigen?", "s_es": {"type": "multiple_choice", "options": ["La zona del café", "La parada de autobús", "El tejado"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Cafébereich", "Die Bushaltestelle", "Das Dach"], "answer": 0}}'::jsonb,
        '{"es": "¿Después de qué número debe hacer una pausa?", "de": "Nach welcher Zahl soll er eine Pause machen?", "s_es": {"type": "multiple_choice", "options": ["4", "8", "20"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["4", "8", "20"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de pregunta pide al final?", "de": "Welche Art von Frage bittet er am Ende?", "s_es": {"type": "multiple_choice", "options": ["Una pregunta factual", "Una petición de canción", "Un concurso de deporte"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Sachfrage", "Einen Musikwunsch", "Ein Sportquiz"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7750 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7750 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7750, 'en', 'reading', 'meetings', 'Speaker Notes - Session 2
Talk: Cup Return Points at the Green Forum\n\nOpen:
- Smile and say welcome
- Show slide with blue cup icon and hall map\n\nKey facts:
- 4 return points in the hall
- Cups are green and reusable
- Visitors pay 1 euro and get it back
- Team washed 300 cups on day one\n\nVisual reminders:
- Point to the café area on the map
- Circle the main door
- Pause after the number 4\n\nClose:
- Say: Less trash, cleaner hall
- Ask for one factual question')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Entender las notas de un ponente', 'Lee unas notas breves para una presentación de conferencia sobre vasos reutilizables.'),
        (v_reading_id, 'de', 'Notizen eines Vortragenden verstehen', 'Lies kurze Notizen für eine Konferenzpräsentation über Mehrwegbecher.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
