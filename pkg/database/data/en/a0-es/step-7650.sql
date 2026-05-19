-- ============================================================
-- Seed: A0 English Path – STEP 7650 – Reading – understand a position paper (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El documento apoya una norma nueva para reuniones internas.", "de": "Das Dokument unterstützt eine neue Regel für interne Besprechungen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La norma pide una lectura previa breve y una hora fija de finalización.", "de": "Die Regel verlangt eine kurze Vorab Lektüre und eine feste Endzeit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El primer punto dice que así la gente llega con información distinta.", "de": "Der erste Punkt sagt, dass die Leute so mit unterschiedlichem Wissen kommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El segundo punto dice que una hora fija anima agendas más claras y turnos más breves.", "de": "Der zweite Punkt sagt, dass eine feste Endzeit klarere Agenden und kürzere Redebeiträge fördert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El tercer punto habla de respetar a colegas que pasan por varios equipos en el día.", "de": "Der dritte Punkt spricht davon, Kollegen zu respektieren, die am Tag zwischen mehreren Teams wechseln.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El documento ignora por completo los temas urgentes de última hora.", "de": "Das Dokument ignoriert dringende Themen in letzter Minute völlig.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Permite un tema abierto pequeño al final de cada reunión.", "de": "Es erlaubt am Ende jeder Besprechung einen kleinen offenen Punkt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La posición final sigue siendo que las reuniones funcionan mejor con preparación breve y final fijo.", "de": "Die Endposition bleibt, dass Besprechungen mit kurzer Vorbereitung und festem Ende besser funktionieren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué tipo de documento es?", "de": "Was für ein Dokument ist das?", "s_es": {"type": "multiple_choice", "options": ["A position paper", "A travel receipt", "A welcome email"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Positionspapier", "Eine Reisekostenquittung", "Eine Begrüßungs E Mail"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dos reglas apoya el texto?", "de": "Welche zwei Regeln unterstützt der Text?", "s_es": {"type": "multiple_choice", "options": ["A short pre read and a fixed finish time", "Longer meetings and more slides", "No agenda and open ending"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine kurze Vorab Lektüre und eine feste Endzeit", "Längere Treffen und mehr Folien", "Keine Agenda und offenes Ende"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué consigue la lectura previa breve?", "de": "Was bewirkt die kurze Vorab Lektüre?", "s_es": {"type": "multiple_choice", "options": ["People arrive with the same background information", "The room becomes larger", "The budget becomes smaller"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Leute kommen mit demselben Hintergrundwissen", "Der Raum wird größer", "Das Budget wird kleiner"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué fomenta una hora fija de finalización?", "de": "Was fördert eine feste Endzeit?", "s_es": {"type": "multiple_choice", "options": ["Clearer agendas and shorter speaking turns", "More side topics", "Longer lunch breaks"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Klarere Agenden und kürzere Redebeiträge", "Mehr Nebenthemen", "Längere Mittagspausen"], "answer": 0}}'::jsonb,
        '{"es": "¿A quién respeta especialmente la tercera idea?", "de": "Wen respektiert die dritte Idee besonders?", "s_es": {"type": "multiple_choice", "options": ["Colleagues who move between several teams", "Only external visitors", "Only finance staff"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kollegen, die zwischen mehreren Teams wechseln", "Nur externe Besucher", "Nur Mitarbeitende aus dem Finanzbereich"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué preocupación acepta el texto?", "de": "Welche Sorge akzeptiert der Text?", "s_es": {"type": "multiple_choice", "options": ["Some urgent topics appear at the last minute", "The office has no chairs", "Clients dislike meetings"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einige dringende Themen tauchen in letzter Minute auf", "Im Büro gibt es keine Stühle", "Kunden mögen keine Treffen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué flexibilidad permite el texto?", "de": "Welche Flexibilität erlaubt der Text?", "s_es": {"type": "multiple_choice", "options": ["One small open item at the end", "A second full meeting", "No pre read at all"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen kleinen offenen Punkt am Ende", "Ein zweites vollständiges Treffen", "Überhaupt keine Vorab Lektüre"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la posición final?", "de": "Was ist die Endposition?", "s_es": {"type": "multiple_choice", "options": ["Meetings work better with short preparation and a firm ending time", "Meetings should always stay open ended", "Preparation is unnecessary"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Besprechungen funktionieren besser mit kurzer Vorbereitung und fester Endzeit", "Besprechungen sollten immer offen enden", "Vorbereitung ist unnötig"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7650 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7650 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7650, 'en', 'reading', 'meetings', 'Position paper. This paper supports a new rule for internal meetings: every meeting should have a short pre read and a fixed finish time. The position is based on three points. First, a short pre read helps people arrive with the same background information. Second, a fixed finish time encourages clearer agendas and shorter speaking turns. Third, the rule respects colleagues who move between several teams during the day.\n\nThe paper accepts one concern: some urgent topics appear at the last minute. For that reason, the paper allows one small open item at the end of each meeting. Even with that flexibility, the main position remains the same: meetings work better when preparation is short and the ending time is firm.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Comprende un posicionamiento escrito', 'Lee un texto breve que defiende una regla para reuniones y responde a una objeción.'),
        (v_reading_id, 'de', 'Verstehe ein schriftliches Positionspapier', 'Lies einen kurzen Text, der eine Regel für Besprechungen begründet und auf einen Einwand antwortet.');

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
