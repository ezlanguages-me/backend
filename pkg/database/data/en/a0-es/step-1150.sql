-- ============================================================
-- Seed: A0 English Path – STEP 1150 – Speaking – go to a department store to buy what is required (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1150 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1150, 'en', 'speaking', 'shopping')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla en unos grandes almacenes para comprar lo que necesitas', 'Practica cómo pedir varios productos en un gran almacén y cómo preguntar por secciones y pago.', '{"scenario": "Vas a unos grandes almacenes porque mañana tienes clase y también necesitas una toalla nueva para casa. Debes pedir ayuda en inglés para encontrar todos los productos y terminar la compra.", "tasks": ["Saluda a la dependienta y di que necesitas tres cosas diferentes.", "Pide una mochila escolar y pregunta en qué planta está.", "Pide también un impermeable o una chaqueta ligera.", "Pregunta dónde están las toallas o la ropa de cama.", "Pregunta si hay probador para la chaqueta o el impermeable.", "Di qué color o talla quieres.", "Pregunta cuánto cuesta uno de los productos y dónde pagas.", "Termina diciendo qué compras al final y despídete con educación."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich in einem Kaufhaus, um das Nötige zu kaufen', 'Übe, wie du in einem Kaufhaus mehrere Produkte verlangst und nach Abteilungen und Bezahlung fragst.', '{"scenario": "Du gehst in ein Kaufhaus, weil du morgen Unterricht hast und auch ein neues Handtuch für zu Hause brauchst. Du musst auf Englisch um Hilfe bitten, alle Produkte finden und den Einkauf abschließen.", "tasks": ["Begrüße die Verkäuferin und sag, dass du drei verschiedene Dinge brauchst.", "Bitte um einen Schulranzen und frage, auf welcher Etage er ist.", "Bitte außerdem um einen Regenmantel oder eine leichte Jacke.", "Frage, wo Handtücher oder Bettwäsche sind.", "Frage, ob es eine Umkleide für die Jacke oder den Regenmantel gibt.", "Sag, welche Farbe oder Größe du möchtest.", "Frage, wie viel ein Produkt kostet und wo du bezahlst.", "Beende das Gespräch damit, was du am Ende kaufst, und verabschiede dich höflich."]}'::jsonb);
END;
$seed$;
