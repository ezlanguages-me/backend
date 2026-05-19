-- ============================================================
-- Seed: A0 English Path – STEP 4500 – Reading – understand general meaning of non-routine letters (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La carta es de Harper & Sons.", "p_de": "Der Brief ist von Harper & Sons.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La factura se envió el 5 de noviembre.", "p_de": "Die Rechnung wurde am 5. November gesendet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El importe de la factura era de 3.200 £.", "p_de": "Der Rechnungsbetrag betrug 3.200 £.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El precio acordado era de 3.200 £.", "p_de": "Der vereinbarte Preis betrug 3.200 £.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El cliente quiere una factura corregida.", "p_de": "Der Kunde möchte eine korrigierte Rechnung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El presupuesto original va adjunto a la carta.", "p_de": "Das ursprüngliche Angebot ist dem Brief beigefügt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El correo del cliente es accounts@harpersons.co.uk.", "p_de": "Die E-Mail des Kunden ist accounts@harpersons.co.uk.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La diferencia es de 600 £.", "p_de": "Die Differenz beträgt 600 £.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Qué empresa envió la reclamación?", "p_de": "Welche Firma hat die Beschwerde geschickt?", "s_es": {"type": "multiple_choice", "options": ["Harper & Sons", "Green Valley", "North Clinic"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Harper & Sons", "Green Valley", "North Clinic"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuándo se envió la factura?", "p_de": "Wann wurde die Rechnung gesendet?", "s_es": {"type": "multiple_choice", "options": ["El 5 de octubre", "El 5 de noviembre", "El 15 de octubre"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am 5. Oktober", "Am 5. November", "Am 15. Oktober"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál era el importe de la factura?", "p_de": "Wie hoch war der Rechnungsbetrag?", "s_es": {"type": "multiple_choice", "options": ["3.200 £", "2.800 £", "3.800 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["3.200 £", "2.800 £", "3.800 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál era el precio acordado?", "p_de": "Wie hoch war der vereinbarte Preis?", "s_es": {"type": "multiple_choice", "options": ["2.800 £", "3.200 £", "2.400 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2.800 £", "3.200 £", "2.400 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué quiere el cliente?", "p_de": "Was möchte der Kunde?", "s_es": {"type": "multiple_choice", "options": ["Una factura corregida", "Un reembolso", "Una reunión"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine korrigierte Rechnung", "Eine Rückerstattung", "Ein Treffen"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué se adjunta a la carta?", "p_de": "Was ist dem Brief beigefügt?", "s_es": {"type": "multiple_choice", "options": ["El presupuesto original", "Una factura nueva", "Un albarán"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das ursprüngliche Angebot", "Eine neue Rechnung", "Ein Lieferschein"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es la diferencia?", "p_de": "Wie groß ist die Differenz?", "s_es": {"type": "multiple_choice", "options": ["400 £", "600 £", "200 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["400 £", "600 £", "200 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el correo de contacto?", "p_de": "Wie lautet die Kontakt-E-Mail?", "s_es": {"type": "multiple_choice", "options": ["accounts@harpersons.co.uk", "sales@harpersons.co.uk", "info@harpersons.co.uk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["accounts@harpersons.co.uk", "sales@harpersons.co.uk", "info@harpersons.co.uk"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4500
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4500
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4500, 'en', 'reading', 'professional', $content$Dear Accounts Team,

I am writing on behalf of Harper & Sons regarding invoice 1187, which was sent to us on 5 October. The invoice total shown is £3,200, but the agreed price for the work completed was £2,800. We reviewed the quotation that your sales department sent before the order was confirmed, and the lower amount is clearly stated there.

To avoid delays in payment, we would be grateful if you could issue a corrected invoice as soon as possible. For your convenience, we have attached a copy of the original quote to this message so that your team can check the agreed figure.

If you need any further information, please contact us at accounts@harpersons.co.uk. We would appreciate your prompt attention to this matter.

Yours sincerely,
Daniel Harper
Harper & Sons$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una carta de reclamación', 'Lee una reclamación sobre una factura incorrecta y la solicitud de una corrección.'),
            (v_reading_id, 'de', 'Lies einen Beschwerdebrief', 'Lies eine Beschwerde über eine falsche Rechnung und die Bitte um eine Korrektur.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_reading_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
