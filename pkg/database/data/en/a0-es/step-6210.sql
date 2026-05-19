-- ============================================================
-- Seed: A0 English Path – STEP 6210 – Reading – lee una invitación social (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La invitación es para el viernes por la tarde.","de": "Die Einladung ist für Freitag Nachmittag.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Hay que llevar una manta si se quiere sentar en el césped.","de": "Man soll eine Decke mitbringen, wenn man auf dem Rasen sitzen möchte.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La merienda es en la biblioteca.","de": "Der Snack findet in der Bibliothek statt.","s_es": {"type": "true_false","answer": false},"s_de": {"type": "true_false","answer": false}}'::jsonb,
        '{"es": "La anfitriona pide que se confirme la asistencia.","de": "Die Gastgeberin bittet um eine Zusage.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La gente puede llevar algo para compartir.","de": "Man kann etwas zum Teilen mitbringen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La invitación es amistosa.","de": "Die Einladung ist freundlich.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La persona que invita vive en un piso.","de": "Die einladende Person wohnt in einer Wohnung.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Se pide avisar antes del jueves.","de": "Es wird gebeten, vor Donnerstag Bescheid zu geben.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Cuándo es la reunión?","de": "Wann ist das Treffen?","s_es": {"type": "multiple_choice","options": ["Friday evening","Tuesday morning","Saturday night"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Am Freitagabend","Am Dienstagmorgen","Am Samstagabend"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué conviene llevar para sentarse fuera?","de": "Was sollte man mitbringen, um draußen zu sitzen?","s_es": {"type": "multiple_choice","options": ["A blanket","A bicycle","A towel"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Eine Decke","Ein Fahrrad","Ein Handtuch"],"answer": 0}}'::jsonb,
        '{"es": "¿Dónde será la merienda?","de": "Wo findet der Snack statt?","s_es": {"type": "multiple_choice","options": ["At a flat","At a train station","At a cinema"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["In einer Wohnung","An einem Bahnhof","In einem Kino"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué debe hacer la gente antes del jueves?","de": "Was soll man vor Donnerstag tun?","s_es": {"type": "multiple_choice","options": ["Reply by Thursday","Reply next month","Reply after the party"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Bis Donnerstag antworten","Nächsten Monat antworten","Nach der Party antworten"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué puede llevar cada persona?","de": "Was kann jede Person mitbringen?","s_es": {"type": "multiple_choice","options": ["A snack to share","A school uniform","A new phone"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Einen Snack zum Teilen","Eine Schuluniform","Ein neues Telefon"],"answer": 0}}'::jsonb,
        '{"es": "¿Quién invita a la merienda?","de": "Wer lädt zum Snack ein?","s_es": {"type": "multiple_choice","options": ["A friend","A teacher","A shopkeeper"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Eine Freundin","Eine Lehrkraft","Ein Verkäufer"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué día deben responder?","de": "Bis wann sollen sie antworten?","s_es": {"type": "multiple_choice","options": ["By Thursday","By Monday","By Sunday"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Bis Donnerstag","Bis Montag","Bis Sonntag"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué pueden llevar para compartir?","de": "Was können sie zum Teilen mitbringen?","s_es": {"type": "multiple_choice","options": ["A small snack","A school book","A coat"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Einen kleinen Snack","Ein Schulbuch","Einen Mantel"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 6210 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 6210 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6210, 'en', 'reading', 'Convivencia', 'Hi, you''re invited to my flat this Friday evening for tea and snacks. We will start at 6 PM and sit outside if the weather is nice. Please bring a drink or a small snack to share. If you want to come, reply by Thursday so I know how many people to expect. Bring a blanket if you want to sit on the grass.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'lee una invitación social', 'Lee una invitación sencilla a una merienda con compañeros y responde a los detalles principales.'),
        (v_reading_id, 'de', 'lies eine soziale Einladung', 'Lies eine einfache Einladung zu einem Treffen mit Mitschülern und beantworte die wichtigsten Details.');

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
