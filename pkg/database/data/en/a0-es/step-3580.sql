-- ============================================================
-- Seed: A0 English Path – STEP 3580 – Speaking – introduce yourself professionally (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3580 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3580, 'en', 'speaking', 'professional')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Preséntate de forma profesional', 'Prepara una breve presentación oral para decir quién eres, dónde trabajas y en qué ayudas.', '{"scenario": "Vas a asistir a una reunión breve con un cliente nuevo. Quieres practicar una presentación profesional, clara y amable antes de entrar en la sala.", "tasks": ["Saluda al cliente y di tu nombre completo.", "Di el nombre de tu empresa y tu puesto.", "Explica en una frase cuál es tu trabajo principal.", "Menciona un área en la que ayudas a clientes o compañeros.", "Di con qué equipo o departamento trabajas normalmente.", "Añade un detalle práctico, por ejemplo horario, contacto o idioma de trabajo.", "Di que estás disponible para preguntas o ayuda.", "Cierra la presentación con una despedida profesional y amable."]}'::jsonb),
        (v_speaking_id, 'de', 'Stell dich beruflich vor', 'Bereite eine kurze mündliche Vorstellung vor, in der du sagst, wer du bist, wo du arbeitest und wobei du hilfst.', '{"scenario": "Du nimmst an einem kurzen Treffen mit einem neuen Kunden teil. Vor dem Gespräch möchtest du eine berufliche, klare und freundliche Vorstellung üben.", "tasks": ["Begrüße den Kunden und nenne deinen vollständigen Namen.", "Sag den Namen deiner Firma und deine Position.", "Erkläre in einem Satz, was deine Hauptaufgabe ist.", "Nenne einen Bereich, in dem du Kunden oder Kollegen unterstützt.", "Sag, mit welchem Team oder welcher Abteilung du normalerweise arbeitest.", "Füge ein praktisches Detail hinzu, zum Beispiel Arbeitszeit, Kontakt oder Arbeitssprache.", "Sag, dass du für Fragen oder Hilfe zur Verfügung stehst.", "Beende die Vorstellung mit einer professionellen und freundlichen Verabschiedung."]}'::jsonb);
END;
$seed$;
