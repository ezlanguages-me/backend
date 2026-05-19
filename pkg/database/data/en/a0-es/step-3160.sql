-- ============================================================
-- Seed: A0 English Path – STEP 3160 – Listening – go through customs and immigration (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El agente pide el pasaporte.", "de": "Der Beamte bittet um den Reisepass.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La persona viaja por trabajo.", "de": "Die Person reist wegen der Arbeit.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La estancia es de cinco días.", "de": "Der Aufenthalt ist fünf Tage lang.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La persona se aloja en el Park Hotel en el centro.", "de": "Die Person bleibt im Park Hotel im Stadtzentrum.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El billete de vuelta es para el domingo por la noche.", "de": "Das Rückticket ist für Sonntagabend.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La persona lleva fruta fresca.", "de": "Die Person hat frisches Obst dabei.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El agente pregunta por carne o fruta fresca.", "de": "Der Beamte fragt nach Fleisch oder frischem Obst.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Al final, el agente envia a la persona a la estacion.", "de": "Am Ende schickt der Beamte die Person zum Bahnhof.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Cuál es el motivo del viaje?", "de": "Was ist der Grund der Reise?", "s_es": {"type": "multiple_choice", "options": ["A holiday", "A football match", "A job interview"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Urlaub", "Ein Fußballspiel", "Ein Vorstellungsgespräch"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos días se queda?", "de": "Wie viele Tage bleibt die Person?", "s_es": {"type": "multiple_choice", "options": ["Five days", "Two days", "Ten days"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünf Tage", "Zwei Tage", "Zehn Tage"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se aloja?", "de": "Wo bleibt die Person?", "s_es": {"type": "multiple_choice", "options": ["At the Park Hotel in City Centre", "At the Blue Farm Hostel", "At the airport office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Park Hotel im Stadtzentrum", "Im Blue Farm Hostel", "Im Flughafenbüro"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué billete tiene la persona?", "de": "Welches Ticket hat die Person?", "s_es": {"type": "multiple_choice", "options": ["A return ticket", "A bus card only", "No ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Rückticket", "Nur eine Buskarte", "Kein Ticket"], "answer": 0}}'::jsonb,
        '{"es": "¿Para cuándo es el regreso?", "de": "Wann ist die Rückreise?", "s_es": {"type": "multiple_choice", "options": ["Friday morning", "Sunday night", "Monday afternoon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Freitagmorgen", "Sonntagabend", "Montagnachmittag"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué no lleva la persona?", "de": "Was hat die Person nicht dabei?", "s_es": {"type": "multiple_choice", "options": ["Meat or fresh fruit", "A passport", "A hotel name"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fleisch oder frisches Obst", "Einen Reisepass", "Einen Hotelnamen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice el agente al final?", "de": "Was sagt der Beamte am Ende?", "s_es": {"type": "multiple_choice", "options": ["Welcome", "Go to platform six", "Open your suitcase"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Willkommen", "Gehen Sie zu Gleis sechs", "Öffnen Sie Ihren Koffer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué documento muestra primero la persona?", "de": "Welches Dokument zeigt die Person zuerst?", "s_es": {"type": "multiple_choice", "options": ["The passport", "The shopping list", "The train map"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Reisepass", "Die Einkaufsliste", "Den Zugplan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3160 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 3160 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3160, 'en', 'listening', 'transport', $transcript$
# AUDIO PROFILE: Immigration officer at an airport desk
## "Passport Control"

## THE SCENE: A traveller arrives and answers routine questions at immigration
The officer checks identity, hotel details, and declared food items.

### DIRECTOR'S NOTES
Style:
* Short question and answer exchange.
* The officer speaks slowly and clearly for a first entry check.

Pace: Slow and formal.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding common immigration questions about purpose, stay, hotel, and return ticket.
The audio also includes a simple customs question about food.

#### TRANSCRIPT
[formal] Officer: Good evening. Passport, please.
[polite] Traveller: Here you are.
[clear] Officer: What is the purpose of your visit?
[friendly] Traveller: Holiday. I am here for five days.
[practical] Officer: Where are you staying?
[clear] Traveller: At the Park Hotel in City Centre.
[checking] Officer: Do you have a return ticket?
[short] Traveller: Yes, on Friday morning.
[informative] Officer: Are you carrying meat or fresh fruit?
[calm] Traveller: No, I am not.
[warm] Officer: Thank you. Welcome.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha un control de inmigración', 'Escucha preguntas normales en inmigración sobre el viaje, el hotel y los objetos que llevas.'),
        (v_listening_id, 'de', 'Höre eine Kontrolle bei der Einreise', 'Höre normale Fragen bei der Einreise zu Reisegrund, Hotel und mitgebrachten Sachen.');

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
