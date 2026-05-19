-- ============================================================
-- Seed: A0 English Path – STEP 2410 – Listening – complain effectively about most situations that are likely to arise in a restaurant (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Esperaron cuarenta minutos.", "p_de": "Sie warteten vierzig Minuten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Recibieron el plato correcto desde el principio.", "p_de": "Sie bekamen von Anfang an das richtige Gericht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La sopa estaba fría.", "p_de": "Die Suppe war kalt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El postre tenía frutos secos después de mencionar una alergia.", "p_de": "Das Dessert hatte Nüsse, nachdem eine Allergie erwähnt wurde.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gerente devuelve también el postre.", "p_de": "Der Manager erstattet auch das Dessert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente pagó por dos bebidas que no pidió.", "p_de": "Der Kunde bezahlte für zwei Getränke, die er nicht bestellt hatte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gerente se niega a imprimir una nueva cuenta.", "p_de": "Der Manager weigert sich, eine neue Rechnung zu drucken.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente aprecia la solución rápida.", "p_de": "Der Kunde schätzt die schnelle Lösung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué problema ocurre después de la espera?", "p_de": "Welches Problem passiert nach der Wartezeit?", "s": {"type": "multiple_choice", "options": ["They got the wrong dish", "The restaurant closed", "There was no table"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace el gerente con ese plato?", "p_de": "Was macht der Manager mit diesem Gericht?", "s": {"type": "multiple_choice", "options": ["Remove it from the bill", "Send it home", "Cook it again tomorrow"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dos problemas más menciona el cliente?", "p_de": "Welche zwei weiteren Probleme nennt der Kunde?", "s": {"type": "multiple_choice", "options": ["Cold soup and nuts in the dessert", "Broken chair and loud music", "No menu and no water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ofrece el gerente además del reembolso?", "p_de": "Was bietet der Manager zusätzlich zur Rückerstattung an?", "s": {"type": "multiple_choice", "options": ["Free coffee", "A hotel room", "A concert ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué error había también en la cuenta?", "p_de": "Welcher Fehler war auch auf der Rechnung?", "s": {"type": "multiple_choice", "options": ["Two drinks they did not order", "Wrong date", "No tax"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué imprime el gerente?", "p_de": "Was druckt der Manager?", "s": {"type": "multiple_choice", "options": ["A new bill", "A new menu", "A map"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo valora el cliente la solución?", "p_de": "Wie bewertet der Kunde die Lösung?", "s": {"type": "multiple_choice", "options": ["Quick", "Too slow", "Impossible"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice el gerente al final?", "p_de": "Was sagt der Manager am Ende?", "s": {"type": "multiple_choice", "options": ["Thank you for telling me", "Please never come back", "The kitchen is closed"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2410 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2410 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2410, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: A customer and a manager
## "Several Problems at One Table"

## THE SCENE: A manager comes to the table
The customer explains several problems from the same meal.
The manager apologises and offers a practical solution for each one.

### DIRECTOR'S NOTES
Style:
* Calm but serious complaint language.
* Clear sequence of problem and solution.

Pace: Medium and controlled.

Accent: Neutral English.

### SAMPLE CONTEXT
Learners hear a more complete complaint with multiple issues.
The manager responds with refunds, corrections, and a new bill.

#### TRANSCRIPT
[customer] Customer: We waited forty minutes and then got the wrong dish.
[manager] Manager: I am very sorry. I can remove that dish from the bill.
[customer] Customer: My soup was cold, and the dessert had nuts after I mentioned an allergy.
[manager] Manager: I understand. I will also refund the dessert and offer free coffee.
[customer] Customer: Thank you, but we also paid for two drinks we did not order.
[manager] Manager: I will print a new bill right now.
[customer] Customer: Good. I appreciate the quick solution.
[manager] Manager: Thank you for telling me.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar la gestión de una reclamación compleja', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Die Bearbeitung einer komplexen Beschwerde hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
