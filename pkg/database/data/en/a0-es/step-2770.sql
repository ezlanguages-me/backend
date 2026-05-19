-- ============================================================
-- Seed: A0 English Path – STEP 2770 – Reading – Lee información sobre servicios de salud
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay citas con el médico de lunes a viernes.", "p_de": "Es gibt Arzttermine von Montag bis Freitag.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clínica de enfermería ofrece vacunas, tensión y cuidado de heridas.", "p_de": "Die Pflegeklinik bietet Impfungen, Blutdruckkontrollen und Wundpflege an.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Urgent care es para cortarse el pelo.", "p_de": "Urgent care ist zum Haareschneiden.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El servicio de intérprete es gratis si se reserva antes.", "p_de": "Der Dolmetscherdienst ist kostenlos, wenn man ihn vorher bucht.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Para registrarte debes llevar ID, dirección y tarjeta sanitaria.", "p_de": "Zur Anmeldung soll man ID, Adresse und Gesundheitskarte mitbringen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los niños menores de 16 pueden ir solos a la clínica de enfermería.", "p_de": "Kinder unter 16 können allein in die Pflegeklinik gehen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las personas con problemas de respiración pueden usar urgent care.", "p_de": "Menschen mit Atemproblemen können urgent care nutzen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que la clínica cierra todo el año.", "p_de": "Im Text steht, dass die Klinik das ganze Jahr geschlossen ist.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuándo hay citas con el GP?", "p_de": "Wann gibt es GP-Termine?", "s": {"type": "multiple_choice", "options": ["From Monday to Friday", "Only on Sunday", "At night only"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["From Monday to Friday", "Only on Sunday", "At night only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["From Monday to Friday", "Only on Sunday", "At night only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ofrece la clínica de enfermería?", "p_de": "Was bietet die Pflegeklinik an?", "s": {"type": "multiple_choice", "options": ["Vaccines, blood pressure checks, and wound care", "Dentist chairs only", "Train tickets"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Vaccines, blood pressure checks, and wound care", "Dentist chairs only", "Train tickets"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vaccines, blood pressure checks, and wound care", "Dentist chairs only", "Train tickets"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué es urgent care?", "p_de": "Wofür ist urgent care?", "s": {"type": "multiple_choice", "options": ["Strong pain, fever, or breathing problems", "Buying medicine only", "Hotel questions"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Strong pain, fever, or breathing problems", "Buying medicine only", "Hotel questions"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Strong pain, fever, or breathing problems", "Buying medicine only", "Hotel questions"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es el servicio de intérprete?", "p_de": "Wie ist der Dolmetscherdienst?", "s": {"type": "multiple_choice", "options": ["Free if you book it first", "Always expensive", "Only for tourists"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Free if you book it first", "Always expensive", "Only for tourists"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Free if you book it first", "Always expensive", "Only for tourists"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes llevar para registrarte?", "p_de": "Was musst du zur Anmeldung mitbringen?", "s": {"type": "multiple_choice", "options": ["ID, address, and health card", "Only cash", "A suitcase"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["ID, address, and health card", "Only cash", "A suitcase"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["ID, address, and health card", "Only cash", "A suitcase"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién puede acompañar a un menor de 16?", "p_de": "Wer kann ein Kind unter 16 begleiten?", "s": {"type": "multiple_choice", "options": ["A parent or guardian", "A taxi driver", "A waiter"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A parent or guardian", "A taxi driver", "A waiter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A parent or guardian", "A taxi driver", "A waiter"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Welche Art Text ist das?", "s": {"type": "multiple_choice", "options": ["Information about health services", "A recipe for soup", "A cinema advert"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Information about health services", "A recipe for soup", "A cinema advert"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Information about health services", "A recipe for soup", "A cinema advert"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema aparece como motivo de urgent care?", "p_de": "Welches Problem wird als Grund für urgent care genannt?", "s": {"type": "multiple_choice", "options": ["Breathing problems", "A broken umbrella", "A late bus"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Breathing problems", "A broken umbrella", "A late bus"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Breathing problems", "A broken umbrella", "A late bus"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2770 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2770 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2770, 'en', 'reading', 'health', 'Riverside Health Centre Services

GP appointments are available from Monday to Friday. The nurse clinic offers vaccines, blood pressure checks, and wound care. Urgent care is for strong pain, fever, or breathing problems.

An interpreter service is free if you book it first. Bring ID, your address, and your health card when you register.

Children under 16 can use the nurse clinic with a parent or guardian.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee información sobre servicios de salud', 'Lee un folleto corto sobre servicios, derechos y registro en un centro de salud.'),
        (v_reading_id, 'de', 'Lies Informationen über Gesundheitsdienste', 'Lies ein kurzes Faltblatt über Dienste, Ansprüche und Anmeldung in einem Gesundheitszentrum.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
