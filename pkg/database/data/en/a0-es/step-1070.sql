-- ============================================================
-- Seed: A0 English Path – STEP 1070 – Writing – write down details of all standard arrangements for assignments to be handed in (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 1070 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1070, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_writing_id, 'es', 'Anota todos los detalles de una entrega', 'Resume por escrito todas las condiciones normales de una tarea que se debe entregar.', '{"scenario": "El profesor explica cómo entregar un trabajo corto. Tú quieres escribir una guía simple con el título, el formato, el nombre del archivo y la hora límite para consultarla después.", "tasks": ["Escribe el título de la tarea o assignment.", "Anota cuántas páginas o palabras debe tener.", "Escribe el formato pedido: papel, PDF o foto clara.", "Anota el nombre exacto del archivo o la portada necesaria.", "Escribe la fecha límite completa y la hora exacta.", "Indica dónde se entrega: plataforma, email o caja del aula.", "Añade dos materiales o elementos obligatorios, por ejemplo nombre y número de grupo.", "Termina con una línea final de comprobación: title, date, place, file name."]}'::jsonb),
        (v_writing_id, 'de', 'Notiere alle Details einer Abgabe', 'Fasse schriftlich alle normalen Bedingungen einer Aufgabe zusammen, die abgegeben werden muss.', '{"scenario": "Die Lehrkraft erklärt, wie eine kurze Aufgabe abgegeben werden soll. Du willst eine einfache Anleitung mit Titel, Format, Dateiname und Frist aufschreiben, damit du sie später prüfen kannst.", "tasks": ["Schreibe den Titel der Aufgabe oder des Assignments auf.", "Notiere, wie viele Seiten oder Wörter die Aufgabe haben soll.", "Schreib das geforderte Format auf: Papier, PDF oder klares Foto.", "Notiere den genauen Dateinamen oder das nötige Deckblatt.", "Schreib das vollständige Abgabedatum und die genaue Uhrzeit auf.", "Gib an, wo die Aufgabe abgegeben wird: Plattform, E-Mail oder Box im Klassenraum.", "Ergänze zwei Pflichtangaben oder Materialien, zum Beispiel Name und Gruppennummer.", "Beende die Notiz mit einer kurzen Prüfliste: title, date, place, file name."]}'::jsonb);
END;
$seed$;
