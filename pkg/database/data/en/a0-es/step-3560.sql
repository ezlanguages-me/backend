-- ============================================================
-- Seed: A0 English Path – STEP 3560 – Listening – understand a business phone call (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Daniel llama de Metro Print.", "p_de": "Daniel ruft von Metro Print an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reunión sigue a las 11 AM.", "p_de": "Das Treffen bleibt um 11 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La nueva hora es las 2 PM.", "p_de": "Die neue Uhrzeit ist 14 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que entrar por Gate B.", "p_de": "Man soll durch Gate B hereinkommen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Daniel enviará el presupuesto después de cenar.", "p_de": "Daniel schickt das Angebot nach dem Abendessen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La reunión dura unos treinta minutos.", "p_de": "Das Treffen dauert ungefähr dreißig Minuten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Daniel llevará dos sample folders.", "p_de": "Daniel bringt zwei sample folders mit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si Daniel llega tarde, hay que llamar a Ana.", "p_de": "Wenn Daniel zu spät kommt, soll man Ana anrufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué día es la reunión?", "p_de": "An welchem Tag ist das Treffen?", "s_es": {"type": "multiple_choice", "options": ["Next Thursday", "This Tuesday", "Next Monday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nächsten Donnerstag", "Diesen Dienstag", "Nächsten Montag"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué hora cambia la reunión?", "p_de": "Von welcher Uhrzeit wird das Treffen verschoben?", "s_es": {"type": "multiple_choice", "options": ["11 AM", "2 PM", "4 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["11 Uhr", "14 Uhr", "16 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la reunión ahora?", "p_de": "Um wie viel Uhr ist das Treffen jetzt?", "s_es": {"type": "multiple_choice", "options": ["2 PM", "11 AM", "1 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["14 Uhr", "11 Uhr", "13 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puerta deben usar?", "p_de": "Welches Tor sollen sie benutzen?", "s_es": {"type": "multiple_choice", "options": ["Gate B", "Gate A", "Gate C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Gate B", "Gate A", "Gate C"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué enviará Daniel antes del almuerzo?", "p_de": "Was schickt Daniel vor dem Mittagessen?", "s_es": {"type": "multiple_choice", "options": ["The quote", "The invoice", "The key"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Angebot", "Die Rechnung", "Den Schlüssel"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura la reunión?", "p_de": "Wie lange dauert das Treffen?", "s_es": {"type": "multiple_choice", "options": ["About thirty minutes", "Two hours", "Ten minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ungefähr dreißig Minuten", "Zwei Stunden", "Zehn Minuten"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas carpetas de muestra lleva Daniel?", "p_de": "Wie viele Mustermappen bringt Daniel mit?", "s_es": {"type": "multiple_choice", "options": ["Two", "One", "Five"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Eine", "Fünf"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué número llaman si llega tarde?", "p_de": "Welche Nummer ruft man an, wenn er zu spät kommt?", "s_es": {"type": "multiple_choice", "options": ["555-0178", "555-0187", "555-0718"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["555-0178", "555-0187", "555-0718"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid FROM listening
            WHERE step_order = 3560 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening'
        );
        DELETE FROM listening WHERE step_order = 3560 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3560, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Daniel, a supplier calling an office assistant
## "Can We Move the Meeting?"

## THE SCENE: A short office call before a supplier visit
Daniel changes the meeting time and repeats the practical details clearly.

### DIRECTOR'S NOTES
Style:
* Polite business call with repeated times and access details.
* Important information is easy to note down.

Pace: Slow and clear.

Accent: Neutral accent.

#### TRANSCRIPT
[polite] Daniel: Hello, this is Daniel from Metro Print.
[helpful] Daniel: I am calling about our meeting next Thursday.
[clear] Daniel: Can we move it from 11 AM to 2 PM?
[confirming] Assistant: Yes, 2 PM is fine.
[practical] Daniel: Great. Please use Gate B when you arrive.
[clear] Daniel: I will send the quote by email before lunch.
[informative] Daniel: The meeting will take about thirty minutes, and I will bring two sample folders.
[careful] Daniel: If I am late, please call Ana on 555-0178.
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una llamada de negocios', 'Escucha una llamada sobre un cambio de hora, acceso al edificio y material para una reunión.'),
            (v_listening_id, 'de', 'Höre ein Geschäftstelefonat', 'Höre ein Telefonat über eine Terminänderung, den Zugang zum Gebäude und Material für ein Treffen.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_listening_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
