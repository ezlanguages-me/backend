-- ============================================================
-- Seed: A0 English Path – STEP 7580 – Speaking – summarize meeting decisions (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7580 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7580, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Resume decisiones de una reunión', 'Practica un resumen oral claro de decisiones, responsables y próximos pasos al final de una reunión.', '{"scenario": "Acaba de terminar una reunión de proyecto. Tu responsable te pide un resumen oral breve para compartir con una persona que llegó tarde.", "tasks": ["Empieza diciendo el objetivo principal de la reunión.", "Menciona la decisión más importante que tomó el grupo.", "Di qué tarea concreta hará cada persona principal.", "Incluye al menos un plazo o una hora límite.", "Explica qué tema quedó abierto o pendiente.", "Resume cuándo será la próxima revisión o seguimiento.", "Usa una frase para conectar ideas, por ejemplo first, then, finally.", "Termina con una acción clara para el equipo."]}'::jsonb),
        (v_speaking_id, 'de', 'Fasse Besprechungsentscheidungen zusammen', 'Übe eine klare mündliche Zusammenfassung von Entscheidungen, Zuständigkeiten und nächsten Schritten am Ende einer Besprechung.', '{"scenario": "Eine Projektbesprechung ist gerade zu Ende. Deine Leitung bittet dich um eine kurze mündliche Zusammenfassung für eine Person, die zu spät gekommen ist.", "tasks": ["Beginne mit dem Hauptziel der Besprechung.", "Nenne die wichtigste Entscheidung der Gruppe.", "Sag, welche konkrete Aufgabe jede zentrale Person übernimmt.", "Baue mindestens eine Frist oder Uhrzeit ein.", "Erkläre, welches Thema offen oder ungeklärt geblieben ist.", "Fasse zusammen, wann die nächste Kontrolle oder Nachbesprechung stattfindet.", "Nutze einen Verbindungsausdruck wie first, then oder finally.", "Beende mit einer klaren Aktion für das Team."]}'::jsonb);
END;
$seed$;
