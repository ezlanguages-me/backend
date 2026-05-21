-- ============================================================
-- Seed: A0 English Path – STEP 420 – Reading – make a complaint about simple matters, for example 'The light in my room doesn’t work.' (Alojamiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Debes explicar exactamente cuál es el problema.", "p_de": "Man soll genau erklären, was das Problem ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No es necesario decir el número de habitación.", "p_de": "Es ist nicht nötig, die Zimmernummer zu sagen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "«The light in my room doesn''t work» aparece como ejemplo.", "p_de": "„The light in my room doesn''t work“ steht als Beispiel im Text.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto menciona una ducha rota.", "p_de": "Im Text wird eine kaputte Dusche erwähnt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que nunca pidas toallas.", "p_de": "Der Text sagt, man soll nie um Handtücher bitten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El texto dice que hablar en voz alta soluciona el problema más rápido.", "p_de": "Der Text sagt, laut zu sprechen löst das Problem schneller.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Puedes pedir que envíen a alguien para arreglar un problema.", "p_de": "Man kann darum bitten, jemanden zu schicken, um das Problem zu lösen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que el problema de la ventana es que no abre.", "p_de": "Der Text sagt, das Problem mit dem Fenster sei, dass es nicht aufgeht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El texto trata sobre pedir comida en un hotel.", "p_de": "Der Text handelt davon, Essen im Hotel zu bestellen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "«Can you send someone, please?» es una petición educada.", "p_de": "„Can you send someone, please?“ ist eine höfliche Bitte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué debes hacer al principio?", "p_de": "Was soll man am Anfang tun?", "s": {"type": "multiple_choice", "options": ["Decir el número de habitación", "Hablar de tu desayuno", "Explicar tu viaje"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema aparece en el texto?", "p_de": "Welches Problem steht im Text?", "s": {"type": "multiple_choice", "options": ["La cama es nueva", "La llave es azul", "La luz no funciona"], "answer": 2}}'::jsonb,
        '{"p": "¿Qué puedes pedir si falta algo en el baño?", "p_de": "Was kann man bitten, wenn im Bad etwas fehlt?", "s": {"type": "multiple_choice", "options": ["Una mesa", "Una toalla", "Un ascensor"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué frase pregunta por el técnico?", "p_de": "Welche Frage bezieht sich auf den Techniker?", "s": {"type": "multiple_choice", "options": ["Where is the breakfast room?", "What is your name?", "When will the technician come?"], "answer": 2}}'::jsonb,
        '{"p": "¿Qué problema de la ventana aparece?", "p_de": "Welches Problem mit dem Fenster wird erwähnt?", "s": {"type": "multiple_choice", "options": ["Es muy grande", "No cierra", "No tiene color"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué equipo de la habitación puede no funcionar?", "p_de": "Welches Gerät im Zimmer kann nicht funktionieren?", "s": {"type": "multiple_choice", "options": ["El desayuno", "El aire acondicionado", "La recepción"], "answer": 1}}'::jsonb,
        '{"p": "¿Por qué es útil dar información clara?", "p_de": "Warum ist klare Information nützlich?", "s": {"type": "multiple_choice", "options": ["Porque cambia el precio", "Porque cierra el hotel", "Porque ayuda a solucionar el problema más rápido"], "answer": 2}}'::jsonb,
        '{"p": "¿Cómo debe ser la petición?", "p_de": "Wie sollte die Bitte sein?", "s": {"type": "multiple_choice", "options": ["Educada", "Agresiva", "Muy larga"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué otro problema del baño se menciona?", "p_de": "Welches andere Badproblem wird erwähnt?", "s": {"type": "multiple_choice", "options": ["No hay música", "La ducha está rota", "La silla es roja"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué palabra describe bien la información que debes dar?", "p_de": "Welches Wort beschreibt die Information, die man geben soll?", "s": {"type": "multiple_choice", "options": ["Secreta", "Difícil", "Clara"], "answer": 2}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 420 AND path_uuid = v_path_id
    );
    DELETE FROM reading WHERE step_order = 420 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (
        v_path_id,
        420,
        'en',
        'reading',
        'accommodation',
        'When you have a problem in your hotel room, explain exactly what is wrong. Start with "Hello" or "Excuse me", and always give your room number. This helps the receptionist find your room quickly and send the right person to help you.

Common problems in hotel rooms include: the light does not work, the shower is broken, the window does not close, the air conditioning is too loud, or the heating does not turn on. In the bathroom, you may find there are no towels, no soap, or no hot water.

You can describe the problem in a simple sentence: "The TV in my room does not work. The screen is black." Or: "The safe does not open. I need my passport." Be clear and specific about what is wrong.

After describing the problem, make a polite request. You can say: "Can you send someone, please?" or "When will the technician come?" If something is missing, ask: "Can I have a towel, please?" or "Can I have more soap, please?"

The hotel staff want to help you. If you give clear information about the room number and the problem, they can solve it faster. Always speak calmly and politely.'
    ) RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Quejas específicas en el hotel');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Spezifische Beschwerden im Hotel');

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
