-- ============================================================
-- Seed: A0 English Path – STEP 2820 – Listening – Escucha información sobre productos sin receta
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente tiene la nariz tapada y estornuda mucho.", "p_de": "Der Kunde hat eine verstopfte Nase und niest viel.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las cold tablets ayudan con la nariz tapada.", "p_de": "Cold tablets helfen bei verstopfter Nase.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las allergy tablets son una opción para los estornudos.", "p_de": "Allergy tablets sind eine Option gegen Niesen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las allergy tablets se toman una vez al día.", "p_de": "Allergy tablets werden einmal am Tag genommen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El hijo de diez años puede tomarlas sin problema.", "p_de": "Der zehnjährige Sohn kann sie problemlos nehmen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Son para personas mayores de doce años.", "p_de": "Sie sind für Personen über zwölf Jahre.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las cold tablets son buenas si tienes tensión alta.", "p_de": "Cold tablets sind gut, wenn man hohen Blutdruck hat.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La farmacéutica no da ninguna advertencia.", "p_de": "Die Apothekerin gibt keine Warnung.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué síntomas tiene el cliente?", "p_de": "Welche Symptome hat der Kunde?", "s": {"type": "multiple_choice", "options": ["A blocked nose and sneezing", "A broken arm and fever", "Back pain only"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A blocked nose and sneezing", "A broken arm and fever", "Back pain only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A blocked nose and sneezing", "A broken arm and fever", "Back pain only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué producto ayuda con la nariz tapada?", "p_de": "Welches Produkt hilft bei verstopfter Nase?", "s": {"type": "multiple_choice", "options": ["Cold tablets", "Pain gel", "A bandage"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Cold tablets", "Pain gel", "A bandage"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Cold tablets", "Pain gel", "A bandage"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué producto ayuda con los estornudos?", "p_de": "Welches Produkt hilft gegen Niesen?", "s": {"type": "multiple_choice", "options": ["Allergy tablets", "Antibiotic cream", "An X-ray"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Allergy tablets", "Antibiotic cream", "An X-ray"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Allergy tablets", "Antibiotic cream", "An X-ray"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué frecuencia se toman las allergy tablets?", "p_de": "Wie oft nimmt man die allergy tablets?", "s": {"type": "multiple_choice", "options": ["One tablet a day", "Three tablets a day", "Every eight hours"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["One tablet a day", "Three tablets a day", "Every eight hours"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["One tablet a day", "Three tablets a day", "Every eight hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos años tiene el hijo del cliente?", "p_de": "Wie alt ist der Sohn des Kunden?", "s": {"type": "multiple_choice", "options": ["Ten", "Twelve", "Sixteen"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Ten", "Twelve", "Sixteen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ten", "Twelve", "Sixteen"], "answer": 0}}'::jsonb,
        '{"p": "¿Para quién son las allergy tablets?", "p_de": "Für wen sind die allergy tablets?", "s": {"type": "multiple_choice", "options": ["For people over twelve", "For babies only", "For dogs"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["For people over twelve", "For babies only", "For dogs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["For people over twelve", "For babies only", "For dogs"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema de salud aparece en la advertencia?", "p_de": "Welches Gesundheitsproblem erscheint in der Warnung?", "s": {"type": "multiple_choice", "options": ["High blood pressure", "Low temperature", "A toothache"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["High blood pressure", "Low temperature", "A toothache"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["High blood pressure", "Low temperature", "A toothache"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién explica los productos?", "p_de": "Wer erklärt die Produkte?", "s": {"type": "multiple_choice", "options": ["The pharmacist", "The driver", "The teacher"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["The pharmacist", "The driver", "The teacher"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The pharmacist", "The driver", "The teacher"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2820 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2820 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2820, 'en', 'listening', 'health', $transcript$
# AUDIO PROFILE: A pharmacist helping a customer choose an over-the-counter product
## "Which Product Is Best?"

## THE SCENE: The counter area of a pharmacy
The customer asks for help with sneezing and a blocked nose. The pharmacist explains two product options and one warning.

### DIRECTOR'S NOTES
Style:
* Clear product names with simple symptom matching.
* Important age and health warnings are easy to hear.

Pace: Slow and practical.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how to ask about over-the-counter products and understand simple information about use and warnings.

#### TRANSCRIPT
[pharmacist] Pharmacist: How can I help you?
[customer] Customer: I have a blocked nose and I keep sneezing.
[pharmacist] Pharmacist: For the blocked nose, these cold tablets can help.
[pharmacist] Pharmacist: For the sneezing, these allergy tablets are a good option.
[customer] Customer: How often do I take the allergy tablets?
[pharmacist] Pharmacist: One tablet a day.
[customer] Customer: Can my ten-year-old son take them too?
[pharmacist] Pharmacist: No. They are for people over twelve.
[pharmacist] Pharmacist: And do not take the cold tablets if you have high blood pressure.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha información sobre productos sin receta', 'Escucha a una farmacéutica comparar dos productos sin receta y dar una advertencia simple.'),
        (v_listening_id, 'de', 'Höre Informationen über rezeptfreie Produkte', 'Höre eine Apothekerin, die zwei rezeptfreie Produkte vergleicht und eine einfache Warnung gibt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
