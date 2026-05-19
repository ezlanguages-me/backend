-- ============================================================
-- Seed: A0 English Path – STEP 4310 – Listening – listen to dictated business text (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El texto dictado es una carta formal de negocios.", "p_de": "Der diktierte Text ist ein formeller Geschäftsbrief.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La carta es para la empresa Green Valley.", "p_de": "Der Brief ist für das Unternehmen Green Valley.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La carta confirma el nuevo precio acordado.", "p_de": "Der Brief bestätigt den vereinbarten neuen Preis.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El nuevo contrato de servicio comienza el 1 de abril.", "p_de": "Der neue Servicevertrag beginnt am 1. April.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona que dicta deletrea el apellido del destinatario.", "p_de": "Die diktierende Person buchstabiert den Nachnamen des Empfängers.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto incluye el importe total del contrato.", "p_de": "Der Text enthält den Gesamtbetrag des Vertrags.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona dicta el texto sin pausas.", "p_de": "Die diktierende Person diktiert den Text ohne Pausen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La carta pide una firma electrónica.", "p_de": "Der Brief bittet um eine elektronische Unterschrift.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué tipo de texto se dicta?", "p_de": "Welche Art von Text wird diktiert?", "s_es": {"type": "multiple_choice", "options": ["A formal business letter", "A casual message", "A technical report"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein formeller Geschäftsbrief", "Eine informelle Nachricht", "Ein technischer Bericht"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué empresa es la carta?", "p_de": "Für welches Unternehmen ist der Brief?", "s_es": {"type": "multiple_choice", "options": ["Green Valley", "Blue Ridge", "Delta Supplies"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Green Valley", "Blue Ridge", "Delta Supplies"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué confirma la carta?", "p_de": "Was bestätigt der Brief?", "s_es": {"type": "multiple_choice", "options": ["The new service contract", "The new price", "The delivery address"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den neuen Servicevertrag", "Den neuen Preis", "Die Lieferadresse"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo empieza el nuevo contrato?", "p_de": "Wann beginnt der neue Vertrag?", "s_es": {"type": "multiple_choice", "options": ["1 April", "1 March", "1 January"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["1. April", "1. März", "1. Januar"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace la persona al dictar el apellido del destinatario?", "p_de": "Was macht die Person beim Diktieren des Nachnamens des Empfängers?", "s_es": {"type": "multiple_choice", "options": ["She spells it out", "She says it twice", "She skips it"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie buchstabiert ihn", "Sie sagt ihn zweimal", "Sie überspringt ihn"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué importe incluye el texto?", "p_de": "Welchen Betrag enthält der Text?", "s_es": {"type": "multiple_choice", "options": ["Total contract value", "Deposit amount", "Late payment fee"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Gesamtvertragswert", "Anzahlungsbetrag", "Verzugszins"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo dicta el texto la persona?", "p_de": "Wie diktiert die Person den Text?", "s_es": {"type": "multiple_choice", "options": ["Slowly with clear pauses", "Very fast without stopping", "In a foreign language"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Langsam mit klaren Pausen", "Sehr schnell ohne Pause", "In einer Fremdsprache"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se practica en esta escucha?", "p_de": "Was wird in diesem Hörtext geübt?", "s_es": {"type": "multiple_choice", "options": ["Taking dictation from a business text", "Listening to a product presentation", "Following a safety briefing"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Geschäftstext aufnehmen", "Eine Produktpräsentation hören", "Einem Sicherheits-Briefing folgen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4310 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 4310 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 4310, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Helen, an office manager dictating a formal business letter
## "Dictation – Service Contract Confirmation Letter"

## THE SCENE: Helen dictates a letter to her assistant, who types it up
Helen speaks slowly and clearly, spelling out names and pausing after punctuation.

### DIRECTOR'S NOTES
Style:
* Dictation style: slow, deliberate, punctuation named aloud.
* Spells out unusual names letter by letter.

Pace: Slow with clear pauses.

Accent: Neutral accent.

#### TRANSCRIPT
[starting] Helen: Ready? New letter. To: Ms Nguyen – N, G, U, Y, E, N – comma – Green Valley Ltd.
[date] Helen: Date: today''s date.
[salutation] Helen: Dear Ms Nguyen comma new paragraph
[body] Helen: I am writing to confirm our new service contract full stop
[detail] Helen: The contract begins on the 1st of April full stop
[value] Helen: The total contract value is £4,800 per year full stop
[next] Helen: Please find the signed copy enclosed full stop
[close] Helen: We look forward to working with you full stop
[sign off] Helen: Yours sincerely comma new paragraph – Helen Marsh comma Operations Manager full stop
[check] Helen: Can you read that back to me when you''re done?
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha un texto de negocios dictado', 'Escucha un dictado de una carta formal de negocios con confirmación de contrato, fecha e importe.'),
            (v_listening_id, 'de', 'Höre einen diktierten Geschäftstext', 'Höre das Diktat eines formellen Geschäftsbriefs mit Vertragsbestätigung, Datum und Betrag.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
