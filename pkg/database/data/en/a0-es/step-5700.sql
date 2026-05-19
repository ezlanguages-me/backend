-- ============================================================
-- Seed: A0 English Path – STEP 5700 – Reading – make full and effective use of dictionaries for productive and receptive purposes (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- 8 true_false exercises first
        '{"p": "El uso receptivo del diccionario ayuda a entender lo que lees o escuchas.", "p_de": "Der rezeptive Wörterbuchgebrauch hilft, Gelesenes oder Gehörtes zu verstehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Para uso receptivo conviene mirar significado, pronunciación, categoría gramatical y ejemplo.", "p_de": "Für den rezeptiven Gebrauch sollte man Bedeutung, Aussprache, Wortart und Beispiel ansehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El uso productivo sirve cuando quieres escribir o hablar con más precisión.", "p_de": "Der produktive Gebrauch hilft, wenn man genauer schreiben oder sprechen will.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las colocaciones y notas de uso no importan al escribir.", "p_de": "Kollokationen und Gebrauchshinweise sind beim Schreiben nicht wichtig.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las etiquetas gramaticales pueden mostrar si una palabra es formal o va con una preposición.", "p_de": "Grammatische Markierungen können zeigen, ob ein Wort formell ist oder mit einer Präposition steht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los buenos usuarios del diccionario cambian entre fines receptivos y productivos.", "p_de": "Gute Wörterbuchnutzer wechseln zwischen rezeptiven und produktiven Zielen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El diccionario es más útil si lees ejemplos y etiquetas, no solo la primera traducción.", "p_de": "Das Wörterbuch ist nützlicher, wenn man Beispiele und Markierungen liest, nicht nur die erste Übersetzung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que un diccionario solo sirve para traducción rápida.", "p_de": "Der Text sagt, ein Wörterbuch diene nur der schnellen Übersetzung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        -- 8 multiple_choice exercises (answer ALWAYS 0)
        '{"p": "¿Para qué sirve el uso receptivo?", "p_de": "Wofür dient der rezeptive Gebrauch?", "s": {"type": "multiple_choice", "options": ["To understand what you read or hear", "To reserve a lecture hall", "To calculate exam grades"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes mirar cuando una palabra es desconocida?", "p_de": "Was sollte man ansehen, wenn ein Wort unbekannt ist?", "s": {"type": "multiple_choice", "options": ["Meaning, pronunciation, part of speech, and example sentence", "Only the page number", "Only the author name"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve el uso productivo?", "p_de": "Wofür dient der produktive Gebrauch?", "s": {"type": "multiple_choice", "options": ["To write or speak accurately", "To find parking spaces", "To borrow equipment"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes buscar además de la traducción?", "p_de": "Was sollte man außer der Übersetzung suchen?", "s": {"type": "multiple_choice", "options": ["Collocations, usage notes, and grammar labels", "Bus routes and maps", "Room keys and invoices"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pueden mostrar las notas de uso?", "p_de": "Was können Gebrauchshinweise zeigen?", "s": {"type": "multiple_choice", "options": ["Whether a word is formal or common in academic writing", "Whether the book is lost", "Whether the class is online"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hacen los buenos usuarios del diccionario?", "p_de": "Was tun gute Wörterbuchnutzer?", "s": {"type": "multiple_choice", "options": ["They switch between receptive and productive purposes", "They read only the first translation", "They ignore example sentences"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo resulta más útil un diccionario?", "p_de": "Wann ist ein Wörterbuch am nützlichsten?", "s": {"type": "multiple_choice", "options": ["When you read examples and labels carefully", "When you close it quickly", "When you count the pages only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ayuda a elegir el sentido correcto de una palabra?", "p_de": "Was hilft, die richtige Bedeutung zu wählen?", "s": {"type": "multiple_choice", "options": ["Checking which sense fits the text", "Choosing the shortest option", "Skipping all examples"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5700 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5700 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5700, 'en', 'reading', 'academic', 'Receptive dictionary use helps you understand what you read or hear. When a word is unfamiliar, check its meaning, pronunciation, part of speech, and example sentence. This helps you choose the sense that fits the text.

Productive dictionary use helps when you want to write or speak accurately. Instead of selecting only a translation, look for collocations, usage notes, and grammar labels. These details show whether a word is formal, countable, followed by a preposition, or common in academic writing.

Good dictionary users switch between both purposes. They use entries to understand a word in context and to produce a natural sentence later. A dictionary is more useful when you read the examples and labels, not only the first translation.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Aprovechar los diccionarios para comprender y producir', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Wörterbücher rezeptiv und produktiv nutzen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
