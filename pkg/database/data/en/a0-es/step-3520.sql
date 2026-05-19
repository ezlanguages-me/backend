-- ============================================================
-- Seed: A0 English Path – STEP 3520 – Listening – understand work instructions (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El equipo empieza en packing room B a las 8:30.", "p_de": "Das Team beginnt um 8:30 in packing room B.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que llevar la identificación y los guantes.", "p_de": "Man soll den Ausweis und die Handschuhe tragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La hoja de pedidos está en el escritorio 2.", "p_de": "Die Bestellliste liegt auf Tisch 2.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las cajas terminadas van al carro rojo.", "p_de": "Die fertigen Kartons kommen auf den roten Wagen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La impresora pequeña junto a la ventana funciona bien.", "p_de": "Der kleine Drucker am Fenster funktioniert gut.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Si hay un problema, hay que llamar a Ben a la extensión 12.", "p_de": "Bei einem Problem soll man Ben unter Durchwahl 12 anrufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La comida es a las 12:30 en la sala del personal.", "p_de": "Das Mittagessen ist um 12:30 im Personalraum.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La salida de incendios está junto a la puerta principal.", "p_de": "Der Notausgang ist neben der Eingangstür.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde empieza el equipo?", "p_de": "Wo beginnt das Team?", "s_es": {"type": "multiple_choice", "options": ["In packing room B", "In office 2", "At the front desk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In packing room B", "In Büro 2", "Am Empfang"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora empiezan?", "p_de": "Um wie viel Uhr beginnen sie?", "s_es": {"type": "multiple_choice", "options": ["At 8:30", "At 9:00", "At 12:30"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 8:30", "Um 9:00", "Um 12:30"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay que mirar primero?", "p_de": "Was soll man zuerst ansehen?", "s_es": {"type": "multiple_choice", "options": ["The order sheet on desk 4", "The window printer", "The lunch list"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Bestellliste auf Tisch 4", "Den Drucker am Fenster", "Die Mittagstabelle"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas etiquetas se imprimen por caja?", "p_de": "Wie viele Etiketten druckt man pro Karton?", "s_es": {"type": "multiple_choice", "options": ["One label", "Two labels", "Three labels"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Etikett", "Zwei Etiketten", "Drei Etiketten"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué color tiene el carro de las cajas terminadas?", "p_de": "Welche Farbe hat der Wagen für fertige Kartons?", "s_es": {"type": "multiple_choice", "options": ["Red", "Blue", "Black"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rot", "Blau", "Schwarz"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué equipo no deben usar?", "p_de": "Welches Gerät sollen sie nicht benutzen?", "s_es": {"type": "multiple_choice", "options": ["The small printer near the window", "The red trolley", "The back door"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den kleinen Drucker am Fenster", "Den roten Wagen", "Die Hintertür"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién llaman si hay un problema?", "p_de": "Wen ruft man bei einem Problem an?", "s_es": {"type": "multiple_choice", "options": ["Ben", "Marta", "Alex"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ben", "Marta", "Alex"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la salida de incendios?", "p_de": "Wo ist der Notausgang?", "s_es": {"type": "multiple_choice", "options": ["Next to the back door", "Next to the lift", "In the staff room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neben der Hintertür", "Neben dem Aufzug", "Im Personalraum"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid FROM listening
            WHERE step_order = 3520 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening'
        );
        DELETE FROM listening WHERE step_order = 3520 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3520, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Ben, a calm supervisor in a packing room
## "Morning Instructions in Room B"

## THE SCENE: A small packing room before the first orders go out
Ben explains where the team starts, what equipment to use, and what to do if there is a problem.

### DIRECTOR'S NOTES
Style:
* Short work instructions with repeated key details.
* Clear emphasis on place, time, and equipment.

Pace: Slow and practical.

Accent: Neutral accent.

#### TRANSCRIPT
[clear] Supervisor: Morning, everyone. Today you start in packing room B at 8:30.
[firm] Supervisor: First, wear your badge and your gloves.
[practical] Supervisor: Then check the order sheet on desk 4.
[careful] Supervisor: Print one label for each box and put the finished boxes on the red trolley.
[warning] Supervisor: Do not use the small printer near the window. It is broken.
[helpful] Supervisor: If you have a problem, call Ben on extension 12.
[friendly] Supervisor: Lunch is at 12:30 in the staff room.
[safety] Supervisor: The fire exit is next to the back door.
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha instrucciones de trabajo', 'Escucha a un supervisor que explica pasos, material y seguridad en una tarea sencilla.'),
            (v_listening_id, 'de', 'Höre Arbeitsanweisungen', 'Höre einem Vorgesetzten zu, der Schritte, Material und Sicherheit für eine einfache Aufgabe erklärt.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_listening_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
