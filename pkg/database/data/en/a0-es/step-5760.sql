-- ============================================================
-- Seed: A0 English Path – STEP 5760 – Writing – make useful notes from written sources, capturing abstract concepts and relationships between ideas (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 5760 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5760, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Tomar notas sobre motivación y relaciones entre conceptos', '', '{"scenario": "Lees investigaciones de psicología sobre motivación intrínseca y autodeterminación y quieres tomar notas que recojan conceptos abstractos y las relaciones entre ellos.", "tasks": ["Identifica conceptos abstractos centrales como autonomía, competencia o motivación intrínseca.", "Escribe una definición breve de cada concepto con tus propias palabras.", "Anota cómo se relacionan entre sí dos o tres conceptos principales.", "Distingue entre factores que favorecen la motivación y resultados que aparecen después.", "Usa flechas o conectores para mostrar influencia, apoyo o contraste.", "Recoge un hallazgo o ejemplo que ayude a entender cada relación importante.", "Resume en una frase la relación más importante entre autodeterminación y conducta.", "Organiza las notas para que luego sirvan en una explicación más teórica."]}'::jsonb);
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Notizen zu Motivation und Begriffszusammenhängen machen', '', '{"scenario": "Du liest psychologische Forschung über intrinsische Motivation und Selbstbestimmung und möchtest Notizen machen, die abstrakte Begriffe und ihre Beziehungen erfassen.", "tasks": ["Bestimme zentrale abstrakte Begriffe wie Autonomie, Kompetenz oder intrinsische Motivation.", "Schreibe zu jedem Begriff eine kurze Definition mit eigenen Worten.", "Notiere, wie zwei oder drei Hauptbegriffe miteinander zusammenhängen.", "Unterscheide zwischen Faktoren, die Motivation fördern, und Ergebnissen, die danach auftreten.", "Verwende Pfeile oder Verbindungswörter, um Einfluss, Unterstützung oder Gegensatz zu zeigen.", "Nimm ein Ergebnis oder Beispiel auf, das jede wichtige Beziehung verständlicher macht.", "Fasse in einem Satz die wichtigste Beziehung zwischen Selbstbestimmung und Verhalten zusammen.", "Ordne deine Notizen so, dass sie später für eine stärker theoretische Erklärung nützlich sind."]}'::jsonb);
END;
$seed$;
