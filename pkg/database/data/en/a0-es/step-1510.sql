-- ============================================================
-- Seed: A0 English Path – STEP 1510 – Speaking – understand routine bank explanations
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1510 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1510, 'en', 'speaking', 'banking')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Habla sobre el plazo de aviso para retirar dinero', 'Practica cómo pedir y confirmar una explicación rutinaria del banco.', '{"scenario": "Quieres retirar una cantidad grande de tu cuenta de ahorro y necesitas entender el plazo de aviso del banco.", "tasks": ["Saluda y di que quieres retirar una cantidad grande de tu cuenta de ahorro.", "Pregunta cuánto dinero puedes sacar el mismo día.", "Pregunta cuándo hace falta aviso previo.", "Pregunta cuántos días de aviso necesita el banco.", "Pregunta si debes llamar o rellenar un formulario.", "Pregunta qué documento debes llevar al recoger el dinero.", "Confirma la fecha en la que quieres volver a la sucursal.", "Resume las instrucciones del banco y despídete."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Sprich über die Vorankündigung für eine Auszahlung', 'Übe, wie man eine routinemäßige Bankerklärung erfragt und bestätigt.', '{"scenario": "Du möchtest einen größeren Betrag von deinem Sparkonto abheben und musst die Vorankündigungsfrist der Bank verstehen.", "tasks": ["Begrüße den Mitarbeiter und sag, dass du einen großen Betrag von deinem Sparkonto abheben möchtest.", "Frag, wie viel Geld du am selben Tag bekommen kannst.", "Frag, ab wann eine Vorankündigung nötig ist.", "Frag, wie viele Tage Vorlauf die Bank braucht.", "Frag, ob du anrufen oder ein Formular ausfüllen musst.", "Frag, welches Dokument du bei der Abholung mitbringen sollst.", "Bestätige das Datum, an dem du in die Filiale zurückkommen möchtest.", "Fass die Anweisungen der Bank zusammen und verabschiede dich."]}'::jsonb);
END;
$seed$;
