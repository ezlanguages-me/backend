-- ============================================================
-- Seed: A0 English Path – STEP 3380 – Speaking – describe a natural landscape
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3380 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3380, 'en', 'speaking', 'nature')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Describir un paisaje natural', 'Habla de un paisaje natural de forma simple y organizada.', $json${"scenario": "Estás mirando una foto de un paisaje natural y quieres describirla en inglés a un amigo.", "tasks": ["Di qué tipo de lugar es: bosque, montaña, playa, valle u otro.", "Describe qué hay en primer plano y qué hay al fondo.", "Habla del cielo y del tiempo que hace.", "Menciona si hay agua: río, lago, mar o cascada.", "Nombra algunas plantas o animales que puedes ver o imaginar allí.", "Di qué colores notas en el paisaje.", "Explica qué puede hacer la gente en ese lugar.", "Di si te gusta ese paisaje y por qué."]}$json$::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine Naturlandschaft beschreiben', 'Sprich einfach und geordnet über eine Naturlandschaft.', $json${"scenario": "Du schaust auf ein Foto einer Naturlandschaft und möchtest sie einem Freund auf Englisch beschreiben.", "tasks": ["Sag, was für ein Ort es ist: Wald, Berg, Strand, Tal oder etwas anderes.", "Beschreibe, was im Vordergrund und was im Hintergrund ist.", "Sprich über den Himmel und das Wetter.", "Erwähne, ob es Wasser gibt: Fluss, See, Meer oder Wasserfall.", "Nenne einige Pflanzen oder Tiere, die du dort sehen oder dir vorstellen kannst.", "Sag, welche Farben du in der Landschaft bemerkst.", "Erkläre, was Menschen an diesem Ort machen können.", "Sag, ob dir diese Landschaft gefällt und warum."]}$json$::jsonb);
END;
$seed$;
