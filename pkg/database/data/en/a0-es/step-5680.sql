-- ============================================================
-- Seed: A0 English Path – STEP 5680 – Reading – assess the relevance of most textbooks and articles within own subject area (Textos, Ensayos e Investigación)
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
        '{"p": "La fecha de publicación puede mostrar si la evidencia es suficientemente actual.", "p_de": "Das Veröffentlichungsdatum kann zeigen, ob die Belege aktuell genug sind.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En áreas que cambian rápido, una fuente reciente puede ser más útil.", "p_de": "In sich schnell verändernden Bereichen kann eine aktuelle Quelle nützlicher sein.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La fecha por sí sola decide toda la relevancia de una fuente.", "p_de": "Das Datum allein entscheidet vollständig über die Relevanz einer Quelle.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las credenciales del autor y la reputación de la revista ayudan a valorar la fiabilidad.", "p_de": "Die Qualifikation des Autors und der Ruf der Zeitschrift helfen bei der Bewertung der Verlässlichkeit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una revista especializada suele aportar más apoyo que una página desconocida.", "p_de": "Eine Fachzeitschrift bietet meist mehr Unterstützung als eine unbekannte Webseite.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una fuente de gran calidad siempre es relevante para cualquier pregunta.", "p_de": "Eine sehr hochwertige Quelle ist immer für jede Frage relevant.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que comprobar si el texto estudia las mismas variables, población o caso.", "p_de": "Man sollte prüfen, ob der Text dieselben Variablen, dieselbe Population oder denselben Fall untersucht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto presenta varios criterios para valorar relevancia en una disciplina.", "p_de": "Der Text nennt mehrere Kriterien, um Relevanz im eigenen Fach einzuschätzen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        -- 8 multiple_choice exercises (answer ALWAYS 0)
        '{"p": "¿Con qué criterio empieza el texto?", "p_de": "Mit welchem Kriterium beginnt der Text?", "s": {"type": "multiple_choice", "options": ["Publication date", "Room number", "Printing cost"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede indicar una fecha reciente?", "p_de": "Was kann ein aktuelles Datum anzeigen?", "s": {"type": "multiple_choice", "options": ["That the evidence is current enough", "That the article is shorter", "That the author is younger"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué datos del autor y de la publicación se recomiendan revisar?", "p_de": "Welche Angaben zu Autor und Veröffentlichung sollte man prüfen?", "s": {"type": "multiple_choice", "options": ["Credentials, affiliation, and journal reputation", "Favorite color and phone number", "Office key and parking card"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué suele aportar una revista especializada?", "p_de": "Was bietet eine Fachzeitschrift normalerweise?", "s": {"type": "multiple_choice", "options": ["Stronger support", "Less research detail", "Automatic free access"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe coincidir con tu pregunta de investigación?", "p_de": "Was sollte mit deiner Forschungsfrage übereinstimmen?", "s": {"type": "multiple_choice", "options": ["Variables, population, or case", "Shoes, bags, or desks", "Accent, speed, or volume"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema puede tener una fuente de calidad?", "p_de": "Welches Problem kann eine hochwertige Quelle haben?", "s": {"type": "multiple_choice", "options": ["It may still be irrelevant", "It loses its author", "It becomes a textbook"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué muestra la reputación de la revista?", "p_de": "Was zeigt der Ruf der Zeitschrift?", "s": {"type": "multiple_choice", "options": ["How trustworthy the material may be", "How long the abstract is", "How many buses stop nearby"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve el proceso descrito?", "p_de": "Wofür dient der beschriebene Prozess?", "s": {"type": "multiple_choice", "options": ["To assess source relevance in your subject area", "To book conference travel", "To translate concrete words only"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5680 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5680 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5680, 'en', 'reading', 'academic', 'To judge relevance in your subject area, start with publication date. In fast moving fields, a recent source can be more useful than an old overview. Date does not decide everything, but it can show whether the evidence is current enough for your topic.

Then check who wrote the source and where it was published. Author credentials, institutional affiliation, and journal reputation can indicate how trustworthy the material is. A specialist journal usually gives stronger support than an unknown website or a magazine article.

Finally, compare the source with your research question. Ask whether the text studies the same variables, population, or case that you need. A source can be high quality and still be irrelevant if it does not answer your question.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Evaluar la relevancia de libros y artículos', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Die Relevanz von Lehrbüchern und Artikeln einschätzen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
