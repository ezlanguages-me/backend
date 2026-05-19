-- ============================================================
-- Seed: A0 English Path – STEP 6370 – Speaking – explica expectativas culturales (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 6370 AND path_uuid = v_path_id;
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 6370, 'en', 'speaking', 'Convivencia')
    RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'explica expectativas culturales', 'Practica cómo explicar normas sociales sencillas de manera clara, amable y útil para un visitante.', '{"scenario": "Un visitante nuevo o un compañero de intercambio te pregunta cómo actuar en tu casa o en tu entorno social.","tasks": ["Explica cómo se saluda normalmente a la gente.","Di si la gente se quita los zapatos al entrar.","Menciona si es importante llegar puntual.","Explica si se suele traer un pequeño regalo o no.","Di cómo se habla en casa o con amigos: directo o con mucho small talk.","Aclara cómo se avisa si no se puede ir a un plan.","Da un consejo sobre la mesa o sobre visitar una casa.","Termina con una frase amable que invite a preguntar más."],"de": {"scenario": "Ein neuer Besucher oder ein Austauschschüler fragt dich, wie man sich zu Hause oder in deinem sozialen Umfeld verhält.","tasks": ["Erkläre, wie man Menschen normalerweise begrüßt.","Sag, ob man beim Reinkommen die Schuhe auszieht.","Erwähne, ob Pünktlichkeit wichtig ist.","Erkläre, ob man gewöhnlich ein kleines Geschenk mitbringt oder nicht.","Sag, wie man zu Hause oder mit Freunden spricht: direkt oder mit viel Small Talk.","Kläre, wie man absagt, wenn man zu einem Plan nicht kommen kann.","Gib einen Tipp für den Tisch oder für einen Hausbesuch.","Beende mit einem freundlichen Satz, der zu weiteren Fragen einlädt."]}}'::jsonb),
        (v_speaking_id, 'de', 'erkläre kulturelle Erwartungen', 'Übe, wie du einfache soziale Regeln klar, freundlich und hilfreich für einen Besucher erklärst.', '{"scenario": "Ein neuer Besucher oder ein Austauschschüler fragt dich, wie man sich zu Hause oder in deinem sozialen Umfeld verhält.","tasks": ["Erkläre, wie man Menschen normalerweise begrüßt.","Sag, ob man beim Reinkommen die Schuhe auszieht.","Erwähne, ob Pünktlichkeit wichtig ist.","Erkläre, ob man gewöhnlich ein kleines Geschenk mitbringt oder nicht.","Sag, wie man zu Hause oder mit Freunden spricht: direkt oder mit viel Small Talk.","Kläre, wie man absagt, wenn man zu einem Plan nicht kommen kann.","Gib einen Tipp für den Tisch oder für einen Hausbesuch.","Beende mit einem freundlichen Satz, der zu weiteren Fragen einlädt."]}'::jsonb);
END;
$seed$;
