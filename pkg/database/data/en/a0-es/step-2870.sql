-- ============================================================
-- Seed: A0 English Path – STEP 2870 – Grammar – Formación -ED
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_grammar_id UUID;
    v_rule1_id UUID;
    v_rule2_id UUID;
    v_rule3_id UUID;
    v_rule4_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_rule1_exercises JSONB[] := ARRAY[
        '{"p": "Escribe el pasado de walk.", "p_de": "Schreibe die Vergangenheitsform von walk.", "s": {"type": "typing", "correct_answers": ["walked"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de play.", "p_de": "Schreibe die Vergangenheitsform von play.", "s": {"type": "typing", "correct_answers": ["played"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de visit.", "p_de": "Schreibe die Vergangenheitsform von visit.", "s": {"type": "typing", "correct_answers": ["visited"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de clean.", "p_de": "Schreibe die Vergangenheitsform von clean.", "s": {"type": "typing", "correct_answers": ["cleaned"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de open.", "p_de": "Schreibe die Vergangenheitsform von open.", "s": {"type": "typing", "correct_answers": ["opened"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de work.", "p_de": "Schreibe die Vergangenheitsform von work.", "s": {"type": "typing", "correct_answers": ["worked"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de help.", "p_de": "Schreibe die Vergangenheitsform von help.", "s": {"type": "typing", "correct_answers": ["helped"], "case_sensitive": false}}'::jsonb,
        '{"p": "Elige la forma correcta de walk en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von walk.", "s": {"type": "multiple_choice", "options": ["walked", "walkd", "walkt"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["walked", "walkd", "walkt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["walked", "walkd", "walkt"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de play en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von play.", "s": {"type": "multiple_choice", "options": ["played", "playeded", "plaied"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["played", "playeded", "plaied"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["played", "playeded", "plaied"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de visit en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von visit.", "s": {"type": "multiple_choice", "options": ["visited", "visitd", "visitted"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["visited", "visitd", "visitted"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["visited", "visitd", "visitted"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de clean en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von clean.", "s": {"type": "multiple_choice", "options": ["cleaned", "cleand", "cleanned"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["cleaned", "cleand", "cleanned"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["cleaned", "cleand", "cleanned"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de open en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von open.", "s": {"type": "multiple_choice", "options": ["opened", "opend", "openned"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["opened", "opend", "openned"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["opened", "opend", "openned"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de work en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von work.", "s": {"type": "multiple_choice", "options": ["worked", "workd", "worket"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["worked", "workd", "worket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["worked", "workd", "worket"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de help en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von help.", "s": {"type": "multiple_choice", "options": ["helped", "helpd", "helppet"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["helped", "helpd", "helppet"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["helped", "helpd", "helppet"], "answer": 0}}'::jsonb,
        '{"p": "Walked es el pasado correcto de walk.", "p_de": "Walked ist die richtige Vergangenheitsform von walk.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Played es el pasado correcto de play.", "p_de": "Played ist die richtige Vergangenheitsform von play.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Visitd es la forma correcta de visit.", "p_de": "Visitd ist die richtige Form von visit.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Muchos verbos regulares solo añaden -ed.", "p_de": "Viele regelmäßige Verben bekommen einfach -ed.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Open → openned sigue la regla normal.", "p_de": "Open → openned folgt der normalen Regel.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Helped es una forma correcta.", "p_de": "Helped ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Worked es una forma correcta.", "p_de": "Worked ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["I", "walked", "home", "yesterday."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["We", "played", "outside", "after", "class."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["They", "visited", "the", "doctor", "yesterday."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["She", "cleaned", "the", "room."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["He", "opened", "the", "door."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["I", "worked", "late", "yesterday."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["She", "helped", "her", "friend."], "correct_order": [0, 1, 2, 3]}}'::jsonb
    ];
    v_rule2_exercises JSONB[] := ARRAY[
        '{"p": "Escribe el pasado de like.", "p_de": "Schreibe die Vergangenheitsform von like.", "s": {"type": "typing", "correct_answers": ["liked"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de move.", "p_de": "Schreibe die Vergangenheitsform von move.", "s": {"type": "typing", "correct_answers": ["moved"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de live.", "p_de": "Schreibe die Vergangenheitsform von live.", "s": {"type": "typing", "correct_answers": ["lived"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de close.", "p_de": "Schreibe die Vergangenheitsform von close.", "s": {"type": "typing", "correct_answers": ["closed"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de dance.", "p_de": "Schreibe die Vergangenheitsform von dance.", "s": {"type": "typing", "correct_answers": ["danced"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de use.", "p_de": "Schreibe die Vergangenheitsform von use.", "s": {"type": "typing", "correct_answers": ["used"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de love.", "p_de": "Schreibe die Vergangenheitsform von love.", "s": {"type": "typing", "correct_answers": ["loved"], "case_sensitive": false}}'::jsonb,
        '{"p": "Elige la forma correcta de like en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von like.", "s": {"type": "multiple_choice", "options": ["liked", "likeed", "likt"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["liked", "likeed", "likt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["liked", "likeed", "likt"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de move en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von move.", "s": {"type": "multiple_choice", "options": ["moved", "moveed", "movved"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["moved", "moveed", "movved"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["moved", "moveed", "movved"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de live en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von live.", "s": {"type": "multiple_choice", "options": ["lived", "liveed", "livved"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["lived", "liveed", "livved"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["lived", "liveed", "livved"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de close en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von close.", "s": {"type": "multiple_choice", "options": ["closed", "closeed", "closd"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["closed", "closeed", "closd"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["closed", "closeed", "closd"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de dance en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von dance.", "s": {"type": "multiple_choice", "options": ["danced", "danceed", "dancced"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["danced", "danceed", "dancced"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["danced", "danceed", "dancced"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de use en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von use.", "s": {"type": "multiple_choice", "options": ["used", "useed", "ussed"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["used", "useed", "ussed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["used", "useed", "ussed"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de love en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von love.", "s": {"type": "multiple_choice", "options": ["loved", "loveed", "lovved"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["loved", "loveed", "lovved"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["loved", "loveed", "lovved"], "answer": 0}}'::jsonb,
        '{"p": "Liked es la forma correcta de like.", "p_de": "Liked ist die richtige Form von like.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Moveed es la forma correcta de move.", "p_de": "Moveed ist die richtige Form von move.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Si el verbo ya termina en -e, añadimos solo -d.", "p_de": "Wenn das Verb schon auf -e endet, fügen wir nur -d hinzu.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Live → lived es correcto.", "p_de": "Live → lived ist korrekt.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Love → loveed es correcto.", "p_de": "Love → loveed ist korrekt.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Closed es una forma correcta.", "p_de": "Closed ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Danced es una forma correcta.", "p_de": "Danced ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["I", "liked", "the", "film."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["We", "moved", "house", "last", "year."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["They", "lived", "in", "Madrid."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["She", "closed", "the", "window."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["He", "danced", "well", "yesterday."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["I", "used", "my", "phone."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["They", "loved", "the", "music."], "correct_order": [0, 1, 2, 3]}}'::jsonb
    ];
    v_rule3_exercises JSONB[] := ARRAY[
        '{"p": "Escribe el pasado de stop.", "p_de": "Schreibe die Vergangenheitsform von stop.", "s": {"type": "typing", "correct_answers": ["stopped"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de plan.", "p_de": "Schreibe die Vergangenheitsform von plan.", "s": {"type": "typing", "correct_answers": ["planned"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de drop.", "p_de": "Schreibe die Vergangenheitsform von drop.", "s": {"type": "typing", "correct_answers": ["dropped"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de shop.", "p_de": "Schreibe die Vergangenheitsform von shop.", "s": {"type": "typing", "correct_answers": ["shopped"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de chat.", "p_de": "Schreibe die Vergangenheitsform von chat.", "s": {"type": "typing", "correct_answers": ["chatted"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de clap.", "p_de": "Schreibe die Vergangenheitsform von clap.", "s": {"type": "typing", "correct_answers": ["clapped"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de grab.", "p_de": "Schreibe die Vergangenheitsform von grab.", "s": {"type": "typing", "correct_answers": ["grabbed"], "case_sensitive": false}}'::jsonb,
        '{"p": "Elige la forma correcta de stop en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von stop.", "s": {"type": "multiple_choice", "options": ["stopped", "stoped", "stopt"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["stopped", "stoped", "stopt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["stopped", "stoped", "stopt"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de plan en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von plan.", "s": {"type": "multiple_choice", "options": ["planned", "planed", "plant"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["planned", "planed", "plant"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["planned", "planed", "plant"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de drop en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von drop.", "s": {"type": "multiple_choice", "options": ["dropped", "droped", "dropt"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["dropped", "droped", "dropt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["dropped", "droped", "dropt"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de shop en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von shop.", "s": {"type": "multiple_choice", "options": ["shopped", "shoped", "shopt"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["shopped", "shoped", "shopt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["shopped", "shoped", "shopt"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de chat en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von chat.", "s": {"type": "multiple_choice", "options": ["chatted", "chated", "chatt"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["chatted", "chated", "chatt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["chatted", "chated", "chatt"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de clap en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von clap.", "s": {"type": "multiple_choice", "options": ["clapped", "claped", "clapt"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["clapped", "claped", "clapt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["clapped", "claped", "clapt"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de grab en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von grab.", "s": {"type": "multiple_choice", "options": ["grabbed", "grabed", "grabt"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["grabbed", "grabed", "grabt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["grabbed", "grabed", "grabt"], "answer": 0}}'::jsonb,
        '{"p": "Stopped es la forma correcta de stop.", "p_de": "Stopped ist die richtige Form von stop.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Planed es la forma correcta de plan.", "p_de": "Planed ist die richtige Form von plan.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "En estos verbos cortos se dobla la consonante final.", "p_de": "Bei diesen kurzen Verben wird der letzte Konsonant verdoppelt.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dropped es una forma correcta.", "p_de": "Dropped ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Shoped es la forma correcta de shop.", "p_de": "Shoped ist die richtige Form von shop.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Grabbed es una forma correcta.", "p_de": "Grabbed ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Chatted es una forma correcta.", "p_de": "Chatted ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["The", "car", "stopped", "suddenly."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["We", "planned", "the", "trip."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["She", "dropped", "the", "bag."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["They", "shopped", "in", "town."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["He", "chatted", "with", "the", "doctor."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["The", "crowd", "clapped", "loudly."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["She", "grabbed", "her", "coat."], "correct_order": [0, 1, 2, 3]}}'::jsonb
    ];
    v_rule4_exercises JSONB[] := ARRAY[
        '{"p": "Escribe el pasado de study.", "p_de": "Schreibe die Vergangenheitsform von study.", "s": {"type": "typing", "correct_answers": ["studied"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de carry.", "p_de": "Schreibe die Vergangenheitsform von carry.", "s": {"type": "typing", "correct_answers": ["carried"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de try.", "p_de": "Schreibe die Vergangenheitsform von try.", "s": {"type": "typing", "correct_answers": ["tried"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de cry.", "p_de": "Schreibe die Vergangenheitsform von cry.", "s": {"type": "typing", "correct_answers": ["cried"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de copy.", "p_de": "Schreibe die Vergangenheitsform von copy.", "s": {"type": "typing", "correct_answers": ["copied"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de worry.", "p_de": "Schreibe die Vergangenheitsform von worry.", "s": {"type": "typing", "correct_answers": ["worried"], "case_sensitive": false}}'::jsonb,
        '{"p": "Escribe el pasado de hurry.", "p_de": "Schreibe die Vergangenheitsform von hurry.", "s": {"type": "typing", "correct_answers": ["hurried"], "case_sensitive": false}}'::jsonb,
        '{"p": "Elige la forma correcta de study en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von study.", "s": {"type": "multiple_choice", "options": ["studied", "studyed", "studyd"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["studied", "studyed", "studyd"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["studied", "studyed", "studyd"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de carry en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von carry.", "s": {"type": "multiple_choice", "options": ["carried", "carryed", "carryd"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["carried", "carryed", "carryd"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["carried", "carryed", "carryd"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de try en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von try.", "s": {"type": "multiple_choice", "options": ["tried", "tryed", "trid"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["tried", "tryed", "trid"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["tried", "tryed", "trid"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de cry en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von cry.", "s": {"type": "multiple_choice", "options": ["cried", "cryed", "cryd"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["cried", "cryed", "cryd"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["cried", "cryed", "cryd"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de copy en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von copy.", "s": {"type": "multiple_choice", "options": ["copied", "copyed", "copyd"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["copied", "copyed", "copyd"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["copied", "copyed", "copyd"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de worry en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von worry.", "s": {"type": "multiple_choice", "options": ["worried", "worryed", "worryd"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["worried", "worryed", "worryd"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["worried", "worryed", "worryd"], "answer": 0}}'::jsonb,
        '{"p": "Elige la forma correcta de hurry en pasado.", "p_de": "Wähle die richtige Vergangenheitsform von hurry.", "s": {"type": "multiple_choice", "options": ["hurried", "hurryed", "hurryd"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["hurried", "hurryed", "hurryd"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["hurried", "hurryed", "hurryd"], "answer": 0}}'::jsonb,
        '{"p": "Study → studied sigue la regla correcta.", "p_de": "Study → studied folgt der richtigen Regel.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Carry → carryed es correcto.", "p_de": "Carry → carryed ist korrekt.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Con consonante + y cambiamos y por i.", "p_de": "Bei Konsonant + y ändern wir y zu i.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tried es una forma correcta.", "p_de": "Tried ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Copyed es la forma correcta de copy.", "p_de": "Copyed ist die richtige Form von copy.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Worried es una forma correcta.", "p_de": "Worried ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hurried es una forma correcta.", "p_de": "Hurried ist eine korrekte Form.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["She", "studied", "all", "night."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["He", "carried", "the", "bag."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["We", "tried", "again", "yesterday."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["The", "baby", "cried", "at", "night."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["She", "copied", "the", "address."], "correct_order": [0, 1, 2, 3]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["They", "worried", "about", "the", "test."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb,
        '{"p": "Ordena la frase en pasado.", "p_de": "Ordne den Satz in der Vergangenheit.", "s": {"type": "scramble", "chunks": ["He", "hurried", "to", "the", "station."], "correct_order": [0, 1, 2, 3, 4]}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE grammar_rule_uuid IN (
        SELECT gr.uuid FROM grammar_rule gr
        JOIN grammar g ON gr.grammar_uuid = g.uuid
        WHERE g.step_order = 2870 AND g.path_uuid = v_path_id
    );
    DELETE FROM grammar WHERE step_order = 2870 AND path_uuid = v_path_id;

    INSERT INTO grammar (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 2870, 'en', 'grammar')
    RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Formación -ED', '', to_jsonb($content_es$
## Formación del pasado regular con -ed

Para muchos verbos regulares en inglés, el pasado se forma con **-ed**. Esta terminación cambia un poco según la última letra del verbo.

| Regla | Cambio | Ejemplo |
| :-- | :-- | :-- |
| 1 | verbo + **-ed** | walk → walked |
| 2 | si termina en **-e**, añade **-d** | like → liked |
| 3 | consonante + vocal + consonante final | stop → stopped |
| 4 | consonante + **y** final | study → studied |

### 1. Verbos regulares: añadir -ed
La mayoría de los verbos regulares simplemente añaden **-ed**.

- walk → walked
- play → played
- visit → visited

### 2. Verbos terminados en -e
Si el verbo ya termina en **-e**, solo añadimos **-d**.

- like → liked
- move → moved
- live → lived

### 3. Consonante + vocal + consonante final
En verbos cortos como **stop** o **plan**, doblamos la consonante final antes de **-ed**.

- stop → stopped
- plan → planned
- drop → dropped

### 4. Verbos terminados en consonante + y
Si el verbo termina en consonante + **y**, cambiamos **y** por **i** y añadimos **-ed**.

- study → studied
- carry → carried
- try → tried

### Idea clave
Mira siempre la última letra del verbo antes de añadir la terminación del pasado.
$content_es$::text)),
        (v_grammar_id, 'de', '-ED-Bildung', '', to_jsonb($content_de$
## Bildung der regelmäßigen Vergangenheit mit -ed

Bei vielen regelmäßigen englischen Verben bildet man die Vergangenheit mit **-ed**. Diese Endung verändert sich leicht je nach letztem Buchstaben des Verbs.

| Regel | Änderung | Beispiel |
| :-- | :-- | :-- |
| 1 | Verb + **-ed** | walk → walked |
| 2 | endet das Verb auf **-e**, kommt nur **-d** dazu | like → liked |
| 3 | Endung Konsonant + Vokal + Konsonant | stop → stopped |
| 4 | Endung Konsonant + **y** | study → studied |

### 1. Regelmäßige Verben: -ed anhängen
Die meisten regelmäßigen Verben bekommen einfach **-ed**.

- walk → walked
- play → played
- visit → visited

### 2. Verben auf -e
Wenn das Verb schon auf **-e** endet, fügt man nur **-d** hinzu.

- like → liked
- move → moved
- live → lived

### 3. Konsonant + Vokal + Konsonant am Ende
Bei kurzen Verben wie **stop** oder **plan** verdoppeln wir den letzten Konsonanten vor **-ed**.

- stop → stopped
- plan → planned
- drop → dropped

### 4. Verben auf Konsonant + y
Wenn das Verb auf Konsonant + **y** endet, wird **y** zu **i** und dann kommt **-ed**.

- study → studied
- carry → carried
- try → tried

### Grundidee
Schau immer auf den letzten Buchstaben des Verbs, bevor du die Vergangenheitsendung hinzufügst.
$content_de$::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) VALUES
        (v_rule1_id, 'es', 'Verbos regulares: añadir -ed', 'La mayoría de los verbos regulares añaden -ed: walk → walked, play → played, visit → visited.'),
        (v_rule1_id, 'de', 'Regelmäßige Verben: -ed anhängen', 'Die meisten regelmäßigen Verben bekommen -ed: walk → walked, play → played, visit → visited.');

    FOREACH ex IN ARRAY v_rule1_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_rule1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) VALUES
        (v_rule2_id, 'es', 'Verbos terminados en -e: añadir -d', 'Si el verbo termina en -e, solo añade -d: like → liked, move → moved, live → lived.'),
        (v_rule2_id, 'de', 'Verben auf -e: nur -d hinzufügen', 'Wenn das Verb auf -e endet, kommt nur -d dazu: like → liked, move → moved, live → lived.');

    FOREACH ex IN ARRAY v_rule2_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_rule2_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) VALUES
        (v_rule3_id, 'es', 'Consonante + vocal + consonante: doblar consonante', 'En verbos cortos como stop o plan, dobla la consonante final antes de -ed: stopped, planned.'),
        (v_rule3_id, 'de', 'Konsonant + Vokal + Konsonant: Konsonant verdoppeln', 'Bei kurzen Verben wie stop oder plan wird der letzte Konsonant vor -ed verdoppelt: stopped, planned.');

    FOREACH ex IN ARRAY v_rule3_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_rule3_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) VALUES
        (v_rule4_id, 'es', 'Consonante + y: cambiar a i + ed', 'Si el verbo termina en consonante + y, cambia y por i y añade -ed: study → studied, carry → carried.'),
        (v_rule4_id, 'de', 'Konsonant + y: zu i + ed ändern', 'Wenn das Verb auf Konsonant + y endet, wird y zu i und dann kommt -ed: study → studied, carry → carried.');

    FOREACH ex IN ARRAY v_rule4_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_rule4_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
