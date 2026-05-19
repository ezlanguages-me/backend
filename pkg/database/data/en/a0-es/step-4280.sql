-- ============================================================
-- Seed: A0 English Path – STEP 4280 – Dialogue – clarify technical requirements (Servicios Laborales)
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
        '{"character": "Engineer", "text": "Before we start, I need to confirm a few technical details.", "es": "Antes de empezar, necesito confirmar algunos detalles técnicos.", "de": "Bevor wir anfangen, muss ich einige technische Details bestätigen."}'::jsonb,
    '{"character": "Manager", "text": "Of course. What do you need to know?", "es": "Por supuesto. ¿Qué necesita saber?", "de": "Natürlich. Was brauchen Sie zu wissen?"}'::jsonb,
    '{"character": "Engineer", "text": "First, what is the voltage of the building''s electrical supply?", "es": "Primero, ¿cuál es el voltaje del suministro eléctrico del edificio?", "de": "Zuerst, wie hoch ist die Spannung der Stromversorgung des Gebäudes?"}'::jsonb,
    '{"character": "Manager", "text": "It is 230 volts, 50 hertz. Standard UK supply.", "es": "Es de 230 voltios, 50 hercios. Suministro estándar del Reino Unido.", "de": "Es sind 230 Volt, 50 Hertz. Standard-UK-Versorgung."}'::jsonb,
    '{"character": "Engineer", "text": "Good. And how many square metres is the room where the unit will be installed?", "es": "Bien. ¿Y cuántos metros cuadrados tiene la habitación donde se instalará la unidad?", "de": "Gut. Und wie viele Quadratmeter hat der Raum, in dem das Gerät installiert wird?"}'::jsonb,
    '{"character": "Manager", "text": "It is approximately 80 square metres.", "es": "Son aproximadamente 80 metros cuadrados.", "de": "Es sind ungefähr 80 Quadratmeter."}'::jsonb,
    '{"character": "Engineer", "text": "Perfect. The AC-12 is the right unit for that size. Are there any special requirements?", "es": "Perfecto. El AC-12 es la unidad adecuada para ese tamaño. ¿Hay algún requisito especial?", "de": "Perfekt. Das AC-12 ist das richtige Gerät für diese Größe. Gibt es besondere Anforderungen?"}'::jsonb,
    '{"character": "Manager", "text": "We need it to be as quiet as possible. Staff work nearby.", "es": "Necesitamos que sea lo más silencioso posible. El personal trabaja cerca.", "de": "Wir brauchen es so leise wie möglich. Das Personal arbeitet in der Nähe."}'::jsonb,
    '{"character": "Engineer", "text": "The AC-12 operates at 45 dB maximum, which should be comfortable for office use.", "es": "El AC-12 funciona a un máximo de 45 dB, lo que debería ser cómodo para uso en oficina.", "de": "Das AC-12 arbeitet bei maximal 45 dB, was für die Büronutzung angenehm sein sollte."}'::jsonb,
    '{"character": "Manager", "text": "That sounds ideal. When can you start the installation?", "es": "Parece ideal. ¿Cuándo puede empezar la instalación?", "de": "Das klingt ideal. Wann können Sie mit der Installation beginnen?"}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El ingeniero necesita confirmar detalles técnicos antes de empezar.", "p_de": "Der Ingenieur muss technische Details bestätigen, bevor er anfängt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El suministro eléctrico del edificio es de 110V.", "p_de": "Die Stromversorgung des Gebäudes beträgt 110V.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La sala donde se instalará la unidad tiene 80 metros cuadrados.", "p_de": "Der Raum, in dem das Gerät installiert wird, hat 80 Quadratmeter.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El requisito especial del gerente es que el sistema sea muy potente.", "p_de": "Die besondere Anforderung des Managers ist, dass das System sehr leistungsstark ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El AC-12 funciona a un máximo de 45 dB.", "p_de": "Das AC-12 arbeitet bei maximal 45 dB.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Qué confirma el ingeniero antes de empezar?", "p_de": "Was bestätigt der Ingenieur vor dem Start?", "s_es": {"type": "multiple_choice", "options": ["Technical requirements", "The contract price", "The client''s name"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Technische Anforderungen", "Den Vertragspreis", "Den Namen des Kunden"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuál es el voltaje del edificio?", "p_de": "Wie hoch ist die Spannung des Gebäudes?", "s_es": {"type": "multiple_choice", "options": ["230V", "110V", "400V"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["230V", "110V", "400V"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuántos metros cuadrados tiene la sala?", "p_de": "Wie viele Quadratmeter hat der Raum?", "s_es": {"type": "multiple_choice", "options": ["Approximately 80", "Approximately 120", "Approximately 50"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ungefähr 80", "Ungefähr 120", "Ungefähr 50"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuál es el requisito especial del gerente?", "p_de": "Was ist die besondere Anforderung des Managers?", "s_es": {"type": "multiple_choice", "options": ["As quiet as possible", "As powerful as possible", "As cheap as possible"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["So leise wie möglich", "So leistungsstark wie möglich", "So günstig wie möglich"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuál es el nivel de ruido máximo del AC-12?", "p_de": "Was ist der maximale Geräuschpegel des AC-12?", "s_es": {"type": "multiple_choice", "options": ["45 dB", "60 dB", "30 dB"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["45 dB", "60 dB", "30 dB"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4280 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 4280 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4280, 'en', 'dialogue', 'professional', '[{"name": "Engineer", "gender": "male", "avatarURL": "https://example.com/avatars/engineer.png"}, {"name": "Manager", "gender": "female", "avatarURL": "https://example.com/avatars/manager.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Aclara los requisitos técnicos', 'Practica una conversación para verificar voltaje, tamaño de sala y requisitos especiales antes de una instalación.'),
        (v_dialogue_id, 'de', 'Kläre technische Anforderungen', 'Übe ein Gespräch zur Überprüfung von Spannung, Raumgröße und besonderen Anforderungen vor einer Installation.');
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
