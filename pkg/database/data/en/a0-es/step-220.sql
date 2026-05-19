-- ============================================================
-- Seed: A0 English Path – STEP 220 – Listening – conversation about home country, family, school (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- TRUE / FALSE (8 exercises)
        '{"p":"Alex vive en Madrid.","p_de":"Alex lebt in Madrid.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Madrid es una ciudad pequeña y tranquila.","p_de":"Madrid ist eine kleine und ruhige Stadt.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"En invierno puede hacer bastante frío en Madrid.","p_de":"Im Winter kann es in Madrid ziemlich kalt werden.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La madre de Alex es enfermera.","p_de":"Alexs Mutter ist Krankenschwester.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Al padre de Alex le encanta la jardinería.","p_de":"Alexs Vater liebt Gartenarbeit.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La hermana de Alex tiene 12 años.","p_de":"Alexs Schwester ist 12 Jahre alt.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"En el instituto de Alex llevan uniforme.","p_de":"In Alexs Schule tragen sie Uniform.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Alex toca la guitarra acústica en la banda del instituto.","p_de":"Alex spielt akustische Gitarre in der Schulband.","s":{"type":"true_false","answer":true}}'::jsonb,

        -- MULTIPLE CHOICE (8 exercises)
        '{"p":"¿Cómo describe Alex a Madrid?","p_de":"Wie beschreibt Alex Madrid?","s":{"type":"multiple_choice","options":["Grande y muy ocupada","Pequeña y tranquila","Cerca de la playa"],"answer":0}}'::jsonb,
        '{"p":"¿Quiénes forman la familia de Alex en España?","p_de":"Wer gehört zu Alexs Familie in Spanien?","s":{"type":"multiple_choice","options":["Sus padres, su hermana menor y él","Solo sus padres","Sus abuelos y un primo"],"answer":0}}'::jsonb,
        '{"p":"¿Qué deporte practica la hermana de Alex?","p_de":"Welchen Sport treibt Alexs Schwester?","s":{"type":"multiple_choice","options":["Fútbol","Tenis","Natación"],"answer":0}}'::jsonb,
        '{"p":"¿Cuántos estudiantes hay en el instituto de Alex?","p_de":"Wie viele Schüler gibt es in Alexs Schule?","s":{"type":"multiple_choice","options":["Más de mil","Unos doscientos","Exactamente quinientos"],"answer":0}}'::jsonb,
        '{"p":"¿A qué hora empiezan las clases de Alex?","p_de":"Um wie viel Uhr beginnt Alexs Unterricht?","s":{"type":"multiple_choice","options":["A las 8:30 AM","A las 7:30 AM","A las 9:30 AM"],"answer":0}}'::jsonb,
        '{"p":"¿Cuáles son las asignaturas favoritas de Alex?","p_de":"Was sind Alexs Lieblingsfächer?","s":{"type":"multiple_choice","options":["Historia e Inglés","Ciencias y Matemáticas","Arte y Geografía"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo es Mr. Davis, el profesor de Inglés?","p_de":"Wie ist Mr. Davis, der Englischlehrer?","s":{"type":"multiple_choice","options":["Muy divertido","Muy estricto","Muy aburrido"],"answer":0}}'::jsonb,
        '{"p":"¿Qué le sugiere Mia a Alex al final?","p_de":"Was schlägt Mia Alex am Ende vor?","s":{"type":"multiple_choice","options":["Que toque algo después de cenar","Que juegue al fútbol con ella","Que enseñe el uniforme del instituto"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 220 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 220 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 220, 'en', 'listening', 'social', $transcript$
# AUDIO PROFILE: Mia and Alex, teenage host sister and exchange student
## "Talking About Home"

## THE SCENE: The family kitchen after school
Mia and Alex are sitting at the kitchen table with tea and a plate of
biscuits after a busy school day. Mia is curious and friendly, and Alex
feels relaxed enough to talk about his life back in Spain, from Madrid
and his family to school and music.

### DIRECTOR'S NOTES
Style:
* Friendly and conversational, like two teenagers getting to know each
  other better.
* Clear and well paced, with simple factual answers that beginner
  learners can follow without stress.

Pace: Natural and light, with short pauses after each question.

Accent: Neutral accent.

### SAMPLE CONTEXT
This kind of audio is useful for listening practice about personal
information, family, school routines, and hobbies.

#### TRANSCRIPT
Mia [curious] So Alex, what is your hometown in Spain like?
Alex [friendly] I live in Madrid. It's the capital, so it's a very big and busy city. The weather is usually sunny, but it gets pretty cold in the winter.
Mia [interested] Do you have a big family back home?
Alex [relaxed] Not really. It's just my parents, my younger sister, and me. My mom is a nurse and my dad is an engineer.
Mia [warmly] Oh, cool. My mom is a teacher. What do your parents do in their free time?
Alex [pleasantly] My dad loves gardening, and my mom likes reading mystery novels.
Mia [curious] And what about your sister? How old is she?
Alex [cheerfully] She is 12. She is crazy about sports. She plays soccer for a local team every Saturday.
Mia [excited] That sounds fun! What about your school? Is it different from here?
Alex [matter-of-factly] Yes, my high school in Madrid is huge. There are over a thousand students. Also, we don't wear a uniform.
Mia [surprised] Wow, no uniform! What time do your classes start?
Alex [clearly] We start at 8:30 AM and finish around 2:30 PM. Then I go home for lunch.
Mia [interested] What are your favorite subjects?
Alex [brightly] My favorite subjects are History and English. Mr. Davis, my English teacher, is very funny.
Mia [curious] Do you play any sports there?
Alex [lightly] I don't play sports. I actually play the acoustic guitar in the school band.
Mia [excited] That's awesome! How long have you played?
Alex [calmly] For about three years. I usually practice in the evenings.
Mia [encouragingly] Maybe you can play something for us later after dinner.
Alex [happy] Sure! I'd love to.
    $transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Charla sobre la vida de Alex en España', '');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Gespräch über Alexs Leben in Spanien', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
