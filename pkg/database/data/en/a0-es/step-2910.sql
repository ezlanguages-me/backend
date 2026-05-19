-- ============================================================
-- Seed: A0 English Path – STEP 2910 – Reading – buy a ticket
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Las máquinas de billetes están cerca de la entrada principal.", "de": "Die Fahrkartenautomaten sind in der Nähe des Haupteingangs.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El billete de ida y vuelta cuesta 4,50 libras.", "de": "Die Hin- und Rückfahrkarte kostet 4,50 Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los niños menores de cinco años viajan gratis.", "de": "Kinder unter fünf Jahren fahren kostenlos.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las máquinas aceptan billetes de papel.", "de": "Die Automaten nehmen Geldscheine an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El revisor comprueba los billetes en el tren.", "de": "Der Schaffner kontrolliert die Fahrkarten im Zug.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La oficina de billetes abre a las 7:00.", "de": "Das Fahrkartenbüro öffnet um 7:00 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hoy muchos visitantes viajan a River Town por el mercado.", "de": "Heute fahren viele Besucher wegen des Marktes nach River Town.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Primero debes pulsar English en la pantalla.", "de": "Zuerst musst du auf dem Bildschirm English drücken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué debes pulsar primero en la pantalla?", "de": "Was musst du zuerst auf dem Bildschirm drücken?", "s_es": {"type": "multiple_choice", "options": ["English", "La ciudad de destino", "El número del andén"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["English", "Die Zielstadt", "Die Bahnsteignummer"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué ciudad viajan hoy muchos visitantes?", "de": "In welche Stadt fahren heute viele Besucher?", "s_es": {"type": "multiple_choice", "options": ["River Town", "Greenhill", "West Airport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["River Town", "Greenhill", "West Airport"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dos tipos de billete puedes elegir?", "de": "Welche zwei Ticketarten kannst du wählen?", "s_es": {"type": "multiple_choice", "options": ["Ida o ida y vuelta", "Niño o maleta", "Rápido o lento"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einfach oder hin und zurück", "Kind oder Gepäck", "Schnell oder langsam"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta un billete de ida a River Town?", "de": "Wie viel kostet eine einfache Fahrkarte nach River Town?", "s_es": {"type": "multiple_choice", "options": ["4,50 libras", "8 libras", "5 libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["4,50 Pfund", "8 Pfund", "5 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta un billete de ida y vuelta?", "de": "Wie viel kostet eine Hin- und Rückfahrkarte?", "s_es": {"type": "multiple_choice", "options": ["8 libras", "4,50 libras", "12 libras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8 Pfund", "4,50 Pfund", "12 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo puedes pagar en la máquina?", "de": "Wie kannst du am Automaten bezahlen?", "s_es": {"type": "multiple_choice", "options": ["Con tarjeta o monedas", "Solo con billetes", "Solo en línea"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Karte oder Münzen", "Nur mit Scheinen", "Nur online"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién comprueba los billetes en el tren?", "de": "Wer kontrolliert die Fahrkarten im Zug?", "s_es": {"type": "multiple_choice", "options": ["El revisor", "El conductor del autobús", "La camarera"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Schaffner", "Der Busfahrer", "Die Kellnerin"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora abre la oficina de billetes?", "de": "Um wie viel Uhr öffnet das Fahrkartenbüro?", "s_es": {"type": "multiple_choice", "options": ["A las 8:00", "A las 7:00", "A las 9:30"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 8:00 Uhr", "Um 7:00 Uhr", "Um 9:30 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2910 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2910 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2910, 'en', 'reading', 'transport', $content$
Central Station Travel Centre.
Buy your ticket before you go to platform 4. The ticket machines are near the main entrance. Press English on the screen first. Then choose your destination and choose a single ticket or a return ticket.

Today many visitors travel to River Town for the market. A single ticket to River Town is £4.50. A return ticket is £8. Children under five travel free. Please pay by card or coins. The machines do not take notes.

Keep your ticket in your hand or bag. A conductor checks tickets on the train. If you need help, the ticket office opens at 8:00 AM.

$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee cómo comprar un billete en una máquina', 'Lee un aviso sencillo de estación sobre billetes, precios y formas de pago.'),
        (v_reading_id, 'de', 'Lies, wie man eine Fahrkarte am Automaten kauft', 'Lies einen einfachen Bahnhofshinweis zu Fahrkarten, Preisen und Bezahlung.');

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
