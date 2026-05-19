-- ============================================================
-- Seed: A0 English Path – STEP 4630 – Reading – understand basic, factual information within own work area, for example from plans and diagrams (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El plano es de la planta 2 del edificio A.", "p_de": "Der Plan zeigt Etage 2 von Gebäude A.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La recepción tiene capacidad para 8 escritorios.", "p_de": "Der Empfang hat Platz für 8 Schreibtische.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La oficina diáfana tiene 18 escritorios.", "p_de": "Das Großraumbüro hat 18 Schreibtische.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La sala de reuniones A tiene proyector y pizarra.", "p_de": "Besprechungsraum A hat einen Projektor und ein Whiteboard.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La sala de reuniones B tiene proyector.", "p_de": "Besprechungsraum B hat einen Projektor.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "En la cocina hay una nevera.", "p_de": "In der Küche gibt es einen Kühlschrank.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La salida de incendios está cerca de recepción.", "p_de": "Der Notausgang ist in der Nähe des Empfangs.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El ascensor está cerca de recepción.", "p_de": "Der Aufzug ist in der Nähe des Empfangs.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "¿Cuántos escritorios hay en la oficina diáfana?", "p_de": "Wie viele Schreibtische gibt es im Großraumbüro?", "s_es": {"type": "multiple_choice", "options": ["18", "12", "24"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["18", "12", "24"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántas personas caben en la sala A?", "p_de": "Wie viele Personen passen in Raum A?", "s_es": {"type": "multiple_choice", "options": ["8", "4", "12"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8", "4", "12"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué tiene la sala de reuniones B?", "p_de": "Was gibt es in Besprechungsraum B?", "s_es": {"type": "multiple_choice", "options": ["Una pantalla de televisión", "Un proyector", "Una pizarra"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Fernsehbildschirm", "Einen Projektor", "Ein Whiteboard"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué hay en la cocina?", "p_de": "Was gibt es in der Küche?", "s_es": {"type": "multiple_choice", "options": ["Microondas, nevera y hervidor", "Impresora, escáner y copiadora", "Solo una cafetera"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mikrowelle, Kühlschrank und Wasserkocher", "Drucker, Scanner und Kopierer", "Nur eine Kaffeemaschine"], "answer": 0}}'::jsonb,
            '{"p": "¿Dónde está la salida de incendios?", "p_de": "Wo befindet sich der Notausgang?", "s_es": {"type": "multiple_choice", "options": ["Al final del pasillo principal", "Cerca de recepción", "Cerca de la cocina"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Ende des Hauptflurs", "In der Nähe des Empfangs", "In der Nähe der Küche"], "answer": 0}}'::jsonb,
            '{"p": "¿Dónde están las escaleras?", "p_de": "Wo sind die Treppen?", "s_es": {"type": "multiple_choice", "options": ["Cerca de la cocina", "Cerca de recepción", "Cerca de la sala A"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In der Nähe der Küche", "In der Nähe des Empfangs", "In der Nähe von Raum A"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué tipo de sala es la habitación 2?", "p_de": "Was für ein Raum ist Zimmer 2?", "s_es": {"type": "multiple_choice", "options": ["Oficina diáfana", "Despacho del gerente", "Sala de reuniones"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Großraumbüro", "Büro des Managers", "Besprechungsraum"], "answer": 0}}'::jsonb,
            '{"p": "¿Quién usa la habitación 6?", "p_de": "Wer nutzt Zimmer 6?", "s_es": {"type": "multiple_choice", "options": ["El gerente", "La recepcionista", "Los visitantes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Manager", "Die Empfangskraft", "Die Besucher"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4630
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4630
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4630, 'en', 'reading', 'professional', $content$Office Floor Plan – Floor 2, Building A

Floor 2 of Building A is organised into six main spaces. Room 1 is Reception and has capacity for 4 desks. Room 2 is the open plan office, which is the largest area on the floor and holds 18 desks for general staff. Room 3 is Meeting Room A. It has space for 8 people and is equipped with both a projector and a whiteboard. Room 4 is Meeting Room B, a smaller room for 4 people with a TV screen.

Room 5 is the kitchen and includes a microwave, fridge and kettle for staff use. Room 6 is the manager’s private office and contains 1 desk. The fire exit is located at the end of the main corridor. The lift is near reception, while the stairs are positioned close to the kitchen.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un plano de planta de oficina', 'Lee un plano de oficinas con salas, equipamiento y salidas.'),
            (v_reading_id, 'de', 'Lies einen Bürogrundriss', 'Lies einen Bürogrundriss mit Räumen, Ausstattung und Ausgängen.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_reading_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
