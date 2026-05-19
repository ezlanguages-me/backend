    -- ============================================================
    -- Seed: A0 English Path – STEP 7380 – Reading – read a story or anecdote for social sharing
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"es": "La familia anfitriona llevó a Leo a un picnic del barrio en la plaza.", "de": "Die Gastfamilie nahm Leo zu einem Nachbarschaftspicknick auf dem Platz mit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Todo el mundo llevó un plato pequeño y una historia de la semana.", "de": "Alle brachten ein kleines Gericht und eine Geschichte aus der Woche mit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Leo derramó limonada sobre otro invitado.", "de": "Leo verschüttete Limonade über einen anderen Gast.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "En su primer día en la ciudad, Leo intentó saludar a todos con un beso en la mejilla.", "de": "An seinem ersten Tag in der Stadt versuchte Leo, alle mit einem Kuss auf die Wange zu begrüßen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El vecino se enfadó cuando Leo quiso saludarlo.", "de": "Der Nachbar wurde wütend, als Leo ihn begrüßen wollte.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Ese mismo vecino le enseñó después la forma local de saludar.", "de": "Derselbe Nachbar zeigte ihm später die lokale Art der Begrüßung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Más tarde, la gente compartió otros errores divertidos.", "de": "Später erzählten die Leute von anderen lustigen Fehlern.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Leo aprende que una buena anécdota social tiene que ser perfecta.", "de": "Leo lernt, dass eine gute soziale Anekdote perfekt sein muss.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Dónde fue el picnic?", "de": "Wo fand das Picknick statt?", "s_es": {"type": "multiple_choice", "options": ["In the square", "At the station", "On the beach"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Platz", "Am Bahnhof", "Am Strand"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué llevó cada persona?", "de": "Was brachte jede Person mit?", "s_es": {"type": "multiple_choice", "options": ["A small dish and a story", "A map and a ticket", "A phone and a chair"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein kleines Gericht und eine Geschichte", "Eine Karte und ein Ticket", "Ein Telefon und einen Stuhl"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pasó cuando Leo intentó sentarse?", "de": "Was passierte, als Leo sich setzen wollte?", "s_es": {"type": "multiple_choice", "options": ["He spilled lemonade on his shoe", "He dropped the chair in the river", "He broke the table"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er verschüttete Limonade auf seinen Schuh", "Er ließ den Stuhl in den Fluss fallen", "Er zerbrach den Tisch"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo intentó saludar Leo al principio?", "de": "Wie wollte Leo am Anfang grüßen?", "s_es": {"type": "multiple_choice", "options": ["With a cheek kiss", "With a bow", "With a formal speech"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einem Kuss auf die Wange", "Mit einer Verbeugung", "Mit einer formellen Rede"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ofreció el vecino en vez de eso?", "de": "Was bot der Nachbar stattdessen an?", "s_es": {"type": "multiple_choice", "options": ["A friendly wave", "A new jacket", "A train card"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein freundliches Winken", "Eine neue Jacke", "Eine Zugkarte"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué otros errores compartió la gente?", "de": "Welche anderen Fehler erzählten die Leute?", "s_es": {"type": "multiple_choice", "options": ["Wrong bus stops, strange translations, and hand gestures", "Lost passports, exams, and recipes", "Hotel keys, rain, and homework"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Falsche Bushaltestellen, seltsame Übersetzungen und Handgesten", "Verlorene Pässe, Prüfungen und Rezepte", "Hotelschlüssel, Regen und Hausaufgaben"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué necesita una buena anécdota social?", "de": "Was braucht eine gute soziale Anekdote?", "s_es": {"type": "multiple_choice", "options": ["A small surprise", "A difficult ending", "A famous speaker"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine kleine Überraschung", "Ein schwieriges Ende", "Einen berühmten Sprecher"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo debería terminar la historia según Leo?", "de": "Wie sollte die Geschichte laut Leo enden?", "s_es": {"type": "multiple_choice", "options": ["With a friendly ending that invites another story", "With a long argument", "With complete silence"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einem freundlichen Ende, das zu einer neuen Geschichte einlädt", "Mit einem langen Streit", "Mit völligem Schweigen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7380 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 7380 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 7380, 'en', 'reading', 'social', 'On Saturday night, the host family took Leo to a neighborhood picnic in the square. Everyone brought one small dish and a story from the week. Leo planned to stay quiet, but then he spilled a little lemonade on his own shoe while trying to sit on a folding chair. The table laughed, and Leo laughed too.\n\nThat small accident gave him a story to tell. He explained that on his first day in town he had tried to greet every person with a cheek kiss, because that was normal at home. One neighbor stepped back in surprise, then offered a friendly wave instead. Later the same neighbor taught him the local style of greeting and brought him an extra napkin for the lemonade.\n\nBy the end of the picnic, people were sharing their own funny mistakes: wrong bus stops, strange translations, and confusing hand gestures. Leo understood that a good social anecdote does not need to be perfect. It only needs a small surprise, a bit of honesty, and a friendly ending that makes everyone want to tell another story.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una anécdota para compartir socialmente', 'Lee una historia breve y divertida sobre un picnic vecinal, saludos y pequeños malentendidos.'),
            (v_reading_id, 'de', 'Lies eine Anekdote zum sozialen Teilen', 'Lies eine kurze und lustige Geschichte über ein Nachbarschaftspicknick, Begrüßungen und kleine Missverständnisse.');

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
