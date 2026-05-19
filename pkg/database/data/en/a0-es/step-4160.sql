-- ============================================================
-- Seed: A0 English Path – STEP 4160 – Dialogue – explain a product to a customer (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Customer", "text": "I am interested in the Pro vacuum. Can you tell me more about it?", "es": "Me interesa la aspiradora Pro. ¿Puede contarme más sobre ella?", "de": "Ich interessiere mich für den Pro-Staubsauger. Können Sie mir mehr darüber erzählen?"}'::jsonb,
    '{"character": "Agent", "text": "Of course. The Pro model has a 40-litre tank and a built-in HEPA filter.", "es": "Claro. El modelo Pro tiene un depósito de 40 litros y un filtro HEPA incorporado.", "de": "Natürlich. Das Pro-Modell hat einen 40-Liter-Tank und einen eingebauten HEPA-Filter."}'::jsonb,
    '{"character": "Customer", "text": "What is the HEPA filter for?", "es": "¿Para qué sirve el filtro HEPA?", "de": "Wofür ist der HEPA-Filter?"}'::jsonb,
    '{"character": "Agent", "text": "It captures 99.9% of fine dust and allergens, so the air stays clean.", "es": "Captura el 99,9% del polvo fino y los alérgenos, así que el aire queda limpio.", "de": "Er fängt 99,9% des Feinstaubs und der Allergene, sodass die Luft sauber bleibt."}'::jsonb,
    '{"character": "Customer", "text": "How long does the battery last?", "es": "¿Cuánto dura la batería?", "de": "Wie lange hält der Akku?"}'::jsonb,
    '{"character": "Agent", "text": "The Pro runs for up to two hours on a single charge.", "es": "El Pro funciona hasta dos horas con una sola carga.", "de": "Das Pro-Modell läuft bis zu zwei Stunden mit einer einzigen Ladung."}'::jsonb,
    '{"character": "Customer", "text": "Does it come with a warranty?", "es": "¿Viene con garantía?", "de": "Kommt es mit Garantie?"}'::jsonb,
    '{"character": "Agent", "text": "Yes, all our products include a 2-year warranty and free technical support.", "es": "Sí, todos nuestros productos incluyen garantía de 2 años y soporte técnico gratuito.", "de": "Ja, alle unsere Produkte haben 2 Jahre Garantie und kostenlosen technischen Support."}'::jsonb,
    '{"character": "Customer", "text": "That sounds great. What is the price?", "es": "Parece estupendo. ¿Cuál es el precio?", "de": "Das klingt toll. Was ist der Preis?"}'::jsonb,
    '{"character": "Agent", "text": "The Pro model is £299. We also offer free installation on orders over £500.", "es": "El modelo Pro cuesta £299. También ofrecemos instalación gratuita en pedidos de más de £500.", "de": "Das Pro-Modell kostet £299. Bei Bestellungen über £500 bieten wir auch kostenlose Installation an."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El modelo Pro tiene un depósito de 40 litros.", "p_de": "Das Pro-Modell hat einen 40-Liter-Tank.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El filtro HEPA atrapa el 90% de las partículas.", "p_de": "Der HEPA-Filter fängt 90% der Partikel.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La batería dura hasta dos horas.", "p_de": "Der Akku hält bis zu zwei Stunden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La garantía es de 5 años.", "p_de": "Die Garantie beträgt 5 Jahre.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La instalación gratuita se ofrece en pedidos de más de £500.", "p_de": "Kostenlose Installation wird bei Bestellungen über £500 angeboten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Qué capacidad tiene el depósito del modelo Pro?", "p_de": "Welche Kapazität hat der Tank des Pro-Modells?", "s_es": {"type": "multiple_choice", "options": ["40 litres", "20 litres", "60 litres"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["40 Liter", "20 Liter", "60 Liter"], "answer": 0}}'::jsonb,
    '{"p": "¿Para qué sirve el filtro HEPA?", "p_de": "Wofür ist der HEPA-Filter?", "s_es": {"type": "multiple_choice", "options": ["To capture fine dust and allergens", "To increase battery life", "To reduce noise"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um Feinstaub und Allergene zu fangen", "Um die Akkulaufzeit zu verlängern", "Um Lärm zu reduzieren"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuánto tiempo dura la batería?", "p_de": "Wie lange hält der Akku?", "s_es": {"type": "multiple_choice", "options": ["Up to two hours", "Up to four hours", "Up to one hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis zu zwei Stunden", "Bis zu vier Stunden", "Bis zu einer Stunde"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuánto cuesta el modelo Pro?", "p_de": "Was kostet das Pro-Modell?", "s_es": {"type": "multiple_choice", "options": ["£299", "£149", "£399"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£299", "£149", "£399"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuándo se ofrece instalación gratuita?", "p_de": "Wann wird kostenlose Installation angeboten?", "s_es": {"type": "multiple_choice", "options": ["On orders over £500", "On all orders", "Only on Pro models"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bei Bestellungen über £500", "Bei allen Bestellungen", "Nur bei Pro-Modellen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4160 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 4160 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4160, 'en', 'dialogue', 'professional', '[{"name": "Customer", "gender": "female", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Agent", "gender": "male", "avatarURL": "https://example.com/avatars/agent.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Explica un producto a un cliente', 'Practica una conversación donde se presentan las características, batería, garantía y precio de un producto.'),
        (v_dialogue_id, 'de', 'Erkläre einem Kunden ein Produkt', 'Übe ein Gespräch, in dem Funktionen, Akku, Garantie und Preis eines Produkts vorgestellt werden.');
    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
        v_line_order := v_line_order + 1;
    END LOOP;
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
