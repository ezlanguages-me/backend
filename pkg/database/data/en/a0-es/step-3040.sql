-- ============================================================
-- Seed: A0 English Path – STEP 3040 – Listening – book a car hire
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La cliente quiere reservar un coche pequeño para el domingo.", "de": "Die Kundin möchte für Sonntag einen Kleinwagen buchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El coche disponible es automático.", "de": "Das verfügbare Auto ist automatisch.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El precio es de treinta y cinco libras al día.", "de": "Der Preis beträgt fünfunddreißig Pfund pro Tag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La oficina está al lado de la estación central.", "de": "Das Büro ist neben dem Hauptbahnhof.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La oficina abre a las ocho de la mañana.", "de": "Das Büro öffnet um acht Uhr morgens.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Se puede devolver el coche antes de las siete de la tarde.", "de": "Man kann das Auto bis vor sieben Uhr abends zurückgeben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La silla infantil cuesta cinco libras extra.", "de": "Der Kindersitz kostet fünf Pfund extra.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La cliente solo necesita traer un pasaporte.", "de": "Die Kundin muss nur einen Reisepass mitbringen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Para qué día quiere la cliente el coche?", "de": "Für welchen Tag möchte die Kundin das Auto?", "s_es": {"type": "multiple_choice", "options": ["Sunday", "Friday", "Monday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sonntag", "Freitag", "Montag"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de coche tienen?", "de": "Welchen Wagentyp haben sie?", "s_es": {"type": "multiple_choice", "options": ["A small manual car", "A big automatic car", "A van"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen kleinen Wagen mit Schaltung", "Einen großen Wagen mit Automatik", "Einen Van"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta por día?", "de": "Wie viel kostet es pro Tag?", "s_es": {"type": "multiple_choice", "options": ["Thirty five pounds", "Five pounds", "Seventy pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünfunddreißig Pfund", "Fünf Pfund", "Siebzig Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde recoge la cliente el coche?", "de": "Wo holt die Kundin das Auto ab?", "s_es": {"type": "multiple_choice", "options": ["Next to the central station", "At the airport", "At the hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neben dem Hauptbahnhof", "Am Flughafen", "Im Hotel"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora abre la oficina?", "de": "Um wie viel Uhr öffnet das Büro?", "s_es": {"type": "multiple_choice", "options": ["Nine a.m.", "Seven p.m.", "Six a.m."], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neun Uhr", "Sieben Uhr abends", "Sechs Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Hasta qué hora puede devolver el coche?", "de": "Bis wann kann sie das Auto zurückbringen?", "s_es": {"type": "multiple_choice", "options": ["By seven p.m.", "By noon", "By midnight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis sieben Uhr abends", "Bis mittags", "Bis Mitternacht"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué extra menciona la agente?", "de": "Welche Zusatzoption erwähnt die Agentin?", "s_es": {"type": "multiple_choice", "options": ["A child seat", "A free map", "A boat ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Kindersitz", "Eine kostenlose Karte", "Ein Bootsticket"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe llevar la cliente?", "de": "Was muss die Kundin mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Her driving licence and card", "Only cash", "A bicycle helmet"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihren Führerschein und ihre Karte", "Nur Bargeld", "Einen Fahrradhelm"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3040 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 3040 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3040, 'en', 'listening', 'transport', $transcript$
# AUDIO PROFILE: Nina, a rental agent on the phone
## "A Small Car for Sunday"

## THE SCENE: A customer phones a city car hire office
The customer wants a small car for one day.
Nina gives the price, the pick up place, the return time, and one extra option.

### DIRECTOR'S NOTES
Style:
* Short phone booking with clear numbers and times.
* Helpful repetition of the car type, the price, and the documents.

Pace: Slow and clear.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following a simple booking call for a day trip by car.
The recording focuses on day rate, office location, return time, and one optional extra.

#### TRANSCRIPT
[phone] Agent: Good morning, City Wheels.
[clear] Customer: Hello. I want to book a small car for Sunday.
[helpful] Agent: Yes. We have a small manual car for thirty five pounds a day.
[checking] Customer: Great. Where do I pick it up?
[practical] Agent: At our office next to the central station. We open at nine a.m.
[question] Customer: Can I return it in the evening?
[clear] Agent: Yes, please bring it back by seven p.m. A child seat is five pounds extra.
[confirming] Customer: Fine. I will bring my driving licence and card.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha una llamada para reservar un coche de alquiler', 'Escucha una llamada sencilla con tipo de coche, precio por día, recogida, devolución y un extra.'),
        (v_listening_id, 'de', 'Höre ein Telefongespräch zur Buchung eines Mietwagens', 'Höre ein einfaches Telefongespräch mit Fahrzeugtyp, Tagespreis, Abholung, Rückgabe und einer Zusatzoption.');

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
