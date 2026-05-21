-- ============================================================
-- Seed: A0 English Path – STEP 380 – Reading – make simple complaints, for example 'The water is cold' (Alojamiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Debes hablar con recepción si hay un problema simple.", "p_de": "Bei einem einfachen Problem soll man mit der Rezeption sprechen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto recomienda gritar al recepcionista.", "p_de": "Der Text empfiehlt, den Rezeptionisten anzuschreien.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Es buena idea decir primero el número de habitación.", "p_de": "Es ist gut, zuerst die Zimmernummer zu sagen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "«The water is cold» es un ejemplo de queja.", "p_de": "„The water is cold” ist ein Beispiel für eine Beschwerde.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que no puedes mencionar el ruido.", "p_de": "Der Text sagt, dass man den Lärm nicht erwähnen darf.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La recepción puede cambiar tu habitación.", "p_de": "Die Rezeption kann dein Zimmer wechseln.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Un técnico puede venir pronto.", "p_de": "Ein Techniker kann bald kommen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto recomienda hablar rápido y sin calma.", "p_de": "Der Text empfiehlt, schnell und ohne Ruhe zu sprechen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "«The room is dirty» aparece en el texto.", "p_de": "„The room is dirty” steht im Text.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "«Excuse me» es una forma educada de empezar.", "p_de": "„Excuse me” ist eine höfliche Art anzufangen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Con quién debes hablar primero?", "p_de": "Mit wem soll man zuerst sprechen?", "s": {"type": "multiple_choice", "options": ["Con recepción", "Con el cocinero", "Con otro huésped"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes decir después de saludar?", "p_de": "Was soll man nach der Begrüßung sagen?", "s": {"type": "multiple_choice", "options": ["El precio de la habitación", "Tu nacionalidad", "El número de habitación"], "answer": 2}}'::jsonb,
        '{"p": "¿Cuál es una queja del texto?", "p_de": "Welche Beschwerde steht im Text?", "s": {"type": "multiple_choice", "options": ["The breakfast is delicious", "The TV is broken", "The room is big"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué puede decir el recepcionista?", "p_de": "Was kann der Rezeptionist sagen?", "s": {"type": "multiple_choice", "options": ["No breakfast today", "You are late", "I''m sorry"], "answer": 2}}'::jsonb,
        '{"p": "¿Qué puede hacer el hotel si el problema sigue?", "p_de": "Was kann das Hotel tun, wenn das Problem bleibt?", "s": {"type": "multiple_choice", "options": ["Cambiar la habitación", "Cerrar la recepción", "Cobrar más"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién puede venir para arreglar algo?", "p_de": "Wer kann kommen, um etwas zu reparieren?", "s": {"type": "multiple_choice", "options": ["Un turista", "Un técnico", "Un conductor"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué actitud recomienda el texto?", "p_de": "Welche Haltung empfiehlt der Text?", "s": {"type": "multiple_choice", "options": ["Mantener la calma", "Hablar muy fuerte", "No decir nada"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema relacionado con el agua aparece?", "p_de": "Welches Problem mit Wasser steht im Text?", "s": {"type": "multiple_choice", "options": ["El agua es muy dulce", "No hay agua caliente", "Hay demasiada agua"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué frase educada usa el texto para pedir ayuda?", "p_de": "Welche höfliche Bitte steht im Text?", "s": {"type": "multiple_choice", "options": ["Give me a new room now", "Open the window", "Please can you help me?"], "answer": 2}}'::jsonb,
        '{"p": "¿Qué problema nocturno aparece en el texto?", "p_de": "Welches Nachtproblem steht im Text?", "s": {"type": "multiple_choice", "options": ["Mucho ruido", "Demasiada luz", "Mucho desayuno"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 380 AND path_uuid = v_path_id
    );
    DELETE FROM reading WHERE step_order = 380 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (
        v_path_id,
        380,
        'en',
        'reading',
        'accommodation',
        'If you have a simple problem in a hotel, the best thing to do is speak to reception. Always be polite and stay calm. It is easier to solve a problem when you are friendly.

Go to reception or call from your room. Start with a greeting: Hello or Excuse me. Then say your room number so the receptionist can find your booking. Speak slowly and clearly.

You can use these sentences to explain your problem: The water is cold. There is no hot water. The TV is broken. The heating does not work. The room is dirty. The window does not close. There is a lot of noise at night.

If you need help, say: Please can you help me? or Can you send someone?

The receptionist may answer: I''m sorry to hear that. We can send a technician. We can send someone to look at it. We can change your room. It will be fixed soon.

Remember to say thank you. Being polite helps everyone.'
    ) RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Quejas sencillas en un hotel');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Einfache Beschwerden im Hotel');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
