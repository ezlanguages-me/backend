-- ============================================================
-- Seed: A0 English Path – STEP 3140 – Speaking – report a car breakdown or traffic problem (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3140 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3140, 'en', 'speaking', 'transport')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (
            v_speaking_id,
            'es',
            'Habla para informar de un problema de tráfico',
            'Practica cómo explicar un retraso por tráfico o por un problema en la carretera.',
            '{"scenario": "Vas en taxi por la circunvalación y llamas a tu hotel o punto de encuentro porque hay un accidente y llegas tarde.", "tasks": ["Saluda e indica a quién llamas.", "Di dónde estás ahora, por ejemplo en una carretera o cerca de una salida.", "Explica el problema de tráfico o de la carretera con una frase simple.", "Di si vas en taxi, bus o coche.", "Indica cuánto retraso tienes, por ejemplo ten minutes or twenty minutes.", "Pregunta si la llegada tarde es un problema.", "Di si necesitas una nueva hora, ayuda o instrucciones.", "Termina con una despedida educada y una confirmación de tu llegada."]}'::jsonb
        ),
        (
            v_speaking_id,
            'de',
            'Sprich, um ein Verkehrsproblem zu melden',
            'Übe, wie man eine Verspätung wegen Verkehr oder eines Problems auf der Straße erklärt.',
            '{"scenario": "Du sitzt im Taxi auf der Ringstraße und rufst dein Hotel oder deinen Treffpunkt an, weil es nach einem Unfall eine Verspätung gibt.", "tasks": ["Begrüße die Person und sage, wen du anrufst.", "Sag, wo du jetzt bist, zum Beispiel auf einer Straße oder bei einer Ausfahrt.", "Erkläre das Verkehrsproblem oder Straßenproblem mit einem einfachen Satz.", "Sag, ob du im Taxi, Bus oder Auto bist.", "Nenne deine Verspätung, zum Beispiel ten minutes oder twenty minutes.", "Frage, ob die späte Ankunft ein Problem ist.", "Sag, ob du eine neue Zeit, Hilfe oder Anweisungen brauchst.", "Beende das Gespräch höflich und bestätige deine Ankunft."]}'::jsonb
        );
END;
$seed$;
