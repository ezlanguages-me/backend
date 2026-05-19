-- ============================================================
-- Seed: A0 English Path – STEP 3950 – Listening – listen to a complaint about goods (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La llamada es sobre el pedido 671.", "p_de": "Der Anruf betrifft Bestellung 671.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Llegaron dos cajas dañadas.", "p_de": "Es kamen zwei beschädigte Kartons an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Faltan diez carpetas.", "p_de": "Zehn Ordner fehlen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cliente envió fotos por email hace diez minutos.", "p_de": "Die Kundin hat vor zehn Minuten Fotos per E-Mail geschickt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reposición puede llegar la próxima semana.", "p_de": "Die Ersatzlieferung kann nächste Woche kommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El evento es el viernes por la tarde.", "p_de": "Die Veranstaltung ist am Freitag Nachmittag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cliente quiere cerrar el caso ahora mismo.", "p_de": "Die Kundin will den Fall sofort schließen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La factura está en espera hasta que lleguen los nuevos productos.", "p_de": "Die Rechnung bleibt offen, bis die neuen Waren ankommen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué número de pedido aparece?", "p_de": "Welche Bestellnummer wird genannt?", "s_es": {"type": "multiple_choice", "options": ["671", "617", "761"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["671", "617", "761"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas cajas llegaron dañadas?", "p_de": "Wie viele Kartons kamen beschädigt an?", "s_es": {"type": "multiple_choice", "options": ["Three", "Two", "Ten"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Zwei", "Zehn"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué falta?", "p_de": "Was fehlt?", "s_es": {"type": "multiple_choice", "options": ["Ten folders", "Three lamps", "One printer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zehn Ordner", "Drei Lampen", "Ein Drucker"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué envió la cliente?", "p_de": "Was hat die Kundin geschickt?", "s_es": {"type": "multiple_choice", "options": ["Photos by email", "A taxi receipt", "A hotel booking"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fotos per E-Mail", "Einen Taxibeleg", "Eine Hotelbuchung"], "answer": 0}}'::jsonb,
        '{"p": "¿Antes de cuándo necesita la reposición?", "p_de": "Bis wann braucht sie den Ersatz?", "s_es": {"type": "multiple_choice", "options": ["Before Friday", "Before Monday", "Before next month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor Freitag", "Vor Montag", "Vor nächstem Monat"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es el evento?", "p_de": "Wann ist die Veranstaltung?", "s_es": {"type": "multiple_choice", "options": ["Friday afternoon", "Thursday morning", "Saturday night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Freitag Nachmittag", "Donnerstagmorgen", "Samstagabend"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará con las cajas dañadas?", "p_de": "Was macht sie mit den beschädigten Kartons?", "s_es": {"type": "multiple_choice", "options": ["She will keep them for collection", "She will throw them away", "She will sell them"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie behält sie zur Abholung", "Sie wirft sie weg", "Sie verkauft sie"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa con la invoice?", "p_de": "Was passiert mit der Rechnung?", "s_es": {"type": "multiple_choice", "options": ["It is on hold", "It is paid today", "It goes to the airport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie wird zurückgehalten", "Sie wird heute bezahlt", "Sie geht zum Flughafen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3950 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 3950 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3950, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Elena, a customer calling about a damaged delivery
## "There Is a Problem with Order 671"

## THE SCENE: A client reports damaged goods after a morning delivery
Elena explains the problem clearly and says what she needs next.

### DIRECTOR'S NOTES
Style:
* Calm but firm complaint with quantities and deadlines.
* Repeated problem details help beginner listeners follow the message.

Pace: Slow and serious.

Accent: Neutral accent.

#### TRANSCRIPT
[firm] Customer: Hello. I am calling about order 671.
[clear] Customer: Three boxes arrived damaged this morning.
[careful] Customer: We also have ten missing folders.
[helpful] Customer: I sent photos by email ten minutes ago.
[urgent] Customer: We need the replacement before Friday because our event is on Friday afternoon.
[practical] Customer: Please do not close the case yet.
[final] Customer: We will keep the damaged boxes for collection, and the invoice is on hold until the new goods arrive.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una queja sobre mercancía', 'Escucha una llamada de cliente sobre cajas dañadas, artículos faltantes y reposición urgente.'),
            (v_listening_id, 'de', 'Höre eine Beschwerde über Waren', 'Höre einen Kundenanruf über beschädigte Kartons, fehlende Artikel und eine dringende Ersatzlieferung.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
