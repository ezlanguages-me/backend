-- ============================================================
-- Seed: A0 English Path – STEP 4510 – Reading – understand correspondence expressed in non-standard language (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El memorando es de Dave de Facilities.", "p_de": "Das Memo ist von Dave aus der Haustechnik.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La calefacción estará apagada el jueves.", "p_de": "Die Heizung wird am Donnerstag ausgeschaltet sein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Las reparaciones son en la planta 3.", "p_de": "Die Reparaturen sind auf Etage 3.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La cocina de la planta 2 está cerrada.", "p_de": "Die Küche auf Etage 2 ist geschlossen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El personal debe llevar algo de abrigo.", "p_de": "Die Mitarbeitenden sollen etwas Warmes mitbringen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Las máquinas expendedoras no funcionan.", "p_de": "Die Verkaufsautomaten funktionieren nicht.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Todo volverá a la normalidad el viernes.", "p_de": "Am Freitag wird alles wieder normal sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El memorando trata sobre una prueba de alarma de incendios.", "p_de": "In dem Memo geht es um einen Feueralarmtest.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Quién envió el memorando?", "p_de": "Wer hat das Memo geschickt?", "s_es": {"type": "multiple_choice", "options": ["Dave de Facilities", "Sarah de RR. HH.", "El gerente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dave aus der Haustechnik", "Sarah aus der Personalabteilung", "Der Manager"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué sistema estará apagado el jueves?", "p_de": "Welches System wird am Donnerstag ausgeschaltet sein?", "s_es": {"type": "multiple_choice", "options": ["El aire acondicionado", "La calefacción", "Internet"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Klimaanlage", "Die Heizung", "Das Internet"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué planta tiene la reparación?", "p_de": "Welche Etage ist von der Reparatur betroffen?", "s_es": {"type": "multiple_choice", "options": ["La planta 3", "La planta 2", "La planta 1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Etage 3", "Etage 2", "Etage 1"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué debe llevar el personal?", "p_de": "Was sollen die Mitarbeitenden mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Algo de abrigo", "Una linterna", "Un casco"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Etwas Warmes", "Eine Taschenlampe", "Einen Helm"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué está abierto en la planta 2?", "p_de": "Was ist auf Etage 2 geöffnet?", "s_es": {"type": "multiple_choice", "options": ["La cocina", "El gimnasio", "El aparcamiento"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Küche", "Das Fitnessstudio", "Der Parkplatz"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuándo volverá todo a la normalidad?", "p_de": "Wann wird alles wieder normal sein?", "s_es": {"type": "multiple_choice", "options": ["El viernes", "El sábado", "La próxima semana"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Freitag", "Am Samstag", "Nächste Woche"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué funciona bien?", "p_de": "Was funktioniert einwandfrei?", "s_es": {"type": "multiple_choice", "options": ["Las máquinas expendedoras", "Los ascensores", "Las impresoras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Verkaufsautomaten", "Die Aufzüge", "Die Drucker"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué tipo de texto es este?", "p_de": "Was für eine Art Text ist das?", "s_es": {"type": "multiple_choice", "options": ["Un memorando informal para el personal", "Un aviso legal formal", "Una confirmación de entrega"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein informelles Mitarbeitermemo", "Eine formelle rechtliche Mitteilung", "Eine Lieferbestätigung"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4510
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4510
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4510, 'en', 'reading', 'professional', $content$Hi everyone,

Quick note from Dave in Facilities. The air conditioning on floor 3 will be off all day on Thursday while the repair team works on the system. The problem should only affect that floor, but it may feel cooler than usual in the morning, so please bring something warm if you are based there.

The good news is that the kitchen on floor 2 will stay open, so you can still make tea or heat lunch as normal. The vending machines are also working fine, so drinks and snacks are available. We expect everything to be back to normal on Friday once the repairs are finished and tested.

Thanks for your patience,
Dave
Facilities$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Comprende un memorando informal', 'Lee un memorando interno informal sobre reparaciones y servicios disponibles en la oficina.'),
            (v_reading_id, 'de', 'Verstehe ein informelles Memo', 'Lies ein informelles internes Memo über Reparaturen und verfügbare Dienste im Büro.');

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
