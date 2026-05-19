-- ============================================================
-- Seed: A0 English Path – STEP 3450 – Speaking – describe local geography and climate
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3450 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3450, 'en', 'speaking', 'nature')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Describir la geografía y el clima local', 'Habla de tu ciudad o región usando vocabulario básico de geografía y clima.', $json${"scenario": "Quieres explicar a otra persona cómo es tu zona en inglés.", "tasks": ["Di el nombre de tu ciudad, pueblo o región.", "Explica dónde está: norte, sur, costa, montaña, valle, etc.", "Di si hay río, lago, mar, montañas o llanuras cerca.", "Describe el tiempo normal en verano.", "Describe el tiempo normal en invierno.", "Di si llueve mucho, poco o a veces.", "Explica cuál es la mejor estación para visitar tu zona y por qué.", "Comenta qué suele hacer la gente allí por el clima y el paisaje."]}$json$::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Lokale Geografie und Klima beschreiben', 'Sprich über deine Stadt oder Region mit einfachem Wortschatz zu Geografie und Klima.', $json${"scenario": "Du möchtest einer anderen Person auf Englisch erklären, wie deine Gegend ist.", "tasks": ["Nenne den Namen deiner Stadt, deines Dorfes oder deiner Region.", "Erkläre, wo sie liegt: Norden, Süden, Küste, Berge, Tal usw.", "Sag, ob es in der Nähe einen Fluss, See, das Meer, Berge oder Ebenen gibt.", "Beschreibe das typische Wetter im Sommer.", "Beschreibe das typische Wetter im Winter.", "Sag, ob es viel, wenig oder manchmal regnet.", "Erkläre, welche Jahreszeit am besten für einen Besuch ist und warum.", "Erzähle, was die Menschen dort wegen des Klimas und der Landschaft oft machen."]}$json$::jsonb);
END;
$seed$;
