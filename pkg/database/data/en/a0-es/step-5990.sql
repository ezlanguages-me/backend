-- ============================================================
-- Seed: A0 English Path – STEP 5990 – Listening – Alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El huésped está haciendo el check-out por la mañana.", "de": "Der Gast macht morgens den Check-out.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La recepción revisa la cuenta.", "de": "Die Rezeption prüft die Rechnung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tarjeta de la habitación se devuelve.", "de": "Die Zimmerkarte wird zurückgegeben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La consumición del minibar cuesta cinco libras.", "de": "Der Minibar-Verbrauch kostet fünf Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El huésped paga con tarjeta.", "de": "Der Gast bezahlt mit Karte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La recepción dice que el total no es correcto.", "de": "Die Rezeption sagt, dass die Summe falsch ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El huésped pide un taxi.", "de": "Der Gast bittet um ein Taxi.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El taxi llegará en cinco minutos.", "de": "Das Taxi kommt in fünf Minuten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuándo hace el check-out el huésped?", "de": "Wann macht der Gast den Check-out?", "s_es": {"type": "multiple_choice", "options": ["In the morning", "At midnight", "In the evening"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Morgen", "Um Mitternacht", "Am Abend"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué devuelve el huésped?", "de": "Was gibt der Gast zurück?", "s_es": {"type": "multiple_choice", "options": ["Key card", "Passport", "Breakfast voucher"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Schlüsselkarte", "Pass", "Frühstücksgutschein"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué revisa la recepción?", "de": "Was prüft die Rezeption?", "s_es": {"type": "multiple_choice", "options": ["The bill", "The luggage", "The room service menu"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Rechnung", "Das Gepäck", "Die Zimmerspeisekarte"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta el minibar?", "de": "Wie viel kostet die Minibar?", "s_es": {"type": "multiple_choice", "options": ["Five pounds", "Three pounds", "Ten pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünf Pfund", "Drei Pfund", "Zehn Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo paga el huésped?", "de": "Wie bezahlt der Gast?", "s_es": {"type": "multiple_choice", "options": ["By card", "By cash only", "By cheque"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Karte", "Nur mit Bargeld", "Mit Scheck"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué solicita el huésped al final?", "de": "Was bittet der Gast am Ende?", "s_es": {"type": "multiple_choice", "options": ["A taxi", "A new room", "A second breakfast"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Taxi", "Ein neues Zimmer", "Ein zweites Frühstück"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto tardará el taxi?", "de": "Wie lange dauert es, bis das Taxi kommt?", "s_es": {"type": "multiple_choice", "options": ["Five minutes", "One hour", "Twenty minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünf Minuten", "Eine Stunde", "Zwanzig Minuten"], "answer": 0}}'::jsonb,
        '{"es": "¿La recepción confirma que el total es correcto?", "de": "Bestätigt die Rezeption, dass die Summe korrekt ist?", "s_es": {"type": "multiple_choice", "options": ["Yes", "No", "Not mentioned"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nicht erwähnt"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5990 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5990 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5990, 'en', 'listening', 'Alojamiento', $transcript$
# AUDIO PROFILE: Thomas, a hotel receptionist
## "Checking Out"

## THE SCENE: A guest leaves the hotel in the morning
Thomas checks the bill, takes the key card, and explains the final details.
He speaks clearly and repeats the total and payment options.

### DIRECTOR'S NOTES
Style:
* Calm front-desk voice with short checkout phrases.
* The bill total, room number, and timing are repeated clearly.

Pace: Slow, with pauses before each number.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear a simple checkout conversation with a receipt, minibar charge, and taxi request.
The audio practises payment, keys, and departure language.

#### TRANSCRIPT
[welcoming] Receptionist: Good morning. Are you ready to check out?
[clear] Guest: Yes. Here is my key card.
[practical] Receptionist: Thank you. I will check the bill now.
[checking] Guest: Is the total correct?
[clear] Receptionist: Yes. The room charge and breakfast are correct, and the minibar is five pounds.
[helpful] Guest: Can I pay by card?
[clear] Receptionist: Yes, of course.
[practical] Guest: Could you call a taxi for me?
[helpful] Receptionist: Yes. It will be here in five minutes.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha el proceso de salida del hotel', 'Escucha cómo un huésped paga la cuenta, devuelve la llave y sale del hotel.'),
        (v_listening_id, 'de', 'Höre den Hotel-Check-out', 'Höre, wie ein Gast die Rechnung bezahlt, den Schlüssel abgibt und das Hotel verlässt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
