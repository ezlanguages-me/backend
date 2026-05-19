-- ============================================================
-- Seed: A0 English Path – STEP 3820 – Listening – listen to work requirements (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Hay que preparar Room B para una reunión con cliente.", "p_de": "Man soll Room B für ein Kundentreffen vorbereiten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que poner doce sillas en dos filas.", "p_de": "Man soll zwölf Stühle in zwei Reihen aufstellen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El proyector va en la puerta de entrada.", "p_de": "Der Projektor kommt an die Eingangstür.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que probar el proyector antes de la 1:30 PM.", "p_de": "Der Projektor soll vor 13:30 Uhr getestet werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Solo hace falta un cable de extensión y una caja de rotuladores.", "p_de": "Man braucht nur ein Verlängerungskabel und eine Kiste Marker.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las cajas de sobra van en el pasillo.", "p_de": "Die übrigen Kartons kommen in den Flur.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que llevar la identificación durante el trabajo.", "p_de": "Man soll den Ausweis während der Arbeit tragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente llega a las 2 PM.", "p_de": "Der Kunde kommt um 14 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué sala se prepara?", "p_de": "Welcher Raum wird vorbereitet?", "s_es": {"type": "multiple_choice", "options": ["Room B", "Room A", "Hall 3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Room B", "Room A", "Halle 3"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas sillas se colocan?", "p_de": "Wie viele Stühle werden aufgestellt?", "s_es": {"type": "multiple_choice", "options": ["Twelve", "Ten", "Twenty"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwölf", "Zehn", "Zwanzig"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde va el proyector?", "p_de": "Wo kommt der Projektor hin?", "s_es": {"type": "multiple_choice", "options": ["On the front table", "In the storeroom", "Next to the door"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf den vorderen Tisch", "In den Lagerraum", "Neben die Tür"], "answer": 0}}'::jsonb,
        '{"p": "¿Antes de qué hora hay que probarlo?", "p_de": "Vor welcher Uhrzeit soll man ihn testen?", "s_es": {"type": "multiple_choice", "options": ["1:30 PM", "2 PM", "12 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["13:30 Uhr", "14 Uhr", "12 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué material adicional se lleva?", "p_de": "Welches zusätzliche Material wird mitgebracht?", "s_es": {"type": "multiple_choice", "options": ["One extension cable and a box of markers", "Two lamps and one printer", "Three laptops"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Verlängerungskabel und eine Kiste Marker", "Zwei Lampen und ein Drucker", "Drei Laptops"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde van las cajas sobrantes?", "p_de": "Wohin kommen die übrigen Kartons?", "s_es": {"type": "multiple_choice", "options": ["In the storeroom", "At reception", "Outside the building"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In den Lagerraum", "An den Empfang", "Vor das Gebäude"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién llaman si falta algo?", "p_de": "Wen ruft man an, wenn etwas fehlt?", "s_es": {"type": "multiple_choice", "options": ["Sara in maintenance", "The client driver", "The hotel chef"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sara aus der Instandhaltung", "Den Fahrer des Kunden", "Den Hotelkoch"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora llega el cliente?", "p_de": "Um wie viel Uhr kommt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["2 PM", "1:30 PM", "3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["14 Uhr", "13:30 Uhr", "15 Uhr"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3820 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 3820 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3820, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Sara, an event supervisor giving setup instructions
## "Prepare Room B"

## THE SCENE: A team gets a meeting room ready for a client visit
Sara gives the exact requirements and repeats the important details.

### DIRECTOR'S NOTES
Style:
* Practical work instructions with quantities and equipment.
* Clear sequence from setup to final check.

Pace: Slow and organised.

Accent: Neutral accent.

#### TRANSCRIPT
[clear] Supervisor: Today we prepare Room B for the client meeting.
[practical] Supervisor: Set up twelve chairs in two rows.
[helpful] Supervisor: Put the projector on the front table and test it before 1:30 PM.
[careful] Supervisor: Bring one extension cable and a box of markers.
[organised] Supervisor: Leave the spare boxes in the storeroom.
[firm] Supervisor: Wear your badge during the job.
[supportive] Supervisor: If any part is missing, call Sara in maintenance.
[final] Supervisor: The client arrives at 2 PM.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha requisitos de trabajo', 'Escucha a un supervisor que indica material, sala, hora y normas para preparar un espacio.'),
            (v_listening_id, 'de', 'Höre Arbeitsanforderungen', 'Höre einem Vorgesetzten zu, der Material, Raum, Zeit und Regeln für die Vorbereitung eines Raums erklärt.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
