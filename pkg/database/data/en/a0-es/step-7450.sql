-- ============================================================
-- Seed: A0 English Path – STEP 7450 – Listening – listen to brief meeting contribution (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Ella da una actualización corta.", "de": "Ella gibt ein kurzes Update.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ella hizo veinte tarjetas con nombres ayer.", "de": "Ella hat gestern zwanzig Namenskarten gemacht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Todas las tarjetas son para visitantes.", "de": "Alle Karten sind für Besucher.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Ella todavía necesita papel azul.", "de": "Ella braucht noch blaues Papier.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay papel azul en el almacén de la oficina.", "de": "Es gibt blaues Papier im Bürolager.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ella puede terminarlas antes de las 3.", "de": "Ella kann sie vor 3 Uhr fertig machen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las tarjetas van en la recepción delantera.", "de": "Die Karten kommen auf den vorderen Empfangstisch.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La actualización es sobre un proyector.", "de": "Das Update handelt von einem Projektor.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Quién da la actualización?", "de": "Wer gibt das Update?", "s_es": {"type": "multiple_choice", "options": ["Ella", "Tom", "The chair"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ella", "Tom", "Die Leitung"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas tarjetas hizo Ella?", "de": "Wie viele Karten hat Ella gemacht?", "s_es": {"type": "multiple_choice", "options": ["Twenty", "Ten", "Thirty"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwanzig", "Zehn", "Dreißig"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas tarjetas son para visitantes?", "de": "Wie viele Karten sind für Besucher?", "s_es": {"type": "multiple_choice", "options": ["Ten", "Five", "Fifteen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zehn", "Fünf", "Fünfzehn"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué necesita todavía Ella?", "de": "Was braucht Ella noch?", "s_es": {"type": "multiple_choice", "options": ["Blue paper", "A new printer", "More chairs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blaues Papier", "Einen neuen Drucker", "Mehr Stühle"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el papel azul?", "de": "Wo ist das blaue Papier?", "s_es": {"type": "multiple_choice", "options": ["In the office store", "In the kitchen", "In the car"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Bürolager", "In der Küche", "Im Auto"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo puede terminar Ella?", "de": "Wann kann Ella fertig werden?", "s_es": {"type": "multiple_choice", "options": ["Before 3 o clock", "After 5 o clock", "Tomorrow morning"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor 3 Uhr", "Nach 5 Uhr", "Morgen früh"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde debe poner las tarjetas?", "de": "Wo soll sie die Karten hinlegen?", "s_es": {"type": "multiple_choice", "options": ["On the front desk", "On the window", "In the meeting bag"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf den vorderen Empfangstisch", "Auf das Fenster", "In die Meetingtasche"], "answer": 0}}'::jsonb,
        '{"es": "¿Sobre qué trata la actualización?", "de": "Worüber ist das Update?", "s_es": {"type": "multiple_choice", "options": ["Name cards", "Visitor chairs", "Coffee cups"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Namenskarten", "Besucherstühle", "Kaffeetassen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7450 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7450 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7450, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Ella, Tom and a chair during a short team meeting
## "A Quick Update on the Name Cards"

## THE SCENE: A meeting round where each person gives one short update
Ella reports on a small task for the visitor meeting.
The other speakers ask one simple follow-up question and confirm the next step.

### DIRECTOR'S NOTES
Style:
* Brief meeting contribution with practical information.
* Clear numbers and clear task language.

Pace: Slow, neat, and slightly formal.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how one person gives a short update in a meeting.
The audio is useful for quantities, materials, and deadlines.

#### TRANSCRIPT
[inviting] Chair: Ella, can you give us a short update on the name cards?
[clear] Ella: Yes. I made twenty name cards yesterday.
[careful] Ella: Ten are for visitors and ten are for staff.
[practical] Ella: I still need blue paper for the visitor cards.
[helpful] Tom: We have blue paper in the office store.
[relieved] Ella: Great. Then I can finish them before 3 o clock.
[organised] Chair: Please put the cards on the front desk.
[calm] Ella: No problem. I will do that after lunch.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha una contribución breve en una reunión', 'Escucha a una compañera dar una actualización corta sobre tarjetas con nombres para una reunión.'),
        (v_listening_id, 'de', 'Höre einen kurzen Beitrag im Meeting', 'Höre, wie eine Kollegin ein kurzes Update über Namenskarten für ein Meeting gibt.');

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
