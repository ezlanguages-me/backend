-- ============================================================
-- Seed: A0 English Path – STEP 330 – Deck – Alojamiento y Hoteles
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        -- Tipos de alojamiento
        '{"term":"hotel","meaning":"hotel","de":"Hotel","ex":"We stayed at a hotel near the beach.","pron":"/hou-tél/","pron_de":"/ho-TEL/"}'::jsonb,
        '{"term":"hostel","meaning":"albergue / hostal","de":"Hostel / Jugendherberge","ex":"Backpackers often stay in a hostel to save money.","pron":"/hós-tel/","pron_de":"/HOS-töl/"}'::jsonb,
        '{"term":"motel","meaning":"motel","de":"Motel","ex":"They stopped at a motel along the highway.","pron":"/mou-tél/","pron_de":"/mo-TEL/"}'::jsonb,
        '{"term":"bed and breakfast (B&B)","meaning":"casa de huéspedes / pensión con desayuno","de":"Bed and Breakfast","ex":"We spent the weekend at a lovely bed and breakfast in the countryside.","pron":"/bed and brék-fast/","pron_de":"/BED önd BREK-fööst/"}'::jsonb,
        '{"term":"resort","meaning":"complejo turístico / resort","de":"Resort / Ferienanlage","ex":"The family spent a week at a resort in Cancún.","pron":"/ri-zórt/","pron_de":"/ri-SORT/"}'::jsonb,
        '{"term":"apartment","meaning":"apartamento","de":"Apartment / Wohnung","ex":"They rented an apartment for the summer.","pron":"/a-párt-ment/","pron_de":"/ö-PAART-mönt/"}'::jsonb,
        '{"term":"villa","meaning":"villa / chalet","de":"Villa","ex":"The couple rented a villa with a private pool.","pron":"/ví-la/","pron_de":"/WIL-lö/"}'::jsonb,
        '{"term":"campsite","meaning":"camping / zona de acampada","de":"Campingplatz","ex":"We set up our tent at the campsite near the lake.","pron":"/kamp-sáit/","pron_de":"/KAMP-ing-plats/"}'::jsonb,

        -- Partes del hotel
        '{"term":"reception","meaning":"recepción","de":"Rezeption / Empfang","ex":"Please check in at the reception desk.","pron":"/ri-sép-shon/","pron_de":"/re-tsep-TSION/"}'::jsonb,
        '{"term":"lobby","meaning":"vestíbulo / recepción","de":"Lobby / Eingangshalle","ex":"Let's meet in the lobby at 9 a.m.","pron":"/ló-bi/","pron_de":"/LO-bi/"}'::jsonb,
        '{"term":"room","meaning":"habitación","de":"Zimmer","ex":"Our room had a beautiful view of the sea.","pron":"/rum/","pron_de":"/TSIM-mö/"}'::jsonb,
        '{"term":"single room","meaning":"habitación individual","de":"Einzelzimmer","ex":"I would like to book a single room for three nights.","pron":"/sín-gel rum/","pron_de":"/AIN-tsöl-tsim-mö/"}'::jsonb,
        '{"term":"double room","meaning":"habitación doble","de":"Doppelzimmer","ex":"We need a double room with a king-size bed.","pron":"/dá-bel rum/","pron_de":"/DO-pöl-tsim-mö/"}'::jsonb,
        '{"term":"suite","meaning":"suite","de":"Suite","ex":"They celebrated their anniversary in a luxury suite.","pron":"/suit/","pron_de":"/SUIT/"}'::jsonb,
        '{"term":"bathroom","meaning":"baño","de":"Badezimmer","ex":"The room has a private bathroom.","pron":"/báz-rum/","pron_de":"/BAA-dö-tsim-mö/"}'::jsonb,
        '{"term":"elevator / lift","meaning":"ascensor","de":"Aufzug / Lift","ex":"Take the elevator to the fourth floor.","pron":"/é-li-vei-tor/","pron_de":"/AUF-tsug/"}'::jsonb,
        '{"term":"stairs","meaning":"escaleras","de":"Treppe","ex":"The stairs are next to the elevator.","pron":"/stérs/","pron_de":"/TREP-pö/"}'::jsonb,
        '{"term":"floor / storey","meaning":"piso / planta","de":"Etage / Stockwerk","ex":"Our room is on the third floor.","pron":"/flor/","pron_de":"/e-TAA-schö/"}'::jsonb,
        '{"term":"corridor / hallway","meaning":"pasillo","de":"Korridor / Flur","ex":"The ice machine is at the end of the corridor.","pron":"/kor-i-dor/","pron_de":"/ko-ri-DOR/"}'::jsonb,
        '{"term":"dining room","meaning":"comedor","de":"Speisesaal / Esszimmer","ex":"Breakfast is served in the dining room from 7 to 10 a.m.","pron":"/dái-nin rum/","pron_de":"/SCHPAI-sö-zaal/"}'::jsonb,
        '{"term":"swimming pool","meaning":"piscina","de":"Schwimmbad / Pool","ex":"The hotel has an outdoor swimming pool.","pron":"/suí-min pul/","pron_de":"/SCHWIM-bad/"}'::jsonb,
        '{"term":"gym","meaning":"gimnasio","de":"Fitnessstudio","ex":"Guests can use the gym free of charge.","pron":"/dyim/","pron_de":"/FIT-ness-schu-dio/"}'::jsonb,

        -- Acciones y procesos
        '{"term":"check in","meaning":"hacer el check-in / registrarse","de":"einchecken","ex":"You can check in from 3 p.m. onwards.","pron":"/chek in/","pron_de":"/AIN-tsché-kön/"}'::jsonb,
        '{"term":"check out","meaning":"hacer el check-out / dejar el hotel","de":"auschecken","ex":"We need to check out before noon.","pron":"/chek áut/","pron_de":"/AUS-tsché-kön/"}'::jsonb,
        '{"term":"book / reserve","meaning":"reservar","de":"buchen / reservieren","ex":"I booked a room online last week.","pron":"/buk / ri-zérv/","pron_de":"/BUU-chön / re-söö-WIEN/"}'::jsonb,
        '{"term":"reservation","meaning":"reserva","de":"Reservierung / Buchung","ex":"I have a reservation under the name Smith.","pron":"/re-ser-véi-shon/","pron_de":"/re-söö-WIE-rung/"}'::jsonb,
        '{"term":"cancel","meaning":"cancelar","de":"stornieren / absagen","ex":"Can I cancel my reservation without a fee?","pron":"/kán-sel/","pron_de":"/stoo-NIE-ren/"}'::jsonb,

        -- Amenidades y extras
        '{"term":"key card","meaning":"tarjeta llave","de":"Schlüsselkarte","ex":"Here is your key card for room 204.","pron":"/ki kard/","pron_de":"/SCHLÜS-söl-kaar-tö/"}'::jsonb,
        '{"term":"minibar","meaning":"minibar","de":"Minibar","ex":"The minibar in the room is stocked with drinks.","pron":"/mí-ni-bar/","pron_de":"/MI-ni-baa/"}'::jsonb,
        '{"term":"room service","meaning":"servicio a la habitación","de":"Zimmerservice","ex":"We ordered room service for dinner.","pron":"/rum sér-vis/","pron_de":"/TSIM-mö-sö-wiss/"}'::jsonb,
        '{"term":"concierge","meaning":"conserje","de":"Concierge / Portier","ex":"The concierge recommended a good restaurant nearby.","pron":"/kon-siérj/","pron_de":"/kon-SIERSCH/"}'::jsonb,
        '{"term":"wake-up call","meaning":"llamada de despertador","de":"Weckruf","ex":"Could you give me a wake-up call at 6:30?","pron":"/wéik-ap kol/","pron_de":"/WEK-ruf/"}'::jsonb,
        '{"term":"Wi-Fi","meaning":"wifi","de":"WLAN / WiFi","ex":"What is the Wi-Fi password?","pron":"/uái-fai/","pron_de":"/WAI-fai/"}'::jsonb,
        '{"term":"air conditioning","meaning":"aire acondicionado","de":"Klimaanlage","ex":"Please turn on the air conditioning.","pron":"/er kon-dí-shon-in/","pron_de":"/KLIE-mö-an-laa-gö/"}'::jsonb,
        '{"term":"tip","meaning":"propina","de":"Trinkgeld","ex":"We left a tip for the housekeeping staff.","pron":"/tip/","pron_de":"/TRINK-gelt/"}'::jsonb,
        '{"term":"bill / invoice","meaning":"cuenta / factura","de":"Rechnung","ex":"Can I have the bill, please?","pron":"/bil/","pron_de":"/RECH-nung/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 330 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 330, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'es', 'Alojamiento y Hoteles', 'Vocabulario esencial para hospedarse en hoteles y otros alojamientos: tipos de habitación, check-in, servicios y más.');

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'de', 'Unterkunft und Hotels', '');

    FOREACH card IN ARRAY v_cards
    LOOP
        INSERT INTO word (term, is_root, source_language, example)
        VALUES (card->>'term', TRUE, 'en', card->>'ex')
        RETURNING uuid INTO v_word_id;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron');

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');

        INSERT INTO deck_words (deck_uuid, word_uuid)
        VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;
