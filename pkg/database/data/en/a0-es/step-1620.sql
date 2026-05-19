-- ============================================================
-- Seed: A0 English Path – STEP 1620 – Listening – understand simple directions (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La mujer dice que hay que ir recto hasta los semáforos.", "p_de": "Die Frau sagt, man soll geradeaus bis zur Ampel gehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En los semáforos hay que girar a la derecha.", "p_de": "An der Ampel muss man rechts abbiegen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que pasar por la oficina de correos.", "p_de": "Man muss am Postamt vorbeigehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La biblioteca está en Queen Street.", "p_de": "Die Bibliothek liegt in der Queen Street.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La biblioteca está detrás del supermercado.", "p_de": "Die Bibliothek ist hinter dem Supermarkt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La biblioteca está junto a un café pequeño.", "p_de": "Die Bibliothek ist neben einem kleinen Café.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si ves el cine, has ido demasiado lejos.", "p_de": "Wenn du das Kino siehst, bist du zu weit gegangen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El visitante pregunta por un banco.", "p_de": "Der Besucher fragt nach einer Bank.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Adónde quiere ir el visitante?", "p_de": "Wohin möchte der Besucher gehen?", "s": {"type": "multiple_choice", "options": ["To the public library", "To the train station", "To the hospital"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde gira?", "p_de": "Wo biegt er ab?", "s": {"type": "multiple_choice", "options": ["At the traffic lights", "At the bridge", "At the museum"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué lugar pasa antes de llegar?", "p_de": "An welchem Ort kommt er vorher vorbei?", "s": {"type": "multiple_choice", "options": ["The post office", "The town hall", "The bakery"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué calle está la biblioteca?", "p_de": "In welcher Straße ist die Bibliothek?", "s": {"type": "multiple_choice", "options": ["Queen Street", "King Street", "Station Road"], "answer": 0}}'::jsonb,
        '{"p": "¿Frente a qué está la biblioteca?", "p_de": "Wogegenüber liegt die Bibliothek?", "s": {"type": "multiple_choice", "options": ["The supermarket", "The cinema", "The bus stop"], "answer": 0}}'::jsonb,
        '{"p": "¿Junto a qué está la biblioteca?", "p_de": "Neben was liegt die Bibliothek?", "s": {"type": "multiple_choice", "options": ["A small café", "A school", "A bank"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa ver el cine?", "p_de": "Was bedeutet es, wenn man das Kino sieht?", "s": {"type": "multiple_choice", "options": ["You went too far", "You are at the library", "You must turn left"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién da las indicaciones?", "p_de": "Wer gibt die Wegbeschreibung?", "s": {"type": "multiple_choice", "options": ["A local woman", "A bus driver", "A police officer"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1620 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1620 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1620, 'en', 'listening', 'Viajes y Transporte', $transcript$
# AUDIO PROFILE: A local woman giving directions to a visitor
## "The Library Is Opposite the Supermarket"

## THE SCENE: Outside a small town bus stop
A visitor asks how to walk to the public library from the bus stop.
The local woman gives short, clear directions and warns about one easy mistake.

### DIRECTOR'S NOTES
Style:
* Warm and practical street-direction language.
* Clear repetition of left, straight, opposite, and too far.

Pace: Slow and clear.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Useful for very short walking directions in a town centre.
Learners hear key landmarks and one warning that helps them self-correct.

#### TRANSCRIPT
[polite] Visitor: Excuse me, where is the public library?
[friendly] Woman: Walk straight to the traffic lights and turn left there.
[steady] Woman: Go past the post office and continue on Queen Street.
[helpful] Woman: The library is opposite the supermarket and next to a small café.
[warning] Woman: If you see the cinema, you went too far.
[grateful] Visitor: Great, thank you very much.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Indicaciones para llegar a la biblioteca', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Wegbeschreibung zur Bibliothek', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
