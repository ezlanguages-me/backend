-- ============================================================
-- Seed: A0 English Path – STEP 1060 – Writing – cope with writing down changes to arrangements given by teachers and lecturers (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 1060 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1060, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_writing_id, 'es', 'Escribe cambios de horario y organización', 'Actualiza una nota cuando el profesor cambia aula, hora y forma de entrega.', '{"scenario": "Ya tenías una nota antigua, pero el profesor anuncia varios cambios: nueva aula, nueva hora, clase cancelada y nueva fecha de entrega. Debes escribir una versión nueva y muy clara.", "tasks": ["Escribe una primera línea con la palabra Change o New plan.", "Anota la actividad que cambia.", "Escribe la nueva fecha y la nueva hora.", "Indica el nuevo aula o edificio.", "Anota si una clase se cancela o se mueve a formato online.", "Escribe la nueva fecha límite de la tarea.", "Añade la nueva forma de entrega: email, plataforma o caja física.", "Cierra la nota con una frase breve de confirmación, por ejemplo Please check the new room."]}'::jsonb),
        (v_writing_id, 'de', 'Schreibe Änderungen von Zeiten und Organisation auf', 'Aktualisiere eine Notiz, wenn die Lehrkraft Raum, Zeit und Abgabeform ändert.', '{"scenario": "Du hattest schon eine alte Notiz, aber die Lehrkraft kündigt mehrere Änderungen an: neuer Raum, neue Uhrzeit, ausfallender Unterricht und neue Abgabefrist. Du sollst eine neue, sehr klare Version schreiben.", "tasks": ["Schreibe in die erste Zeile das Wort Change oder New plan.", "Notiere die Aktivität, die sich ändert.", "Schreib das neue Datum und die neue Uhrzeit auf.", "Gib den neuen Raum oder das neue Gebäude an.", "Notiere, ob ein Unterricht ausfällt oder online stattfindet.", "Schreib die neue Frist der Aufgabe auf.", "Ergänze die neue Abgabeform: E-Mail, Plattform oder Abgabebox.", "Beende die Notiz mit einem kurzen Bestätigungssatz, zum Beispiel Please check the new room."]}'::jsonb);
END;
$seed$;
