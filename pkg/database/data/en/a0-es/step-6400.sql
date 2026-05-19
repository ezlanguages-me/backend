-- ============================================================
-- Seed: A0 English Path – STEP 6400 – Reading – lee la información básica de una visita guiada (Turismo y Entretenimiento)
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
        '{"es": "La visita guiada dura una hora.","de": "The guided visit lasts one hour.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El punto de encuentro es la entrada principal.","de": "The meeting point is the main entrance.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "No se permiten preguntas durante la visita.","de": "No questions are allowed during the visit.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Se puede hacer una foto en el patio.","de": "You can take a photo in the courtyard.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Hay una tienda de recuerdos al final.","de": "There is a souvenir shop at the end.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La visita se hace con un guía.","de": "Die Führung findet mit einem Guide statt.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El grupo se reúne en la entrada principal.","de": "Die Gruppe trifft sich am Haupteingang.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Se puede hacer una foto en el patio.","de": "Im Innenhof kann man ein Foto machen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Dónde se reúne el grupo?","de": "¿Dónde se reúne el grupo?","s_es": {"type": "multiple_choice","options": ["The main entrance","The car park","The hotel room"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["La entrada principal","El aparcamiento","La habitación del hotel"],"answer": 0}}'::jsonb,
        '{"es": "¿Cuánto dura la visita?","de": "¿Cuánto dura la visita?","s_es": {"type": "multiple_choice","options": ["One hour","Ten minutes","Three hours"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Una hora","Diez minutos","Tres horas"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué se puede hacer en el patio?","de": "¿Qué se puede hacer en el patio?","s_es": {"type": "multiple_choice","options": ["Take a photo","Buy a ticket","Leave the town"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Hacer una foto","Comprar un billete","Salir de la ciudad"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué recomienda el guía?","de": "¿Qué recomienda el guía?","s_es": {"type": "multiple_choice","options": ["Listen to the guide","Ignore the guide","Run away"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Escuchar al guía","Ignorar al guía","Salir corriendo"],"answer": 0}}'::jsonb,
        '{"es": "¿Dónde termina la visita?","de": "¿Dónde termina la visita?","s_es": {"type": "multiple_choice","options": ["At the souvenir shop","At the kitchen","At the airport"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["En la tienda de recuerdos","En la cocina","En el aeropuerto"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué información básica se ofrece?","de": "¿Qué información básica se ofrece?","s_es": {"type": "multiple_choice","options": ["Simple route and timings","Train prices and exams","Shopping lists and bills"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Ruta sencilla y horarios","Precios de tren y exámenes","Listas de compra y facturas"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué deben escuchar los visitantes?","de": "¿Qué deben escuchar los visitantes?","s_es": {"type": "multiple_choice","options": ["The guide","A radio advert","A taxi driver"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Al guía","Un anuncio de radio","Un taxista"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué se menciona sobre los baños?","de": "¿Qué se menciona sobre los baños?","s_es": {"type": "multiple_choice","options": ["Near the souvenir shop","Inside the bus","At the school gate"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Cerca de la tienda de recuerdos","Dentro del autobús","En la puerta del colegio"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 6400 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 6400 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6400, 'en', 'reading', 'Turismo y Entretenimiento', 'Guided Tour: Old Town Highlights

Meet your guide at the main entrance at 10:00. The visit lasts one hour and follows a simple route through the courtyard, the old square, and the small museum room.

Please listen to the guide and stay with the group. You can take a photo in the courtyard, but not inside the museum room. If you have a question, ask the guide after each stop.

There is a toilet near the souvenir shop at the end of the route. After the visit, you may stay for a short look at the shop or leave through the main entrance.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'lee la información básica de una visita guiada', 'Lee un texto sencillo con la información básica de una visita guiada en una situación previsible.'),
        (v_reading_id, 'de', 'lies die Grundinformationen einer Führung', 'Lies einen einfachen Text mit den Grundinformationen einer Führung in einer vorhersehbaren Situation.');

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
