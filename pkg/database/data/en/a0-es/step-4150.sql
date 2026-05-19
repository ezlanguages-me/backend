-- ============================================================
-- Seed: A0 English Path – STEP 4150 – Listening – listen to a product demonstration (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El demostrador se llama Mark.", "p_de": "Der Demonstrator heißt Mark.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Mark demuestra el modelo Pro primero.", "p_de": "Mark demonstriert zuerst das Pro-Modell.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El modelo básico es adecuado para oficinas pequeñas.", "p_de": "Das Basismodell eignet sich für kleine Büros.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El modelo Pro funciona 3 veces más rápido que el básico.", "p_de": "Das Pro-Modell arbeitet dreimal schneller als das Basismodell.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El filtro HEPA atrapa el 99,9% de las partículas.", "p_de": "Der HEPA-Filter fängt 99,9% der Partikel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El depósito del modelo Pro tiene capacidad para 40 litros.", "p_de": "Der Tank des Pro-Modells fasst 40 Liter.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente puede llevarse el equipo hoy mismo si hace el pedido.", "p_de": "Der Kunde kann das Gerät heute mitnehmen, wenn er bestellt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Mark invita al cliente a hacer preguntas al final.", "p_de": "Mark lädt den Kunden am Ende ein, Fragen zu stellen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué modelo demuestra Mark primero?", "p_de": "Welches Modell demonstriert Mark zuerst?", "s_es": {"type": "multiple_choice", "options": ["Basic model", "Pro model", "Premium model"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Basismodell", "Pro-Modell", "Premium-Modell"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué tipo de local es el modelo básico?", "p_de": "Für welche Art von Räumlichkeiten ist das Basismodell geeignet?", "s_es": {"type": "multiple_choice", "options": ["Small offices", "Large warehouses", "Hospitals"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kleine Büros", "Große Lagerhallen", "Krankenhäuser"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto más rápido trabaja el modelo Pro?", "p_de": "Wie viel schneller arbeitet das Pro-Modell?", "s_es": {"type": "multiple_choice", "options": ["Twice as fast", "Three times faster", "50% faster"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Doppelt so schnell", "Dreimal schneller", "50% schneller"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué porcentaje de partículas atrapa el filtro HEPA?", "p_de": "Welchen Prozentsatz an Partikeln fängt der HEPA-Filter?", "s_es": {"type": "multiple_choice", "options": ["99.9%", "95%", "80%"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["99,9%", "95%", "80%"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos litros tiene el depósito del modelo Pro?", "p_de": "Wie viele Liter fasst der Tank des Pro-Modells?", "s_es": {"type": "multiple_choice", "options": ["40 litres", "20 litres", "60 litres"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["40 Liter", "20 Liter", "60 Liter"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se entrega el equipo si se hace el pedido hoy?", "p_de": "Wann wird das Gerät geliefert, wenn man heute bestellt?", "s_es": {"type": "multiple_choice", "options": ["Within 3 working days", "Today", "Next month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Innerhalb von 3 Werktagen", "Heute", "Nächsten Monat"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace Mark al final de la demostración?", "p_de": "Was macht Mark am Ende der Demonstration?", "s_es": {"type": "multiple_choice", "options": ["Invites questions", "Leaves immediately", "Offers a discount"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lädt zu Fragen ein", "Geht sofort", "Bietet einen Rabatt an"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata esta escucha?", "p_de": "Worum geht es in diesem Hörtext?", "s_es": {"type": "multiple_choice", "options": ["A product demonstration", "A sales complaint", "A job interview"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Produktdemonstration", "Eine Verkaufsbeschwerde", "Ein Vorstellungsgespräch"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4150 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 4150 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 4150, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Mark, a product specialist giving a live demonstration
## "CleanPro Equipment – Live Product Demonstration"

## THE SCENE: A showroom; a potential client watches the demonstration
Mark demonstrates two industrial vacuum cleaner models in sequence.

### DIRECTOR'S NOTES
Style:
* Energetic but professional; technical details stated clearly.
* Pauses after key specifications so listeners can process them.

Pace: Moderate; slows down for technical numbers.

Accent: Neutral accent.

#### TRANSCRIPT
[welcoming] Mark: Thank you for coming today. I will start with our Basic model.
[demonstrating] Mark: This is the Basic – it has a 20-litre tank and is designed for small offices.
[switching] Mark: Now let me show you the Pro model. It has a 40-litre tank and works twice as fast.
[highlighting] Mark: The Pro also includes a HEPA filter, which captures 99.9% of dust particles.
[practical] Mark: If you order today, delivery takes three working days.
[closing] Mark: Both models carry a two-year warranty and spare parts are always in stock.
[inviting] Mark: Please feel free to ask any questions. I am happy to demonstrate anything again.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una demostración de producto', 'Escucha una demostración en vivo de dos modelos de aspiradora industrial con especificaciones y condiciones.'),
            (v_listening_id, 'de', 'Höre eine Produktdemonstration', 'Höre eine Live-Demonstration zweier Industriestaubsauger-Modelle mit Spezifikationen und Bedingungen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
