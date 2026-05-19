-- ============================================================
-- Seed: A0 English Path – STEP 4520 – Reading – understand specialist/legal correspondence (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La notificación es de Citywide Properties.", "p_de": "Die Mitteilung ist von Citywide Properties.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La unidad es la número 14.", "p_de": "Die Einheit ist Nummer 14.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El arrendamiento actual termina el 31 de marzo.", "p_de": "Der aktuelle Mietvertrag endet am 31. März.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La nueva renta es de 18.000 £ al año.", "p_de": "Die neue Jahresmiete beträgt 18.000 £.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Se trata de una bajada del alquiler.", "p_de": "Es handelt sich um eine Mietsenkung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El nuevo contrato durará 2 años.", "p_de": "Der neue Vertrag läuft 2 Jahre.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El inquilino debe responder en 14 días.", "p_de": "Der Mieter muss innerhalb von 14 Tagen antworten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El correo de contacto es legal@citywideproperties.co.uk.", "p_de": "Die Kontakt-E-Mail lautet legal@citywideproperties.co.uk.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "¿Cuál es el número de la unidad?", "p_de": "Wie lautet die Nummer der Einheit?", "s_es": {"type": "multiple_choice", "options": ["Unidad 12", "Unidad 14", "Unidad 22"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einheit 12", "Einheit 14", "Einheit 22"], "answer": 0}}'::jsonb,
            '{"p": "¿Dónde está la propiedad?", "p_de": "Wo befindet sich die Immobilie?", "s_es": {"type": "multiple_choice", "options": ["44 Brook Street", "44 Park Lane", "22 Brook Street"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["44 Brook Street", "44 Park Lane", "22 Brook Street"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuándo termina el contrato actual?", "p_de": "Wann endet der aktuelle Vertrag?", "s_es": {"type": "multiple_choice", "options": ["El 31 de marzo", "El 30 de abril", "El 28 de febrero"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am 31. März", "Am 30. April", "Am 28. Februar"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es la nueva renta anual?", "p_de": "Wie hoch ist die neue Jahresmiete?", "s_es": {"type": "multiple_choice", "options": ["18.000 £", "17.000 £", "19.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["18.000 £", "17.000 £", "19.000 £"], "answer": 0}}'::jsonb,
            '{"p": "¿En cuánto aumenta la renta?", "p_de": "Um wie viel steigt die Miete?", "s_es": {"type": "multiple_choice", "options": ["5 %", "10 %", "3 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["5 %", "10 %", "3 %"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuánto dura el nuevo contrato?", "p_de": "Wie lange läuft der neue Vertrag?", "s_es": {"type": "multiple_choice", "options": ["3 años", "2 años", "5 años"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["3 Jahre", "2 Jahre", "5 Jahre"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos días tiene el inquilino para responder?", "p_de": "Wie viele Tage hat der Mieter zur Antwort?", "s_es": {"type": "multiple_choice", "options": ["14 días", "30 días", "7 días"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["14 Tage", "30 Tage", "7 Tage"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué pasa si el inquilino no responde?", "p_de": "Was passiert, wenn der Mieter nicht antwortet?", "s_es": {"type": "multiple_choice", "options": ["El propietario puede ofrecer la unidad a otros", "La renta sigue igual", "El contrato continúa automáticamente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Vermieter kann die Einheit anderen anbieten", "Die Miete bleibt gleich", "Der Vertrag läuft automatisch weiter"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4520
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4520
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4520, 'en', 'reading', 'professional', $content$Dear Tenant,

Citywide Properties writes to inform you that the current lease for Unit 12, 44 Brook Street, will expire on 31 March. We are pleased to offer a renewal on revised terms. Under the new agreement, the annual rent will be £18,000, representing an increase of 5% on the current amount. The renewed lease will run for a period of 3 years from the commencement date.

Please review the enclosed documents carefully. If you wish to accept the renewal, you must sign and return the lease within 14 days of the date of this notice. If we do not receive the signed documents within that period, the landlord reserves the right to offer the unit to other interested parties.

If you require clarification, please contact our legal team at legal@citywideproperties.co.uk.

Yours faithfully,
Lease Administration
Citywide Properties$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una notificación legal de arrendamiento', 'Lee una notificación de renovación de arrendamiento con condiciones, plazo y consecuencias.'),
            (v_reading_id, 'de', 'Lies eine rechtliche Mietmitteilung', 'Lies eine Mitteilung zur Mietvertragsverlängerung mit Bedingungen, Frist und Folgen.');

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
