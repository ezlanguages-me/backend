-- ============================================================
-- Seed: A0 English Path – STEP 9310 – Listening – make critical remarks / express disagreement without causing offence (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about how a delegate politely challenges a claim made in the keynote address.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about how a delegate politely challenges a claim made in the keynote address.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a mountain resort.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a mountain resort.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: the delegate is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the delegate is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: One detail is that the delegate cites a conflicting study published in the same year.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the delegate cites a conflicting study published in the same year.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The other side says the speaker acknowledges the point and offers a nuanced explanation.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says the speaker acknowledges the point and offers a nuanced explanation.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The source named is a conference hall.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is a conference hall.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conclusion is that the session chair proposes that both perspectives appear in the published proceedings.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that the session chair proposes that both perspectives appear in the published proceedings.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["a delegate politely challenges a claim made in the keynote address", "a cooking competition", "a sports training session"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a conference hall", "a bakery", "a swimming pool"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the delegate", "Doctor Williams", "Artist Maria"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the delegate cites a conflicting study published in the same year", "the screen is broken", "the audience leaves"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the speaker acknowledges the point and offers a nuanced explanation", "the chairs are uncomfortable", "the microphone stops"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the session chair proposes that both perspectives appear in the published proceedings", "the discussion is abandoned", "the event is postponed"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a conference hall", "a fashion blog", "a sports magazine"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Respectful disagreement advances knowledge further than silence.", "Never question authority.", "Speed matters more than accuracy."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9310 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9310 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9310 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9310 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9310 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9310 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9310 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9310 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,9310,'en','listening','academic',$transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly.

## THE SCENE
A short exchange about how a delegate politely challenges a claim made in the keynote address.

### DIRECTOR'S NOTES
- Style: Academic and measured
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on how a delegate politely challenges a claim made in the keynote address.
[steady] Speaker: The setting is a conference hall.
[thoughtful] Listener: the delegate is part of the discussion.
[clear] Listener: One important detail is that the delegate cites a conflicting study published in the same year.
[measured] Speaker: A different view is that the speaker acknowledges the point and offers a nuanced explanation.
[calm] Listener: We compare both sides before deciding what is most practical.
[clear] Speaker: In the end, the conclusion is that the session chair proposes that both perspectives appear in the published proceedings.
[warm] Listener: As the speaker says, "Respectful disagreement advances knowledge further than silence."$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','make critical remarks / express disagreement without causing offence','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','make critical remarks / express disagreement without causing offence','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
