-- ============================================================
-- Seed: A0 English Path – STEP 1010 – Speaking – check that all instructions are understood (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1010 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1010, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Comprueba que entiendes todas las instrucciones', 'Ensaya una respuesta oral para confirmar cada detalle de unas instrucciones académicas.', '{"scenario": "Acabas de terminar una sesión de orientación en inglés. Vas a grabar un mensaje corto para tu tutor para demostrar que entendiste todas las instrucciones sobre la clase, la tarjeta de estudiante y la entrega de un formulario.", "tasks": ["Saluda al tutor y di que quieres repetir las instrucciones importantes.", "Indica el día, la fecha, la hora y el aula de la próxima clase.", "Explica a qué hora debes llegar y qué documento llevas contigo.", "Di dónde recoges la tarjeta de estudiante y en qué mostrador preguntas si tienes dudas.", "Explica qué formulario completas hoy y en qué página web lo haces.", "Menciona dos materiales que debes llevar a la primera clase.", "Confirma la hora límite para enviar el formulario y a qué correo escribes si hay un problema.", "Termina diciendo que ahora entiendes todo y despídete con educación."]}'::jsonb),
        (v_speaking_id, 'de', 'Prüfe, ob du alle Anweisungen verstehst', 'Übe eine mündliche Antwort, um jedes Detail akademischer Anweisungen zu bestätigen.', '{"scenario": "Du hast gerade eine Einführung auf Englisch beendet. Du willst deiner Tutorin eine kurze Nachricht aufnehmen, um zu zeigen, dass du alle Anweisungen zu Unterricht, Studentenausweis und einem Formular verstanden hast.", "tasks": ["Begrüße die Tutorin und sag, dass du die wichtigen Anweisungen wiederholen möchtest.", "Nenne den Tag, das Datum, die Uhrzeit und den Raum des nächsten Unterrichts.", "Erkläre, wann du ankommen sollst und welches Dokument du mitbringst.", "Sag, wo du den Studentenausweis abholst und an welchem Schalter du bei Fragen nachfragst.", "Erkläre, welches Formular du heute ausfüllst und auf welcher Webseite du das machst.", "Nenne zwei Materialien, die du zum ersten Unterricht mitbringen musst.", "Bestätige die Frist für das Formular und an welche E-Mail du bei einem Problem schreibst.", "Beende die Nachricht damit, dass du jetzt alles verstehst, und verabschiede dich höflich."]}'::jsonb);
END;
$seed$;
