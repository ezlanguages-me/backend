-- ============================================================
-- Seed: A0 English Path – STEP 6350 – Listening – escucha una charla sobre diferencias culturales (Convivencia)
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
        '{"es": "Sofia y Daniel hablan después de clase.","de": "Sofia and Daniel talk after class.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Las dos familias usan solo señales silenciosas.","de": "Both families use only silent gestures.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "En el país de Sofia la cena es tarde.","de": "In Sofia''s country dinner is late.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Daniel dice que hablar claro no significa ser grosero.","de": "Daniel says speaking clearly does not mean being rude.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Ambos creen que el respeto es importante.","de": "They both think respect is important.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Sofia cena más tarde que Daniel.","de": "Sofia isst später zu Abend als Daniel.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Daniel piensa que ser claro no es grosero.","de": "Daniel findet, dass klar zu sprechen nicht unhöflich ist.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Los dos valoran el respeto.","de": "Beide legen Wert auf Respekt.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Cómo saludan las familias?","de": "¿Cómo saludan las familias?","s_es": {"type": "multiple_choice","options": ["A smile and handshakes","Only written notes","A loud whistle"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Una sonrisa y apretones de manos","Solo notas escritas","Un silbido fuerte"],"answer": 0}}'::jsonb,
        '{"es": "¿Cuándo cena Sofia normalmente?","de": "¿Cuándo cena Sofia normalmente?","s_es": {"type": "multiple_choice","options": ["Dinner is late","Dinner is at dawn","Dinner is cancelled"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["La cena es tarde","La cena es al amanecer","La cena se cancela"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué opina Daniel de ser directo?","de": "¿Qué opina Daniel de ser directo?","s_es": {"type": "multiple_choice","options": ["Being clear is not rude","Being clear is always rude","Being clear is impossible"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Ser claro no es grosero","Ser claro siempre es grosero","Ser claro es imposible"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué hace Sofia al hacer preguntas en su casa?","de": "¿Qué hace Sofia al hacer preguntas en su casa?","s_es": {"type": "multiple_choice","options": ["More small talk","No food","No greetings"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Más charla informal","No hay comida","No hay saludos"],"answer": 0}}'::jsonb,
        '{"es": "¿Cómo ve Daniel las dos costumbres?","de": "¿Cómo ve Daniel las dos costumbres?","s_es": {"type": "multiple_choice","options": ["Both ways can work","Only one way is correct","Nothing matters"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Que ambas formas pueden funcionar","Que solo una forma es correcta","Que nada importa"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué tema comparan?","de": "¿Qué tema comparan?","s_es": {"type": "multiple_choice","options": ["Everyday customs","Homework tasks","Bus times"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Costumbres cotidianas","Deberes escolares","Horarios de autobús"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué relación tienen los hablantes?","de": "¿Qué relación tienen los hablantes?","s_es": {"type": "multiple_choice","options": ["Exchange students","Train drivers","Shop owners"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Estudiantes de intercambio","Conductores de tren","Dueños de tienda"],"answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el tono de la charla?","de": "¿Cuál es el tono de la charla?","s_es": {"type": "multiple_choice","options": ["Respectful and curious","Angry and loud","Bored and rude"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Respetuoso y curioso","Enfadado y ruidoso","Aburrido y grosero"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 6350 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 6350 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 6350, 'en', 'listening', 'Convivencia', $transcript$
# AUDIO PROFILE: Sofia and Daniel, exchange students
## "Different, But Still Friendly"

## THE SCENE: Two students talk after class in a quiet corridor
They compare greetings, meal times, and how direct people are in different places.

### DIRECTOR''S NOTES
Style:
* Discussion-style listening with clear examples and short opinions.
* Keep contrasts simple and easy to follow.

Pace: Medium-slow, with natural thinking pauses.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear people comparing cultural differences politely.
The audio focuses on customs, timing, and everyday behaviour.

#### TRANSCRIPT
[opening] Sofia: My host family always greets me with a smile.
[reply] Daniel: Mine does too, but they also shake hands more often.
[comment] Sofia: In my country, dinner is quite late.
[compare] Daniel: That is interesting. We usually eat earlier.
[detail] Sofia: People here are also very direct when they speak.
[thought] Daniel: Yes, I noticed that. It is not rude, just clear.
[example] Sofia: At home we would ask more slowly and with extra small talk.
[response] Daniel: I think both ways can work if people are polite.
[closing] Sofia: Exactly. Different habits, but the same respect.
[end] Daniel: That''s a good way to see it.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'escucha una charla sobre diferencias culturales', 'Escucha una conversación suave entre dos estudiantes que comparan costumbres y horarios.'),
        (v_listening_id, 'de', 'höre ein Gespräch über kulturelle Unterschiede', 'Höre ein ruhiges Gespräch zwischen zwei Studierenden, die Gepflogenheiten und Zeiten vergleichen.');

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
