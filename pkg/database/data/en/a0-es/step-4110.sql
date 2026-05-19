-- ============================================================
-- Seed: A0 English Path – STEP 4110 – Listening – offer professional assistance (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La agente se llama Claire.", "p_de": "Die Mitarbeiterin heißt Claire.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente ya conoce bien los servicios de la empresa.", "p_de": "Der Kunde kennt die Dienste des Unternehmens bereits gut.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Claire ofrece enviar información por correo electrónico.", "p_de": "Claire bietet an, Informationen per E-Mail zu schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empresa tiene un servicio de asistencia en línea.", "p_de": "Das Unternehmen hat einen Online-Assistenzdienst.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Claire ofrece una visita de demostración de dos horas.", "p_de": "Claire bietet einen zweistündigen Demonstrationsbesuch an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente acepta la visita de demostración.", "p_de": "Der Kunde nimmt den Demonstrationsbesuch an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Claire puede reservar la visita directamente.", "p_de": "Claire kann den Besuch direkt buchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La visita de demostración tiene un coste de £50.", "p_de": "Der Demonstrationsbesuch kostet £50.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cómo se llama la agente?", "p_de": "Wie heißt die Mitarbeiterin?", "s_es": {"type": "multiple_choice", "options": ["Claire", "Rosa", "Ana"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Claire", "Rosa", "Ana"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ofrece enviar Claire?", "p_de": "Was bietet Claire an zu schicken?", "s_es": {"type": "multiple_choice", "options": ["Information by email", "A printed manual", "A sample product"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Informationen per E-Mail", "Ein gedrucktes Handbuch", "Ein Produktmuster"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué servicio en línea tiene la empresa?", "p_de": "Welchen Online-Dienst hat das Unternehmen?", "s_es": {"type": "multiple_choice", "options": ["Online assistance", "Online ordering only", "No online service"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Online-Assistenz", "Nur Online-Bestellungen", "Kein Online-Service"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de visita ofrece Claire?", "p_de": "Welche Art von Besuch bietet Claire an?", "s_es": {"type": "multiple_choice", "options": ["A one-hour demonstration visit", "A two-hour audit", "A half-day training"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen einstündigen Demonstrationsbesuch", "Ein zweistündiges Audit", "Ein halbtägiges Training"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué decide el cliente?", "p_de": "Was entscheidet der Kunde?", "s_es": {"type": "multiple_choice", "options": ["To accept the demonstration visit", "To decline all offers", "To read the brochure first"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Demonstrationsbesuch anzunehmen", "Alle Angebote abzulehnen", "Zuerst die Broschüre zu lesen"], "answer": 0}}'::jsonb,
        '{"p": "¿Puede Claire reservar la visita?", "p_de": "Kann Claire den Besuch buchen?", "s_es": {"type": "multiple_choice", "options": ["Yes, directly", "No, the client must call back", "Only online"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja, direkt", "Nein, der Kunde muss zurückrufen", "Nur online"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la visita de demostración?", "p_de": "Was kostet der Demonstrationsbesuch?", "s_es": {"type": "multiple_choice", "options": ["It is free", "£50", "£100"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Es ist kostenlos", "£50", "£100"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se practica en esta escucha?", "p_de": "Was wird in diesem Hörtext geübt?", "s_es": {"type": "multiple_choice", "options": ["Offering professional assistance", "Filing a complaint", "Reporting a technical fault"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Professionelle Hilfe anbieten", "Eine Beschwerde einreichen", "Einen technischen Fehler melden"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4110 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 4110 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 4110, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Claire (agent) and a potential client
## "Offering Professional Assistance"

## THE SCENE: An outbound service call; Claire calls a potential new client
Claire introduces the company services and offers several types of help.

### DIRECTOR'S NOTES
Style:
* Polite, professional outbound sales call.
* Claire is helpful and attentive to the client's needs.

Pace: Moderate and clear.

Accent: Neutral accent.

#### TRANSCRIPT
[welcoming] Claire: Good afternoon. This is Claire from ProServ Solutions. How are you today?
[opening] Client: Fine, thank you. I was actually thinking about your services.
[offering] Claire: That is great to hear. I can send you information by email straight away.
[informing] Claire: We also have an online assistance portal where you can find answers any time.
[proposing] Claire: I would also like to offer a free one-hour demonstration visit at your premises.
[interested] Client: That sounds useful. What would the visit involve?
[explaining] Claire: Our specialist would show you all our main services and answer your questions directly.
[deciding] Client: Yes, I would like that. Please go ahead and book it.
[booking] Claire: Wonderful. I can reserve the visit directly for you. What day suits you best?
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una llamada de oferta de ayuda profesional', 'Escucha una llamada donde se ofrece información, asistencia en línea y una visita de demostración gratuita.'),
            (v_listening_id, 'de', 'Höre einen Anruf zum Angebot professioneller Hilfe', 'Höre einen Anruf, bei dem Informationen, Online-Assistenz und ein kostenloser Demonstrationsbesuch angeboten werden.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
