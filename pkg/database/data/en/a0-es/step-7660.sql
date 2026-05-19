-- ============================================================
-- Seed: A0 English Path – STEP 7660 – Listening – follow complex discussion (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El equipo necesita un plan final para un taller con socios el mes que viene.", "de": "Das Team braucht einen Endplan für einen Workshop mit Partnern im nächsten Monat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La oficina de la ciudad es más barata, pero su internet fue débil la última vez.", "de": "Das Stadtbüro ist billiger, aber das Internet war dort letztes Mal schwach.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Seis socios participarán en persona en vez de en línea.", "de": "Sechs Partner nehmen vor Ort statt online teil.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La sala del hotel incluye equipo de grabación y soporte técnico.", "de": "Der Hotelraum enthält Aufnahmegerät und technischen Support.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Pueden seguir dentro del presupuesto si reducen los paquetes impresos.", "de": "Sie können im Budget bleiben, wenn sie die gedruckten Unterlagen reduzieren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Karin dice que el hotel está más cerca de la estación.", "de": "Karin sagt, das Hotel liege näher am Bahnhof.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La oficina de la ciudad solo está libre por la tarde.", "de": "Das Stadtbüro ist nur am Nachmittag frei.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Al final deciden reservar el hotel y enviar los materiales en línea.", "de": "Am Ende entscheiden sie sich für das Hotel und dafür, die Materialien online zu verschicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué deben decidir?", "de": "Was müssen sie entscheiden?", "s_es": {"type": "multiple_choice", "options": ["The final plan for a partner workshop", "The office holiday schedule", "A new company logo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Endplan für einen Partner Workshop", "Den Urlaubsplan im Büro", "Ein neues Firmenlogo"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué problema tiene la oficina de la ciudad?", "de": "Welches Problem hat das Stadtbüro?", "s_es": {"type": "multiple_choice", "options": ["Weak internet", "No chairs", "High price"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Schwaches Internet", "Keine Stühle", "Hoher Preis"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos socios se unirán en línea?", "de": "Wie viele Partner nehmen online teil?", "s_es": {"type": "multiple_choice", "options": ["Six", "Two", "Ten"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sechs", "Zwei", "Zehn"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ventaja ofrece la sala del hotel?", "de": "Welchen Vorteil bietet der Hotelraum?", "s_es": {"type": "multiple_choice", "options": ["Recording equipment and technical support", "Free lunch for all guests", "A smaller screen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Aufnahmetechnik und technischer Support", "Kostenloses Mittagessen für alle Gäste", "Einen kleineren Bildschirm"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo pueden mantenerse dentro del presupuesto?", "de": "Wie können sie im Budget bleiben?", "s_es": {"type": "multiple_choice", "options": ["Reduce printed packs and send the agenda by email", "Cancel all online access", "Move the workshop outside"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Gedruckte Unterlagen reduzieren und die Agenda per Mail senden", "Den Online Zugang ganz streichen", "Den Workshop nach draußen verlegen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué problema ve Karin con el hotel?", "de": "Welches Problem sieht Karin beim Hotel?", "s_es": {"type": "multiple_choice", "options": ["It is farther from the train station", "It has no technical support", "It is only free in the afternoon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Es liegt weiter vom Bahnhof entfernt", "Es hat keinen technischen Support", "Es ist nur am Nachmittag frei"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué horario es difícil para los socios de Brasil?", "de": "Welche Uhrzeit ist für die Partner in Brasilien schwierig?", "s_es": {"type": "multiple_choice", "options": ["An afternoon slot", "An early morning slot", "A Friday evening slot"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Termin am Nachmittag", "Ein früher Morgentermin", "Ein Freitagabend Termin"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la decisión final?", "de": "Was ist die Endentscheidung?", "s_es": {"type": "multiple_choice", "options": ["Book the hotel and move the materials online", "Use the city office and print more packs", "Delay the workshop for a year"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Hotel buchen und die Materialien online stellen", "Das Stadtbüro nutzen und mehr Unterlagen drucken", "Den Workshop um ein Jahr verschieben"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7660 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7660 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7660, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Maya, Joel, and Karin in a planning meeting for a partner workshop
## "Choosing the Right Venue"

## THE SCENE: A longer work discussion with several factors to balance before a final decision
The team compares two venues for a partner workshop.
They talk about cost, technology, travel, online access, and schedule before they agree on one plan.

### DIRECTOR'S NOTES
Style:
* More layered meeting discussion with several trade offs and practical constraints.
* Each speaker adds a new factor, so learners follow a richer decision making process.

Pace: Medium, with clear pauses between each new consideration.

Accent: Neutral professional accents.

### SAMPLE CONTEXT
Learners hear a complex workplace discussion with three speakers.
The audio practises comparison, budget thinking, logistics, and a final group decision.

#### TRANSCRIPT
[opening] Maya: We need a final plan for the partner workshop next month.
[practical] Joel: The city office is cheaper, but the internet there was weak last time.
[concerned] Karin: That matters because six partners will join online.
[analytical] Maya: The hotel room costs more, yet it includes recording equipment and technical support.
[checking] Joel: If we choose the hotel, can we still stay inside the travel budget?
[clear] Maya: Yes, if we reduce printed packs and send the agenda by email.
[hesitant] Karin: I like that, but the hotel is farther from the train station.
[balancing] Joel: True, although the hotel can arrange a shuttle every thirty minutes.
[detail] Maya: Another issue is timing. The city office is free only in the afternoon, while the hotel is free all day.
[reasoning] Karin: An afternoon slot is hard for the online partners in Brazil.
[deciding] Joel: Then the hotel seems stronger on technology and schedule.
[closing] Maya: Agreed. Let us book the hotel and move the materials online.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha una discusión compleja de planificación', 'Escucha a tres personas comparar coste, tecnología, viaje y horario antes de decidir.'),
        (v_listening_id, 'de', 'Höre eine komplexe Planungsdiskussion', 'Höre drei Personen, die Kosten, Technik, Anreise und Zeitplan vergleichen, bevor sie entscheiden.');

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
