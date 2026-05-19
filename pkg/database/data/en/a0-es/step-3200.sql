-- ============================================================
-- Seed: A0 English Path – STEP 3200 – Writing – complete standard travel forms such as landing cards (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 3200 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3200, 'en', 'writing', 'transport')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (
            v_writing_id,
            'es',
            'Escribe en una landing card o formulario de llegada',
            'Practica cómo completar un formulario normal de llegada con datos básicos del viaje.',
            '{"scenario": "Estás en el avión antes de aterrizar. La tripulación te da una landing card para el control de entrada.", "tasks": ["Escribe tu apellido y tu nombre exactamente como en el pasaporte.", "Anota tu fecha de nacimiento y tu nacionalidad.", "Escribe tu número de pasaporte.", "Anota el número de vuelo y la fecha de llegada.", "Escribe la dirección de tu primera noche en el país.", "Indica el motivo del viaje, por ejemplo holiday, work o visit.", "Marca si tienes algo que declarar o si no tienes nada.", "Firma el formulario y revisa que todas las casillas estén completas."]}'::jsonb
        ),
        (
            v_writing_id,
            'de',
            'Schreibe eine landing card oder ein Ankunftsformular aus',
            'Übe, wie man ein normales Ankunftsformular mit einfachen Reisedaten ausfüllt.',
            '{"scenario": "Du sitzt im Flugzeug vor der Landung. Die Crew gibt dir eine landing card für die Einreisekontrolle.", "tasks": ["Schreibe deinen Nachnamen und Vornamen genau wie im Reisepass.", "Trage dein Geburtsdatum und deine Nationalität ein.", "Schreibe deine Passnummer auf.", "Trage die Flugnummer und das Ankunftsdatum ein.", "Schreibe die Adresse deiner ersten Nacht im Land.", "Nenne den Grund der Reise, zum Beispiel holiday, work oder visit.", "Kreuze an, ob du etwas zu verzollen hast oder nichts.", "Unterschreibe das Formular und prüfe, dass alle Felder komplett sind."]}'::jsonb
        );
END;
$seed$;
