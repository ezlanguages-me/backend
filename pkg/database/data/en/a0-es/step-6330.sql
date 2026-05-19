-- ============================================================
-- Seed: A0 English Path – STEP 6330 – Speaking – entreten a un invitado (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 6330 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 6330, 'en', 'speaking', 'Convivencia')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'entreten a un invitado', 'Practica cómo cuidar a una visita con gestos sencillos, opciones claras y un tono amable.', '{"scenario": "Tienes una visita en casa durante un rato y quieres que la otra persona se sienta cómoda y entretenida.","tasks": ["Saluda a tu invitado y dale la bienvenida.","Ofrece algo de beber y una pequeña merienda.","Pregunta si prefiere música, un juego o una charla tranquila.","Sugiere una actividad sencilla para hacer juntos.","Comenta algo sobre la casa, el salón o la vista.","Pregunta si la persona necesita cargar el teléfono o dejar el abrigo.","Responde de forma amable si el invitado prefiere descansar un momento.","Termina agradeciendo la visita y despidiéndote con educación."],"de": {"scenario": "Du hast für eine Weile Besuch zu Hause und möchtest, dass sich die andere Person wohlfühlt und gut unterhalten wird.","tasks": ["Begrüße deinen Gast und heiße ihn willkommen.","Biete etwas zu trinken und einen kleinen Snack an.","Frage, ob Musik, ein Spiel oder ein ruhiges Gespräch lieber ist.","Schlage eine einfache gemeinsame Aktivität vor.","Mach eine Bemerkung über die Wohnung, das Wohnzimmer oder die Aussicht.","Frage, ob die Person das Handy laden oder den Mantel ablegen möchte.","Antworte freundlich, wenn der Gast sich kurz ausruhen möchte.","Bedanke dich am Ende für den Besuch und verabschiede dich höflich."]}}'::jsonb),
        (v_speaking_id, 'de', 'unterhalte einen Gast', 'Übe, wie du einen Gast mit einfachen Gesten, klaren Optionen und freundlichem Ton betreust.', '{"scenario": "Du hast für eine Weile Besuch zu Hause und möchtest, dass sich die andere Person wohlfühlt und gut unterhalten wird.","tasks": ["Begrüße deinen Gast und heiße ihn willkommen.","Biete etwas zu trinken und einen kleinen Snack an.","Frage, ob Musik, ein Spiel oder ein ruhiges Gespräch lieber ist.","Schlage eine einfache gemeinsame Aktivität vor.","Mach eine Bemerkung über die Wohnung, das Wohnzimmer oder die Aussicht.","Frage, ob die Person das Handy laden oder den Mantel ablegen möchte.","Antworte freundlich, wenn der Gast sich kurz ausruhen möchte.","Bedanke dich am Ende für den Besuch und verabschiede dich höflich."]}'::jsonb);
END;
$seed$;
