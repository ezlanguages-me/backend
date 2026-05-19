-- ============================================================
-- Seed: A0 English Path – STEP 1500 – Dialogue – understand routine bank explanations
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Customer", "text": "Hello. I have a question about my account fees.", "es": "Hola. Tengo una pregunta sobre las comisiones de mi cuenta.", "de": "Hallo. Ich habe eine Frage zu den Gebühren meines Kontos."}'::jsonb,
    '{"character": "Advisor", "text": "Of course. What do you need to know?", "es": "Claro. ¿Qué necesita saber?", "de": "Natürlich. Was möchten Sie wissen?"}'::jsonb,
    '{"character": "Customer", "text": "Is there a fee for paper statements?", "es": "¿Hay comisión por los extractos en papel?", "de": "Gibt es eine Gebühr für Papierauszüge?"}'::jsonb,
    '{"character": "Advisor", "text": "Yes. A paper statement costs two euros.", "es": "Sí. Un extracto en papel cuesta dos euros.", "de": "Ja. Ein Papierauszug kostet zwei Euro."}'::jsonb,
    '{"character": "Customer", "text": "And what about transfers to another bank?", "es": "¿Y qué pasa con las transferencias a otro banco?", "de": "Und wie ist es mit Überweisungen an eine andere Bank?"}'::jsonb,
    '{"character": "Advisor", "text": "Online transfers are free, but a transfer at the counter costs one euro.", "es": "Las transferencias en línea son gratis, pero una transferencia en ventanilla cuesta un euro.", "de": "Online-Überweisungen sind kostenlos, aber eine Überweisung am Schalter kostet einen Euro."}'::jsonb,
    '{"character": "Customer", "text": "Is there a fee for using another bank''s ATM?", "es": "¿Hay comisión por usar el cajero de otro banco?", "de": "Gibt es eine Gebühr für den Geldautomaten einer anderen Bank?"}'::jsonb,
    '{"character": "Advisor", "text": "Yes. That fee is three euros.", "es": "Sí. Esa comisión es de tres euros.", "de": "Ja. Diese Gebühr beträgt drei Euro."}'::jsonb,
    '{"character": "Customer", "text": "Thank you. That explains the charges.", "es": "Gracias. Eso explica los cargos.", "de": "Danke. Das erklärt die Abbuchungen."}'::jsonb,
    '{"character": "Advisor", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El cliente pregunta por las comisiones de su cuenta.", "de": "Der Kunde fragt nach den Gebühren seines Kontos.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Un extracto en papel cuesta dos euros.", "de": "Ein Papierauszug kostet zwei Euro.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Las transferencias en línea cuestan un euro.", "de": "Online-Überweisungen kosten einen Euro.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "Una transferencia en ventanilla cuesta un euro.", "de": "Eine Überweisung am Schalter kostet einen Euro.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Usar el cajero de otro banco cuesta tres euros.", "de": "Die Nutzung eines fremden Geldautomaten kostet drei Euro.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Qué tipo de extracto cuesta dinero?", "de": "Welche Art von Auszug kostet Geld?", "s_es": {"type": "multiple_choice", "options": ["A paper statement", "An email statement", "A parcel receipt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Papierauszug", "Ein E-Mail-Auszug", "Ein Paketbeleg"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué transferencias son gratis?", "de": "Welche Überweisungen sind kostenlos?", "s_es": {"type": "multiple_choice", "options": ["Online transfers", "Counter transfers", "Foreign cash exchanges"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Online-Überweisungen", "Überweisungen am Schalter", "Fremdwährungswechsel"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuánto cuesta una transferencia en ventanilla?", "de": "Wie viel kostet eine Überweisung am Schalter?", "s_es": {"type": "multiple_choice", "options": ["One euro", "Five euros", "Nothing"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Euro", "Fünf Euro", "Nichts"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuánto cuesta usar el cajero de otro banco?", "de": "Wie viel kostet die Nutzung eines fremden Geldautomaten?", "s_es": {"type": "multiple_choice", "options": ["Three euros", "One euro", "Ten euros"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Euro", "Ein Euro", "Zehn Euro"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué entiende el cliente al final?", "de": "Was versteht der Kunde am Ende?", "s_es": {"type": "multiple_choice", "options": ["Why there are charges", "How to send a parcel", "How to rent a flat"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Warum Gebühren da sind", "Wie man ein Paket schickt", "Wie man eine Wohnung mietet"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1500 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1500 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1500, 'en', 'dialogue', 'banking', '[{"name": "Customer", "gender": "male", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Advisor", "gender": "female", "avatarURL": "https://example.com/avatars/advisor.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Preguntar por comisiones bancarias', 'Lee una conversación breve donde el banco explica comisiones rutinarias.');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Nach Bankgebühren fragen', 'Lies ein kurzes Gespräch, in dem die Bank routinemäßige Gebühren erklärt.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "__ES__"}]}]'::jsonb);
        UPDATE dialogue_lines_translation
        SET meaning = jsonb_set(meaning, '{0,translations,0,translation}', to_jsonb(line->>'es'))
        WHERE dialogue_line_uuid = v_line_uuid AND language = 'es';

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "__DE__"}]}]'::jsonb);
        UPDATE dialogue_lines_translation
        SET meaning = jsonb_set(meaning, '{0,translations,0,translation}', to_jsonb(line->>'de'))
        WHERE dialogue_line_uuid = v_line_uuid AND language = 'de';

        v_order := v_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'es', ex->'s_es');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
