-- ============================================================
-- Seed: A0 English Path – STEP 1315 – Deck – Banco, Dinero y Correos
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "bank", "meaning": "banco", "de": "Bank", "ex": "I need to go to the bank to open an account.", "pron": "/bank/", "pron_de": "/bank/"}'::jsonb,
        '{"term": "account", "meaning": "cuenta (bancaria)", "de": "Konto", "ex": "Transfer the money to my account.", "pron": "/a-káunt/", "pron_de": "/KON-to/"}'::jsonb,
        '{"term": "current account", "meaning": "cuenta corriente", "de": "Girokonto", "ex": "My salary goes into my current account.", "pron": "/ká-rent a-káunt/", "pron_de": "/GII-ro-kon-to/"}'::jsonb,
        '{"term": "savings account", "meaning": "cuenta de ahorro", "de": "Sparkonto", "ex": "Keep your savings in a savings account.", "pron": "/séi-vings a-káunt/", "pron_de": "/SHPAR-kon-to/"}'::jsonb,
        '{"term": "joint account", "meaning": "cuenta conjunta", "de": "gemeinsames Konto", "ex": "We opened a joint account after getting married.", "pron": "/dyoint a-káunt/", "pron_de": "/gö-MAIN-zaa-mes KON-to/"}'::jsonb,
        '{"term": "open an account", "meaning": "abrir una cuenta", "de": "ein Konto eröffnen", "ex": "You need your passport to open an account.", "pron": "/óu-pen an a-káunt/", "pron_de": "/ain KON-to ö-ÖF-nen/"}'::jsonb,
        '{"term": "close an account", "meaning": "cerrar una cuenta", "de": "ein Konto kündigen / schließen", "ex": "She closed her account when she moved abroad.", "pron": "/klouz an a-káunt/", "pron_de": "/ain KON-to KÜÜN-di-gen/"}'::jsonb,
        '{"term": "balance", "meaning": "saldo", "de": "Kontostand", "ex": "Check your balance before you pay.", "pron": "/bá-lens/", "pron_de": "/KON-to-shtant/"}'::jsonb,
        '{"term": "deposit", "meaning": "depósito / ingresar dinero", "de": "Einzahlung", "ex": "Make a deposit at the ATM.", "pron": "/di-pó-sit/", "pron_de": "/AIN-tsaa-lung/"}'::jsonb,
        '{"term": "withdrawal", "meaning": "retirada / sacar dinero", "de": "Abhebung", "ex": "There is a fee for cash withdrawals abroad.", "pron": "/wid-dró-el/", "pron_de": "/AP-hee-bung/"}'::jsonb,
        '{"term": "transfer", "meaning": "transferencia", "de": "Überweisung", "ex": "I will transfer the money today.", "pron": "/trans-fér/", "pron_de": "/üü-bö-VAI-zung/"}'::jsonb,
        '{"term": "direct debit", "meaning": "domiciliación bancaria / débito directo", "de": "Lastschrift", "ex": "Pay the rent by direct debit every month.", "pron": "/di-rékt dé-bit/", "pron_de": "/LAST-shrift/"}'::jsonb,
        '{"term": "standing order", "meaning": "orden permanente", "de": "Dauerauftrag", "ex": "Set up a standing order for the gym fee.", "pron": "/stán-ding ór-der/", "pron_de": "/DAU-ö-auf-traak/"}'::jsonb,
        '{"term": "statement", "meaning": "extracto / estado de cuenta", "de": "Kontoauszug", "ex": "Check your monthly bank statement online.", "pron": "/stéit-ment/", "pron_de": "/KON-to-aus-tsuuk/"}'::jsonb,
        '{"term": "online banking", "meaning": "banca en línea / banca digital", "de": "Online-Banking", "ex": "Use online banking to check your balance.", "pron": "/on-lain bán-king/", "pron_de": "/ON-lain-bäng-king/"}'::jsonb,
        '{"term": "mobile banking", "meaning": "banca móvil", "de": "Mobile Banking", "ex": "The mobile banking app is very easy to use.", "pron": "/móu-bail bán-king/", "pron_de": "/MO-bi-le BÄN-king/"}'::jsonb,
        '{"term": "ATM", "meaning": "cajero automático", "de": "Geldautomat", "ex": "Withdraw cash from the ATM nearby.", "pron": "/ei-tii-em/", "pron_de": "/GELT-au-to-maat/"}'::jsonb,
        '{"term": "teller", "meaning": "cajero/a de banco / empleado de ventanilla", "de": "Bankangestellte/r", "ex": "The teller helped me with the transfer.", "pron": "/té-ler/", "pron_de": "/BANK-an-gö-shtel-te/"}'::jsonb,
        '{"term": "branch", "meaning": "sucursal", "de": "Filiale / Zweigstelle", "ex": "Visit the nearest branch for assistance.", "pron": "/branch/", "pron_de": "/fi-li-AA-le/"}'::jsonb,
        '{"term": "overdraft", "meaning": "descubierto bancario", "de": "Überziehung / Dispokredit", "ex": "I went into overdraft at the end of the month.", "pron": "/óu-ver-draft/", "pron_de": "/üü-bö-TSII-ung/"}'::jsonb,
        '{"term": "interest rate", "meaning": "tipo de interés", "de": "Zinssatz", "ex": "The interest rate on the loan is four percent.", "pron": "/ín-te-rest reit/", "pron_de": "/TSINS-zats/"}'::jsonb,
        '{"term": "bank fee", "meaning": "comisión bancaria", "de": "Bankgebühr", "ex": "Check if there are bank fees for the transfer.", "pron": "/bank fii/", "pron_de": "/BANK-gö-büür/"}'::jsonb,
        '{"term": "PIN", "meaning": "PIN / número secreto", "de": "PIN / Geheimzahl", "ex": "Never share your PIN with anyone.", "pron": "/pin/", "pron_de": "/pin/"}'::jsonb,
        '{"term": "cheque", "meaning": "cheque", "de": "Scheck", "ex": "Pay by cheque if you prefer.", "pron": "/chek/", "pron_de": "/shek/"}'::jsonb,
        '{"term": "contactless", "meaning": "sin contacto / pago por aproximación", "de": "kontaktlos", "ex": "Tap your card for a contactless payment.", "pron": "/kón-takt-les/", "pron_de": "/kon-TAKT-los/"}'::jsonb,
        '{"term": "IBAN", "meaning": "IBAN / número de cuenta internacional", "de": "IBAN", "ex": "Provide your IBAN for the international transfer.", "pron": "/ái-ban/", "pron_de": "/ii-baan/"}'::jsonb,
        '{"term": "fraud", "meaning": "fraude / estafa", "de": "Betrug / Bankbetrug", "ex": "Report any fraud to your bank immediately.", "pron": "/frod/", "pron_de": "/bö-TRUUK/"}'::jsonb,
        '{"term": "credit card", "meaning": "tarjeta de crédito", "de": "Kreditkarte", "ex": "I paid for the flight with my credit card.", "pron": "/kré-dit kard/", "pron_de": "/kre-DIIT-kar-te/"}'::jsonb,
        '{"term": "debit card", "meaning": "tarjeta de débito", "de": "EC-Karte / Debitkarte", "ex": "Use your debit card at the supermarket.", "pron": "/dé-bit kard/", "pron_de": "/EE-TSEE-kar-te/"}'::jsonb,
        '{"term": "payment", "meaning": "pago", "de": "Zahlung / Bezahlung", "ex": "The payment was processed successfully.", "pron": "/péi-ment/", "pron_de": "/TSAA-lung/"}'::jsonb,
        '{"term": "receipt", "meaning": "recibo / ticket de compra", "de": "Quittung / Kassenbon", "ex": "Ask for a receipt after every purchase.", "pron": "/ri-sít/", "pron_de": "/KVI-tung/"}'::jsonb,
        '{"term": "invoice", "meaning": "factura", "de": "Rechnung", "ex": "Send me an invoice for the work.", "pron": "/ín-vois/", "pron_de": "/REJ-nung/"}'::jsonb,
        '{"term": "change", "meaning": "cambio / vuelta", "de": "Wechselgeld", "ex": "She gave me the wrong change.", "pron": "/cheindy/", "pron_de": "/VEK-sel-gelt/"}'::jsonb,
        '{"term": "cash", "meaning": "efectivo", "de": "Bargeld", "ex": "Some small shops only accept cash.", "pron": "/kash/", "pron_de": "/BAAR-gelt/"}'::jsonb,
        '{"term": "coin", "meaning": "moneda", "de": "Münze", "ex": "Do you have a two-euro coin?", "pron": "/koin/", "pron_de": "/MÜNT-se/"}'::jsonb,
        '{"term": "note / bill", "meaning": "billete", "de": "Geldschein", "ex": "Pay with a twenty-euro note.", "pron": "/nout/", "pron_de": "/GELT-shain/"}'::jsonb,
        '{"term": "currency", "meaning": "moneda / divisa", "de": "Währung", "ex": "What currency do they use in Japan?", "pron": "/ká-ren-si/", "pron_de": "/VÄÄ-rung/"}'::jsonb,
        '{"term": "exchange rate", "meaning": "tipo de cambio", "de": "Wechselkurs", "ex": "Check the exchange rate before travelling.", "pron": "/iks-chéindy reit/", "pron_de": "/VEK-sel-kurs/"}'::jsonb,
        '{"term": "foreign currency", "meaning": "moneda extranjera / divisa", "de": "Fremdwährung", "ex": "Buy foreign currency at the airport.", "pron": "/fó-ren ká-ren-si/", "pron_de": "/FREMT-vä-rung/"}'::jsonb,
        '{"term": "budget", "meaning": "presupuesto", "de": "Budget / Haushaltsplan", "ex": "Plan a monthly budget to control spending.", "pron": "/bá-dyit/", "pron_de": "/BU-dyit/"}'::jsonb,
        '{"term": "earn", "meaning": "ganar (dinero)", "de": "verdienen", "ex": "She earns a good salary.", "pron": "/ern/", "pron_de": "/fö-DII-nen/"}'::jsonb,
        '{"term": "salary / wage", "meaning": "salario / sueldo", "de": "Gehalt / Lohn", "ex": "His salary increased after the promotion.", "pron": "/sá-la-ri/", "pron_de": "/gö-HALT/"}'::jsonb,
        '{"term": "income", "meaning": "ingresos", "de": "Einkommen", "ex": "Their income comes from two jobs.", "pron": "/ín-kam/", "pron_de": "/AIN-ko-men/"}'::jsonb,
        '{"term": "expenses", "meaning": "gastos", "de": "Ausgaben / Kosten", "ex": "Keep track of your monthly expenses.", "pron": "/iks-pén-ses/", "pron_de": "/AUS-gaa-ben/"}'::jsonb,
        '{"term": "save", "meaning": "ahorrar", "de": "sparen", "ex": "Try to save at least ten percent of your income.", "pron": "/seiv/", "pron_de": "/SHPAA-ren/"}'::jsonb,
        '{"term": "spend", "meaning": "gastar", "de": "ausgeben", "ex": "He spends too much on takeaways.", "pron": "/spend/", "pron_de": "/AUS-gee-ben/"}'::jsonb,
        '{"term": "afford", "meaning": "permitirse / poder pagar", "de": "sich leisten können", "ex": "Can you afford the rent?", "pron": "/a-ford/", "pron_de": "/sich LAIS-ten/"}'::jsonb,
        '{"term": "debt", "meaning": "deuda", "de": "Schulden", "ex": "Pay off your debt as soon as possible.", "pron": "/det/", "pron_de": "/SHUL-den/"}'::jsonb,
        '{"term": "owe", "meaning": "deber (dinero)", "de": "schulden", "ex": "I owe you twenty euros.", "pron": "/ou/", "pron_de": "/SHUL-den/"}'::jsonb,
        '{"term": "pay back", "meaning": "devolver / pagar de vuelta", "de": "zurückzahlen", "ex": "Pay back the loan within five years.", "pron": "/pei bak/", "pron_de": "/tsu-RÜK-tsaa-len/"}'::jsonb,
        '{"term": "borrow", "meaning": "pedir prestado", "de": "leihen / borgen", "ex": "Can I borrow ten euros until Friday?", "pron": "/bó-rou/", "pron_de": "/LAI-en/"}'::jsonb,
        '{"term": "lend", "meaning": "prestar", "de": "leihen / verleihen", "ex": "She lent me some money for the taxi.", "pron": "/lend/", "pron_de": "/LAI-en/"}'::jsonb,
        '{"term": "loan", "meaning": "préstamo", "de": "Darlehen / Kredit", "ex": "Apply for a loan at the bank.", "pron": "/loun/", "pron_de": "/DAR-lee-en/"}'::jsonb,
        '{"term": "mortgage", "meaning": "hipoteca", "de": "Hypothek / Immobilienkredit", "ex": "They took out a mortgage to buy the house.", "pron": "/mór-gidy/", "pron_de": "/hi-po-TEK/"}'::jsonb,
        '{"term": "instalment", "meaning": "plazo / cuota", "de": "Rate / Teilzahlung", "ex": "Pay in monthly instalments with no interest.", "pron": "/ins-tól-ment/", "pron_de": "/RAA-te/"}'::jsonb,
        '{"term": "down payment", "meaning": "entrada / pago inicial", "de": "Anzahlung", "ex": "They made a down payment of ten percent.", "pron": "/daun péi-ment/", "pron_de": "/AN-tsaa-lung/"}'::jsonb,
        '{"term": "tax", "meaning": "impuesto / tributo", "de": "Steuer", "ex": "Income tax is deducted from your salary.", "pron": "/taks/", "pron_de": "/SHTOI-ö/"}'::jsonb,
        '{"term": "VAT", "meaning": "IVA", "de": "Mehrwertsteuer", "ex": "The price shown already includes VAT.", "pron": "/vii-ei-tii/", "pron_de": "/MEER-vert-shtoi-ö/"}'::jsonb,
        '{"term": "refund", "meaning": "reembolso / devolución", "de": "Rückerstattung", "ex": "I received a full refund within three days.", "pron": "/rí-fand/", "pron_de": "/RÜK-ö-shta-tung/"}'::jsonb,
        '{"term": "invest", "meaning": "invertir", "de": "investieren / anlegen", "ex": "Invest in shares for long-term growth.", "pron": "/in-vést/", "pron_de": "/in-ves-TIR-en/"}'::jsonb,
        '{"term": "pension", "meaning": "pensión / jubilación", "de": "Rente / Pension", "ex": "Save into a pension from an early age.", "pron": "/pén-shen/", "pron_de": "/REN-te/"}'::jsonb,
        '{"term": "insurance", "meaning": "seguro", "de": "Versicherung", "ex": "Travel insurance is important when going abroad.", "pron": "/in-shú-rans/", "pron_de": "/fö-ZI-je-rung/"}'::jsonb,
        '{"term": "fine", "meaning": "multa", "de": "Geldstrafe / Bußgeld", "ex": "Pay the fine within fourteen days.", "pron": "/fain/", "pron_de": "/GELT-shtraa-fe/"}'::jsonb,
        '{"term": "tip", "meaning": "propina", "de": "Trinkgeld", "ex": "Leave a tip if the service was good.", "pron": "/tip/", "pron_de": "/TRINK-gelt/"}'::jsonb,
        '{"term": "broke", "meaning": "sin dinero / sin blanca", "de": "pleite / blank sein", "ex": "I am broke until payday.", "pron": "/brouk/", "pron_de": "/PLAI-te/"}'::jsonb,
        '{"term": "wealthy", "meaning": "adinerado / rico", "de": "wohlhabend / reich", "ex": "He became wealthy after selling his business.", "pron": "/uél-zi/", "pron_de": "/VOOL-haa-bent/"}'::jsonb,
        '{"term": "stamp", "meaning": "sello / estampilla", "de": "Briefmarke", "ex": "Buy a stamp at the post office.", "pron": "/stamp/", "pron_de": "/BRIIF-mar-ke/"}'::jsonb,
        '{"term": "letter", "meaning": "carta", "de": "Brief", "ex": "Write a letter to your friend.", "pron": "/lé-ter/", "pron_de": "/briif/"}'::jsonb,
        '{"term": "postcard", "meaning": "postal / tarjeta postal", "de": "Postkarte", "ex": "Send a postcard from your holiday.", "pron": "/póust-kard/", "pron_de": "/POST-kar-te/"}'::jsonb,
        '{"term": "parcel / package", "meaning": "paquete", "de": "Paket", "ex": "The parcel arrived the next day.", "pron": "/pár-sel/", "pron_de": "/pa-KET/"}'::jsonb,
        '{"term": "envelope", "meaning": "sobre", "de": "Umschlag / Briefumschlag", "ex": "Put the letter in the envelope.", "pron": "/én-ve-loup/", "pron_de": "/UM-shlaak/"}'::jsonb,
        '{"term": "address", "meaning": "dirección / domicilio", "de": "Adresse", "ex": "Write the address clearly on the envelope.", "pron": "/a-drés/", "pron_de": "/a-DRE-se/"}'::jsonb,
        '{"term": "postcode / zip code", "meaning": "código postal", "de": "Postleitzahl / PLZ", "ex": "Include the postcode when filling the form.", "pron": "/póust-koud/", "pron_de": "/POST-lait-tsaal/"}'::jsonb,
        '{"term": "sender", "meaning": "remitente", "de": "Absender", "ex": "Write the sender address on the back.", "pron": "/sén-der/", "pron_de": "/AP-zen-dö/"}'::jsonb,
        '{"term": "recipient", "meaning": "destinatario", "de": "Empfänger", "ex": "The recipient was not at home.", "pron": "/ri-sí-pi-ent/", "pron_de": "/emp-FÄNG-ö/"}'::jsonb,
        '{"term": "postman", "meaning": "cartero", "de": "Briefträger / Postbote", "ex": "The postman delivers at eight every morning.", "pron": "/póust-man/", "pron_de": "/BRIIF-trä-gö/"}'::jsonb,
        '{"term": "registered mail", "meaning": "correo certificado", "de": "Einschreiben", "ex": "Send important documents by registered mail.", "pron": "/ré-dyi-sterd meil/", "pron_de": "/AIN-shrai-ben/"}'::jsonb,
        '{"term": "airmail", "meaning": "correo aéreo", "de": "Luftpost", "ex": "Send it by airmail to arrive faster.", "pron": "/ér-meil/", "pron_de": "/LUFT-post/"}'::jsonb,
        '{"term": "express delivery", "meaning": "entrega urgente / express", "de": "Expresslieferung", "ex": "Choose express delivery to get it tomorrow.", "pron": "/iks-prés di-lí-ve-ri/", "pron_de": "/eks-PRES-lii-fö-rung/"}'::jsonb,
        '{"term": "tracking number", "meaning": "número de seguimiento", "de": "Sendungsnummer / Tracking-Nummer", "ex": "Use the tracking number to follow the parcel.", "pron": "/trá-king nám-ber/", "pron_de": "/ZEN-dungs-nu-mö/"}'::jsonb,
        '{"term": "postbox", "meaning": "buzón", "de": "Briefkasten", "ex": "Post the letter in the red postbox.", "pron": "/póust-boks/", "pron_de": "/BRIIF-kas-ten/"}'::jsonb,
        '{"term": "P.O. box", "meaning": "apartado de correos", "de": "Postfach", "ex": "Write to our P.O. box if you prefer.", "pron": "/pii-ou boks/", "pron_de": "/POST-faj/"}'::jsonb,
        '{"term": "postage", "meaning": "franqueo / tarifa postal", "de": "Porto", "ex": "The postage for this parcel is three euros.", "pron": "/póus-tidy/", "pron_de": "/POR-to/"}'::jsonb,
        '{"term": "counter", "meaning": "mostrador / ventanilla", "de": "Schalter", "ex": "Wait at the counter for your turn.", "pron": "/káun-ter/", "pron_de": "/SHAL-tö/"}'::jsonb,
        '{"term": "form", "meaning": "formulario", "de": "Formular", "ex": "Fill in the form before sending the parcel.", "pron": "/form/", "pron_de": "/for-mu-LAAR/"}'::jsonb,
        '{"term": "send", "meaning": "enviar", "de": "schicken / senden", "ex": "Send the parcel before Friday.", "pron": "/send/", "pron_de": "/SHI-ken/"}'::jsonb,
        '{"term": "deliver", "meaning": "entregar / repartir", "de": "liefern / zustellen", "ex": "They will deliver the package tomorrow.", "pron": "/di-lí-ver/", "pron_de": "/LII-fern/"}'::jsonb,
        '{"term": "collect", "meaning": "recoger / retirar", "de": "abholen", "ex": "Collect your parcel from the post office.", "pron": "/ko-lékt/", "pron_de": "/AP-hoo-len/"}'::jsonb,
        '{"term": "sign for", "meaning": "firmar al recibir", "de": "unterschreiben / quittieren", "ex": "You have to sign for the registered letter.", "pron": "/sain for/", "pron_de": "/UN-tö-shrai-ben/"}'::jsonb,
        '{"term": "courier", "meaning": "mensajero / empresa de mensajería", "de": "Kurier / Paketdienst", "ex": "The courier delivered it within two hours.", "pron": "/kú-ri-er/", "pron_de": "/ku-RIIR/"}'::jsonb,
        '{"term": "customs", "meaning": "aduana", "de": "Zoll", "ex": "The parcel was held at customs for inspection.", "pron": "/kás-tems/", "pron_de": "/tsol/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 1315 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1315, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'Banco, Dinero y Correos');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Bank, Geld und Post');

    FOREACH card IN ARRAY v_cards
    LOOP
        SELECT get_or_create_word(card->>'term', 'en', card->>'ex') INTO v_word_id;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron')
    ON CONFLICT DO NOTHING;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de')
    ON CONFLICT DO NOTHING;

        INSERT INTO deck_words (deck_uuid, word_uuid)
        VALUES (v_deck_id, v_word_id)
    ON CONFLICT DO NOTHING;
    END LOOP;
END;
$seed$;
