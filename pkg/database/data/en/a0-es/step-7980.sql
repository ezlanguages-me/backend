-- ============================================================
-- Seed: A0 English Path – STEP 7980 – Speaking – handle predictable questions confidently (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7980 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7980, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Maneja preguntas previsibles con seguridad', 'Practica respuestas claras y seguras a preguntas muy comunes después de una presentación breve.', '{"scenario": "Acabas de terminar una mini presentación y sigues junto a tu cartel o mesa. Varias personas hacen preguntas muy previsibles. Responde con frases cortas, tono seguro y actitud amable.", "tasks": ["Empieza con una respuesta clara y tranquila sobre tu tema.", "Di un dato simple o un número con seguridad.", "Explica para quién es tu idea o presentación.", "Responde cuánto dura o cuánto tiempo necesita.", "Di dónde están las notas, las diapositivas o el folleto.", "Explica el siguiente paso con una frase breve.", "Invita a una pregunta más con una expresión amable.", "Termina con una frase segura, por ejemplo Yes, that is the plan or Thank you, that is correct."]}'::jsonb),
        (v_speaking_id, 'de', 'Bewältige vorhersehbare Fragen selbstbewusst', 'Übe klare und selbstbewusste Antworten auf sehr häufige Fragen nach einer kurzen Präsentation.', '{"scenario": "Du hast gerade eine Mini-Präsentation beendet und stehst noch an deinem Poster oder Tisch. Mehrere Personen stellen sehr vorhersehbare Fragen. Antworte mit kurzen Sätzen, sicherem Ton und freundlicher Haltung.", "tasks": ["Beginne mit einer klaren und ruhigen Antwort über dein Thema.", "Nenne selbstbewusst eine einfache Information oder eine Zahl.", "Erkläre, für wen deine Idee oder Präsentation ist.", "Beantworte, wie lange sie dauert oder wie viel Zeit sie braucht.", "Sag, wo die Notizen, Folien oder der Handzettel sind.", "Erkläre den nächsten Schritt mit einem kurzen Satz.", "Lade mit einem freundlichen Ausdruck zu einer weiteren Frage ein.", "Beende mit einem sicheren Satz, zum Beispiel Yes, that is the plan oder Thank you, that is correct."]}'::jsonb);
END;
$seed$;
