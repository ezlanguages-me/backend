-- ============================================================
-- Seed: A0 English Path – STEP 1050 – Writing – note down times, dates and places given by teachers and lecturers (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 1050 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1050, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_writing_id, 'es', 'Toma nota de horas, fechas y lugares que dice el profesor', 'Practica la toma de apuntes rápidos mientras una profesora da instrucciones en voz alta.', '{"scenario": "Tu profesora habla rápido al final de clase y tú necesitas escribir una nota breve pero completa con todos los datos prácticos para la semana.", "tasks": ["Empieza tu nota con el nombre de la asignatura o actividad.", "Anota el día y la fecha de la próxima sesión.", "Escribe la hora de inicio y la hora de llegada recomendada.", "Apunta el aula, laboratorio u oficina mencionados.", "Anota dos materiales que debes llevar.", "Escribe la fecha y la hora límite de la tarea.", "Añade el lugar o la plataforma donde se entrega el trabajo.", "Termina con una línea de recordatorio personal en inglés muy simple, por ejemplo Bring book and ID."]}'::jsonb),
        (v_writing_id, 'de', 'Notiere Zeiten, Daten und Orte aus den Angaben der Lehrkraft', 'Übe schnelles Mitschreiben, während eine Lehrkraft Anweisungen laut gibt.', '{"scenario": "Deine Lehrerin spricht am Ende des Unterrichts schnell, und du musst eine kurze, aber vollständige Notiz mit allen praktischen Angaben für die Woche schreiben.", "tasks": ["Beginne deine Notiz mit dem Namen des Fachs oder der Aktivität.", "Notiere den Wochentag und das Datum der nächsten Sitzung.", "Schreibe die Startzeit und die empfohlene Ankunftszeit auf.", "Notiere den genannten Raum, das Labor oder das Büro.", "Schreib zwei Materialien auf, die du mitbringen musst.", "Notiere Datum und Uhrzeit der Hausaufgabe.", "Ergänze den Ort oder die Plattform für die Abgabe.", "Beende die Notiz mit einer einfachen persönlichen Erinnerung auf Englisch, zum Beispiel Bring book and ID."]}'::jsonb);
END;
$seed$;
