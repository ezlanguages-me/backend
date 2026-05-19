-- ============================================================
-- Seed: A0 English Path – STEP 2920 – Listening – buy a ticket
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El pasajero quiere un billete para West Airport.", "de": "Der Fahrgast möchte eine Fahrkarte nach West Airport.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El próximo autobús sale a las 10:30.", "de": "Der nächste Bus fährt um 10:30 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El autobús sale del andén 3.", "de": "Der Bus fährt von Stand 3 ab.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El billete de ida cuesta seis libras.", "de": "Die einfache Fahrkarte kostet sechs Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El billete de ida y vuelta cuesta ocho libras.", "de": "Die Hin- und Rückfahrkarte kostet acht Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El billete no tiene número de asiento.", "de": "Die Fahrkarte hat keine Sitznummer.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se puede pagar con tarjeta o en efectivo.", "de": "Man kann mit Karte oder bar bezahlen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El pasajero compra un billete de ida y vuelta.", "de": "Der Fahrgast kauft eine Hin- und Rückfahrkarte.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿A dónde quiere ir el pasajero?", "de": "Wohin möchte der Fahrgast fahren?", "s_es": {"type": "multiple_choice", "options": ["West Airport", "River Town", "Blue Island"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["West Airport", "River Town", "Blue Island"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora sale el próximo autobús?", "de": "Um wie viel Uhr fährt der nächste Bus?", "s_es": {"type": "multiple_choice", "options": ["10:30", "10:00", "11:30"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10:30", "10:00", "11:30"], "answer": 0}}'::jsonb,
        '{"es": "¿Desde qué andén sale el autobús?", "de": "Von welchem Stand fährt der Bus ab?", "s_es": {"type": "multiple_choice", "options": ["Andén 2", "Andén 3", "Andén 5"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Stand 2", "Stand 3", "Stand 5"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta un billete de ida?", "de": "Wie viel kostet eine einfache Fahrkarte?", "s_es": {"type": "multiple_choice", "options": ["6 libras", "10 libras", "4 libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["6 Pfund", "10 Pfund", "4 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta un billete de ida y vuelta?", "de": "Wie viel kostet eine Hin- und Rückfahrkarte?", "s_es": {"type": "multiple_choice", "options": ["10 libras", "6 libras", "12 libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10 Pfund", "6 Pfund", "12 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos billetes quiere hoy el pasajero?", "de": "Wie viele Fahrkarten möchte der Fahrgast heute?", "s_es": {"type": "multiple_choice", "options": ["Uno", "Dos", "Tres"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine", "Zwei", "Drei"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice la empleada sobre el asiento?", "de": "Was sagt die Mitarbeiterin über den Sitzplatz?", "s_es": {"type": "multiple_choice", "options": ["No hay número de asiento", "Hay asiento 14", "Hay que elegir ventanilla"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Es gibt keine Sitznummer", "Es ist Sitz 14", "Man muss einen Fensterplatz wählen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo puede pagar el pasajero?", "de": "Wie kann der Fahrgast bezahlen?", "s_es": {"type": "multiple_choice", "options": ["Con tarjeta o en efectivo", "Solo en efectivo", "Solo con el móvil"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Karte oder bar", "Nur bar", "Nur mit dem Handy"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2920 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2920 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2920, 'en', 'listening', 'transport', $transcript$
# AUDIO PROFILE: Ticket clerk at an airport bus desk
## "One Ticket to West Airport"

## THE SCENE: A small ticket desk inside a busy bus station
A passenger needs one airport ticket for today.
The clerk gives the next bus time, the stand number, and the price.

### DIRECTOR'S NOTES
Style:
* Short ticket-desk exchange with clear numbers and simple travel words.
* The clerk repeats the time and price to help beginner listeners.

Pace: Slow and clear, with extra stress on times, numbers, and ticket type.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise buying a simple ticket and understanding time, place, and payment.
The recording focuses on one ticket, one destination, and one bus.

#### TRANSCRIPT
[welcoming] Clerk: Hello. Where do you want to go?
[polite] Passenger: To West Airport, please. One ticket for today.
[informative] Clerk: The next airport bus leaves at 10:30 from stand 2.
[checking] Passenger: Is it a single ticket?
[clear] Clerk: Yes. A single ticket is six pounds. A return ticket is ten pounds.
[deciding] Passenger: I only need a single, please.
[helpful] Clerk: No problem. Here is your ticket. There is no seat number.
[polite] Passenger: Can I pay by card?
[reassuring] Clerk: Yes. Card or cash is fine.

$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha cómo comprar un billete para el autobús del aeropuerto', 'Escucha una conversación breve en una taquilla de autobuses con destino, hora y precio.'),
        (v_listening_id, 'de', 'Höre, wie man eine Fahrkarte für den Flughafenbus kauft', 'Höre ein kurzes Gespräch am Bus-Schalter mit Ziel, Uhrzeit und Preis.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
