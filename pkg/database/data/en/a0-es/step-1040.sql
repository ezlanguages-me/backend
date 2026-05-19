-- ============================================================
-- Seed: A0 English Path – STEP 1040 – Writing – copy times, dates and places from notices on classroom board or notice board (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 1040 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1040, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_writing_id, 'es', 'Copia horas, fechas y lugares del tablón', 'Escribe una nota clara con la información que aparece en varios avisos del tablón.', '{"scenario": "Estás en el pasillo de la escuela. Ves tres avisos en el tablón y quieres copiar toda la información importante en tu cuaderno para no olvidar nada.", "tasks": ["Escribe el título corto del primer aviso.", "Copia el día y la fecha completos de la primera actividad.", "Anota la hora exacta de inicio.", "Escribe el aula o lugar donde tiene lugar la actividad.", "Copia el día y la hora del segundo aviso.", "Añade el nombre del edificio o laboratorio que aparece en ese aviso.", "Anota la fecha límite del tercer aviso y la hora de entrega.", "Revisa tu nota final y ordénala en tres líneas claras: actividad, tiempo y lugar."]}'::jsonb),
        (v_writing_id, 'de', 'Schreibe Zeiten, Daten und Orte vom Brett ab', 'Schreibe eine klare Notiz mit Informationen aus mehreren Aushängen am Brett.', '{"scenario": "Du bist im Flur der Schule. Du siehst drei Aushänge am schwarzen Brett und willst alle wichtigen Informationen in dein Heft schreiben, damit du nichts vergisst.", "tasks": ["Schreibe den kurzen Titel des ersten Aushangs.", "Notiere den vollständigen Wochentag und das Datum der ersten Aktivität.", "Schreib die genaue Startzeit auf.", "Notiere den Raum oder Ort der Aktivität.", "Schreib den Tag und die Uhrzeit des zweiten Aushangs auf.", "Ergänze den Namen des Gebäudes oder Labors aus diesem Aushang.", "Notiere die Frist des dritten Aushangs und die Abgabezeit.", "Prüfe deine Notiz am Ende und ordne sie in drei klare Zeilen: Aktivität, Zeit und Ort."]}'::jsonb);
END;
$seed$;
