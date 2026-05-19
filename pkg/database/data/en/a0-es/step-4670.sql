-- ============================================================
-- Seed: A0 English Path – STEP 4670 – Reading – understand most articles likely to be encountered during the course of her/his work, including complex ideas expressed in complex language (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El almacenamiento en la nube permite acceder a los datos por internet.", "p_de": "Cloud-Speicher ermöglicht den Zugriff auf Daten über das Internet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El almacenamiento en la nube siempre es más caro que los servidores locales.", "p_de": "Cloud-Speicher ist immer teurer als lokale Server.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Microsoft Azure se menciona como proveedor importante.", "p_de": "Microsoft Azure wird als wichtiger Anbieter genannt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los datos solo deben cifrarse cuando se transfieren.", "p_de": "Daten sollten nur während der Übertragung verschlüsselt werden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "MFA significa autenticación multifactor.", "p_de": "MFA steht für Multi-Faktor-Authentifizierung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Un SLA suele garantizar un 100 % de disponibilidad.", "p_de": "Ein SLA garantiert in der Regel 100 % Verfügbarkeit.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Los modelos de coste en la nube suelen ser por suscripción.", "p_de": "Cloud-Kostenmodelle sind meist abonnementbasiert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Las empresas no necesitan un plan de recuperación si usan la nube.", "p_de": "Unternehmen brauchen keinen Wiederherstellungsplan, wenn sie die Cloud nutzen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Qué es el almacenamiento en la nube?", "p_de": "Was ist Cloud-Speicher?", "s_es": {"type": "multiple_choice", "options": ["Almacenamiento remoto de datos por internet", "Almacenamiento físico en la oficina", "Un tipo de memoria USB"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Remote Datenspeicherung über das Internet", "Physischer Speicher im Büro", "Eine Art USB-Stick"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué empresa NO se menciona como proveedor?", "p_de": "Welches Unternehmen wird NICHT als Anbieter erwähnt?", "s_es": {"type": "multiple_choice", "options": ["Apple", "Microsoft Azure", "Amazon Web Services"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Apple", "Microsoft Azure", "Amazon Web Services"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué debe controlar el acceso a los datos?", "p_de": "Was sollte den Zugang zu den Daten kontrollieren?", "s_es": {"type": "multiple_choice", "options": ["La autenticación multifactor", "Solo una contraseña", "La aprobación del gerente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Multi-Faktor-Authentifizierung", "Nur ein Passwort", "Die Freigabe durch den Manager"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué suele garantizar un SLA?", "p_de": "Was garantiert ein SLA normalerweise?", "s_es": {"type": "multiple_choice", "options": ["Un 99,9 % de disponibilidad", "Un 100 % de disponibilidad", "Un 95 % de disponibilidad"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["99,9 % Verfügbarkeit", "100 % Verfügbarkeit", "95 % Verfügbarkeit"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué significa escalable en este contexto?", "p_de": "Was bedeutet skalierbar in diesem Zusammenhang?", "s_es": {"type": "multiple_choice", "options": ["Que el almacenamiento crece con las necesidades", "Que los datos se borran automáticamente", "Que los archivos se comparten públicamente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dass der Speicher mit dem Bedarf wächst", "Dass Daten automatisch gelöscht werden", "Dass Dateien öffentlich geteilt werden"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué modelo de coste es típico?", "p_de": "Welches Kostenmodell ist typisch?", "s_es": {"type": "multiple_choice", "options": ["Basado en suscripción", "Solo pago por uso", "Gratis para todos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Abonnementbasiert", "Nur nutzungsabhängig", "Kostenlos für alle"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué deben tener las empresas en caso de interrupción?", "p_de": "Was sollten Unternehmen für den Fall eines Ausfalls haben?", "s_es": {"type": "multiple_choice", "options": ["Un plan de recuperación de datos", "Una nueva sala de servidores", "Una oficina de reserva"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Datenwiederherstellungsplan", "Einen neuen Serverraum", "Ein Ersatzbüro"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué es el cifrado en reposo?", "p_de": "Was bedeutet Verschlüsselung im Ruhezustand?", "s_es": {"type": "multiple_choice", "options": ["Los datos se cifran cuando están almacenados", "Los datos solo se cifran durante la transferencia", "Los datos se eliminan del almacenamiento"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Daten werden verschlüsselt, wenn sie gespeichert sind", "Daten werden nur während der Übertragung verschlüsselt", "Daten werden aus dem Speicher entfernt"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4670
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4670
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4670, 'en', 'reading', 'professional', $content$Cloud Storage for Businesses

Cloud storage allows businesses to store, manage and access data remotely through the internet instead of relying only on on-premises servers. One major advantage is scalability: storage capacity can increase as business needs grow, without requiring the company to install more physical hardware. Well-known providers include Microsoft Azure, Amazon Web Services and Google Cloud.

Security remains a major concern, so data should be encrypted both in transit and at rest. Access should also be protected through multi-factor authentication, often shortened to MFA. In addition, providers usually offer a Service Level Agreement, or SLA, that promises around 99.9% uptime.

Even with cloud services, businesses still need a clear data recovery plan in case of cyberattack or system outage. Costs are commonly subscription-based, which helps companies predict monthly spending more easily.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un artículo sobre almacenamiento en la nube', 'Lee un artículo profesional sobre almacenamiento en la nube, seguridad y continuidad.'),
            (v_reading_id, 'de', 'Lies einen Artikel über Cloud-Speicher', 'Lies einen Fachtext über Cloud-Speicher, Sicherheit und Ausfallschutz.');

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
