-- ============================================================
-- Seed: A0 English Path – STEP 6300 – Reading – lee cómo recibir o visitar a alguien (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El texto aconseja llegar a la hora.","de": "The text advises arriving on time.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El anfitrión debe ofrecer algo de beber.","de": "The host should offer something to drink.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "No hace falta avisar si se tiene una alergia.","de": "There is no need to mention an allergy.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El invitado puede llevar un pequeño detalle.","de": "The guest can bring a small gift.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Se recomienda agradecer al final.","de": "It is recommended to thank the host at the end.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La guía habla de ser puntual.","de": "Der Leitfaden spricht davon, pünktlich zu sein.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Se recomienda dar las gracias al anfitrión.","de": "Es wird empfohlen, dem Gastgeber zu danken.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Se puede llevar un pequeño regalo.","de": "Man kann ein kleines Geschenk mitbringen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué debe hacer el anfitrión al llegar la visita?","de": "¿Qué debe hacer el anfitrión al llegar la visita?","s_es": {"type": "multiple_choice","options": ["Offer a drink","Offer a bus ticket","Offer homework"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Ofrecer algo de beber","Ofrecer un billete de bus","Ofrecer deberes"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué conviene preguntar antes de servir comida?","de": "¿Qué conviene preguntar antes de servir comida?","s_es": {"type": "multiple_choice","options": ["Food needs","Train delays","School marks"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Las necesidades de comida","Los retrasos del tren","Las notas escolares"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué puede llevar un invitado?","de": "¿Qué puede llevar un invitado?","s_es": {"type": "multiple_choice","options": ["A small gift","A school uniform","A loud alarm"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Un pequeño detalle","Un uniforme escolar","Una alarma fuerte"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué debe decir una persona al terminar?","de": "¿Qué debe decir una persona al terminar?","s_es": {"type": "multiple_choice","options": ["Thank the host","Leave silently","Complain loudly"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Dar las gracias al final","Irse en silencio","Quejarse en voz alta"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué se aconseja sobre la puntualidad?","de": "¿Qué se aconseja sobre la puntualidad?","s_es": {"type": "multiple_choice","options": ["Arrive on time","Arrive after midnight","Arrive without knocking"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Llegar a la hora","Llegar después de medianoche","Llegar sin llamar"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué pasa si alguien tiene alergia?","de": "¿Qué pasa si alguien tiene alergia?","s_es": {"type": "multiple_choice","options": ["Mention allergies","Hide allergies","Ignore food"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Decirlo","Esconderlo","Ignorar la comida"],"answer": 0}}'::jsonb,
        '{"es": "¿Dónde se dejan los zapatos si el anfitrión lo pide?","de": "¿Dónde se dejan los zapatos si el anfitrión lo pide?","s_es": {"type": "multiple_choice","options": ["By the door","In the garden","On the sofa"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Junto a la puerta","En el jardín","En el sofá"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de visita describe el texto?","de": "¿Qué tipo de visita describe el texto?","s_es": {"type": "multiple_choice","options": ["A home visit","A job interview","A sports match"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Una visita a casa","Una entrevista de trabajo","Un partido deportivo"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 6300 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 6300 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6300, 'en', 'reading', 'Convivencia', 'When you visit someone, arrive on time and bring a small gift if you can. Say hello clearly and thank the host for the invitation.

When you are hosting, offer a drink first and ask if anyone has allergies or special food needs. Show guests where to leave their coats and shoes if necessary.

During the visit, keep the conversation friendly and simple. If you want to leave, say thank you before you go. A short message later is also polite.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'lee cómo recibir o visitar a alguien', 'Lee una guía sencilla sobre cómo comportarse cuando visitas a alguien o recibes visitas.'),
        (v_reading_id, 'de', 'lies, wie man jemanden bewirtet oder zu Besuch geht', 'Lies einen einfachen Leitfaden, wie man sich als Gast oder Gastgeber verhält.');

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
