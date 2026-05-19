-- ============================================================
-- Seed: A0 English Path – STEP 5850 – Listening – Gestión del Estudio y Trámites
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La bibliotecaria pide silencio.", "de": "Die Bibliothekarin bittet um Ruhe.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se pueden sacar cuatro libros.", "de": "Man kann vier Bücher ausleihen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La renovación debe hacerse después de la fecha límite.", "de": "Die Verlängerung muss nach dem Fälligkeitstermin erfolgen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los libros se pueden devolver en el mostrador principal.", "de": "Bücher können am Haupterschalter zurückgegeben werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se pueden usar portátiles en la zona de ordenadores.", "de": "Laptops dürfen im Computerbereich benutzt werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El teléfono móvil debe estar en modo normal.", "de": "Das Handy soll im Normalmodus sein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La caja de libros está junto a la entrada.", "de": "Der Bücherkasten steht neben dem Eingang.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El estudiante pregunta si puede renovar en línea.", "de": "Der Student fragt, ob er online verlängern kann.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuántos libros puede pedir prestados el estudiante?", "de": "Wie viele Bücher kann der Student ausleihen?", "s_es": {"type": "multiple_choice", "options": ["Four", "Two", "Five"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vier", "Zwei", "Fünf"], "answer": 0}}'::jsonb,
        '{"es": "¿Por cuánto tiempo puede sacar los libros?", "de": "Wie lange kann er die Bücher ausleihen?", "s_es": {"type": "multiple_choice", "options": ["Three weeks", "One week", "Six weeks"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Wochen", "Eine Woche", "Sechs Wochen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe hacer antes de la fecha límite?", "de": "Was soll er vor dem Fälligkeitstermin tun?", "s_es": {"type": "multiple_choice", "options": ["Renew them online", "Buy new books", "Return his phone"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie online verlängern", "Neue Bücher kaufen", "Sein Handy zurückgeben"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se pueden devolver los libros?", "de": "Wo kann man die Bücher zurückgeben?", "s_es": {"type": "multiple_choice", "options": ["Front desk or book box", "Only in the café", "Only at the gate"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Schalter oder im Bücherkasten", "Nur im Café", "Nur am Tor"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué zona se permiten portátiles?", "de": "In welchem Bereich sind Laptops erlaubt?", "s_es": {"type": "multiple_choice", "options": ["Computer area", "Silent study room", "Entrance"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Computerbereich", "Stiller Lernraum", "Eingang"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice la bibliotecaria sobre el móvil?", "de": "Was sagt die Bibliothekarin zum Handy?", "s_es": {"type": "multiple_choice", "options": ["Keep it on silent", "Keep it on loud", "Switch it off and leave"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf lautlos stellen", "Auf laut stellen", "Ausschalten und weglegen"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde pide ayuda el estudiante?", "de": "Wo soll der Student Hilfe fragen?", "s_es": {"type": "multiple_choice", "options": ["At the main desk", "At the bus stop", "At the café counter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Hauptschalter", "An der Bushaltestelle", "Am Cafécounter"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta el estudiante al final?", "de": "Was fragt der Student am Ende?", "s_es": {"type": "multiple_choice", "options": ["If he can renew online", "If he can print photos", "If he can book a hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ob er online verlängern kann", "Ob er Fotos drucken kann", "Ob er ein Hotel buchen kann"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5850 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5850 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5850, 'en', 'listening', 'Gestión del Estudio y Trámites', $transcript$
# AUDIO PROFILE: Helen, a library orientation assistant
## "Welcome to East Hall Library"

## THE SCENE: A first visit to the university library
A new student learns the rules, where to study, and how to borrow books.
Helen repeats the key words slowly and gives simple directions.

### DIRECTOR'S NOTES
Style:
* Friendly and quiet voice with short, practical explanations.
* The important places in the library are named clearly.

Pace: Slow, with clear pauses before numbers and room names.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear a short library tour and simple advice about borrowing and returning books.
The audio focuses on rules, quiet study, and basic service points.

#### TRANSCRIPT
[welcoming] Librarian: Welcome. Please keep your phone on silent in the library.
[clear] Librarian: You can borrow up to four books for three weeks.
[helpful] Student: Can I renew them online?
[clear] Librarian: Yes. Renew them before the due date if you need more time.
[practical] Student: Where do I return the books?
[clear] Librarian: You can return them at the front desk or in the book box by the entrance.
[checking] Student: Can I use my laptop here?
[helpful] Librarian: Yes, laptops are allowed in the computer area.
[closing] Librarian: If you need help, ask at the main desk.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha la orientación de la biblioteca', 'Escucha a una bibliotecaria que explica cómo usar la biblioteca y devolver libros.'),
        (v_listening_id, 'de', 'Höre die Bibliothekseinführung', 'Höre eine Bibliothekarin, die erklärt, wie man die Bibliothek benutzt und Bücher zurückgibt.');

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

