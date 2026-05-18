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
        '{"v":"first name","es":"nombre (de pila)","de":"Vorname","ex":"My first name is Carlos.","pron":"/ferst néim/","pron_de":"/FÖÖST NEJM/"}',
        '{"v":"middle name","es":"segundo nombre","de":"zweiter Vorname","ex":"Her middle name is Anne.","pron":"/mí-del néim/","pron_de":"/MI-döl NEJM/"}',
        '{"v":"last name","es":"apellido","de":"Nachname / Familienname","ex":"His last name is Johnson.","pron":"/last néim/","pron_de":"/LAAST NEJM/"}',
        '{"v":"full name","es":"nombre completo","de":"vollständiger Name","ex":"Please write your full name on the form.","pron":"/ful néim/","pron_de":"/FUL NEJM/"}',
        '{"v":"age","es":"edad","de":"Alter","ex":"What is your age? I am 34 years old.","pron":"/éich/","pron_de":"/EJDSCH/"}',
        '{"v":"date of birth (DOB)","es":"fecha de nacimiento","de":"Geburtsdatum","ex":"Please enter your date of birth: 15/03/1990.","pron":"/déit of berz/","pron_de":"/DEJT ow BÖRS/"}',
        '{"v":"place of birth","es":"lugar de nacimiento","de":"Geburtsort","ex":"Her place of birth is Buenos Aires, Argentina.","pron":"/pléis of berz/","pron_de":"/PLEJS ow BÖRS/"}',
        '{"v":"nationality","es":"nacionalidad","de":"Nationalität / Staatsangehörigkeit","ex":"His nationality is Mexican.","pron":"/na-sho-ná-li-ti/","pron_de":"/näsch-ö-NÄ-li-tie/"}',
        '{"v":"Social Security Number (SSN)","es":"número de seguro social","de":"Sozialversicherungsnummer","ex":"You need your Social Security Number to apply for the benefit.","pron":"/sóu-shal si-kiú-ri-ti nám-ber/","pron_de":"/SOU-schöl si-KJUU-ri-tie NAM-bö/"}',
        '{"v":"address","es":"dirección","de":"Adresse / Anschrift","ex":"What is your current address?","pron":"/a-drés/","pron_de":"/Ä-dres/"}',
        '{"v":"apartment number (apt)","es":"número de apartamento","de":"Wohnungsnummer","ex":"My address is 42 Oak Street, apartment number 3B.","pron":"/a-párt-ment nám-ber/","pron_de":"/ö-PAART-mönt NAM-bö/"}',
        '{"v":"city","es":"ciudad","de":"Stadt","ex":"Which city do you live in?","pron":"/sí-ti/","pron_de":"/SI-tie/"}',
        '{"v":"state","es":"estado","de":"Bundesstaat / Bundesland","ex":"She lives in the state of California.","pron":"/stéit/","pron_de":"/STEJT/"}',
        '{"v":"zip code","es":"código postal","de":"Postleitzahl","ex":"The zip code for downtown Chicago is 60601.","pron":"/sip kóud/","pron_de":"/SIP KOUD/"}',
        '{"v":"country","es":"país","de":"Land","ex":"Which country were you born in?","pron":"/kán-tri/","pron_de":"/KAN-trie/"}',
        '{"v":"phone number","es":"número de teléfono","de":"Telefonnummer","ex":"Can I have your phone number, please?","pron":"/fóun nám-ber/","pron_de":"/FOUN NAM-bö/"}',
        '{"v":"cell phone","es":"teléfono celular","de":"Mobiltelefon / Handy","ex":"I left my cell phone on the bus.","pron":"/sel fóun/","pron_de":"/SEL FOUN/"}',
        '{"v":"email address","es":"dirección de correo electrónico","de":"E-Mail-Adresse","ex":"Please enter your email address to create an account.","pron":"/í-meil a-drés/","pron_de":"/IE-mejl Ä-dres/"}',
        '{"v":"marital status","es":"estado civil","de":"Familienstand","ex":"What is your marital status: single, married or divorced?","pron":"/má-ri-tal stá-tus/","pron_de":"/MÄ-ri-töl STEJ-töss/"}',
        '{"v":"single","es":"soltero/a","de":"ledig","ex":"She has been single for two years now.","pron":"/sín-gel/","pron_de":"/SING-göl/"}',
        '{"v":"married","es":"casado/a","de":"verheiratet","ex":"They have been married for over twenty years.","pron":"/má-rid/","pron_de":"/MÄ-ried/"}',
        '{"v":"divorced","es":"divorciado/a","de":"geschieden","ex":"He got divorced last year and moved to a new city.","pron":"/di-vórst/","pron_de":"/di-WOORST/"}',
        '{"v":"widowed","es":"viudo/a","de":"verwitwet","ex":"She has been widowed for five years.","pron":"/uí-doud/","pron_de":"/WI-doud/"}',
        '{"v":"occupation / job","es":"ocupación / empleo","de":"Beruf / Beschäftigung","ex":"What is your occupation? I work as a nurse.","pron":"/o-kiu-péi-shon / yob/","pron_de":"/ok-ju-PEJ-schön/"}',
        '{"v":"gender","es":"género","de":"Geschlecht","ex":"Please select your gender: male, female or non-binary.","pron":"/yén-der/","pron_de":"/DSCHEN-dö/"}',
        '{"v":"male","es":"hombre / masculino","de":"männlich","ex":"The form asks whether the patient is male or female.","pron":"/méil/","pron_de":"/MEJL/"}',
        '{"v":"female","es":"mujer / femenino","de":"weiblich","ex":"The majority of nurses at that hospital are female.","pron":"/fí-meil/","pron_de":"/FIE-mejl/"}',
        '{"v":"ID card (Identity card)","es":"carné de identidad / DNI","de":"Personalausweis","ex":"You need a valid ID card to open a bank account.","pron":"/ái-dí kard/","pron_de":"/AI-die KAARD/"}',
        '{"v":"passport","es":"pasaporte","de":"Reisepass","ex":"Do you have your passport with you?","pron":"/pás-port/","pron_de":"/PAAS-poot/"}',
        '{"v":"driver''s license","es":"licencia de conducir","de":"Führerschein","ex":"She showed her driver''s license at the border.","pron":"/drái-vers lái-sens/","pron_de":"/DRAI-wörs LAI-sönss/"}',
        '{"v":"signature","es":"firma","de":"Unterschrift","ex":"Please add your signature at the bottom of the form.","pron":"/síg-na-cher/","pron_de":"/SIG-nö-tschö/"}'
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
INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (v_deck_id, 'de', 'Persönliche Informationen', '');

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

    -- Insertar la traducción al alemán y su pronunciación en JSONB y texto
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_root_id, 'de', jsonb_build_object('translation', v_item->>'de'), v_item->>'pron_de');

    -- Vincular la palabra creada al mazo actual
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

END LOOP;
END;
$seed$;
