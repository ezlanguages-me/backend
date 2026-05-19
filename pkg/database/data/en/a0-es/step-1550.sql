-- ============================================================
-- Seed: A0 English Path – STEP 1550 – Speaking – deal effectively with routine bank/post office transactions
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1550 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1550, 'en', 'speaking', 'financial')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Gestiona una cuenta con operaciones habituales', 'Habla para resolver varias operaciones bancarias normales en una sola visita.', '{"scenario": "Estás en el banco y quieres hacer varias operaciones sencillas con tu cuenta el mismo día.", "tasks": ["Saluda y di que quieres hacer varias gestiones con tu cuenta.", "Pide ingresar una cantidad de dinero en efectivo.", "Pregunta cuál será tu saldo después del ingreso.", "Pide un extracto o un recibo del ingreso.", "Pregunta cómo hacer una transferencia pequeña a otra cuenta.", "Pregunta dónde actualizar tu dirección si es necesario.", "Confirma si puedes usar el cajero automático después.", "Resume lo que has hecho y despídete."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Erledige übliche Kontovorgänge', 'Sprich, um mehrere normale Bankvorgänge in einem Besuch zu erledigen.', '{"scenario": "Du bist in der Bank und möchtest am selben Tag mehrere einfache Vorgänge mit deinem Konto erledigen.", "tasks": ["Begrüße den Mitarbeiter und sag, dass du mehrere Dinge mit deinem Konto erledigen möchtest.", "Bitte darum, einen Geldbetrag bar einzuzahlen.", "Frag, wie hoch dein Kontostand nach der Einzahlung sein wird.", "Bitte um einen Auszug oder Beleg der Einzahlung.", "Frag, wie man eine kleine Überweisung auf ein anderes Konto macht.", "Frag, wo du deine Adresse aktualisieren kannst, falls nötig.", "Bestätige, ob du danach den Geldautomaten benutzen kannst.", "Fass zusammen, was du erledigt hast, und verabschiede dich."]}'::jsonb);
END;
$seed$;
