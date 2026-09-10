-- ============================================================
-- Seed: A0 English Path – STEP 480 – Dialogue – understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    ex JSONB;
    v_order SMALLINT := 1;

    v_lines JSONB[] := ARRAY[
        '{"c": "Landlord", "t": "Hello. This room is available from the fifteenth of September.", "es": "Hola. Esta habitación está disponible desde el quince de septiembre.", "pron": "/he-lóu. dis rum is a-véi-la-bel from de fif-tínz ov sep-tém-ber./", "de": "Hallo. Dieses Zimmer ist ab dem fünfzehnten September frei.", "pron_de": "/HA-lou. DII-zös TSI-mö ist ap dém FÜNF-tseen-tön sep-TEM-bö FRAI./"}'::jsonb,
        '{"c": "Tenant", "t": "How much is it per month?", "es": "¿Cuánto cuesta al mes?", "pron": "/háu mach is it per manz?/", "de": "Wie viel kostet es pro Monat?", "pron_de": "/WII fiil KOS-töt es PRO MO-nat?/"}'::jsonb,
        '{"c": "Landlord", "t": "It is 480 euros per month, and the deposit is 150 euros.", "es": "Cuesta 480 euros al mes y el depósito es de 150 euros.", "pron": "/it is for-éi-ti iú-rous per manz, and de di-pó-sit is uán-fif-ti iú-rous./", "de": "Es kostet 480 Euro pro Monat, und die Kaution beträgt 150 Euro.", "pron_de": "/es KOS-töt fiir-HUNT-ört-axt-tsig OI-ro PRO MO-nat, unt dii KAU-tsion bö-TREKT hUN-döt-fUnf-tsig OI-ro./"}'::jsonb,
        '{"c": "Tenant", "t": "Are the bills included?", "es": "¿Están incluidos los gastos?", "pron": "/ar de bils in-klú-ded?/", "de": "Sind die Nebenkosten inbegriffen?", "pron_de": "/ZINT dii NEE-bön-kos-tön IN-bö-gri-fön?/"}'::jsonb,
        '{"c": "Landlord", "t": "Gas and internet are included, but water is separate.", "es": "El gas e internet están incluidos, pero el agua va aparte.", "pron": "/gas and ín-ter-net ar in-klú-ded, bat uó-ter is sé-pa-ret./", "de": "Gas und Internet sind inklusive, aber Wasser extra.", "pron_de": "/GAS unt IN-tö-net ZINT in-klu-ZII-vö, AH-bö WA-sö EKS-tra./"}'::jsonb,
        '{"c": "Tenant", "t": "Is the room furnished?", "es": "¿La habitación está amueblada?", "pron": "/is de rum fér-nisht?/", "de": "Ist das Zimmer möbliert?", "pron_de": "/ist däs TSI-mö möb-LIIT?/"}'::jsonb,
        '{"c": "Landlord", "t": "Yes. It has a bed, a desk, and a wardrobe. The kitchen and living room are shared.", "es": "Sí. Tiene cama, escritorio y armario. La cocina y el salón son compartidos.", "pron": "/ies. it has a bed, a desk, and a uór-droub. de kí-chen and lí-ving rum ar shérd./", "de": "Ja. Es hat ein Bett, einen Schreibtisch und einen Kleiderschrank. Küche und Wohnzimmer werden geteilt.", "pron_de": "/YAA. es hat ain BET, AI-nön SHRAIB-tish unt AI-nön KLAI-dö-shrank. KÜ-xö unt WOON-tsi-mö WER-dön gö-TAILT./"}'::jsonb,
        '{"c": "Tenant", "t": "Are there any house rules?", "es": "¿Hay normas de la casa?", "pron": "/ar der é-ni háus ruls?/", "de": "Gibt es Hausregeln?", "pron_de": "/GIBT es HAUS-ree-göln?/"}'::jsonb,
        '{"c": "Landlord", "t": "Yes. No overnight guests, and please clean the shared kitchen every evening.", "es": "Sí. No se permiten invitados para dormir y por favor limpia la cocina compartida cada tarde.", "pron": "/ies. nou óu-ver-náit guésts, and plis klin de shérd kí-chen é-vri ív-ning./", "de": "Ja. Keine Übernachtungsgäste, und bitte die Gemeinschaftsküche jeden Abend sauber halten.", "pron_de": "/YAA. KAI-nö ÜÜ-bö-nax-tungs-gés-tö, unt BI-tö dii gö-MAIN-shafts-kü-xö JEE-dön AH-bönt ZAU-bö HAL-tön./"}'::jsonb,
        '{"c": "Tenant", "t": "When can I move in?", "es": "¿Cuándo puedo mudarme?", "pron": "/uén kan ái muv in?/", "de": "Wann kann ich einziehen?", "pron_de": "/WAN kän ai AIN-tsii-ön?/"}'::jsonb,
        '{"c": "Landlord", "t": "You can move in on the fifteenth. You need to pay the first month and the deposit.", "es": "Puede mudarse el día quince. Necesita pagar el primer mes y el depósito.", "pron": "/iu kan muv in on de fif-tínz. iu nid tu péi de ferst manz and de di-pó-sit./", "de": "Sie können am fünfzehnten einziehen. Sie müssen den ersten Monat und die Kaution bezahlen.", "pron_de": "/ZII KÖ-nön am FÜNF-tseen-tön AIN-tsii-ön. ZII MÜ-sön dén ERS-tön MO-nat unt dii KAU-tsion bö-TSAA-lön./"}'::jsonb,
        '{"c": "Tenant", "t": "Thank you. I will think about it and contact you soon.", "es": "Gracias. Lo pensaré y me pondré en contacto pronto.", "pron": "/zánk iu. ái uil zink a-báut it and kón-takt iu sun./", "de": "Danke. Ich werde darüber nachdenken und mich bald melden.", "pron_de": "/DÄN-kö. ai WER-dö da-RÜÜ-bö NAX-denk-ön unt mix BALT MEL-dön./"}'::jsonb
    ];

BEGIN

SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM dialogue WHERE step_order = 480 AND path_uuid = v_path_id;

INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
VALUES (
    v_path_id,
    480,
    'en',
    'dialogue',
    'accommodation',
    '[
      {"name": "Tenant",   "gender": "female", "avatarURL": "https://example.com/avatars/tenant.png"},
      {"name": "Landlord", "gender": "male",   "avatarURL": "https://example.com/avatars/landlord.png"}
    ]'::jsonb
) RETURNING uuid INTO v_dialogue_id;

INSERT INTO dialogue_translation (dialogue_uuid, language, title)
VALUES (v_dialogue_id, 'es', 'Visita a una habitación amueblada');

INSERT INTO dialogue_translation (dialogue_uuid, language, title)
VALUES (v_dialogue_id, 'de', 'Besichtigung eines möblierten Zimmers');

FOREACH ex IN ARRAY v_lines
LOOP
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_order, ex->>'c', ex->>'t')
    RETURNING uuid INTO v_line_id;

    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (
        v_line_id,
        'es',
        jsonb_build_object(
            'translation',   ex->>'es',
            'pronunciation', ex->>'pron'
        )
    );

    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (
        v_line_id,
        'de',
        jsonb_build_object(
            'translation',   ex->>'de',
            'pronunciation', ex->>'pron_de'
        )
    );

    v_order := v_order + 1;
END LOOP;

END;
$seed$;
