-- ============================================================
-- Seed: A0 English Path – STEP 7370 – Speaking – give opinion on cultural differences
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7370 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7370, 'en', 'speaking', 'social')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Da tu opinión sobre diferencias culturales', 'Practica cómo expresar con respeto tu opinión sobre formas distintas de comunicarse y relacionarse.', '{"scenario": "Hablas con un amigo después de un taller sobre diferencias culturales en la comunicación. Queréis comentar la franqueza, el silencio, el contacto visual y las preguntas personales.", "tasks": ["Di una diferencia cultural de comunicación que te parezca interesante.", "Expresa si prefieres un estilo más directo o más indirecto y da una razón.", "Comenta qué puede significar el silencio en dos contextos distintos.", "Habla del contacto visual con personas mayores, profesores o desconocidos.", "Explica cuándo prefieres usar nombre de pila o un título.", "Pon un ejemplo de una pregunta que puede sonar cercana o demasiado privada.", "Responde con respeto a una opinión distinta y muestra curiosidad.", "Termina diciendo qué has aprendido para futuras conversaciones interculturales."]}'::jsonb),
        (v_speaking_id, 'de', 'Gib deine Meinung zu kulturellen Unterschieden', 'Übe, wie du respektvoll deine Meinung zu verschiedenen Kommunikations- und Umgangsformen ausdrückst.', '{"scenario": "Du sprichst nach einem Workshop über kulturelle Unterschiede in der Kommunikation mit einem Freund. Ihr möchtet über Direktheit, Schweigen, Blickkontakt und persönliche Fragen sprechen.", "tasks": ["Nenne einen kulturellen Kommunikationsunterschied, den du interessant findest.", "Sage, ob du einen direkteren oder indirekteren Stil bevorzugst, und nenne einen Grund.", "Erkläre, was Schweigen in zwei verschiedenen Situationen bedeuten kann.", "Sprich über Blickkontakt mit älteren Menschen, Lehrkräften oder Fremden.", "Erkläre, wann du lieber einen Vornamen oder einen Titel benutzt.", "Gib ein Beispiel für eine Frage, die freundlich oder zu privat klingen kann.", "Reagiere respektvoll auf eine andere Meinung und zeige Neugier.", "Beende das Gespräch damit, was du für zukünftige interkulturelle Gespräche gelernt hast."]}'::jsonb);
END;
$seed$;
