-- ============================================================
-- Seed: A0 English Path – STEP 2360 – Reading – understand most explanations of what is on the menu, but will require a dictionary for culinary terms (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Grilled significa cocinado a fuego alto.", "p_de": "Grilled bedeutet bei hoher Hitze gekocht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Roasted significa cocinado en agua.", "p_de": "Roasted bedeutet in Wasser gekocht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El pollo marinado lleva hierbas y aceite antes de cocinarse.", "p_de": "Mariniertes Hähnchen hat vor dem Garen Kräuter und Öl.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sopa cremosa lleva leche o nata.", "p_de": "Cremige Suppe enthält Milch oder Sahne.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las cebollas crujientes son cebollas hervidas.", "p_de": "Knusprige Zwiebeln sind gekochte Zwiebeln.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "En el menú hay gambas a la parrilla.", "p_de": "Auf der Karte gibt es gegrillte Garnelen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las verduras del menú son roasted.", "p_de": "Das Gemüse auf der Karte ist roasted.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto combina definiciones y un menú.", "p_de": "Der Text kombiniert Definitionen und eine Speisekarte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué significa grilled?", "p_de": "Was bedeutet grilled?", "s": {"type": "multiple_choice", "options": ["Cooked over high heat", "Cooked in water", "Served with sugar"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa roasted?", "p_de": "Was bedeutet roasted?", "s": {"type": "multiple_choice", "options": ["Cooked in the oven", "Cooked in ice", "Mixed with fruit"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué lleva el pollo marinado antes de cocinarse?", "p_de": "Was hat mariniertes Hähnchen vor dem Kochen?", "s": {"type": "multiple_choice", "options": ["Herbs and oil", "Chocolate and milk", "Rice and beans"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué lleva una sopa creamy?", "p_de": "Was enthält eine creamy soup?", "s": {"type": "multiple_choice", "options": ["Milk or cream", "Peanuts", "Only lemon"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo son las crispy onions?", "p_de": "Wie sind crispy onions?", "s": {"type": "multiple_choice", "options": ["Brown and hard", "Cold and wet", "Soft and white"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué marisco aparece en el menú?", "p_de": "Welche Meeresfrucht steht auf der Karte?", "s": {"type": "multiple_choice", "options": ["Grilled shrimp", "Octopus stew", "Raw tuna"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué verduras aparecen en el menú?", "p_de": "Welches Gemüse steht auf der Karte?", "s": {"type": "multiple_choice", "options": ["Roasted vegetables", "Boiled potatoes only", "Sweet corn bread"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es este?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A culinary glossary with a menu", "A bus ticket", "A bill receipt"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2360 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2360 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2360, 'en', 'reading', 'Restauración', $reading$
CULINARY NOTES
Grilled means cooked over high heat.
Roasted means cooked in the oven.
Marinated chicken is chicken in herbs and oil before cooking.
Creamy soup has milk or cream.
Crispy onions are onions fried until brown and hard.

MENU
Marinated chicken salad, roasted vegetables, grilled shrimp, creamy mushroom soup.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer un pequeño glosario culinario');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Ein kleines kulinarisches Glossar lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
