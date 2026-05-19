-- ============================================================
-- Seed: A0 English Path – STEP 420 – Reading – make a complaint about simple matters, for example 'The light in my room doesn't work.' (Alojamiento)
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
        '{"p": "Puedes preguntar cuándo vendrá el técnico.", "p_de": "Man kann fragen, wann der Techniker kommt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hablar con claridad ayuda a resolver el problema más rápido.", "p_de": "Klare Informationen helfen, das Problem schneller zu lösen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "«The window doesn''t close» es un problema posible.", "p_de": "„The window doesn''t close“ ist ein mögliches Problem.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto trata sobre pedir comida en un hotel.", "p_de": "Der Text handelt davon, Essen im Hotel zu bestellen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "«Can you send someone, please?» es una petición educada.", "p_de": "„Can you send someone, please?“ ist eine höfliche Bitte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué debes hacer al principio?", "p_de": "Was soll man am Anfang tun?", "s": {"type": "multiple_choice", "options": ["Decir el número de habitación", "Hablar de tu desayuno", "Explicar tu viaje"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema aparece en el texto?", "p_de": "Welches Problem steht im Text?", "s": {"type": "multiple_choice", "options": ["La luz no funciona", "La cama es nueva", "La llave es azul"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puedes pedir si falta algo en el baño?", "p_de": "Was kann man bitten, wenn im Bad etwas fehlt?", "s": {"type": "multiple_choice", "options": ["Una toalla", "Una mesa", "Un ascensor"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué frase pregunta por el técnico?", "p_de": "Welche Frage bezieht sich auf den Techniker?", "s": {"type": "multiple_choice", "options": ["When will the technician come?", "Where is the breakfast room?", "What is your name?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema de la ventana aparece?", "p_de": "Welches Problem mit dem Fenster wird erwähnt?", "s": {"type": "multiple_choice", "options": ["No cierra", "No tiene color", "Es muy grande"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué equipo de la habitación puede no funcionar?", "p_de": "Welches Gerät im Zimmer kann nicht funktionieren?", "s": {"type": "multiple_choice", "options": ["El aire acondicionado", "El desayuno", "La recepción"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué es útil dar información clara?", "p_de": "Warum ist klare Information nützlich?", "s": {"type": "multiple_choice", "options": ["Porque ayuda a solucionar el problema más rápido", "Porque cambia el precio", "Porque cierra el hotel"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo debe ser la petición?", "p_de": "Wie sollte die Bitte sein?", "s": {"type": "multiple_choice", "options": ["Educada", "Agresiva", "Muy larga"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué otro problema del baño se menciona?", "p_de": "Welches andere Badproblem wird erwähnt?", "s": {"type": "multiple_choice", "options": ["La ducha está rota", "No hay música", "La silla es roja"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué palabra describe bien la información que debes dar?", "p_de": "Welches Wort beschreibt die Information, die man geben soll?", "s": {"type": "multiple_choice", "options": ["Clara", "Secreta", "Difícil"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM reading WHERE step_order = 420 AND path_uuid = v_path_id
            );
            DELETE FROM reading WHERE step_order = 420 AND path_uuid = v_path_id;

            INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
            VALUES (v_path_id, 420, 'en', 'reading', 'accommodation', 'When you make a more specific complaint in a hotel, explain exactly what is wrong. Start with Hello or Excuse me, and give your room number.

You can say: The light in my room doesn''t work. The shower is broken. There is no towel in the bathroom. The window doesn''t close. The air conditioning doesn''t work.

Then ask politely: Can you send someone, please? Can I have a towel, please? When will the technician come? Clear information helps the receptionist solve the problem faster.')
            RETURNING uuid INTO v_reading_id;

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
