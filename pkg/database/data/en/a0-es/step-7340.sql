    -- ============================================================
    -- Seed: A0 English Path – STEP 7340 – Reading – read about cultural differences in communication
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"es": "Algunas comunidades valoran los mensajes directos.", "de": "Manche Gemeinschaften schätzen direkte Botschaften.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "En otros lugares, la gente usa un lenguaje más indirecto para proteger la armonía.", "de": "An anderen Orten benutzen die Leute indirektere Sprache, um Harmonie zu bewahren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Todo el mundo interpreta el contacto visual de la misma manera.", "de": "Alle deuten Blickkontakt auf dieselbe Weise.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Usar el nombre de pila desde el primer día puede sonar cercano en algunos trabajos.", "de": "Den Vornamen vom ersten Tag an zu benutzen, kann in manchen Arbeitsumgebungen freundlich klingen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El silencio siempre significa que la conversación ha fracasado.", "de": "Schweigen bedeutet immer, dass ein Gespräch gescheitert ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "En algunas culturas, las preguntas personales pueden mostrar cercanía.", "de": "In manchen Kulturen können persönliche Fragen Nähe zeigen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los buenos comunicadores usan exactamente el mismo estilo en todas partes.", "de": "Gute Kommunikatoren benutzen überall genau denselben Stil.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Observar y hacer preguntas educadas puede ayudar a generar confianza.", "de": "Beobachten und höfliche Fragen können helfen, Vertrauen aufzubauen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Por qué algunas personas usan un lenguaje más indirecto?", "de": "Warum benutzen manche Menschen indirektere Sprache?", "s_es": {"type": "multiple_choice", "options": ["To protect harmony", "To end the conversation", "To hide their name"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um Harmonie zu bewahren", "Um das Gespräch zu beenden", "Um ihren Namen zu verbergen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué puede mostrar el contacto visual fuerte en algunos lugares?", "de": "Was kann starker Blickkontakt an manchen Orten zeigen?", "s_es": {"type": "multiple_choice", "options": ["Confidence and attention", "Fear and distance", "A wish to leave"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Selbstvertrauen und Aufmerksamkeit", "Angst und Distanz", "Den Wunsch zu gehen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo puede sonar usar el nombre de pila desde el primer día en un contexto formal?", "de": "Wie kann es in einem formellen Umfeld wirken, den Vornamen gleich am ersten Tag zu benutzen?", "s_es": {"type": "multiple_choice", "options": ["Too informal", "Too expensive", "Too quiet"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zu informell", "Zu teuer", "Zu leise"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué puede significar el silencio en algunas conversaciones?", "de": "Was kann Schweigen in manchen Gesprächen bedeuten?", "s_es": {"type": "multiple_choice", "options": ["Respect or thinking time", "A broken microphone", "A train problem"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Respekt oder Denkzeit", "Ein kaputtes Mikrofon", "Ein Zugproblem"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué algunas personas hacen preguntas personales?", "de": "Warum stellen manche Leute persönliche Fragen?", "s_es": {"type": "multiple_choice", "options": ["To show warmth", "To sell a product", "To stop the meeting"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um Wärme zu zeigen", "Um ein Produkt zu verkaufen", "Um das Treffen zu beenden"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debería hacer una persona antes de juzgar un estilo de comunicación?", "de": "Was sollte man tun, bevor man einen Kommunikationsstil beurteilt?", "s_es": {"type": "multiple_choice", "options": ["Observe and ask polite questions", "Speak much louder", "Change the subject immediately"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Beobachten und höflich nachfragen", "Viel lauter sprechen", "Sofort das Thema wechseln"], "answer": 0}}'::jsonb,
        '{"es": "¿Para qué sirve un pequeño ajuste de tono o de tiempo?", "de": "Wozu dient eine kleine Anpassung im Ton oder Timing?", "s_es": {"type": "multiple_choice", "options": ["To prevent misunderstanding and build trust", "To make the talk longer", "To avoid all eye contact"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um Missverständnisse zu vermeiden und Vertrauen aufzubauen", "Um das Gespräch länger zu machen", "Um allen Blickkontakt zu vermeiden"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice el texto sobre las normas de comunicación?", "de": "Was sagt der Text über Kommunikationsregeln?", "s_es": {"type": "multiple_choice", "options": ["They change between communities", "They are always identical", "They only matter online"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie unterscheiden sich zwischen Gemeinschaften", "Sie sind immer identisch", "Sie sind nur online wichtig"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7340 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 7340 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 7340, 'en', 'reading', 'social', 'Communication styles can look very different even when people are friendly. Some communities value direct messages because they sound honest and efficient. In other communities, people prefer softer language. They may say Maybe or We will see because they want to protect harmony and leave space for the other person.\n\nEye contact can also mean different things. In one setting, strong eye contact shows confidence and attention. In another, very long eye contact can feel too intense. Names matter too. Using a first name on the first day can sound warm in some workplaces, while other people prefer titles until the relationship is clearer.\n\nSilence is another area of difference. Some speakers use a pause to think or to show respect. They do not see silence as a problem. Personal questions can also be interpreted differently. Asking about family, age, or meals may feel warm and caring in one culture, but private in another.\n\nFor that reason, good communicators do not copy one style everywhere. They observe, listen, and ask polite questions. A small adjustment in tone, timing, or wording can prevent misunderstanding and build trust.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee sobre diferencias culturales en la comunicación', 'Lee un texto breve sobre lenguaje directo e indirecto, silencio, contacto visual y preguntas personales.'),
            (v_reading_id, 'de', 'Lies über kulturelle Unterschiede in der Kommunikation', 'Lies einen kurzen Text über direkte und indirekte Sprache, Schweigen, Blickkontakt und persönliche Fragen.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_reading_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'es', ex->'s_es'),
                (v_ex_id, 'de', ex->>'de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
