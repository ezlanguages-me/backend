-- ============================================================
-- Seed: A0 English Path – STEP 5660 – Reading – use a bilingual dictionary and establish the first language equivalent of concrete words (Textos, Ensayos e Investigación)
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
        '{"p": "La palabra principal de la entrada se llama headword.", "p_de": "Das Hauptwort eines Eintrags heißt headword.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La categoría gramatical puede mostrar si una palabra es nombre, verbo o adjetivo.", "p_de": "Die Wortart kann zeigen, ob ein Wort Nomen, Verb oder Adjektiv ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las frases de ejemplo no ayudan a elegir una traducción.", "p_de": "Beispielsätze helfen nicht bei der Wahl einer Übersetzung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La palabra bank puede significar un lugar para el dinero o la orilla de un río.", "p_de": "Das Wort bank kann einen Ort für Geld oder das Ufer eines Flusses bedeuten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Para elegir bien, debes mirar la situación descrita en la frase original.", "p_de": "Für die richtige Wahl sollte man auf die Situation im Ursprungssatz achten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La mejor traducción siempre es la primera de la lista.", "p_de": "Die beste Übersetzung ist immer die erste in der Liste.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las etiquetas pueden indicar si una palabra es formal, informal o técnica.", "p_de": "Markierungen können zeigen, ob ein Wort formell, informell oder fachsprachlich ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto explica cómo usar un diccionario bilingüe según el contexto.", "p_de": "Der Text erklärt, wie man ein zweisprachiges Wörterbuch je nach Kontext benutzt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        -- 8 multiple_choice exercises (answer ALWAYS 0)
        '{"p": "¿Cómo se llama la forma principal que aparece en el diccionario?", "p_de": "Wie heißt die Grundform im Wörterbuch?", "s": {"type": "multiple_choice", "options": ["The headword", "The bookshelf", "The login code"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes mirar después del headword?", "p_de": "Was sollte man nach dem headword ansehen?", "s": {"type": "multiple_choice", "options": ["The part of speech", "The room number", "The printer cable"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirven las frases de ejemplo?", "p_de": "Wofür dienen Beispielsätze?", "s": {"type": "multiple_choice", "options": ["To show how the word works in context", "To reserve a seat", "To count library fines"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué muestra el ejemplo con bank?", "p_de": "Was zeigt das Beispiel mit bank?", "s": {"type": "multiple_choice", "options": ["That one word can have different meanings", "That all words are technical", "That dictionaries have no order"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes comprobar antes de escoger la traducción?", "p_de": "Was sollte man vor der Wahl der Übersetzung prüfen?", "s": {"type": "multiple_choice", "options": ["What object, action, or situation is meant", "What color the dictionary is", "What time the library closes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué comparas con tu texto?", "p_de": "Was vergleicht man mit dem eigenen Text?", "s": {"type": "multiple_choice", "options": ["The example sentences", "The cafeteria menu", "The lecture slides"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué indican etiquetas como formal o technical?", "p_de": "Was zeigen Markierungen wie formal oder technical?", "s": {"type": "multiple_choice", "options": ["Usage information", "Page size only", "Shelf height only"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la mejor traducción?", "p_de": "Welche Übersetzung ist die beste?", "s": {"type": "multiple_choice", "options": ["The one that fits the context", "The longest one", "The last one listed"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5660 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5660 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5660, 'en', 'reading', 'academic', 'A bilingual dictionary helps you connect an unfamiliar concrete word with a first language equivalent. Start with the headword, which is the main form listed in alphabetical order. Then notice the part of speech, such as noun, verb, or adjective, because one word can have more than one function.

Dictionary entries also include translation options, example sentences, and sometimes labels such as formal, informal, or technical. Example sentences show how the word works in context and can prevent a wrong choice. A concrete word like bank can mean a place for money or the side of a river.

To choose the right translation, check the sentence you are reading and ask what object, action, or situation is meant. Compare the example sentences with your text before selecting the first language equivalent. The best translation is the one that fits the context, not always the first one in the list.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Usar un diccionario bilingüe para palabras concretas', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Ein zweisprachiges Wörterbuch für konkrete Wörter nutzen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
