-- ============================================================
-- Seed: A0 English Path – STEP 7200 – Writing – write letters on any subject with good expression and accuracy (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 7200 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7200, 'en', 'writing', 'communication')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_writing_id, 'es', 'Escribe una carta personal clara y cuidada', 'Redacta una carta personal con noticias, detalles y preguntas para otra persona.', '{"scenario": "Vas a escribir una carta personal a una amiga que vive en otra ciudad. Hace tiempo que no habláis y quieres contarle novedades de tu vida, un plan próximo y algunas preguntas para mantener el contacto.", "tasks": ["Empieza con un saludo adecuado y el nombre de la persona.", "Explica por qué escribes la carta en una frase clara.", "Cuenta una noticia reciente sobre tu vida diaria.", "Añade un segundo detalle sobre tus estudios, tu trabajo o tu casa.", "Menciona un plan futuro, por ejemplo una visita o una celebración.", "Haz al menos dos preguntas sencillas para la otra persona.", "Usa una frase amable para mostrar interés o cariño.", "Termina con un cierre natural y tu nombre."]}'::jsonb),
        (v_writing_id, 'de', 'Schreibe einen klaren und sorgfältigen persönlichen Brief', 'Verfasse einen persönlichen Brief mit Neuigkeiten, Details und Fragen an eine andere Person.', '{"scenario": "Du schreibst einen persönlichen Brief an eine Freundin, die in einer anderen Stadt lebt. Ihr habt lange nicht gesprochen, und du möchtest Neuigkeiten aus deinem Leben, einen kommenden Plan und einige Fragen schreiben, um in Kontakt zu bleiben.", "tasks": ["Beginne mit einer passenden Anrede und dem Namen der Person.", "Erkläre in einem klaren Satz, warum du den Brief schreibst.", "Berichte eine aktuelle Neuigkeit aus deinem Alltag.", "Füge ein zweites Detail über dein Studium, deine Arbeit oder deine Wohnung hinzu.", "Erwähne einen zukünftigen Plan, zum Beispiel einen Besuch oder eine Feier.", "Stelle der anderen Person mindestens zwei einfache Fragen.", "Verwende einen freundlichen Satz, um Interesse oder Zuneigung zu zeigen.", "Beende den Brief mit einem natürlichen Abschluss und deinem Namen."]}'::jsonb);
END;
$seed$;
