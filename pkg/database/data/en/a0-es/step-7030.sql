-- ============================================================
-- Seed: A0 English Path – STEP 7030 – Dialogue – discuss social media use (Medios de Comunicación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: The dialogue is about social media use.", "p_de": "Laut dem Material, markiere wahr oder falsch: The dialogue is about social media use.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The speakers meet at 05:00 in the morning.", "p_de": "Laut dem Material, markiere wahr oder falsch: The speakers meet at 05:00 in the morning.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The first speaker asks about the podcast topic.", "p_de": "Laut dem Material, markiere wahr oder falsch: The first speaker asks about the podcast topic.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The second speaker says the guest is a teacher.", "p_de": "Laut dem Material, markiere wahr oder falsch: The second speaker says the guest is a teacher.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: At the end, both speakers are still confused.", "p_de": "Laut dem Material, markiere wahr oder falsch: At the end, both speakers are still confused.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who gives the main information?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who gives the main information?", "s": {"type": "multiple_choice", "options": ["Sam", "a pilot", "a football player"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What time is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: What time is mentioned?", "s": {"type": "multiple_choice", "options": ["Tuesday evening", "05:00", "23:50"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which place is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which place is mentioned?", "s": {"type": "multiple_choice", "options": ["Screen Talk", "the airport tunnel", "the desert farm"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is the main purpose of the dialogue?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is the main purpose of the dialogue?", "s": {"type": "multiple_choice", "options": ["the podcast topic", "buy a tractor", "find a lost camel"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How does the dialogue end?", "p_de": "Laut dem Material, wähle die richtige Antwort: How does the dialogue end?", "s": {"type": "multiple_choice", "options": ["with a shared opinion", "with a big argument", "with no clear plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7030 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7030 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7030 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7030 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7030 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7030 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7030 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7030 AND path_uuid=v_path_id;
    INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
    VALUES (v_path_id,7030,'en','dialogue','media','[{"name":"Mia","gender":"female","avatarURL":"https://example.com/avatars/mia.png"},{"name":"Sam","gender":"male","avatarURL":"https://example.com/avatars/sam.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','Hablar sobre uso de redes sociales','Lee el diálogo y responde.');
    INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','Über die Nutzung sozialer Medien sprechen','Lies den Dialog und antworte.');
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES
        (v_dialogue_id, 0, 'Mia', 'Did you hear Screen Talk at Tuesday evening?'),
        (v_dialogue_id, 1, 'Sam', 'Yes. The main topic was social media habits.'),
        (v_dialogue_id, 2, 'Mia', 'I liked the guest, a teacher.'),
        (v_dialogue_id, 3, 'Sam', 'Me too. The programme was good because of simple ideas for healthy use.'),
        (v_dialogue_id, 4, 'Mia', 'Would you watch it again?'),
        (v_dialogue_id, 5, 'Sam', 'Yes, especially the next episode.'),
        (v_dialogue_id, 6, 'Mia', 'I will tell my brother about it.'),
        (v_dialogue_id, 7, 'Sam', 'Good idea.');
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Escuchaste Screen Talk a las Tuesday evening?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Hast du Screen Talk um Tuesday evening gehört?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. El tema principal fue social media habits."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Das Hauptthema war social media habits."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Me gustó la invitada, a teacher."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Mir hat der Gast a teacher gefallen."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "A mí también. El programa fue bueno por simple ideas for healthy use."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Mir auch. Die Sendung war wegen simple ideas for healthy use gut."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Lo verías otra vez?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Würdest du es noch einmal ansehen?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí, sobre todo el próximo episodio."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja, besonders die nächste Folge."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Se lo contaré a mi hermano."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich werde meinem Bruder davon erzählen."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Buena idea."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Gute Idee."}]}]'::jsonb);
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
