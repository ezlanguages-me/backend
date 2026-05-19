-- ============================================================
-- Seed: A0 English Path – STEP 3850 – Listening – listen to order confirmation (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La llamada confirma la orden PO-7784.", "p_de": "Der Anruf bestätigt die Bestellung PO-7784.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se enviarán cincuenta toner cartridges.", "p_de": "Es werden fünfzig Tonerkartuschen geschickt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La entrega principal llega el miércoles por la mañana.", "p_de": "Die Hauptlieferung kommt am Mittwochmorgen an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La entrega llega a Door 2 el jueves por la mañana.", "p_de": "Die Lieferung kommt am Donnerstagmorgen an Door 2 an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La factura va al finance team por separado.", "p_de": "Die Rechnung geht separat an das Finanzteam.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las blue folders están listas hoy.", "p_de": "Die blauen Ordner sind heute verfügbar.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las blue folders se enviarán el viernes.", "p_de": "Die blauen Ordner werden am Freitag geschickt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que llamar si cambia la hora del almacén.", "p_de": "Man soll anrufen, wenn sich die Lagerzeit ändert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué orden se confirma?", "p_de": "Welche Bestellung wird bestätigt?", "s_es": {"type": "multiple_choice", "options": ["PO-7784", "PO-7748", "PO-7874"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["PO-7784", "PO-7748", "PO-7874"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos toner cartridges se envían?", "p_de": "Wie viele Tonerkartuschen werden geschickt?", "s_es": {"type": "multiple_choice", "options": ["Fifty", "Fifteen", "Five"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünfzig", "Fünfzehn", "Fünf"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo salen los toner cartridges?", "p_de": "Wann gehen die Tonerkartuschen raus?", "s_es": {"type": "multiple_choice", "options": ["Wednesday afternoon", "Thursday morning", "Friday evening"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mittwochnachmittag", "Donnerstagmorgen", "Freitagabend"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo llegan a Door 2?", "p_de": "Wann kommen sie an Door 2 an?", "s_es": {"type": "multiple_choice", "options": ["Thursday morning", "Wednesday afternoon", "Friday morning"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Donnerstagmorgen", "Mittwochnachmittag", "Freitagmorgen"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién va la factura?", "p_de": "An wen geht die Rechnung?", "s_es": {"type": "multiple_choice", "options": ["The finance team", "The driver", "The kitchen team"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Finanzteam", "Den Fahrer", "Das Küchenteam"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué producto tiene retraso?", "p_de": "Welches Produkt ist verspätet?", "s_es": {"type": "multiple_choice", "options": ["Five blue folders", "The toner cartridges", "The chairs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünf blaue Ordner", "Die Tonerkartuschen", "Die Stühle"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se enviarán las blue folders?", "p_de": "Wann werden die blauen Ordner geschickt?", "s_es": {"type": "multiple_choice", "options": ["On Friday", "Today", "Next month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Freitag", "Heute", "Nächsten Monat"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo hay que llamar al proveedor?", "p_de": "Wann soll man den Lieferanten anrufen?", "s_es": {"type": "multiple_choice", "options": ["If the warehouse time changes", "If the café closes", "If the weather is sunny"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wenn sich die Lagerzeit ändert", "Wenn das Café schließt", "Wenn das Wetter sonnig ist"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3850 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 3850 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3850, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Tom, a supplier confirming an order by phone
## "Your Order Is Confirmed"

## THE SCENE: A supplier calls to repeat the main delivery details
Tom confirms the order, the delivery time, and one small delay.

### DIRECTOR'S NOTES
Style:
* Clear business call with repeated order numbers and dates.
* One problem is mentioned simply so learners can follow it.

Pace: Slow and precise.

Accent: Neutral accent.

#### TRANSCRIPT
[polite] Supplier: I am calling to confirm purchase order PO-7784.
[clear] Supplier: We will send fifty toner cartridges on Wednesday afternoon.
[informative] Supplier: They will arrive on Thursday morning at Door 2.
[practical] Supplier: The invoice goes separately to your finance team.
[careful] Supplier: Five blue folders are out of stock today, so we will send them on Friday.
[helpful] Supplier: Please call me if the warehouse time changes.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una confirmación de pedido', 'Escucha una llamada de proveedor con fecha de envío, entrega, factura y un pequeño retraso.'),
            (v_listening_id, 'de', 'Höre eine Auftragsbestätigung', 'Höre einen Lieferantenanruf mit Versanddatum, Lieferung, Rechnung und kleiner Verzögerung.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
