-- ============================================================
-- Seed: A0 English Path – STEP 7240 – Speaking – write and dictate a personal letter (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7240 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7240, 'en', 'speaking', 'communication')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Escribe y dicta una carta personal', 'Practica cómo redactar una carta personal y leerla en voz alta de forma clara.', '{"scenario": "Estás pasando unos días fuera de casa y quieres enviar una carta personal a tu abuelo. Debes contarle dónde estás, qué has hecho y cuándo volverás. Después, vas a dictar la carta con buena pronunciación y pausas claras.", "tasks": ["Empieza con un saludo cariñoso y el nombre de la persona.", "Di dónde estás y por qué estás allí.", "Cuenta una experiencia positiva de estos días.", "Menciona un pequeño problema o una sorpresa del viaje.", "Haz dos preguntas sencillas sobre la otra persona o sobre la familia.", "Escribe cuándo volverás o cuándo escribirás otra vez.", "Termina con un cierre cálido y tu nombre.", "Ahora dicta la carta despacio, separando bien saludos, fechas y nombres."]}'::jsonb),
        (v_speaking_id, 'de', 'Schreibe und diktiere einen persönlichen Brief', 'Übe, wie man einen persönlichen Brief schreibt und klar laut vorliest.', '{"scenario": "Du verbringst einige Tage außerhalb von zu Hause und möchtest deinem Großvater einen persönlichen Brief schicken. Du sollst schreiben, wo du bist, was du gemacht hast und wann du zurückkommst. Danach diktierst du den Brief mit guter Aussprache und klaren Pausen.", "tasks": ["Beginne mit einer herzlichen Anrede und dem Namen der Person.", "Sage, wo du bist und warum du dort bist.", "Berichte von einer positiven Erfahrung dieser Tage.", "Erwähne ein kleines Problem oder eine Überraschung der Reise.", "Stelle zwei einfache Fragen über die andere Person oder über die Familie.", "Schreibe, wann du zurückkommst oder wann du wieder schreiben wirst.", "Beende den Brief mit einem warmen Schluss und deinem Namen.", "Diktiere den Brief jetzt langsam und trenne Anrede, Daten und Namen deutlich."]}'::jsonb);
END;
$seed$;
