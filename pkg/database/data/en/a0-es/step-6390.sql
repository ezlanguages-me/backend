-- ============================================================
-- Seed: A0 English Path – STEP 6390 – Listening – escucha una conversación de piso compartido (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Hablan sobre las normas del piso.","de": "They are talking about flat rules.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La cocina está limpia hoy.","de": "The kitchen is clean today.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Priya puede limpiar después de cenar.","de": "Priya can clean after dinner.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Deben mantener silencio después de las diez.","de": "They need to be quiet after ten.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La comida compartida debe llevar nombre.","de": "Shared food must have names on it.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Priya puede limpiar la cocina después de cenar.","de": "Priya kann die Küche nach dem Abendessen putzen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Deben mantener el ruido bajo por la noche.","de": "Sie müssen nachts den Lärm niedrig halten.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Van a comprar leche y pan.","de": "Sie wollen Milch und Brot kaufen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Sobre qué pregunta Elena primero?","de": "¿Sobre qué pregunta Elena primero?","s_es": {"type": "multiple_choice","options": ["The flat rules","The exam results","The bus timetable"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Las normas del piso","Los resultados del examen","Los horarios del autobús"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué dice Jamal sobre la cocina?","de": "¿Qué dice Jamal sobre la cocina?","s_es": {"type": "multiple_choice","options": ["The kitchen is messy","The kitchen is closed","The kitchen is empty"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["La cocina está desordenada","La cocina está cerrada","La cocina está vacía"],"answer": 0}}'::jsonb,
        '{"es": "¿Quién limpiará después de cenar?","de": "¿Quién limpiará después de cenar?","s_es": {"type": "multiple_choice","options": ["Priya","The postman","The teacher"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Priya","El cartero","El profesor"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué hora de silencio se menciona?","de": "¿Qué hora de silencio se menciona?","s_es": {"type": "multiple_choice","options": ["After ten","At breakfast","At noon"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Después de las diez","En el desayuno","Al mediodía"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué debe avisarse antes de que alguien duerma en el piso?","de": "¿Qué debe avisarse antes de que alguien duerma en el piso?","s_es": {"type": "multiple_choice","options": ["Overnight guests","A school test","A bus fare"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Las visitas que duermen","Un examen escolar","Un precio de autobús"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué comprarán juntos?","de": "¿Qué comprarán juntos?","s_es": {"type": "multiple_choice","options": ["Milk and bread","Shoes and hats","Tickets and stamps"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Leche y pan","Zapatos y sombreros","Billetes y sellos"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué debe hacer la gente con el ruido?","de": "¿Qué debe hacer la gente con el ruido?","s_es": {"type": "multiple_choice","options": ["Keep it low","Turn it up","Ignore it"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Mantenerlo bajo","Subirlo","Ignorarlo"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué es lo que está desordenado?","de": "¿Qué es lo que está desordenado?","s_es": {"type": "multiple_choice","options": ["The kitchen","The bedroom","The garden"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["La cocina","El dormitorio","El jardín"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 6390 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 6390 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 6390, 'en', 'listening', 'Convivencia', $transcript$
# AUDIO PROFILE: Elena, Jamal, and Priya, housemates
## "Shared Flat, Shared Rules"

## THE SCENE: A kitchen conversation about daily life in a shared flat
The housemates discuss cleaning, guests, quiet hours, and shopping.

### DIRECTOR''S NOTES
Style:
* Everyday housemate conversation with clear responsibilities.
* Keep the details practical and ordinary.

Pace: Moderate and steady.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear people agreeing on simple shared-house rules.
The audio focuses on chores, noise, food, and bills.

#### TRANSCRIPT
[opening] Elena: Can we talk about the flat rules for a minute?
[response] Jamal: Of course. The kitchen is a bit messy today.
[practical] Priya: I can clean it after dinner if you do the bins.
[agreeing] Elena: Yes, that works. We also need to keep quiet after ten.
[checking] Jamal: Right. What about guests at night?
[explanation] Priya: Please tell everyone before someone stays over.
[detail] Elena: And shared food should have names on it.
[reply] Jamal: Good idea. I keep forgetting that.
[closing] Priya: Let''s also buy milk and bread together.
[final] Elena: Perfect. I''ll update the list.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'escucha una conversación de piso compartido', 'Escucha una charla práctica entre compañeros de piso sobre limpieza, ruido y compras compartidas.'),
        (v_listening_id, 'de', 'höre ein Gespräch in einer Wohngemeinschaft', 'Höre ein praktisches Gespräch zwischen Mitbewohnern über Putzen, Lärm und gemeinsame Einkäufe.');

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
