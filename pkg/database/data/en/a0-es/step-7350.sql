    -- ============================================================
    -- Seed: A0 English Path – STEP 7350 – Listening – listen to conversation about cultural topics
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"es": "Nora dice que el taller fue interesante.", "de": "Nora sagt, dass der Workshop interessant war.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "En la familia de Samir, una pausa corta suele significar respeto.", "de": "In Samirs Familie bedeutet eine kurze Pause meist Respekt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "En la oficina de Nora, el silencio da sensación de que la reunión se ha detenido.", "de": "In Noras Büro fühlt es sich bei Schweigen so an, als hätte das Treffen aufgehört.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Samir dice que la crítica directa siempre suena educada.", "de": "Samir sagt, dass direkte Kritik immer höflich klingt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La tía de Nora prefiere que la llamen Doctor Ruiz en el trabajo.", "de": "Noras Tante möchte bei der Arbeit weiterhin Doctor Ruiz genannt werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El primo de Samir quiere que usen su nombre de pila desde el primer día.", "de": "Samirs Cousin möchte, dass man ab dem ersten Tag seinen Vornamen benutzt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Nora dice que algunas personas apartan la mirada para ser educadas.", "de": "Nora sagt, dass manche Menschen wegschauen, um höflich zu sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Samir cree que es mejor hacer juicios rápidos.", "de": "Samir findet, dass schnelle Urteile besser sind.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué le sorprende a Nora del silencio?", "de": "Was überrascht Nora am Schweigen?", "s_es": {"type": "multiple_choice", "options": ["It can have many meanings", "It always means anger", "It only happens in schools"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Es kann viele Bedeutungen haben", "Es bedeutet immer Ärger", "Es kommt nur in Schulen vor"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué suele significar una pausa corta en la familia de Samir?", "de": "Was bedeutet eine kurze Pause in Samirs Familie meistens?", "s_es": {"type": "multiple_choice", "options": ["Respect", "Boredom", "A phone call"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Respekt", "Langeweile", "Einen Telefonanruf"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo se siente el silencio en la oficina de Nora?", "de": "Wie fühlt sich Schweigen in Noras Büro an?", "s_es": {"type": "multiple_choice", "options": ["Like the meeting has stopped", "Like everyone agrees", "Like the room is warmer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Als wäre das Treffen gestoppt", "Als würden alle zustimmen", "Als wäre der Raum wärmer"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo puede sonar la crítica directa según el taller?", "de": "Wie kann direkte Rückmeldung laut Workshop klingen?", "s_es": {"type": "multiple_choice", "options": ["Useful in one culture and rude in another", "Always funny", "Only formal"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In einer Kultur nützlich und in einer anderen unhöflich", "Immer lustig", "Nur formell"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué título prefiere la tía de Nora?", "de": "Welchen Titel bevorzugt Noras Tante?", "s_es": {"type": "multiple_choice", "options": ["Doctor Ruiz", "Professor Lane", "Ms. White"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Doctor Ruiz", "Professor Lane", "Ms. White"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pide el primo de Samir?", "de": "Worum bittet Samirs Cousin?", "s_es": {"type": "multiple_choice", "options": ["Use his first name on the first day", "Write him a letter", "Avoid eye contact"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Seinen Vornamen gleich am ersten Tag zu benutzen", "Ihm einen Brief zu schreiben", "Blickkontakt zu vermeiden"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hacen algunas personas para mostrar educación?", "de": "Was tun manche Menschen, um höflich zu sein?", "s_es": {"type": "multiple_choice", "options": ["They look away", "They speak louder", "They change chairs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie schauen weg", "Sie sprechen lauter", "Sie wechseln den Stuhl"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué idea final comparten Nora y Samir?", "de": "Welche Schlussidee teilen Nora und Samir?", "s_es": {"type": "multiple_choice", "options": ["Curiosity is more helpful than quick judgments", "Rules never change", "Titles are always necessary"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neugier hilft mehr als schnelle Urteile", "Regeln ändern sich nie", "Titel sind immer nötig"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7350 AND path_uuid = v_path_id);
        DELETE FROM listening WHERE step_order = 7350 AND path_uuid = v_path_id;

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 7350, 'en', 'listening', 'social', $transcript$
    # AUDIO PROFILE: Nora and Samir, two friends walking home after a workshop
## "How People Show Respect"

## THE SCENE: A quiet street after a community talk on communication styles
Two friends continue discussing the examples from the workshop and compare them with their own experience.

### DIRECTOR'S NOTES
Style:
* Thoughtful and natural conversation with clear examples from daily life.
* The speakers sound curious and respectful, not argumentative.

Pace: Medium and steady, like friends reflecting while they walk.

Accent: Neutral international English.

### SAMPLE CONTEXT
Learners hear vocabulary for communication styles, respect, titles, eye contact, and making careful cultural comparisons.

#### TRANSCRIPT
[thoughtful] Nora: The workshop was interesting. I did not realize how many meanings silence can have.
[curious] Samir: Same here. In my family, a short pause usually means respect, not discomfort.
[reflective] Nora: In my office, people jump in quickly, so silence feels like the meeting has stopped.
[engaged] Samir: The speaker also said direct feedback can sound useful in one culture and rude in another.
[agreeing] Nora: Yes, and I liked the part about titles. My aunt still prefers Doctor Ruiz at work.
[light laugh] Samir: My cousin is the opposite. He tells everyone to use his first name on the first day.
[observing] Nora: Eye contact was another good example. Some friends look away to be polite.
[calm] Samir: While others look directly at you to show attention.
[warm] Nora: I think the best idea was to ask simple questions instead of making fast judgments.
[confident] Samir: Exactly. Curiosity is more helpful than assuming one habit is the only normal one.
    $transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una conversación sobre temas culturales', 'Escucha a dos amigos hablar de respeto, lenguaje directo, títulos y contacto visual después de un taller.'),
            (v_listening_id, 'de', 'Höre ein Gespräch über kulturelle Themen', 'Höre zwei Freunde, die nach einem Workshop über Respekt, direkte Sprache, Titel und Blickkontakt sprechen.');

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
