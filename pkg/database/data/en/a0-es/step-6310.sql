-- ============================================================
-- Seed: A0 English Path – STEP 6310 – Listening – escucha una conversación al recibir visitas (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Priya da la bienvenida a su invitado.","de": "Priya welcomes her guest.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El invitado elige agua.","de": "The guest chooses water.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Priya pregunta por alergias.","de": "Priya asks about allergies.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El invitado no tiene necesidades especiales hoy.","de": "The guest has no special needs today.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El invitado deja los zapatos en la puerta.","de": "The guest leaves shoes by the door.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Priya ofrece té o agua.","de": "Priya bietet Tee oder Wasser an.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El invitado deja los zapatos en la puerta.","de": "Der Gast lässt die Schuhe an der Tür.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Hablan de salir sobre las ocho.","de": "Sie sprechen davon, gegen acht zu gehen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué ofrece Priya primero?","de": "¿Qué ofrece Priya primero?","s_es": {"type": "multiple_choice","options": ["Tea or water","Coffee or soda","Milk or juice"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Té o agua","Café o refresco","Leche o zumo"],"answer": 0}}'::jsonb,
        '{"es": "¿Dónde quiere sentarse el invitado?","de": "¿Dónde quiere sentarse el invitado?","s_es": {"type": "multiple_choice","options": ["By the window","On the roof","In the garage"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Junto a la ventana","En el tejado","En el garaje"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta hace Priya sobre la comida?","de": "¿Qué pregunta hace Priya sobre la comida?","s_es": {"type": "multiple_choice","options": ["Food allergies","Train tickets","School grades"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Alergias alimentarias","Billetes de tren","Notas escolares"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué trae el invitado?","de": "¿Qué trae el invitado?","s_es": {"type": "multiple_choice","options": ["A small cake","A bicycle","A suitcase"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Un pastel pequeño","Una bicicleta","Una maleta"],"answer": 0}}'::jsonb,
        '{"es": "¿A qué hora debe irse el invitado?","de": "¿A qué hora debe irse el invitado?","s_es": {"type": "multiple_choice","options": ["At about eight","At noon","At sunrise"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Sobre las ocho","Al mediodía","Al amanecer"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué hace Priya con los zapatos?","de": "¿Qué hace Priya con los zapatos?","s_es": {"type": "multiple_choice","options": ["Leave them by the door","Put them in the fridge","Throw them away"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Déjalos junto a la puerta","Ponlos en la nevera","Tíralos"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué van a hacer después del té?","de": "¿Qué van a hacer después del té?","s_es": {"type": "multiple_choice","options": ["Eat the cake","Go jogging","Start homework"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Comer el pastel","Salir a correr","Empezar los deberes"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de relación social hay?","de": "¿Qué tipo de relación social hay?","s_es": {"type": "multiple_choice","options": ["Host and guest","Teacher and pupil","Driver and passenger"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Anfitrión e invitado","Profesor y alumno","Conductor y pasajero"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 6310 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 6310 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 6310, 'en', 'listening', 'Convivencia', $transcript$
# AUDIO PROFILE: Priya, hosting a friend at home
## "Tea, Shoes, and a Seat by the Window"

## THE SCENE: A small flat in the early evening
Priya welcomes a guest, offers tea, and checks what the guest needs.

### DIRECTOR''S NOTES
Style:
* Calm hosting conversation with clear offers and polite replies.
* Keep every turn short and easy to understand.

Pace: Slow and friendly.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners follow a simple host-and-guest exchange at home.
The audio covers greetings, food, shoes, and leaving time.

#### TRANSCRIPT
[welcome] Priya: Hi, come in. It is nice to see you.
[response] Guest: Thank you. Your flat is lovely.
[offering] Priya: Would you like some tea or water?
[choice] Guest: Tea, please. I'm happy to sit by the window.
[checking] Priya: Great. Do you have any food allergies?
[answer] Guest: No, nothing special today.
[practical] Priya: You can leave your shoes by the door.
[helpful] Guest: Thanks. I brought a small cake for us.
[planning] Priya: Wonderful. We can eat after the tea.
[closing] Guest: That sounds perfect. I should go at about eight.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'escucha una conversación al recibir visitas', 'Escucha una conversación sencilla entre anfitrión e invitado sobre comida, zapatos y horarios.'),
        (v_listening_id, 'de', 'höre ein Gespräch beim Bewirten', 'Höre ein einfaches Gespräch zwischen Gastgeber und Gast über Essen, Schuhe und Zeiten.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
