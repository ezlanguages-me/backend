-- ============================================================
-- Seed: A0 English Path – STEP 2500 – Grammar – Órdenes y Sugerencias
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_grammar_id UUID;
    v_rule1_id UUID;
    v_rule2_id UUID;
    v_rule3_id UUID;
    v_rule4_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_rule1_exercises JSONB[] := ARRAY[
        '{"p": "Completa la orden positiva: ___ the window. (open)", "p_de": "Ergänze den positiven Befehl: ___ the window. (open)", "s": {"type": "typing", "correct_answers": ["Open"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la orden: ___ down, please. (sit)", "p_de": "Ergänze den Befehl: ___ down, please. (sit)", "s": {"type": "typing", "correct_answers": ["Sit"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa con be: ___ careful.", "p_de": "Ergänze mit be: ___ careful.", "s": {"type": "typing", "correct_answers": ["Be"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la orden: ___ left at the hospital entrance. (turn)", "p_de": "Ergänze den Befehl: ___ left at the hospital entrance. (turn)", "s": {"type": "typing", "correct_answers": ["Turn"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe la orden negativa: ___ the bottle. (don''t / touch)", "p_de": "Schreibe den negativen Befehl: ___ the bottle. (don''t / touch)", "s": {"type": "typing", "correct_answers": ["Don''t touch"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa: ___ late for the appointment. (don''t / be)", "p_de": "Ergänze: ___ late for the appointment. (don''t / be)", "s": {"type": "typing", "correct_answers": ["Don''t be"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe la orden: ___ your hands. (wash)", "p_de": "Schreibe den Befehl: ___ your hands. (wash)", "s": {"type": "typing", "correct_answers": ["Wash"], "case_sensitive": false}}'::jsonb,
        '{"p": "Elige la orden correcta: ___ the door.", "p_de": "Wähle den richtigen Befehl: ___ the door.", "s": {"type": "multiple_choice", "options": ["Open", "Opens", "Opening"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Open", "Opens", "Opening"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Open", "Opens", "Opening"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma negativa correcta: ___ the medicine now.", "p_de": "Wähle die richtige negative Form: ___ the medicine now.", "s": {"type": "multiple_choice", "options": ["Don''t take", "Not take", "Doesn''t take"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Don''t take", "Not take", "Doesn''t take"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Don''t take", "Not take", "Doesn''t take"], "answer": 0}}'::jsonb,
        '{"p": "Elige la advertencia correcta.", "p_de": "Wähle die richtige Warnung.", "s": {"type": "multiple_choice", "options": ["Be careful", "Careful be", "Are careful"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Be careful", "Careful be", "Are careful"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Be careful", "Careful be", "Are careful"], "answer": 0}}'::jsonb,
        '{"p": "En un cartel del hospital: ___ here.", "p_de": "Auf einem Schild im Krankenhaus: ___ here.", "s": {"type": "multiple_choice", "options": ["Wait", "Waits", "Waiting"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Wait", "Waits", "Waiting"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wait", "Waits", "Waiting"], "answer": 0}}'::jsonb,
        '{"p": "Elige la orden correcta: ___ the nurse.", "p_de": "Wähle den richtigen Befehl: ___ the nurse.", "s": {"type": "multiple_choice", "options": ["Ask", "Asks", "Asked"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Ask", "Asks", "Asked"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ask", "Asks", "Asked"], "answer": 0}}'::jsonb,
        '{"p": "Elige la orden correcta: ___ on the bed.", "p_de": "Wähle den richtigen Befehl: ___ on the bed.", "s": {"type": "multiple_choice", "options": ["Sit", "Sits", "Sitting"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Sit", "Sits", "Sitting"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sit", "Sits", "Sitting"], "answer": 0}}'::jsonb,
        '{"p": "Elige la advertencia correcta para algo caliente.", "p_de": "Wähle die richtige Warnung für etwas Heißes.", "s": {"type": "multiple_choice", "options": ["Don''t touch", "No touch", "Not touching"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Don''t touch", "No touch", "Not touching"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Don''t touch", "No touch", "Not touching"], "answer": 0}}'::jsonb,
        '{"p": "En las órdenes usamos normalmente el verbo base.", "p_de": "In Befehlen benutzen wir normalerweise das Grundverb.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Open the door es un imperativo correcto.", "p_de": "Open the door ist ein korrekter Imperativ.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Don''t touch es una orden negativa.", "p_de": "Don''t touch ist ein negativer Befehl.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "You opens the window es la forma normal del imperativo.", "p_de": "You opens the window ist die normale Imperativform.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Be careful es inglés correcto.", "p_de": "Be careful ist korrektes Englisch.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Don''t be late es una forma negativa correcta.", "p_de": "Don''t be late ist eine korrekte negative Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los imperativos muchas veces no llevan sujeto.", "p_de": "Imperative haben oft kein Subjekt.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Open", "the", "window."], "correct_order": [0, 1, 2]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Don''t", "touch", "that."], "correct_order": [0, 1, 2]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Be", "careful."], "correct_order": [0, 1]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Turn", "left", "here."], "correct_order": [0, 1, 2]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Wait", "outside."], "correct_order": [0, 1]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Wash", "your", "hands."], "correct_order": [0, 1, 2]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Don''t", "be", "late."], "correct_order": [0, 1, 2]}}'::jsonb
    ];
    v_rule2_exercises JSONB[] := ARRAY[
        '{"p": "Completa la sugerencia: ___ go to the clinic now.", "p_de": "Ergänze den Vorschlag: ___ go to the clinic now.", "s": {"type": "typing", "correct_answers": ["Let''s"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa: Let''s ___ this cream.", "p_de": "Ergänze: Let''s ___ this cream.", "s": {"type": "typing", "correct_answers": ["try"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la sugerencia: ___ wait here for the nurse.", "p_de": "Ergänze den Vorschlag: ___ wait here for the nurse.", "s": {"type": "typing", "correct_answers": ["Let''s"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa: Let''s ___ some water.", "p_de": "Ergänze: Let''s ___ some water.", "s": {"type": "typing", "correct_answers": ["drink"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la sugerencia: ___ take a taxi to the hospital.", "p_de": "Ergänze den Vorschlag: ___ take a taxi to the hospital.", "s": {"type": "typing", "correct_answers": ["Let''s"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa: Let''s ___ the receptionist.", "p_de": "Ergänze: Let''s ___ the receptionist.", "s": {"type": "typing", "correct_answers": ["ask"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la sugerencia: ___ sit down for a minute.", "p_de": "Ergänze den Vorschlag: ___ sit down for a minute.", "s": {"type": "typing", "correct_answers": ["Let''s"], "case_sensitive": false}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Let''s call the doctor.", "Let''s calls the doctor.", "Let us to call the doctor."], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Let''s call the doctor.", "Let''s calls the doctor.", "Let us to call the doctor."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Let''s call the doctor.", "Let''s calls the doctor.", "Let us to call the doctor."], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta después de Let''s.", "p_de": "Wähle die richtige Form nach Let''s.", "s": {"type": "multiple_choice", "options": ["Let''s go home.", "Let''s goes home.", "Let''s to go home."], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Let''s go home.", "Let''s goes home.", "Let''s to go home."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Let''s go home.", "Let''s goes home.", "Let''s to go home."], "answer": 0}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Let''s try this medicine.", "Let''s tries this medicine.", "Let''s to try this medicine."], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Let''s try this medicine.", "Let''s tries this medicine.", "Let''s to try this medicine."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Let''s try this medicine.", "Let''s tries this medicine.", "Let''s to try this medicine."], "answer": 0}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Let''s wait outside.", "Let''s waits outside.", "Let''s waiting outside."], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Let''s wait outside.", "Let''s waits outside.", "Let''s waiting outside."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Let''s wait outside.", "Let''s waits outside.", "Let''s waiting outside."], "answer": 0}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Let''s check the address.", "Let''s checks the address.", "Let''s checking the address."], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Let''s check the address.", "Let''s checks the address.", "Let''s checking the address."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Let''s check the address.", "Let''s checks the address.", "Let''s checking the address."], "answer": 0}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Let''s drink some water.", "Let''s drinks some water.", "Let''s to drink some water."], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Let''s drink some water.", "Let''s drinks some water.", "Let''s to drink some water."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Let''s drink some water.", "Let''s drinks some water.", "Let''s to drink some water."], "answer": 0}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Let''s rest today.", "Let''s rests today.", "Let''s resting today."], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Let''s rest today.", "Let''s rests today.", "Let''s resting today."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Let''s rest today.", "Let''s rests today.", "Let''s resting today."], "answer": 0}}'::jsonb,
        '{"p": "Let''s se usa para sugerencias con we.", "p_de": "Let''s wird für Vorschläge mit we benutzt.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Let''s goes now es correcto.", "p_de": "Let''s goes now ist richtig.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Let''s try this es una sugerencia.", "p_de": "Let''s try this ist ein Vorschlag.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Después de Let''s usamos el verbo base.", "p_de": "Nach Let''s benutzen wir das Grundverb.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Let''s we go es correcto.", "p_de": "Let''s we go ist richtig.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Let''s sit here puede invitar a otra persona.", "p_de": "Let''s sit here kann eine andere Person einladen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Let''s es la forma corta de Let us.", "p_de": "Let''s ist die Kurzform von Let us.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Let''s", "go", "home."], "correct_order": [0, 1, 2]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Let''s", "try", "this", "soup."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Let''s", "wait", "here."], "correct_order": [0, 1, 2]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Let''s", "ask", "the", "nurse."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Let''s", "drink", "some", "water."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Let''s", "call", "a", "taxi."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Let''s", "sit", "outside."], "correct_order": [0, 1, 2]}}'::jsonb
    ];
    v_rule3_exercises JSONB[] := ARRAY[
        '{"p": "Escribe una sugerencia amable a otra persona para probar la sopa.", "p_de": "Schreibe einen höflichen Vorschlag, die Suppe zu probieren.", "s": {"type": "typing", "correct_answers": ["Why don''t you try the soup"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe una sugerencia amable a otra persona para llamar al doctor.", "p_de": "Schreibe einen höflichen Vorschlag, den Arzt anzurufen.", "s": {"type": "typing", "correct_answers": ["Why don''t you call the doctor"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe una sugerencia para el grupo para sentarse aquí.", "p_de": "Schreibe einen Vorschlag für die Gruppe, sich hier hinzusetzen.", "s": {"type": "typing", "correct_answers": ["Why don''t we sit here"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe una sugerencia para el grupo para hacer una pausa.", "p_de": "Schreibe einen Vorschlag für die Gruppe, eine Pause zu machen.", "s": {"type": "typing", "correct_answers": ["Why don''t we take a break"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe una sugerencia amable a otra persona para descansar hoy.", "p_de": "Schreibe einen höflichen Vorschlag, heute zu ruhen.", "s": {"type": "typing", "correct_answers": ["Why don''t you rest today"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe una sugerencia para el grupo para comer ahora.", "p_de": "Schreibe einen Vorschlag für die Gruppe, jetzt zu essen.", "s": {"type": "typing", "correct_answers": ["Why don''t we eat now"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe una sugerencia amable a otra persona para preguntar al farmacéutico.", "p_de": "Schreibe einen höflichen Vorschlag, den Apotheker zu fragen.", "s": {"type": "typing", "correct_answers": ["Why don''t you ask the pharmacist"], "case_sensitive": false}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Why don''t you try the salad?", "Why not you try the salad?", "Why don''t you tries the salad?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Why don''t you try the salad?", "Why not you try the salad?", "Why don''t you tries the salad?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Why don''t you try the salad?", "Why not you try the salad?", "Why don''t you tries the salad?"], "answer": 0}}'::jsonb,
        '{"p": "Elige la propuesta correcta para el grupo.", "p_de": "Wähle den richtigen Gruppenvorschlag.", "s": {"type": "multiple_choice", "options": ["Why don''t we eat here?", "Why don''t we eats here?", "Why don''t we to eat here?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Why don''t we eat here?", "Why don''t we eats here?", "Why don''t we to eat here?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Why don''t we eat here?", "Why don''t we eats here?", "Why don''t we to eat here?"], "answer": 0}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Why don''t you rest today?", "Why don''t you rests today?", "Why you don''t rest today?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Why don''t you rest today?", "Why don''t you rests today?", "Why you don''t rest today?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Why don''t you rest today?", "Why don''t you rests today?", "Why you don''t rest today?"], "answer": 0}}'::jsonb,
        '{"p": "Elige la propuesta correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Why don''t we wait outside?", "Why don''t we waits outside?", "Why don''t wait we outside?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Why don''t we wait outside?", "Why don''t we waits outside?", "Why don''t wait we outside?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Why don''t we wait outside?", "Why don''t we waits outside?", "Why don''t wait we outside?"], "answer": 0}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Why don''t you call a taxi?", "Why don''t you calls a taxi?", "Why not you call a taxi?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Why don''t you call a taxi?", "Why don''t you calls a taxi?", "Why not you call a taxi?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Why don''t you call a taxi?", "Why don''t you calls a taxi?", "Why not you call a taxi?"], "answer": 0}}'::jsonb,
        '{"p": "Elige la propuesta correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Why don''t we ask the nurse?", "Why don''t we asks the nurse?", "Why don''t ask we the nurse?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Why don''t we ask the nurse?", "Why don''t we asks the nurse?", "Why don''t ask we the nurse?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Why don''t we ask the nurse?", "Why don''t we asks the nurse?", "Why don''t ask we the nurse?"], "answer": 0}}'::jsonb,
        '{"p": "Elige la sugerencia correcta.", "p_de": "Wähle den richtigen Vorschlag.", "s": {"type": "multiple_choice", "options": ["Why don''t you drink some water?", "Why don''t you drinks some water?", "Why you don''t drink some water?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Why don''t you drink some water?", "Why don''t you drinks some water?", "Why you don''t drink some water?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Why don''t you drink some water?", "Why don''t you drinks some water?", "Why you don''t drink some water?"], "answer": 0}}'::jsonb,
        '{"p": "Why don''t you...? sirve para hacer una sugerencia a otra persona.", "p_de": "Why don''t you...? dient dazu, einer anderen Person etwas vorzuschlagen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Why don''t we...? sirve para hacer una propuesta en grupo.", "p_de": "Why don''t we...? dient für einen Gruppenvorschlag.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Why don''t you tries this? es correcto.", "p_de": "Why don''t you tries this? ist richtig.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Después de Why don''t we usamos el verbo base.", "p_de": "Nach Why don''t we benutzen wir das Grundverb.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Why don''t we sit here? es una frase correcta.", "p_de": "Why don''t we sit here? ist ein korrekter Satz.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Why don''t you to call him? es correcto.", "p_de": "Why don''t you to call him? ist richtig.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Esta estructura suena más suave que una orden directa.", "p_de": "Diese Struktur klingt weicher als ein direkter Befehl.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Why", "don''t", "you", "try", "the", "salad?"], "correct_order": [0, 1, 2, 3, 4, 5]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Why", "don''t", "we", "eat", "here?"], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Why", "don''t", "you", "call", "the", "doctor?"], "correct_order": [0, 1, 2, 3, 4, 5]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Why", "don''t", "we", "sit", "here?"], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Why", "don''t", "you", "rest", "today?"], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Why", "don''t", "we", "take", "a", "break?"], "correct_order": [0, 1, 2, 3, 4, 5]}}'::jsonb,
        '{"p": "Ordena la sugerencia.", "p_de": "Ordne den Vorschlag.", "s": {"type": "scramble", "chunks": ["Why", "don''t", "you", "ask", "the", "pharmacist?"], "correct_order": [0, 1, 2, 3, 4, 5]}}'::jsonb
    ];
    v_rule4_exercises JSONB[] := ARRAY[
        '{"p": "Completa la recomendación: You ___ see a doctor.", "p_de": "Ergänze die Empfehlung: You ___ see a doctor.", "s": {"type": "typing", "correct_answers": ["should"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la recomendación: We ___ rest today.", "p_de": "Ergänze die Empfehlung: We ___ rest today.", "s": {"type": "typing", "correct_answers": ["should"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la pregunta: ___ we order now?", "p_de": "Ergänze die Frage: ___ we order now?", "s": {"type": "typing", "correct_answers": ["Shall"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la recomendación: You ___ drink more water.", "p_de": "Ergänze die Empfehlung: You ___ drink more water.", "s": {"type": "typing", "correct_answers": ["should"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la pregunta: ___ we go by bus?", "p_de": "Ergänze die Frage: ___ we go by bus?", "s": {"type": "typing", "correct_answers": ["Shall"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la recomendación: He ___ stay in bed.", "p_de": "Ergänze die Empfehlung: He ___ stay in bed.", "s": {"type": "typing", "correct_answers": ["should"], "case_sensitive": false}}'::jsonb,
        '{"p": "Completa la pregunta: ___ we call the clinic?", "p_de": "Ergänze die Frage: ___ we call the clinic?", "s": {"type": "typing", "correct_answers": ["Shall"], "case_sensitive": false}}'::jsonb,
        '{"p": "Elige la opción correcta: You ___ see a doctor.", "p_de": "Wähle die richtige Option: You ___ see a doctor.", "s": {"type": "multiple_choice", "options": ["should", "shall", "are"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["should", "shall", "are"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["should", "shall", "are"], "answer": 0}}'::jsonb,
        '{"p": "Elige la opción correcta: ___ we sit here?", "p_de": "Wähle die richtige Option: ___ we sit here?", "s": {"type": "multiple_choice", "options": ["Shall", "Should", "Do"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Shall", "Should", "Do"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Shall", "Should", "Do"], "answer": 0}}'::jsonb,
        '{"p": "Elige la opción correcta: He ___ rest today.", "p_de": "Wähle die richtige Option: He ___ rest today.", "s": {"type": "multiple_choice", "options": ["should", "shall", "does"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["should", "shall", "does"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["should", "shall", "does"], "answer": 0}}'::jsonb,
        '{"p": "Elige la opción correcta: ___ we order the soup?", "p_de": "Wähle die richtige Option: ___ we order the soup?", "s": {"type": "multiple_choice", "options": ["Shall", "Should", "Can"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Shall", "Should", "Can"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Shall", "Should", "Can"], "answer": 0}}'::jsonb,
        '{"p": "Elige la opción correcta: You ___ take this medicine after food.", "p_de": "Wähle die richtige Option: You ___ take this medicine after food.", "s": {"type": "multiple_choice", "options": ["should", "shall", "have"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["should", "shall", "have"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["should", "shall", "have"], "answer": 0}}'::jsonb,
        '{"p": "Elige la opción correcta: ___ we go now?", "p_de": "Wähle die richtige Option: ___ we go now?", "s": {"type": "multiple_choice", "options": ["Shall", "Should", "Are"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Shall", "Should", "Are"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Shall", "Should", "Are"], "answer": 0}}'::jsonb,
        '{"p": "Elige la opción correcta: They ___ drink more water.", "p_de": "Wähle die richtige Option: They ___ drink more water.", "s": {"type": "multiple_choice", "options": ["should", "shall", "is"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["should", "shall", "is"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["should", "shall", "is"], "answer": 0}}'::jsonb,
        '{"p": "Should sirve para dar una recomendación.", "p_de": "Should dient dazu, eine Empfehlung zu geben.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Shall we...? puede hacer una propuesta conjunta.", "p_de": "Shall we...? kann einen gemeinsamen Vorschlag machen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "You shall see a doctor es la recomendación normal en A0.", "p_de": "You shall see a doctor ist die normale Empfehlung auf A0-Niveau.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Shall we order now? es una pregunta correcta.", "p_de": "Shall we order now? ist eine korrekte Frage.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Después de should usamos el verbo base.", "p_de": "Nach should benutzen wir das Grundverb.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "He should rests today es correcto.", "p_de": "He should rests today ist richtig.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "You should drink more water es una recomendación.", "p_de": "You should drink more water ist eine Empfehlung.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["You", "should", "rest", "today."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Shall", "we", "go", "now?"], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["He", "should", "stay", "in", "bed."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Shall", "we", "order", "now?"], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["You", "should", "drink", "more", "water."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["Shall", "we", "call", "the", "clinic?"], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la frase.", "p_de": "Ordne den Satz.", "s": {"type": "scramble", "chunks": ["They", "should", "rest", "at", "home."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE grammar_rule_uuid IN (
        SELECT gr.uuid FROM grammar_rule gr
        JOIN grammar g ON gr.grammar_uuid = g.uuid
        WHERE g.step_order = 2500 AND g.path_uuid = v_path_id
    );
    DELETE FROM grammar WHERE step_order = 2500 AND path_uuid = v_path_id;

    INSERT INTO grammar (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 2500, 'en', 'grammar')
    RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Órdenes y Sugerencias', '', to_jsonb($content_es$
## Órdenes y sugerencias

En inglés usamos formas muy cortas para **dar órdenes**, **dar instrucciones** y **hacer sugerencias**.

| Función | Forma básica | Ejemplo |
| :-- | :-- | :-- |
| Orden positiva | verbo base | Open the door. |
| Orden negativa | Don''t + verbo base | Don''t touch that. |
| Sugerencia en grupo | Let''s + verbo | Let''s go now. |
| Sugerencia amable | Why don''t you / we + verbo? | Why don''t you rest? |
| Recomendación | should | You should see a doctor. |
| Propuesta conjunta | Shall we + verbo? | Shall we order now? |

### 1. Imperativo: órdenes positivas y negativas
Usa el **verbo base** sin sujeto para dar una orden.

| Tipo | Estructura | Ejemplo |
| :-- | :-- | :-- |
| Positiva | verbo + complemento | Sit down. |
| Negativa | Don''t + verbo + complemento | Don''t touch the pan. |
| Con **be** | Be / Don''t be + adjetivo | Be careful. / Don''t be late. |

### 2. Let''s + verbo
**Let''s** significa **hagamos...** y sirve para proponer algo que hacemos juntos.

- Let''s wait here.
- Let''s ask the nurse.
- Let''s try this soup.

### 3. Why don''t you / we...?
Esta estructura hace una sugerencia más suave.

| Forma | Uso | Ejemplo |
| :-- | :-- | :-- |
| Why don''t you + verbo? | sugerencia para otra persona | Why don''t you call the doctor? |
| Why don''t we + verbo? | sugerencia para el grupo | Why don''t we sit here? |

### 4. Should / Shall
**Should** sirve para recomendar. **Shall we...?** sirve para hacer una propuesta en preguntas.

- You should drink more water.
- He should rest today.
- Shall we go now?
- Shall we order the soup?

### Idea clave
- **Imperative** = orden o instrucción.
- **Let''s** = sugerencia conjunta.
- **Why don''t you / we...?** = sugerencia amable.
- **Should / Shall** = recomendación o propuesta.
$content_es$::text)),
        (v_grammar_id, 'de', 'Befehle und Vorschläge', '', to_jsonb($content_de$
## Befehle und Vorschläge

Im Englischen verwenden wir sehr kurze Formen, um **Befehle**, **Anweisungen** und **Vorschläge** zu machen.

| Funktion | Grundform | Beispiel |
| :-- | :-- | :-- |
| Positiver Befehl | Grundverb | Open the door. |
| Negativer Befehl | Don''t + Grundverb | Don''t touch that. |
| Gemeinsamer Vorschlag | Let''s + Verb | Let''s go now. |
| Höflicher Vorschlag | Why don''t you / we + Verb? | Why don''t you rest? |
| Empfehlung | should | You should see a doctor. |
| Gemeinsamer Vorschlag als Frage | Shall we + Verb? | Shall we order now? |

### 1. Imperativ: positive und negative Befehle
Benutze das **Grundverb** ohne Subjekt, um einen Befehl zu geben.

| Typ | Struktur | Beispiel |
| :-- | :-- | :-- |
| Positiv | Verb + Ergänzung | Sit down. |
| Negativ | Don''t + Verb + Ergänzung | Don''t touch the pan. |
| Mit **be** | Be / Don''t be + Adjektiv | Be careful. / Don''t be late. |

### 2. Let''s + Verb
**Let''s** bedeutet **lass uns...** und macht einen Vorschlag für eine gemeinsame Handlung.

- Let''s wait here.
- Let''s ask the nurse.
- Let''s try this soup.

### 3. Why don''t you / we...?
Diese Struktur macht einen weicheren Vorschlag.

| Form | Gebrauch | Beispiel |
| :-- | :-- | :-- |
| Why don''t you + Verb? | Vorschlag für eine andere Person | Why don''t you call the doctor? |
| Why don''t we + Verb? | Vorschlag für eine Gruppe | Why don''t we sit here? |

### 4. Should / Shall
**Should** gibt eine Empfehlung. **Shall we...?** macht einen Vorschlag als Frage.

- You should drink more water.
- He should rest today.
- Shall we go now?
- Shall we order the soup?

### Grundidee
- **Imperative** = Befehl oder Anweisung.
- **Let''s** = gemeinsamer Vorschlag.
- **Why don''t you / we...?** = höflicher Vorschlag.
- **Should / Shall** = Empfehlung oder Vorschlag.
$content_de$::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) VALUES
        (v_rule1_id, 'es', 'Imperativo: órdenes positivas y negativas', 'Usa el verbo base para órdenes: Open the door. Para negativo: Don''t touch. Con be: Be careful / Don''t be late.'),
        (v_rule1_id, 'de', 'Imperativ: positive und negative Befehle', 'Benutze das Grundverb für Befehle: Open the door. Für die Verneinung: Don''t touch. Mit be: Be careful / Don''t be late.');

    FOREACH ex IN ARRAY v_rule1_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_rule1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) VALUES
        (v_rule2_id, 'es', 'Let''s + verbo para sugerencias', 'Usa Let''s + verbo base para proponer algo juntos: Let''s go, Let''s try this, Let''s wait here.'),
        (v_rule2_id, 'de', 'Let''s + Verb für Vorschläge', 'Benutze Let''s + Grundverb für gemeinsame Vorschläge: Let''s go, Let''s try this, Let''s wait here.');

    FOREACH ex IN ARRAY v_rule2_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_rule2_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) VALUES
        (v_rule3_id, 'es', 'Why don''t you / we...? para sugerencias', 'Usa Why don''t you...? para sugerir algo a otra persona y Why don''t we...? para una propuesta conjunta.'),
        (v_rule3_id, 'de', 'Why don''t you / we...? für Vorschläge', 'Benutze Why don''t you...? für einen Vorschlag an eine andere Person und Why don''t we...? für einen gemeinsamen Vorschlag.');

    FOREACH ex IN ARRAY v_rule3_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_rule3_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) VALUES
        (v_rule4_id, 'es', 'Should y Shall para recomendaciones', 'Usa should para recomendar y Shall we...? para proponer algo en forma de pregunta.'),
        (v_rule4_id, 'de', 'Should und Shall für Empfehlungen', 'Benutze should für Empfehlungen und Shall we...? für einen Vorschlag als Frage.');

    FOREACH ex IN ARRAY v_rule4_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_rule4_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
