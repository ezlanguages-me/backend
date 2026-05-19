-- ============================================================
-- Seed: A0 English Path – STEP 5150 – Reading – read a detailed academic text (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Los edificios de laboratorio usan más agua.", "p_de": "Laborgebäude verbrauchen am meisten Wasser.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los aseos antiguos desperdician agua en dos edificios de aulas.", "p_de": "Alte Toiletten verschwenden Wasser in zwei Unterrichtsgebäuden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los sensores redujeron el uso de agua un dos por ciento.", "p_de": "Sensoren reduzierten den Wasserverbrauch um zwei Prozent.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los jardines cerca del centro deportivo usan agua reciclada.", "p_de": "Die Gärten nahe dem Sportzentrum nutzen recyceltes Wasser.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El consumo de agua es más alto en verano.", "p_de": "Der Wasserverbrauch ist im Sommer am höchsten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los sistemas de refrigeración funcionan menos tiempo en verano.", "p_de": "Kühlsysteme laufen im Sommer kürzer.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El informe recomienda resúmenes semanales por edificio.", "p_de": "Der Bericht empfiehlt wöchentliche Zusammenfassungen pro Gebäude.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto es sobre menús universitarios.", "p_de": "Der Text handelt von Universitätsmenüs.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué edificios usan más agua?", "p_de": "Welche Gebäude verbrauchen am meisten Wasser?", "s": {"type": "multiple_choice", "options": ["Laboratory buildings", "The library only", "Student cafes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema aparece en dos edificios de aulas?", "p_de": "Welches Problem gibt es in zwei Unterrichtsgebäuden?", "s": {"type": "multiple_choice", "options": ["Older toilets waste water", "The lights do not work", "There are no chairs"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto redujeron los sensores el uso de agua?", "p_de": "Um wie viel reduzierten Sensoren den Wasserverbrauch?", "s": {"type": "multiple_choice", "options": ["Twelve percent", "Two percent", "Twenty-five percent"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de agua usan ahora los jardines?", "p_de": "Welche Art Wasser nutzen die Gärten jetzt?", "s": {"type": "multiple_choice", "options": ["Recycled water", "Bottled water", "Sea water"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es más alto el consumo de agua?", "p_de": "Wann ist der Wasserverbrauch am höchsten?", "s": {"type": "multiple_choice", "options": ["In summer", "In winter", "On weekends only"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué sube el consumo en verano?", "p_de": "Warum steigt der Verbrauch im Sommer?", "s": {"type": "multiple_choice", "options": ["Cooling systems work longer", "More books are printed", "Students have longer phone calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recomienda el informe cada semana?", "p_de": "Was empfiehlt der Bericht jede Woche?", "s": {"type": "multiple_choice", "options": ["Water summaries for each building", "New bike helmets", "A debate about parking"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A detailed campus report", "A conference badge list", "A voicemail script"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5150 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5150 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5150, 'en', 'reading', 'academic', 'Detailed text: A campus report shows that laboratory buildings use the most water because they need special cleaning and equipment. The report also says that older toilets in two classroom buildings waste large amounts of water every week.

Last year, motion sensors in one science building reduced water use by twelve percent. The gardens near the sports center now use recycled water from a storage system. Water use is highest in summer because the cooling systems work longer.

The report recommends weekly water summaries for each building so that staff and students can see where problems begin.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Texto académico sobre uso del agua en el campus', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Akademischer Text über Wasserverbrauch auf dem Campus', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
