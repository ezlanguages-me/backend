-- ============================================================
-- Seed: A0 English Path – STEP 2430 – Speaking – complain effectively about most situations that are likely to arise in a restaurant (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2430 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2430, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Presentar una queja compleja en un restaurante', '', '{"scenario": "Has tenido varios problemas en un restaurante: mucha espera, plato equivocado, posible riesgo de alergia y errores en la cuenta. Expón la situación y pide una solución completa.", "tasks": ["Llama al encargado o al gerente.", "Explica cuánto tiempo has esperado.", "Describe el error principal del pedido.", "Menciona el problema relacionado con una alergia o ingrediente peligroso.", "Explica el error de la cuenta.", "Pide una solución concreta para cada problema.", "Di qué compensación te parece justa.", "Termina de forma educada pero firme."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine komplexe Beschwerde im Restaurant vorbringen', '', '{"scenario": "Du hattest mehrere Probleme in einem Restaurant: lange Wartezeit, falsches Gericht, mögliches Allergierisiko und Fehler auf der Rechnung. Erkläre die Situation und bitte um eine vollständige Lösung.", "tasks": ["Rufe den Manager oder die Managerin.", "Erkläre, wie lange du gewartet hast.", "Beschreibe den Hauptfehler bei der Bestellung.", "Erwähne das Problem mit einer Allergie oder einer gefährlichen Zutat.", "Erkläre den Fehler auf der Rechnung.", "Bitte um eine konkrete Lösung für jedes Problem.", "Sage, welche Entschädigung du fair findest.", "Beende höflich, aber bestimmt."]}'::jsonb);
END;
$seed$;
