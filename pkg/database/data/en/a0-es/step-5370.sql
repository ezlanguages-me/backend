-- ============================================================
-- Seed: A0 English Path – STEP 5370 – Dialogue – give and receive feedback (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Julia", "text": "Your presentation was clear, and I liked the example from the library survey.", "es": "Tu presentación fue clara y me gustó el ejemplo de la encuesta de la biblioteca.", "de": "Dein Vortrag war klar, und das Beispiel aus der Bibliotheksumfrage hat mir gefallen."}'::jsonb,
        '{"character": "Tom", "text": "Thanks. Was there anything I should improve?", "es": "Gracias. ¿Hubo algo que debería mejorar?", "de": "Danke. Gab es etwas, das ich verbessern sollte?"}'::jsonb,
        '{"character": "Julia", "text": "Yes, slide two had too much text for one minute.", "es": "Sí, la diapositiva dos tenía demasiado texto para un minuto.", "de": "Ja, Folie zwei hatte zu viel Text für eine Minute."}'::jsonb,
        '{"character": "Tom", "text": "That makes sense. I can cut some bullet points.", "es": "Tiene sentido. Puedo quitar algunas viñetas.", "de": "Das ergibt Sinn. Ich kann einige Stichpunkte kürzen."}'::jsonb,
        '{"character": "Julia", "text": "Also, your conclusion was a bit short.", "es": "Además, tu conclusión era un poco corta.", "de": "Außerdem war dein Schluss etwas kurz."}'::jsonb,
        '{"character": "Tom", "text": "Okay. I will add one stronger final sentence.", "es": "Vale. Añadiré una frase final más fuerte.", "de": "Okay. Ich füge einen stärkeren Abschlusssatz hinzu."}'::jsonb,
        '{"character": "Julia", "text": "Your answer to the first question was very calm and clear.", "es": "Tu respuesta a la primera pregunta fue muy tranquila y clara.", "de": "Deine Antwort auf die erste Frage war sehr ruhig und klar."}'::jsonb,
        '{"character": "Tom", "text": "Good to hear. Thank you for the useful comments.", "es": "Me alegra oírlo. Gracias por los comentarios útiles.", "de": "Gut zu hören. Danke für die nützlichen Kommentare."}'::jsonb,
        '{"character": "Julia", "text": "No problem. I can look at the new version tomorrow.", "es": "No hay problema. Puedo ver la nueva versión mañana.", "de": "Kein Problem. Ich kann mir die neue Version morgen ansehen."}'::jsonb,
        '{"character": "Tom", "text": "Great, I appreciate that.", "es": "Genial, lo agradezco.", "de": "Super, das weiß ich zu schätzen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Julia dice que la presentación fue clara.", "p_de": "Julia sagt, dass der Vortrag klar war.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tom no pregunta por mejoras posibles.", "p_de": "Tom fragt nicht nach möglichen Verbesserungen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La diapositiva dos tenía demasiado texto.", "p_de": "Folie zwei hatte zu viel Text.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tom decide eliminar el ejemplo de la biblioteca.", "p_de": "Tom entscheidet, das Bibliotheksbeispiel zu entfernen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Julia ofrece mirar la nueva versión al día siguiente.", "p_de": "Julia bietet an, die neue Version am nächsten Tag anzuschauen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué ejemplo le gustó a Julia?", "p_de": "Welches Beispiel gefiel Julia?", "s": {"type": "multiple_choice", "options": ["The library survey example", "The train map", "The office invoice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace Tom?", "p_de": "Welche Frage stellt Tom?", "s": {"type": "multiple_choice", "options": ["What should I improve?", "Can you print my badge?", "Where is lunch today?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema detecta Julia en la diapositiva dos?", "p_de": "Welches Problem sieht Julia bei Folie zwei?", "s": {"type": "multiple_choice", "options": ["Too much text", "No chart at all", "Too many speakers"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué parte positiva comenta Julia sobre las preguntas?", "p_de": "Welchen positiven Punkt nennt Julia zu den Fragen?", "s": {"type": "multiple_choice", "options": ["The first answer was calm and clear", "There were no questions", "The answer was too long"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará Julia después?", "p_de": "Was wird Julia danach tun?", "s": {"type": "multiple_choice", "options": ["Look at the new version tomorrow", "Rewrite the whole talk herself", "Send it to the conference desk"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5370 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5370 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5370, 'en', 'dialogue', 'academic', '[{"name": "Julia", "gender": "female", "avatarURL": "https://example.com/avatars/julia.png"}, {"name": "Tom", "gender": "male", "avatarURL": "https://example.com/avatars/tom.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Dar y recibir feedback', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Feedback geben und annehmen', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
