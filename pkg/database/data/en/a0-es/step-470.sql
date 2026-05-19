-- ============================================================
-- Seed: A0 English Path – STEP 470 – Listening – understand basics of renting a room or flat (Alquileres)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- TRUE / FALSE (8 exercises)
        '{"p":"David es el propietario del piso.","p_de":"David ist der Vermieter der Wohnung.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El alquiler cuesta 650 libras al mes.","p_de":"Die Miete kostet 650 Pfund pro Monat.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El agua está incluida en el precio.","p_de":"Wasser ist im Preis enthalten.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La electricidad y el internet están incluidos.","p_de":"Strom und Internet sind inklusive.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El depósito es de un mes de alquiler.","p_de":"Die Kaution beträgt eine Monatsmiete.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El contrato mínimo es de seis meses.","p_de":"Die Mindestvertragsdauer beträgt sechs Monate.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Se permiten mascotas en el edificio.","p_de":"Haustiere sind im Gebäude erlaubt.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Hay que avisar con un mes si quieres irte.","p_de":"Man muss einen Monat vorher Bescheid geben, wenn man ausziehen will.","s":{"type":"true_false","answer":true}}'::jsonb,

        -- MULTIPLE CHOICE (8 exercises)
        '{"p":"¿Cuánto cuesta el piso al mes?","p_de":"Wie viel kostet die Wohnung pro Monat?","s":{"type":"multiple_choice","options":["650 libras","500 libras","800 libras"],"answer":0}}'::jsonb,
        '{"p":"¿Qué gasto está incluido?","p_de":"Welche Kosten sind enthalten?","s":{"type":"multiple_choice","options":["El agua","La electricidad","El internet"],"answer":0}}'::jsonb,
        '{"p":"¿Qué gastos no están incluidos?","p_de":"Welche Kosten sind nicht enthalten?","s":{"type":"multiple_choice","options":["La electricidad y el internet","Solo el agua","Nada"],"answer":0}}'::jsonb,
        '{"p":"¿Cuánto es el depósito?","p_de":"Wie hoch ist die Kaution?","s":{"type":"multiple_choice","options":["Un mes de alquiler","Dos meses de alquiler","100 libras"],"answer":0}}'::jsonb,
        '{"p":"¿Cuál es la duración mínima del contrato?","p_de":"Wie lang ist die Mindestvertragsdauer?","s":{"type":"multiple_choice","options":["Seis meses","Tres meses","Un año"],"answer":0}}'::jsonb,
        '{"p":"¿Qué dice David sobre las mascotas?","p_de":"Was sagt David über Haustiere?","s":{"type":"multiple_choice","options":["No están permitidas","Solo se permiten gatos","Se permiten animales pequeños"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo empiezan las horas de silencio?","p_de":"Wann beginnt die Ruhezeit?","s":{"type":"multiple_choice","options":["Después de las 10 PM","Después de las 8 PM","A medianoche"],"answer":0}}'::jsonb,
        '{"p":"¿Cuánto aviso debe dar Maria si quiere marcharse?","p_de":"Wie viel Kündigungsfrist muss Maria geben, wenn sie ausziehen will?","s":{"type":"multiple_choice","options":["Un mes","Una semana","Dos meses"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 470 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 470 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 470, 'en', 'listening', 'accommodation', $transcript$
# AUDIO PROFILE: David and Maria, landlord and prospective tenant
## "A Flat Viewing"

## THE SCENE: Inside a small rented flat
David is showing Maria around a tidy one-bedroom flat on a quiet street.
As they move from the living room to the kitchen, he explains the rent,
bills, and house rules, while Maria listens carefully and asks short,
practical questions.

### DIRECTOR'S NOTES
Style:
* Friendly property viewing with simple rental vocabulary.
* Keep prices, rules, and contract terms especially clear for beginners.

Pace: Steady and informative, like a careful explanation during a visit.

Accent: Neutral accent.

### SAMPLE CONTEXT
This listening is useful for understanding basic rental terms during a
first visit to a room or flat.

#### TRANSCRIPT
David [welcomingly] Hi Maria. Thanks for coming. This is the flat I told you about.
Maria [pleasantly] Thanks, David. It looks bright.
David [clearly] The rent is £650 a month.
Maria [checking] Does that include the bills?
David [explaining] Water is included, but electricity and internet are not.
Maria [thoughtfully] Okay. And how much is the deposit?
David [matter-of-factly] The deposit is one month's rent.
Maria [curious] What is the minimum contract?
David [clearly] The minimum contract is six months.
Maria [asking] Are pets allowed?
David [firm but polite] No, sorry. Pets are not allowed in the building.
Maria [continuing] Are there any house rules?
David [helpfully] Yes. Quiet hours start after 10 PM, and if you want to leave, you need to give one month's notice.
Maria [warmly] That all sounds very clear. Thank you.
    $transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Visita a un piso en alquiler', '');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Besichtigung einer Mietwohnung', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
