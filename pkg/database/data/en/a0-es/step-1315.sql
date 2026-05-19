-- ============================================================
-- Seed: A0 English Path – STEP 1315 – Deck – Banco, Dinero y Correos (Servicios Financieros)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        -- Banking
        '{"term":"bank","meaning":"banco","de":"Bank","ex":"The bank opens at nine every morning.","pron":"/bank/","pron_de":"/bank/"}'::jsonb,
        '{"term":"account","meaning":"cuenta","de":"Konto","ex":"I need a new bank account for my salary.","pron":"/a-KAUNT/","pron_de":"/KON-to/"}'::jsonb,
        '{"term":"balance","meaning":"saldo","de":"Kontostand","ex":"My balance is higher after the deposit.","pron":"/BA-lans/","pron_de":"/KON-to-shtant/"}'::jsonb,
        '{"term":"deposit","meaning":"depósito / ingresar dinero","de":"Einzahlung / Einzahlung machen","ex":"She makes a cash deposit at the counter.","pron":"/di-PO-zit/","pron_de":"/AIN-tsaa-lung/"}'::jsonb,
        '{"term":"withdrawal","meaning":"retirada / sacar dinero","de":"Abhebung","ex":"This withdrawal is for the rent.","pron":"/with-DRO-ol/","pron_de":"/AP-hey-bung/"}'::jsonb,
        '{"term":"transfer","meaning":"transferencia","de":"Überweisung","ex":"The transfer goes to another branch.","pron":"/TRANS-fer/","pron_de":"/Ü-bör-vai-zung/"}'::jsonb,
        '{"term":"interest rate","meaning":"tipo de interés","de":"Zinssatz","ex":"The savings account has a low interest rate.","pron":"/IN-trest reit/","pron_de":"/TSINS-zats/"}'::jsonb,
        '{"term":"PIN","meaning":"PIN / número secreto","de":"PIN","ex":"Please enter your PIN at the ATM.","pron":"/pin/","pron_de":"/pin/"}'::jsonb,
        '{"term":"statement","meaning":"extracto / estado de cuenta","de":"Kontoauszug","ex":"The statement arrives by email every month.","pron":"/STEIT-ment/","pron_de":"/KON-to-aus-tsook/"}'::jsonb,
        '{"term":"branch","meaning":"sucursal","de":"Filiale","ex":"The main branch is near the station.","pron":"/branch/","pron_de":"/fi-li-AA-lö/"}'::jsonb,
        '{"term":"teller","meaning":"cajero de banco / empleado de ventanilla","de":"Bankschaltermitarbeiter","ex":"The teller counts the notes slowly.","pron":"/TE-ler/","pron_de":"/bank-SHAL-ter-mit-ar-bai-ter/"}'::jsonb,
        '{"term":"ATM","meaning":"cajero automático","de":"Geldautomat","ex":"There is an ATM next to the door.","pron":"/ei-ti-em/","pron_de":"/GELT-au-to-mat/"}'::jsonb,
        '{"term":"bank fee","meaning":"comisión bancaria","de":"Bankgebühr","ex":"This bank fee is for an international transfer.","pron":"/bank fiː/","pron_de":"/BANK-gö-büür/"}'::jsonb,
        
        -- Money
        '{"term":"cash","meaning":"efectivo","de":"Bargeld","ex":"I want to pay in cash today.","pron":"/kash/","pron_de":"/BAR-gelt/"}'::jsonb,
        '{"term":"coin","meaning":"moneda","de":"Münze","ex":"The machine only takes one euro coins.","pron":"/koin/","pron_de":"/MÜN-tsö/"}'::jsonb,
        '{"term":"note / bill","meaning":"billete","de":"Geldschein","ex":"Do you have a ten euro note?","pron":"/nout bil/","pron_de":"/GELT-shain/"}'::jsonb,
        '{"term":"currency","meaning":"moneda / divisa","de":"Währung","ex":"The local currency is the pound.","pron":"/KUR-en-si/","pron_de":"/VÄ-rung/"}'::jsonb,
        '{"term":"exchange rate","meaning":"tipo de cambio","de":"Wechselkurs","ex":"The exchange rate is better today.","pron":"/eks-CHENCH reit/","pron_de":"/VEK-sel-kurs/"}'::jsonb,
        '{"term":"receipt","meaning":"recibo","de":"Quittung","ex":"Keep the receipt for your records.","pron":"/ri-SIIT/","pron_de":"/KVI-tung/"}'::jsonb,
        '{"term":"change","meaning":"cambio / vuelta","de":"Wechselgeld","ex":"Here is your change and your receipt.","pron":"/cheinch/","pron_de":"/VEK-sel-gelt/"}'::jsonb,
        '{"term":"credit card","meaning":"tarjeta de crédito","de":"Kreditkarte","ex":"She pays for the hotel with a credit card.","pron":"/KRE-dit kard/","pron_de":"/kre-DIT-kar-tö/"}'::jsonb,
        '{"term":"debit card","meaning":"tarjeta de débito","de":"Debitkarte","ex":"My debit card works at this ATM.","pron":"/DE-bit kard/","pron_de":"/DE-bit-kar-tö/"}'::jsonb,
        '{"term":"payment","meaning":"pago","de":"Zahlung","ex":"The payment is due on Monday.","pron":"/PEI-ment/","pron_de":"/TSAA-lung/"}'::jsonb,
        
        -- Post office
        '{"term":"stamp","meaning":"sello","de":"Briefmarke","ex":"I need one stamp for this postcard.","pron":"/stamp/","pron_de":"/BRIEF-mar-kö/"}'::jsonb,
        '{"term":"letter","meaning":"carta","de":"Brief","ex":"This letter is for my aunt.","pron":"/LE-ter/","pron_de":"/brief/"}'::jsonb,
        '{"term":"parcel / package","meaning":"paquete","de":"Paket","ex":"The parcel is small but heavy.","pron":"/PAR-sel PA-kidʒ/","pron_de":"/pa-KET/"}'::jsonb,
        '{"term":"envelope","meaning":"sobre","de":"Umschlag","ex":"Please put the photo in the envelope.","pron":"/EN-və-loup/","pron_de":"/UM-shlak/"}'::jsonb,
        '{"term":"address","meaning":"dirección","de":"Adresse","ex":"Write the address in clear letters.","pron":"/a-DRES/","pron_de":"/a-DRE-sö/"}'::jsonb,
        '{"term":"postcode / zip code","meaning":"código postal","de":"Postleitzahl","ex":"Do not forget the postcode.","pron":"/POUST-koud zip koud/","pron_de":"/POST-laits-tsaal/"}'::jsonb,
        '{"term":"registered mail","meaning":"correo certificado","de":"Einschreiben","ex":"Registered mail needs a signature.","pron":"/RE-dʒis-terd meil/","pron_de":"/AIN-shrai-bən/"}'::jsonb,
        '{"term":"tracking number","meaning":"número de seguimiento","de":"Sendungsnummer","ex":"You can check the parcel with the tracking number.","pron":"/TRA-king NAM-ber/","pron_de":"/ZEN-dungs-num-mer/"}'::jsonb,
        '{"term":"postbox","meaning":"buzón","de":"Briefkasten","ex":"The red postbox is outside the bank.","pron":"/POUST-boks/","pron_de":"/BRIEF-kas-ten/"}'::jsonb,
        '{"term":"counter","meaning":"mostrador / ventanilla","de":"Schalter","ex":"Please go to counter three.","pron":"/KAUN-ter/","pron_de":"/SHAL-ter/"}'::jsonb,
        '{"term":"form","meaning":"formulario","de":"Formular","ex":"Fill in the form before you wait.","pron":"/form/","pron_de":"/for-mu-LAR/"}'::jsonb,
        '{"term":"send","meaning":"enviar","de":"senden","ex":"I want to send this parcel today.","pron":"/send/","pron_de":"/ZEN-den/"}'::jsonb,
        '{"term":"deliver","meaning":"entregar / repartir","de":"zustellen / liefern","ex":"They deliver letters in the morning.","pron":"/di-LI-ver/","pron_de":"/TSU-shte-lən/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 1315 AND path_uuid = v_path_id;
    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1315, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'es', 'Banco, Dinero y Correos', 'Vocabulario esencial para hablar de bancos, dinero, pagos y servicios postales en situaciones cotidianas.');

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'de', 'Bank, Geld und Post', 'Wichtiger Wortschatz für Bankgeschäfte, Geld und Postdienste im Alltag.');

    FOREACH card IN ARRAY v_cards LOOP
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
