-- ============================================================
-- Seed: A0 English Path – STEP 4640 – Reading – understand the general meaning of a theoretical article within own work area (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La ergonomía es la ciencia de diseñar el entorno para que se adapte al trabajador.", "p_de": "Ergonomie ist die Wissenschaft, die Arbeitsumgebung an den Menschen anzupassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La mala ergonomía solo provoca dolores de cabeza.", "p_de": "Schlechte Ergonomie verursacht nur Kopfschmerzen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Las pantallas deben mantenerse a la altura de los ojos.", "p_de": "Bildschirme sollten auf Augenhöhe sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los trabajadores deben hacer pausas cada 30 minutos.", "p_de": "Mitarbeitende sollten alle 30 Minuten Pausen machen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Los trastornos musculoesqueléticos representan el 30 % de los problemas de salud laboral.", "p_de": "Muskel-Skelett-Erkrankungen machen 30 % der arbeitsbedingten Gesundheitsprobleme aus.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La inversión ergonómica puede reducir las ausencias hasta un 25 %.", "p_de": "Ergonomische Investitionen können Fehlzeiten um bis zu 25 % senken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El dolor de espalda se menciona como un problema musculoesquelético.", "p_de": "Rückenschmerzen werden als Muskel-Skelett-Problem genannt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El artículo dice que la ergonomía no es importante para la productividad.", "p_de": "Der Artikel sagt, Ergonomie sei nicht wichtig für die Produktivität.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Qué es la ergonomía?", "p_de": "Was ist Ergonomie?", "s_es": {"type": "multiple_choice", "options": ["La ciencia de diseñar el entorno para adaptarlo al trabajador", "El estudio del mobiliario de oficina", "Un tipo de ejercicio"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Wissenschaft, die Umgebung an den Menschen anzupassen", "Die Lehre von Büromöbeln", "Eine Art von Gymnastik"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué lesión NO se menciona?", "p_de": "Welche Verletzung wird NICHT erwähnt?", "s_es": {"type": "multiple_choice", "options": ["Fractura de muñeca", "Dolor de espalda", "Tensión en el cuello"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Handgelenksbruch", "Rückenschmerzen", "Nackenverspannung"], "answer": 0}}'::jsonb,
            '{"p": "¿Cada cuánto tiempo deben hacerse pausas cortas?", "p_de": "Wie oft sollten kurze Pausen gemacht werden?", "s_es": {"type": "multiple_choice", "options": ["Cada 45–60 minutos", "Cada 2 horas", "Cada 20 minutos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alle 45–60 Minuten", "Alle 2 Stunden", "Alle 20 Minuten"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué porcentaje de la mala salud laboral es musculoesquelética?", "p_de": "Welcher Prozentsatz der arbeitsbedingten Gesundheitsprobleme ist muskel-skelettbedingt?", "s_es": {"type": "multiple_choice", "options": ["30 %", "20 %", "40 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["30 %", "20 %", "40 %"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué organización se menciona?", "p_de": "Welche Organisation wird erwähnt?", "s_es": {"type": "multiple_choice", "options": ["La Health and Safety Executive", "El NHS", "El Departamento de Educación"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Health and Safety Executive", "Der NHS", "Das Bildungsministerium"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué postura debe mantenerse?", "p_de": "Welche Haltung sollte beibehalten werden?", "s_es": {"type": "multiple_choice", "options": ["Una posición corporal neutra", "Inclinarse hacia delante", "Una postura reclinada"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine neutrale Körperhaltung", "Nach vorn gebeugt", "Eine zurückgelehnte Haltung"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuánto pueden reducirse las ausencias?", "p_de": "Um wie viel können Fehlzeiten reduziert werden?", "s_es": {"type": "multiple_choice", "options": ["Hasta un 25 %", "Hasta un 10 %", "Hasta un 50 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um bis zu 25 %", "Um bis zu 10 %", "Um bis zu 50 %"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué dos cosas recomienda el artículo?", "p_de": "Welche zwei Dinge empfiehlt der Artikel?", "s_es": {"type": "multiple_choice", "options": ["Mobiliario ergonómico y formación", "Meditación y yoga", "Reuniones periódicas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ergonomische Möbel und Schulungen", "Meditation und Yoga", "Regelmäßige Besprechungen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4640
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4640
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4640, 'en', 'reading', 'professional', $content$Ergonomics in the Workplace

Ergonomics is the science of designing the work environment to fit the worker rather than forcing the worker to adapt to poor conditions. In office settings, bad ergonomic design can contribute to musculoskeletal problems such as back pain, neck strain and repetitive strain injuries. These issues often develop slowly, but they can lead to discomfort, absence and lower productivity.

Good ergonomic practice includes maintaining a neutral body position, keeping computer screens at eye level and taking short breaks every 45 to 60 minutes. Research published by the Health and Safety Executive shows that musculoskeletal disorders account for 30% of all work-related ill-health cases in the UK.

Employers that invest in ergonomic furniture and staff training can reduce absence by up to 25%. As a result, ergonomics is not only a health issue but also a practical business decision.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un artículo sobre ergonomía laboral', 'Lee un texto teórico sobre ergonomía y salud en el trabajo.'),
            (v_reading_id, 'de', 'Lies einen Artikel über Arbeitsergonomie', 'Lies einen theoretischen Text über Ergonomie und Gesundheit am Arbeitsplatz.');

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
