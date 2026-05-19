-- ============================================================
-- Seed: A0 English Path – STEP 5480 – Reading – read position statements (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Ana apoya grabar las clases para poder repasar partes difíciles.", "p_de": "Ana unterstützt Aufzeichnungen, um schwierige Teile später zu wiederholen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ben cree que las grabaciones completas pueden bajar la asistencia.", "p_de": "Ben glaubt, dass vollständige Aufzeichnungen die Anwesenheit senken können.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Carla quiere vídeos completos para todas las clases.", "p_de": "Carla möchte vollständige Videos für alle Vorlesungen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Carla prefiere clips breves de resumen.", "p_de": "Carla bevorzugt kurze Zusammenfassungsclips.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El departamento hará una prueba en un curso.", "p_de": "Die Abteilung macht einen Test in einem Kurs.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los tres estudiantes tienen exactamente la misma opinión.", "p_de": "Alle drei Studierenden haben genau dieselbe Meinung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El texto muestra apoyo total, preocupación y apoyo parcial.", "p_de": "Der Text zeigt volle Unterstützung, Sorge und teilweise Unterstützung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El tema trata de horarios de cafetería.", "p_de": "Das Thema handelt von Öffnungszeiten der Cafeteria.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Por qué apoya Ana las grabaciones?", "p_de": "Warum unterstützt Ana Aufzeichnungen?", "s": {"type": "multiple_choice", "options": ["To review difficult parts after class", "To reduce library hours", "To avoid all group work"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué teme Ben?", "p_de": "Was befürchtet Ben?", "s": {"type": "multiple_choice", "options": ["Attendance may fall", "Rent may rise", "The chart may break"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué formato prefiere Carla?", "p_de": "Welches Format bevorzugt Carla?", "s": {"type": "multiple_choice", "options": ["Short summary clips", "Full videos of every class", "Only written notes from teachers"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará el departamento?", "p_de": "Was wird die Abteilung tun?", "s": {"type": "multiple_choice", "options": ["Run a trial in one course", "Ban all recordings today", "Move every class online"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tres tipos de posición aparecen?", "p_de": "Welche drei Positionstypen erscheinen?", "s": {"type": "multiple_choice", "options": ["Full support, concern, and partial support", "Only support and no concern", "Only one neutral view"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál no es la postura de Carla?", "p_de": "Welche Position ist nicht Carlas Haltung?", "s": {"type": "multiple_choice", "options": ["Full recordings for everything", "Limited recordings", "Summary clips"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata el texto?", "p_de": "Worum geht es im Text?", "s": {"type": "multiple_choice", "options": ["Recording lectures", "Campus recycling bins", "Professional voicemail rules"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se toma la decisión final?", "p_de": "Wie wird die endgültige Entscheidung getroffen?", "s": {"type": "multiple_choice", "options": ["After a trial", "Immediately without testing", "By the library alone"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5480 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5480 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5480, 'en', 'reading', 'academic', 'Position statements. Ana supports recording lectures because students can review difficult parts after class. Ben does not support full recordings because he thinks attendance may fall.

Carla accepts recordings only in a limited form. She prefers short summary clips instead of complete videos. The department now plans a trial in one course before making a final decision.

The three statements show different views: full support, clear concern, and partial support with limits.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Posiciones escritas sobre grabar clases', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Schriftliche Positionen zum Aufzeichnen von Vorlesungen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
