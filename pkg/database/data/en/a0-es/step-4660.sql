-- ============================================================
-- Seed: A0 English Path – STEP 4660 – Reading – understand at least the general meaning of more complex articles without serious misunderstanding (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El RGPD entró en vigor en el Reino Unido en 2018.", "p_de": "Die DSGVO trat im Vereinigten Königreich 2018 in Kraft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El RGPD solo se aplica a empresas fuera del Reino Unido.", "p_de": "Die DSGVO gilt nur für Unternehmen außerhalb des Vereinigten Königreichs.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Uno de los principios es la minimización de datos.", "p_de": "Einer der Grundsätze ist die Datenminimierung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Las multas pueden llegar a 17,5 millones de libras o al 4 % de la facturación global.", "p_de": "Geldstrafen können bis zu 17,5 Millionen Pfund oder 4 % des weltweiten Umsatzes betragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Todas las organizaciones deben nombrar un DPO.", "p_de": "Alle Organisationen müssen einen DSB benennen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La limitación del almacenamiento es uno de los principios del RGPD.", "p_de": "Speicherbegrenzung ist einer der Grundsätze der DSGVO.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El artículo menciona la integridad y la confidencialidad como principio.", "p_de": "Der Artikel nennt Integrität und Vertraulichkeit als Grundsatz.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El incumplimiento no tiene consecuencias económicas.", "p_de": "Nichteinhaltung hat keine finanziellen Folgen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Cuándo entró en vigor el RGPD en el Reino Unido?", "p_de": "Wann trat die DSGVO im Vereinigten Königreich in Kraft?", "s_es": {"type": "multiple_choice", "options": ["2018", "2016", "2020"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2018", "2016", "2020"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es la multa máxima según el RGPD?", "p_de": "Wie hoch ist die maximale Strafe nach der DSGVO?", "s_es": {"type": "multiple_choice", "options": ["17,5 millones de libras o el 4 % de la facturación global", "5 millones de libras o el 2 %", "10 millones de libras o el 3 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["17,5 Millionen Pfund oder 4 % des weltweiten Umsatzes", "5 Millionen Pfund oder 2 %", "10 Millionen Pfund oder 3 %"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué significa DPO?", "p_de": "Wofür steht DPO?", "s_es": {"type": "multiple_choice", "options": ["Delegado de Protección de Datos", "Organización de Procesamiento de Datos", "Oficial de Privacidad Digital"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Data Protection Officer", "Data Processing Organisation", "Digital Privacy Officer"], "answer": 0}}'::jsonb,
            '{"p": "¿Quién DEBE nombrar un DPO?", "p_de": "Wer MUSS einen DPO benennen?", "s_es": {"type": "multiple_choice", "options": ["Las organizaciones que procesan grandes cantidades de datos sensibles", "Todas las empresas", "Solo los organismos públicos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Organisationen, die große Mengen sensibler Daten verarbeiten", "Alle Unternehmen", "Nur staatliche Stellen"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué principio trata de mantener los datos correctos?", "p_de": "Welcher Grundsatz betrifft die Richtigkeit der Daten?", "s_es": {"type": "multiple_choice", "options": ["Exactitud", "Transparencia", "Limitación de la finalidad"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Richtigkeit", "Transparenz", "Zweckbindung"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué significa minimización de datos?", "p_de": "Was bedeutet Datenminimierung?", "s_es": {"type": "multiple_choice", "options": ["Recoger solo lo necesario", "Borrar todos los datos", "Cifrar todos los datos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nur das Nötige erheben", "Alle Daten löschen", "Alle Daten verschlüsseln"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué principio dice que los datos solo se usen para su fin original?", "p_de": "Welcher Grundsatz besagt, dass Daten nur für den ursprünglichen Zweck genutzt werden?", "s_es": {"type": "multiple_choice", "options": ["Limitación de la finalidad", "Integridad", "Limitación del almacenamiento"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweckbindung", "Integrität", "Speicherbegrenzung"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál NO aparece como principio del RGPD?", "p_de": "Was gehört NICHT zu den Grundsätzen der DSGVO?", "s_es": {"type": "multiple_choice", "options": ["Optimización financiera", "Legalidad", "Equidad"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Finanzoptimierung", "Rechtmäßigkeit", "Fairness"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4660
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4660
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4660, 'en', 'reading', 'professional', $content$Data Protection and GDPR

The General Data Protection Regulation, usually called GDPR, came into force in the UK in 2018. It sets legal rules for how organisations collect, store and use personal data. The regulation is built around several principles, including lawfulness, fairness and transparency, purpose limitation, data minimisation, accuracy, storage limitation, and integrity and confidentiality.

Organisations that fail to comply with GDPR can face significant penalties. The maximum fine is £17.5 million or 4% of global annual turnover, whichever amount is higher. This means that data protection is a major legal and financial risk for businesses that handle personal information.

Not every organisation must appoint a Data Protection Officer. However, a DPO is required when an organisation processes large amounts of sensitive personal data or systematically monitors individuals as part of its operations.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un artículo sobre protección de datos', 'Lee un artículo informativo sobre el RGPD, sus principios y sanciones.'),
            (v_reading_id, 'de', 'Lies einen Artikel über Datenschutz', 'Lies einen Fachtext über die DSGVO, ihre Grundsätze und Sanktionen.');

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
