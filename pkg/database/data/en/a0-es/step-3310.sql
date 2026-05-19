-- ============================================================
-- Seed: A0 English Path – STEP 3310 – Reading – read a doctor's emergency instructions
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Hay que tomar una pastilla para el dolor cada seis horas con agua.", "de": "Man soll alle sechs Stunden eine Schmerztablette mit Wasser nehmen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El médico dice que hoy sí se puede conducir.", "de": "Der Arzt sagt, dass man heute fahren darf.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay que llamar al 112 si hay dolor en el pecho.", "de": "Man soll 112 anrufen, wenn Brustschmerzen auftreten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Si hay fiebre alta, hay que llamar al número de urgencias de la clínica.", "de": "Bei hohem Fieber soll man die Notfallnummer der Klinik anrufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El vendaje puede mojarse sin problema.", "de": "Der Verband darf ruhig nass werden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay que cambiar el vendaje mañana por la mañana.", "de": "Der Verband soll morgen früh gewechselt werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se pueden levantar bolsas pesadas durante dos días.", "de": "Man darf zwei Tage lang schwere Taschen heben.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La mesa de urgencias está en City Clinic, Entrance C, abierta toda la noche.", "de": "Der Notfallschalter ist in der City Clinic, Eingang C, und die ganze Nacht offen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cómo toma la persona la pastilla?", "de": "Wie nimmt die Person die Tablette ein?", "s_es": {"type": "multiple_choice", "options": ["With water", "With coffee", "With juice only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Wasser", "Mit Kaffee", "Nur mit Saft"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo cambia el vendaje?", "de": "Wann wechselt sie den Verband?", "s_es": {"type": "multiple_choice", "options": ["Tomorrow morning", "Tonight", "Next week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Morgen früh", "Heute Abend", "Nächste Woche"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué problema necesita una llamada al 112?", "de": "Welches Problem braucht einen Anruf bei 112?", "s_es": {"type": "multiple_choice", "options": ["Trouble breathing", "A small headache", "Cold hands"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Atemprobleme", "Leichte Kopfschmerzen", "Kalte Hände"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el número de urgencias de la clínica?", "de": "Wie lautet die Notfallnummer der Klinik?", "s_es": {"type": "multiple_choice", "options": ["020 4550 7000", "020 4550 7700", "020 4450 7000"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["020 4550 7000", "020 4550 7700", "020 4450 7000"], "answer": 0}}'::jsonb,
        '{"es": "¿Durante cuánto tiempo no se levantan bolsas pesadas?", "de": "Wie lange soll man keine schweren Taschen heben?", "s_es": {"type": "multiple_choice", "options": ["For two days", "For one week", "For one hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Tage lang", "Eine Woche lang", "Eine Stunde lang"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace la persona si se marea?", "de": "Was macht die Person, wenn ihr schwindlig ist?", "s_es": {"type": "multiple_choice", "options": ["Sit down and ask another adult to stay", "Run outside", "Take a taxi home"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sich hinsetzen und eine andere erwachsene Person dabeibleiben lassen", "Nach draußen rennen", "Mit dem Taxi nach Hause fahren"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está la mesa de urgencias?", "de": "Wo ist der Notfallschalter?", "s_es": {"type": "multiple_choice", "options": ["At City Clinic, Entrance C", "At Riverside Hospital, Entrance A", "At the pharmacy desk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In der City Clinic, Eingang C", "Im Riverside Hospital, Eingang A", "Am Apothekenschalter"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué no debe hacer la persona hoy?", "de": "Was soll die Person heute nicht tun?", "s_es": {"type": "multiple_choice", "options": ["Drive", "Drink water", "Call the clinic"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fahren", "Wasser trinken", "Die Klinik anrufen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3310 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3310 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3310 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3310 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3310 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3310 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3310 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3310 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3310 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3310 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3310, 'en', 'reading', 'emergency', $content$
Dr Patel Emergency Instructions. Take one pain tablet every six hours with water. Do not drive today.

Call 112 at once if you have chest pain, trouble breathing, or heavy bleeding. If you get a high fever, call the clinic emergency number 020 4550 7000.

Keep the bandage clean and dry. Change it tomorrow morning. Do not lift heavy bags for two days.

If you feel dizzy, sit down and ask another adult to stay with you. The emergency desk is at City Clinic, Entrance C, open all night.
$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee las instrucciones de urgencia de un médico', 'Lee una tarjeta médica con medicación, señales de alarma y datos de una clínica de urgencias.'),
        (v_reading_id, 'de', 'Lies die Notfallanweisungen eines Arztes', 'Lies eine ärztliche Karte mit Medikamenten, Warnzeichen und Daten einer Notfallklinik.');

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
