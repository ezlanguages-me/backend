-- ============================================================
-- Seed: A0 English Path – STEP 3900 – Listening – give detailed information and state detailed requirements within familiar area of work (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El servicio semanal es en City Hub.", "p_de": "Der wöchentliche Service ist im City Hub.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que limpiar tres salas de reuniones, dos cocinas y recepción.", "p_de": "Man soll drei Besprechungsräume, zwei Küchen und den Empfang reinigen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El trabajo empieza a las 5 PM.", "p_de": "Die Arbeit beginnt um 17 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Solo se usan productos ecológicos.", "p_de": "Es werden nur ökologische Reinigungsprodukte benutzt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El viernes hay que pulir el suelo principal cerca de recepción.", "p_de": "Am Freitag soll der Hauptboden nahe dem Empfang poliert werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se necesitan cuatro trabajadores para la visita normal.", "p_de": "Für den normalen Einsatz braucht man vier Mitarbeiter.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las llaves de repuesto se toman en recepción.", "p_de": "Die Ersatzschlüssel holt man am Empfang.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si hay daños, hay que hacer un informe y enviar fotos esa noche.", "p_de": "Bei Schäden soll man einen Bericht schreiben und noch am Abend Fotos schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Dónde es el servicio semanal?", "p_de": "Wo ist der wöchentliche Service?", "s_es": {"type": "multiple_choice", "options": ["At City Hub", "At Green Tower", "At River Hall"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im City Hub", "Im Green Tower", "In der River Hall"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas meeting rooms se limpian?", "p_de": "Wie viele meeting rooms werden gereinigt?", "s_es": {"type": "multiple_choice", "options": ["Three", "Two", "Five"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Zwei", "Fünf"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora empieza el trabajo?", "p_de": "Um wie viel Uhr beginnt die Arbeit?", "s_es": {"type": "multiple_choice", "options": ["6 PM", "5 PM", "9 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["18 Uhr", "17 Uhr", "21 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de productos se usan?", "p_de": "Welche Art Produkte werden benutzt?", "s_es": {"type": "multiple_choice", "options": ["Eco cleaning products", "Industrial paint", "Only hot water"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ökologische Reinigungsprodukte", "Industriefarbe", "Nur heißes Wasser"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tarea especial hay el viernes?", "p_de": "Welche Zusatzaufgabe gibt es am Freitag?", "s_es": {"type": "multiple_choice", "options": ["Polish the main floor near reception", "Paint the kitchen walls", "Move the furniture outside"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Hauptboden am Empfang polieren", "Die Küchenwände streichen", "Die Möbel nach draußen bringen"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos trabajadores bastan normalmente?", "p_de": "Wie viele Mitarbeiter reichen normalerweise aus?", "s_es": {"type": "multiple_choice", "options": ["Two", "Four", "One"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Vier", "Einer"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde están las llaves de repuesto?", "p_de": "Wo sind die Ersatzschlüssel?", "s_es": {"type": "multiple_choice", "options": ["At reception", "In the storeroom", "In the car park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Empfang", "Im Lagerraum", "Auf dem Parkplatz"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay que hacer si ves daños?", "p_de": "Was muss man bei Schäden tun?", "s_es": {"type": "multiple_choice", "options": ["Write it in the report and email photos that night", "Wait until next week", "Call a taxi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Es in den Bericht schreiben und noch am Abend Fotos mailen", "Bis nächste Woche warten", "Ein Taxi rufen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3900 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 3900 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3900, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Carla, a team leader explaining a weekly cleaning service
## "Weekly Service at City Hub"

## THE SCENE: A familiar work task with several clear requirements
Carla explains what to clean, when to start, and how to report problems.

### DIRECTOR'S NOTES
Style:
* Detailed but simple instructions for a familiar work area.
* Clear quantities and repeated routine steps.

Pace: Slow and steady.

Accent: Neutral accent.

#### TRANSCRIPT
[clear] Team leader: For the weekly service at City Hub, clean three meeting rooms, two kitchens, and the reception area every evening.
[practical] Team leader: Start at 6 PM and finish before 9 PM.
[careful] Team leader: Use eco cleaning products only.
[specific] Team leader: On Friday, polish the main floor near reception.
[organised] Team leader: Two staff members are enough for the normal visit.
[helpful] Team leader: Take the spare keys from reception and return them before you leave.
[final] Team leader: If you see damage, write it in the report and email photos to me that night.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha información y requisitos detallados', 'Escucha a una responsable que explica un servicio semanal con zonas, productos y reporte final.'),
            (v_listening_id, 'de', 'Höre detaillierte Informationen und Anforderungen', 'Höre einer Leiterin zu, die einen wöchentlichen Service mit Bereichen, Produkten und Abschlussbericht erklärt.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
