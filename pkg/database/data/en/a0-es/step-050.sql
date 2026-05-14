-- ============================================================
-- Seed: A0 English Path – STEP 50 – Deck – El Individuo I (Información Personal)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_deck_id UUID; 
    v_root_id UUID; 
    v_item JSONB;
    v_personal_info JSONB[] := ARRAY[
        '{"v":"first name","es":"nombre (de pila)","ex":"My first name is Carlos.","pron":"/ferst néim/"}',
        '{"v":"middle name","es":"segundo nombre","ex":"Her middle name is Anne.","pron":"/mí-del néim/"}',
        '{"v":"last name","es":"apellido","ex":"His last name is Johnson.","pron":"/last néim/"}',
        '{"v":"full name","es":"nombre completo","ex":"Please write your full name on the form.","pron":"/ful néim/"}',
        '{"v":"age","es":"edad","ex":"What is your age? I am 34 years old.","pron":"/éich/"}',
        '{"v":"date of birth (DOB)","es":"fecha de nacimiento","ex":"Please enter your date of birth: 15/03/1990.","pron":"/déit of berz/"}',
        '{"v":"place of birth","es":"lugar de nacimiento","ex":"Her place of birth is Buenos Aires, Argentina.","pron":"/pléis of berz/"}',
        '{"v":"nationality","es":"nacionalidad","ex":"His nationality is Mexican.","pron":"/na-sho-ná-li-ti/"}',
        '{"v":"Social Security Number (SSN)","es":"número de seguro social","ex":"You need your Social Security Number to apply for the benefit.","pron":"/sóu-shal si-kiú-ri-ti nám-ber/"}',
        '{"v":"address","es":"dirección","ex":"What is your current address?","pron":"/a-drés/"}',
        '{"v":"apartment number (apt)","es":"número de apartamento","ex":"My address is 42 Oak Street, apartment number 3B.","pron":"/a-párt-ment nám-ber/"}',
        '{"v":"city","es":"ciudad","ex":"Which city do you live in?","pron":"/sí-ti/"}',
        '{"v":"state","es":"estado","ex":"She lives in the state of California.","pron":"/stéit/"}',
        '{"v":"zip code","es":"código postal","ex":"The zip code for downtown Chicago is 60601.","pron":"/sip kóud/"}',
        '{"v":"country","es":"país","ex":"Which country were you born in?","pron":"/kán-tri/"}',
        '{"v":"phone number","es":"número de teléfono","ex":"Can I have your phone number, please?","pron":"/fóun nám-ber/"}',
        '{"v":"cell phone","es":"teléfono celular","ex":"I left my cell phone on the bus.","pron":"/sel fóun/"}',
        '{"v":"email address","es":"dirección de correo electrónico","ex":"Please enter your email address to create an account.","pron":"/í-meil a-drés/"}',
        '{"v":"marital status","es":"estado civil","ex":"What is your marital status: single, married or divorced?","pron":"/má-ri-tal stá-tus/"}',
        '{"v":"single","es":"soltero/a","ex":"She has been single for two years now.","pron":"/sín-gel/"}',
        '{"v":"married","es":"casado/a","ex":"They have been married for over twenty years.","pron":"/má-rid/"}',
        '{"v":"divorced","es":"divorciado/a","ex":"He got divorced last year and moved to a new city.","pron":"/di-vórst/"}',
        '{"v":"widowed","es":"viudo/a","ex":"She has been widowed for five years.","pron":"/uí-doud/"}',
        '{"v":"occupation / job","es":"ocupación / empleo","ex":"What is your occupation? I work as a nurse.","pron":"/o-kiu-péi-shon / yob/"}',
        '{"v":"gender","es":"género","ex":"Please select your gender: male, female or non-binary.","pron":"/yén-der/"}',
        '{"v":"male","es":"hombre / masculino","ex":"The form asks whether the patient is male or female.","pron":"/méil/"}',
        '{"v":"female","es":"mujer / femenino","ex":"The majority of nurses at that hospital are female.","pron":"/fí-meil/"}',
        '{"v":"ID card (Identity card)","es":"carné de identidad / DNI","ex":"You need a valid ID card to open a bank account.","pron":"/ái-dí kard/"}',
        '{"v":"passport","es":"pasaporte","ex":"Do you have your passport with you?","pron":"/pás-port/"}',
        '{"v":"driver''s license","es":"licencia de conducir","ex":"She showed her driver''s license at the border.","pron":"/drái-vers lái-sens/"}',
        '{"v":"signature","es":"firma","ex":"Please add your signature at the bottom of the form.","pron":"/síg-na-cher/"}'
    ];

BEGIN

-- 1. Obtener el path del idioma principal
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Deck en la base de datos
INSERT INTO deck (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 50, 'en', 'deck') 
RETURNING uuid INTO v_deck_id;

-- 3. Insertar Traducción y Metadata del Deck
INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (
    v_deck_id, 
    'es', 
    'Información Personal', 
    ''
);

-- 4. Bucle para insertar todas las palabras del mazo
FOREACH v_item IN ARRAY v_personal_info
LOOP
    -- Insertar el término en la tabla word como palabra raíz
    INSERT INTO word (term, is_root, source_language, example) 
    VALUES (v_item->>'v', TRUE, 'en', v_item->>'ex') 
    RETURNING uuid INTO v_root_id;

    -- Insertar la traducción al español y su pronunciación en JSONB y texto
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (
        v_root_id, 
        'es', 
        jsonb_build_object('translation', v_item->>'es'), 
        v_item->>'pron'
    );

    -- Vincular la palabra creada al mazo actual
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

END LOOP;
END;
$seed$;
