-- ============================================================
-- Seed: A0 English Path – STEP 4230 – Listening – listen to a departmental briefing (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La reunión es del departamento de operaciones.", "p_de": "Das Meeting ist vom Betriebsabteilung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El equipo ha completado el 80% de los contratos del trimestre.", "p_de": "Das Team hat 80% der Verträge des Quartals abgeschlossen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El nuevo objetivo del trimestre es conseguir 5 contratos nuevos.", "p_de": "Das neue Quartalsziel ist, 5 neue Verträge zu gewinnen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La jefa de departamento pide al equipo que complete los informes antes del viernes.", "p_de": "Die Abteilungsleiterin bittet das Team, die Berichte bis Freitag fertigzustellen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El sistema de gestión nuevo ya está instalado.", "p_de": "Das neue Verwaltungssystem ist bereits installiert.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Habrá una sesión de formación el próximo lunes.", "p_de": "Es wird am nächsten Montag eine Schulungssitzung geben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La jefa de departamento felicita al equipo por los resultados.", "p_de": "Die Abteilungsleiterin lobt das Team für seine Ergebnisse.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El presupuesto del departamento se ha reducido este trimestre.", "p_de": "Das Budget der Abteilung wurde dieses Quartal gekürzt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿De qué departamento es la reunión?", "p_de": "Zu welcher Abteilung gehört das Meeting?", "s_es": {"type": "multiple_choice", "options": ["Operations", "Sales", "HR"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Betrieb", "Vertrieb", "Personal"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué porcentaje de contratos se ha completado?", "p_de": "Welcher Prozentsatz der Verträge wurde abgeschlossen?", "s_es": {"type": "multiple_choice", "options": ["90%", "80%", "70%"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["90%", "80%", "70%"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos contratos nuevos se buscan este trimestre?", "p_de": "Wie viele neue Verträge werden dieses Quartal angestrebt?", "s_es": {"type": "multiple_choice", "options": ["5 new contracts", "3 new contracts", "10 new contracts"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["5 neue Verträge", "3 neue Verträge", "10 neue Verträge"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo deben estar los informes?", "p_de": "Wann müssen die Berichte fertig sein?", "s_es": {"type": "multiple_choice", "options": ["By Friday", "By Monday", "By Wednesday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis Freitag", "Bis Montag", "Bis Mittwoch"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo estará instalado el nuevo sistema de gestión?", "p_de": "Wann wird das neue Verwaltungssystem installiert sein?", "s_es": {"type": "multiple_choice", "options": ["By end of month", "It is already installed", "Next year"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis Ende des Monats", "Es ist bereits installiert", "Nächstes Jahr"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es la sesión de formación?", "p_de": "Wann ist die Schulungssitzung?", "s_es": {"type": "multiple_choice", "options": ["Next Monday", "This Friday", "Next Wednesday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nächsten Montag", "Diesen Freitag", "Nächsten Mittwoch"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice la jefa sobre los resultados del equipo?", "p_de": "Was sagt die Abteilungsleiterin über die Ergebnisse des Teams?", "s_es": {"type": "multiple_choice", "options": ["She congratulates them", "She is disappointed", "She says nothing"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie lobt das Team", "Sie ist enttäuscht", "Sie sagt nichts"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata esta escucha?", "p_de": "Worum geht es in diesem Hörtext?", "s_es": {"type": "multiple_choice", "options": ["A departmental briefing", "A client complaint call", "A salary negotiation"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Abteilungsmeeting", "Ein Kundenbeschwerdenanruf", "Eine Gehaltsverhandlung"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4230 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 4230 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 4230, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Linda, Head of Operations, running a departmental briefing
## "Operations Department – Quarterly Briefing"

## THE SCENE: A team briefing room; the operations team is seated
Linda reviews quarterly performance, sets new targets, and announces upcoming training.

### DIRECTOR'S NOTES
Style:
* Professional team briefing with clear performance figures and action items.
* Encouraging tone with specific targets and deadlines.

Pace: Moderate; pauses after key numbers.

Accent: Neutral British accent.

#### TRANSCRIPT
[opening] Linda: Good morning, everyone. Thank you for joining today''s briefing.
[results] Linda: This quarter, the team has completed 90% of planned contracts. Well done.
[congratulating] Linda: I want to congratulate everyone on a strong performance.
[targets] Linda: Our target for next quarter is to win 5 new contracts.
[action] Linda: Please make sure all client reports are submitted by this Friday.
[systems] Linda: The new management system will be installed by end of this month.
[training] Linda: There will be a training session next Monday to help everyone use it.
[closing] Linda: Any questions, please come and see me after the briefing. Thank you.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha un briefing de departamento', 'Escucha una reunión de equipo con resultados del trimestre, objetivos, plazos y próximos eventos.'),
            (v_listening_id, 'de', 'Höre ein Abteilungsmeeting', 'Höre ein Teammeeting mit Quartalsergebnissen, Zielen, Fristen und bevorstehenden Ereignissen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
