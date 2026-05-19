-- ============================================================
-- Seed: A0 English Path – STEP 3740 – Speaking – recommend places to visit (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3740 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3740, 'en', 'speaking', 'tourism') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Recomienda lugares para visitar', 'Practica cómo recomendar uno o dos lugares con razones simples y detalles útiles.', '{"scenario": "Un amigo visita tu ciudad por primera vez. Quieres grabar un mensaje corto para recomendarle lugares bonitos, fáciles de encontrar y buenos para un día de paseo.", "tasks": ["Saluda a tu amigo y di que vas a recomendar algunos lugares.", "Nombra el primer lugar y explica dónde está.", "Di por qué te gusta ese lugar.", "Añade una actividad que se puede hacer allí.", "Nombra un segundo lugar o una alternativa.", "Explica a qué hora es mejor ir o cuánto tiempo se necesita.", "Añade un consejo práctico, por ejemplo transporte, entrada o comida.", "Termina diciendo cuál recomiendas más y por qué."]}'::jsonb),
        (v_item_id, 'de', 'Empfiehl sehenswerte Orte', 'Übe, wie man ein oder zwei Orte mit einfachen Gründen und nützlichen Details empfiehlt.', '{"scenario": "Ein Freund besucht deine Stadt zum ersten Mal. Du möchtest eine kurze Nachricht aufnehmen und schöne, leicht erreichbare Orte für einen Tagesausflug empfehlen.", "tasks": ["Begrüße deinen Freund und sag, dass du einige Orte empfehlen willst.", "Nenne den ersten Ort und erkläre, wo er liegt.", "Sag, warum dir dieser Ort gefällt.", "Füge eine Aktivität hinzu, die man dort machen kann.", "Nenne einen zweiten Ort oder eine Alternative.", "Erkläre, wann man am besten hingeht oder wie viel Zeit man braucht.", "Gib einen praktischen Tipp, zum Beispiel Transport, Eintritt oder Essen.", "Beende die Nachricht damit, welchen Ort du am meisten empfiehlst und warum."]}'::jsonb);
END;
$seed$;
