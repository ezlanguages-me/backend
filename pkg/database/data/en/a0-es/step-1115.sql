-- ============================================================
-- Seed: A0 English Path – STEP 1115 – Deck – Compras y Tiendas
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "supermarket", "meaning": "supermercado", "de": "Supermarkt", "ex": "I do the weekly shop at the supermarket.", "pron": "/sú-per-mar-ket/", "pron_de": "/ZUU-pö-markt/"}'::jsonb,
        '{"term": "department store", "meaning": "grandes almacenes", "de": "Kaufhaus", "ex": "The department store has six floors.", "pron": "/di-párt-ment stor/", "pron_de": "/KAUF-haus/"}'::jsonb,
        '{"term": "convenience store", "meaning": "tienda de conveniencia / colmado", "de": "Spätverkauf / Kiosk", "ex": "The convenience store is open until midnight.", "pron": "/kon-víi-ni-ens stor/", "pron_de": "/SHPÄT-fer-kauf/"}'::jsonb,
        '{"term": "corner shop", "meaning": "tienda de barrio / colmado", "de": "Tante-Emma-Laden / Eckladen", "ex": "I bought milk at the corner shop.", "pron": "/kór-ner shop/", "pron_de": "/E-klaa-den/"}'::jsonb,
        '{"term": "bakery", "meaning": "panadería", "de": "Bäckerei", "ex": "The bakery opens at six in the morning.", "pron": "/béi-ke-ri/", "pron_de": "/bä-ke-RAI/"}'::jsonb,
        '{"term": "butcher", "meaning": "carnicería / carnicero", "de": "Metzgerei / Fleischer", "ex": "Buy the steak at the butcher.", "pron": "/bú-cher/", "pron_de": "/METS-ge-rai/"}'::jsonb,
        '{"term": "fishmonger", "meaning": "pescadería / pescadero", "de": "Fischgeschäft", "ex": "Get fresh salmon at the fishmonger.", "pron": "/físh-mong-er/", "pron_de": "/FISH-gö-sheft/"}'::jsonb,
        '{"term": "greengrocer", "meaning": "frutería / verdulería", "de": "Gemüsehändler / Obstgeschäft", "ex": "Buy tomatoes and onions at the greengrocer.", "pron": "/grín-grou-ser/", "pron_de": "/gö-MÜÜ-ze-händ-lö/"}'::jsonb,
        '{"term": "deli", "meaning": "charcutería / delicatessen", "de": "Feinkostgeschäft / Deli", "ex": "The deli sells imported cheeses and meats.", "pron": "/dé-li/", "pron_de": "/FAIN-kost-gö-sheft/"}'::jsonb,
        '{"term": "pharmacy", "meaning": "farmacia", "de": "Apotheke", "ex": "Pick up the prescription at the pharmacy.", "pron": "/fár-ma-si/", "pron_de": "/a-po-TEE-ke/"}'::jsonb,
        '{"term": "bookshop", "meaning": "librería", "de": "Buchhandlung", "ex": "I found a great novel at the bookshop.", "pron": "/búk-shop/", "pron_de": "/BUUJ-hant-lung/"}'::jsonb,
        '{"term": "clothes shop", "meaning": "tienda de ropa", "de": "Bekleidungsgeschäft / Boutique", "ex": "She spent hours in the clothes shop.", "pron": "/klóuds shop/", "pron_de": "/bö-KLAI-dungs-gö-sheft/"}'::jsonb,
        '{"term": "shoe shop", "meaning": "zapatería", "de": "Schuhgeschäft", "ex": "I need new trainers from the shoe shop.", "pron": "/shu shop/", "pron_de": "/SHUU-gö-sheft/"}'::jsonb,
        '{"term": "electronics store", "meaning": "tienda de electrónica", "de": "Elektronikfachmarkt", "ex": "Buy the laptop at the electronics store.", "pron": "/e-lek-tró-niks stor/", "pron_de": "/e-lek-TROO-nik-faj-markt/"}'::jsonb,
        '{"term": "hardware store", "meaning": "ferretería", "de": "Baumarkt / Eisenwarengeschäft", "ex": "Get the screws at the hardware store.", "pron": "/hárd-uer stor/", "pron_de": "/BAU-markt/"}'::jsonb,
        '{"term": "furniture store", "meaning": "tienda de muebles", "de": "Möbelgeschäft / Möbelhaus", "ex": "We bought a sofa at the furniture store.", "pron": "/fér-ni-cher stor/", "pron_de": "/MÖÖ-bel-haus/"}'::jsonb,
        '{"term": "DIY store", "meaning": "tienda de bricolaje", "de": "Baumarkt / Do-it-yourself-Laden", "ex": "Get the paint at the DIY store.", "pron": "/di-ai-uái stor/", "pron_de": "/BAU-markt/"}'::jsonb,
        '{"term": "toy shop", "meaning": "juguetería", "de": "Spielzeuggeschäft", "ex": "The children loved the toy shop.", "pron": "/toi shop/", "pron_de": "/SHPIIL-tsoik-gö-sheft/"}'::jsonb,
        '{"term": "sports shop", "meaning": "tienda de deportes", "de": "Sportgeschäft / Sportladen", "ex": "Buy your running shoes at the sports shop.", "pron": "/sports shop/", "pron_de": "/SHPORT-gö-sheft/"}'::jsonb,
        '{"term": "jeweller", "meaning": "joyería / joyero", "de": "Juwelier", "ex": "She bought a ring at the jeweller.", "pron": "/dyú-e-ler/", "pron_de": "/ju-ve-LIIR/"}'::jsonb,
        '{"term": "florist", "meaning": "floristería / florista", "de": "Blumenladen / Florist", "ex": "Order a bouquet from the florist.", "pron": "/fló-rist/", "pron_de": "/BLUU-men-laa-den/"}'::jsonb,
        '{"term": "optician", "meaning": "óptica / óptico", "de": "Optiker", "ex": "Get your eyes tested at the optician.", "pron": "/op-tí-shen/", "pron_de": "/OP-ti-kö/"}'::jsonb,
        '{"term": "newsagent", "meaning": "quiosco / prensa", "de": "Zeitungshändler / Kiosk", "ex": "Buy the newspaper at the newsagent.", "pron": "/niús-ei-dyent/", "pron_de": "/TSAI-tungs-händ-lö/"}'::jsonb,
        '{"term": "gift shop", "meaning": "tienda de regalos", "de": "Geschenkeladen", "ex": "I bought a mug at the gift shop.", "pron": "/gift shop/", "pron_de": "/gö-SHENK-e-laa-den/"}'::jsonb,
        '{"term": "second-hand shop", "meaning": "tienda de segunda mano", "de": "Secondhandladen / Gebrauchtwarenladen", "ex": "Find vintage clothes at a second-hand shop.", "pron": "/sé-kend-hand shop/", "pron_de": "/SE-kond-hant-laa-den/"}'::jsonb,
        '{"term": "outlet", "meaning": "outlet / tienda de fábrica", "de": "Outlet / Fabrikverkauf", "ex": "Buy designer clothes cheaper at an outlet.", "pron": "/áut-let/", "pron_de": "/AUT-let/"}'::jsonb,
        '{"term": "online shop", "meaning": "tienda online / tienda en línea", "de": "Onlineshop", "ex": "Order from the online shop and get it delivered.", "pron": "/on-lain shop/", "pron_de": "/ON-lain-shop/"}'::jsonb,
        '{"term": "market stall", "meaning": "puesto de mercado", "de": "Marktstand", "ex": "The market stall sells homemade jam.", "pron": "/már-ket stol/", "pron_de": "/MARKT-shtant/"}'::jsonb,
        '{"term": "cashier", "meaning": "cajero/a", "de": "Kassierer/in", "ex": "Pay the cashier at the end.", "pron": "/ka-shír/", "pron_de": "/ka-SIR-ö/"}'::jsonb,
        '{"term": "shop assistant", "meaning": "dependiente / vendedor", "de": "Verkäufer/in", "ex": "The shop assistant helped me find my size.", "pron": "/shop a-sís-tent/", "pron_de": "/fö-KOI-fö/"}'::jsonb,
        '{"term": "customer", "meaning": "cliente", "de": "Kunde / Kundin", "ex": "The customer asked for a refund.", "pron": "/kás-to-mer/", "pron_de": "/KUN-de/"}'::jsonb,
        '{"term": "manager", "meaning": "encargado / gerente", "de": "Filialleiter/in / Manager", "ex": "Ask to speak to the manager.", "pron": "/má-ne-dyer/", "pron_de": "/fi-li-AAL-lai-tö/"}'::jsonb,
        '{"term": "security guard", "meaning": "guardia de seguridad", "de": "Sicherheitsdienst / Wächter", "ex": "The security guard checked our bags.", "pron": "/si-kiú-ri-ti gard/", "pron_de": "/ZI-jö-haits-dinst/"}'::jsonb,
        '{"term": "shopping cart / trolley", "meaning": "carrito de la compra", "de": "Einkaufswagen", "ex": "Take a trolley at the entrance.", "pron": "/shó-ping kart/", "pron_de": "/AIN-kaufs-vaa-gen/"}'::jsonb,
        '{"term": "basket", "meaning": "cesta / canasta", "de": "Einkaufskorb", "ex": "Use a basket for a small shop.", "pron": "/bás-ket/", "pron_de": "/AIN-kaufs-korp/"}'::jsonb,
        '{"term": "aisle", "meaning": "pasillo", "de": "Gang / Regal-Reihe", "ex": "The cereals are in aisle five.", "pron": "/áil/", "pron_de": "/gang/"}'::jsonb,
        '{"term": "shelf", "meaning": "estante / balda", "de": "Regal / Regalfach", "ex": "The product is on the top shelf.", "pron": "/shelf/", "pron_de": "/re-GAAL/"}'::jsonb,
        '{"term": "fitting room", "meaning": "probador", "de": "Umkleidekabine", "ex": "Try the dress on in the fitting room.", "pron": "/fí-ting rum/", "pron_de": "/UM-klai-de-ka-bii-ne/"}'::jsonb,
        '{"term": "checkout", "meaning": "caja / punto de pago", "de": "Kasse", "ex": "Go to the checkout when you are ready.", "pron": "/chék-aut/", "pron_de": "/KA-se/"}'::jsonb,
        '{"term": "self-checkout", "meaning": "caja automática / autocaja", "de": "Selbstbedienungskasse", "ex": "Use the self-checkout to save time.", "pron": "/self-chék-aut/", "pron_de": "/ZELPST-be-dii-nungs-ka-se/"}'::jsonb,
        '{"term": "window display", "meaning": "escaparate", "de": "Schaufenster", "ex": "The window display changes every week.", "pron": "/uín-dou dis-pléi/", "pron_de": "/SHAU-fen-stö/"}'::jsonb,
        '{"term": "entrance", "meaning": "entrada", "de": "Eingang", "ex": "Meet me at the entrance to the mall.", "pron": "/én-trans/", "pron_de": "/AIN-gang/"}'::jsonb,
        '{"term": "exit", "meaning": "salida", "de": "Ausgang", "ex": "The exit is at the back of the shop.", "pron": "/ék-sit/", "pron_de": "/AUS-gang/"}'::jsonb,
        '{"term": "escalator", "meaning": "escalera mecánica", "de": "Rolltreppe", "ex": "Take the escalator to the second floor.", "pron": "/és-ka-lei-tor/", "pron_de": "/ROL-tre-pe/"}'::jsonb,
        '{"term": "lift / elevator", "meaning": "ascensor", "de": "Aufzug / Fahrstuhl", "ex": "Take the lift if you have a pushchair.", "pron": "/lift/", "pron_de": "/AUF-tsuug/"}'::jsonb,
        '{"term": "shop", "meaning": "hacer la compra / comprar", "de": "einkaufen", "ex": "I shop online every week.", "pron": "/shop/", "pron_de": "/AIN-kau-fen/"}'::jsonb,
        '{"term": "buy", "meaning": "comprar", "de": "kaufen", "ex": "Did you buy the jacket?", "pron": "/bai/", "pron_de": "/KAU-fen/"}'::jsonb,
        '{"term": "sell", "meaning": "vender", "de": "verkaufen", "ex": "They sell handmade jewellery.", "pron": "/sel/", "pron_de": "/fö-KAU-fen/"}'::jsonb,
        '{"term": "pay", "meaning": "pagar", "de": "bezahlen", "ex": "How would you like to pay?", "pron": "/pei/", "pron_de": "/bö-TSAA-len/"}'::jsonb,
        '{"term": "spend", "meaning": "gastar / invertir", "de": "ausgeben", "ex": "I spend too much money on clothes.", "pron": "/spend/", "pron_de": "/AUS-gee-ben/"}'::jsonb,
        '{"term": "afford", "meaning": "permitirse / poder pagar", "de": "sich leisten können", "ex": "I cannot afford that coat.", "pron": "/a-ford/", "pron_de": "/sich LAIS-ten/"}'::jsonb,
        '{"term": "save", "meaning": "ahorrar", "de": "sparen", "ex": "Save money by buying in bulk.", "pron": "/seiv/", "pron_de": "/SHPAA-ren/"}'::jsonb,
        '{"term": "order", "meaning": "pedir / encargar", "de": "bestellen", "ex": "Order the item online and collect in store.", "pron": "/ór-der/", "pron_de": "/bö-SHTE-len/"}'::jsonb,
        '{"term": "deliver", "meaning": "entregar / repartir", "de": "liefern", "ex": "They deliver within two working days.", "pron": "/di-lí-ver/", "pron_de": "/LII-fern/"}'::jsonb,
        '{"term": "collect", "meaning": "recoger / retirar", "de": "abholen", "ex": "Collect your parcel from the post office.", "pron": "/ko-lékt/", "pron_de": "/AP-hoo-len/"}'::jsonb,
        '{"term": "browse", "meaning": "ojear / mirar (sin comprar)", "de": "stöbern / sich umsehen", "ex": "I like to browse the shops on Saturday.", "pron": "/brauz/", "pron_de": "/SHTÖÖ-bern/"}'::jsonb,
        '{"term": "window-shop", "meaning": "mirar escaparates (sin comprar)", "de": "Schaufensterbummel machen", "ex": "We window-shopped all afternoon.", "pron": "/uín-dou shop/", "pron_de": "/SHAU-fen-stö-bu-mel/"}'::jsonb,
        '{"term": "try on", "meaning": "probarse (ropa)", "de": "anprobieren", "ex": "Try the jacket on before buying it.", "pron": "/trai on/", "pron_de": "/AN-pro-bir-en/"}'::jsonb,
        '{"term": "compare", "meaning": "comparar", "de": "vergleichen", "ex": "Compare prices before you decide.", "pron": "/kom-pér/", "pron_de": "/fö-GLAI-jen/"}'::jsonb,
        '{"term": "return", "meaning": "devolver", "de": "zurückgeben", "ex": "Return the shoes if they do not fit.", "pron": "/ri-térn/", "pron_de": "/tsu-RÜK-gee-ben/"}'::jsonb,
        '{"term": "exchange", "meaning": "cambiar / canjear", "de": "umtauschen", "ex": "Can I exchange this for a larger size?", "pron": "/iks-chéindy/", "pron_de": "/UM-tau-shen/"}'::jsonb,
        '{"term": "haggle", "meaning": "regatear", "de": "feilschen / handeln", "ex": "You can haggle at the market.", "pron": "/há-gel/", "pron_de": "/FAIL-shen/"}'::jsonb,
        '{"term": "queue", "meaning": "cola / fila", "de": "Schlange stehen / anstellen", "ex": "There was a long queue at the checkout.", "pron": "/kiu/", "pron_de": "/SHLAN-ge SHTEE-en/"}'::jsonb,
        '{"term": "price", "meaning": "precio", "de": "Preis", "ex": "What is the price of this jacket?", "pron": "/prais/", "pron_de": "/prais/"}'::jsonb,
        '{"term": "price tag", "meaning": "etiqueta de precio", "de": "Preisschild", "ex": "Check the price tag before buying.", "pron": "/prais tag/", "pron_de": "/PRAIS-shilt/"}'::jsonb,
        '{"term": "discount", "meaning": "descuento", "de": "Rabatt / Nachlass", "ex": "Students get a ten percent discount.", "pron": "/dís-kaunt/", "pron_de": "/ra-BAT/"}'::jsonb,
        '{"term": "sale", "meaning": "rebajas / liquidación", "de": "Schlussverkauf / Sale", "ex": "Everything is 30% off in the sale.", "pron": "/seil/", "pron_de": "/SHLUS-fö-kauf/"}'::jsonb,
        '{"term": "bargain", "meaning": "ganga / oferta", "de": "Schnäppchen", "ex": "This coat was a real bargain.", "pron": "/bár-gen/", "pron_de": "/SHNEP-jen/"}'::jsonb,
        '{"term": "offer", "meaning": "oferta / promoción", "de": "Angebot", "ex": "There is a buy-one-get-one-free offer.", "pron": "/ó-fer/", "pron_de": "/AN-gö-bot/"}'::jsonb,
        '{"term": "half price", "meaning": "mitad de precio", "de": "zum halben Preis", "ex": "The shoes are half price today.", "pron": "/háf prais/", "pron_de": "/zum HAL-ben PRAIS/"}'::jsonb,
        '{"term": "receipt", "meaning": "recibo / ticket de compra", "de": "Quittung / Kassenbon", "ex": "Keep your receipt in case you need a refund.", "pron": "/ri-sít/", "pron_de": "/KVI-tung/"}'::jsonb,
        '{"term": "cash", "meaning": "efectivo", "de": "Bargeld", "ex": "Do you pay by cash or card?", "pron": "/kash/", "pron_de": "/BAAR-gelt/"}'::jsonb,
        '{"term": "card", "meaning": "tarjeta (de pago)", "de": "Karte", "ex": "I will pay by card.", "pron": "/kard/", "pron_de": "/KAR-te/"}'::jsonb,
        '{"term": "debit card", "meaning": "tarjeta de débito", "de": "EC-Karte / Debitkarte", "ex": "Use your debit card at the machine.", "pron": "/dé-bit kard/", "pron_de": "/EE-TSEE-kar-te/"}'::jsonb,
        '{"term": "credit card", "meaning": "tarjeta de crédito", "de": "Kreditkarte", "ex": "I paid for the holiday by credit card.", "pron": "/kré-dit kard/", "pron_de": "/kre-DIIT-kar-te/"}'::jsonb,
        '{"term": "contactless", "meaning": "sin contacto / pago sin contacto", "de": "kontaktlos", "ex": "Tap your phone for a contactless payment.", "pron": "/kón-takt-les/", "pron_de": "/kon-TAKT-los/"}'::jsonb,
        '{"term": "PIN", "meaning": "PIN / número secreto", "de": "PIN / Geheimzahl", "ex": "Enter your PIN at the machine.", "pron": "/pin/", "pron_de": "/pin/"}'::jsonb,
        '{"term": "change", "meaning": "cambio / vuelta", "de": "Wechselgeld", "ex": "Here is your change — two euros.", "pron": "/cheindy/", "pron_de": "/VEK-sel-gelt/"}'::jsonb,
        '{"term": "refund", "meaning": "reembolso / devolución", "de": "Rückerstattung", "ex": "I got a full refund for the broken item.", "pron": "/rí-fand/", "pron_de": "/RÜK-ö-shta-tung/"}'::jsonb,
        '{"term": "voucher", "meaning": "vale / cupón", "de": "Gutschein", "ex": "Use the voucher to get ten percent off.", "pron": "/váu-cher/", "pron_de": "/GUUT-shain/"}'::jsonb,
        '{"term": "loyalty card", "meaning": "tarjeta de fidelidad", "de": "Kundenkarte / Treuekarte", "ex": "Collect points on your loyalty card.", "pron": "/lói-al-ti kard/", "pron_de": "/KUN-den-kar-te/"}'::jsonb,
        '{"term": "VAT", "meaning": "IVA", "de": "Mehrwertsteuer / MwSt.", "ex": "The price includes VAT.", "pron": "/vii-ei-tii/", "pron_de": "/MEER-vert-shtoi-ö/"}'::jsonb,
        '{"term": "invoice", "meaning": "factura", "de": "Rechnung", "ex": "Please send me an invoice by email.", "pron": "/ín-vois/", "pron_de": "/REJ-nung/"}'::jsonb,
        '{"term": "total", "meaning": "total / importe total", "de": "Gesamtbetrag / insgesamt", "ex": "The total comes to forty euros.", "pron": "/tóu-tal/", "pron_de": "/gö-ZAAMT-bö-traak/"}'::jsonb,
        '{"term": "size", "meaning": "talla / tamaño", "de": "Größe", "ex": "Do you have this in a size medium?", "pron": "/sais/", "pron_de": "/GRÖÖ-se/"}'::jsonb,
        '{"term": "brand", "meaning": "marca", "de": "Marke", "ex": "Which brand do you prefer?", "pron": "/brand/", "pron_de": "/MAR-ke/"}'::jsonb,
        '{"term": "quality", "meaning": "calidad", "de": "Qualität", "ex": "The quality of this product is excellent.", "pron": "/kuó-li-ti/", "pron_de": "/kva-li-TÄT/"}'::jsonb,
        '{"term": "warranty", "meaning": "garantía", "de": "Garantie", "ex": "The washing machine has a two-year warranty.", "pron": "/uó-ran-ti/", "pron_de": "/ga-ran-TII/"}'::jsonb,
        '{"term": "in stock", "meaning": "disponible / en stock", "de": "vorrätig / auf Lager", "ex": "Is this model in stock?", "pron": "/in stok/", "pron_de": "/FOR-rä-tig/"}'::jsonb,
        '{"term": "out of stock", "meaning": "agotado / sin existencias", "de": "nicht vorrätig / ausverkauft", "ex": "Sorry, that colour is out of stock.", "pron": "/áut ov stok/", "pron_de": "/NICHT FOR-rä-tig/"}'::jsonb,
        '{"term": "faulty", "meaning": "defectuoso / averiado", "de": "fehlerhaft / defekt", "ex": "The item was faulty so I returned it.", "pron": "/fól-ti/", "pron_de": "/FEE-lö-haft/"}'::jsonb,
        '{"term": "affordable", "meaning": "asequible / a buen precio", "de": "erschwinglich / günstig", "ex": "The menu is affordable for everyone.", "pron": "/a-fór-da-bel/", "pron_de": "/ö-SHVING-lij/"}'::jsonb,
        '{"term": "expensive", "meaning": "caro", "de": "teuer", "ex": "That restaurant is too expensive for me.", "pron": "/iks-pén-siv/", "pron_de": "/TOI-ö/"}'::jsonb,
        '{"term": "cheap", "meaning": "barato", "de": "billig / günstig", "ex": "These jeans are cheap but good quality.", "pron": "/chip/", "pron_de": "/BI-lij/"}'::jsonb,
        '{"term": "complaint", "meaning": "queja / reclamación", "de": "Beschwerde / Reklamation", "ex": "Make a complaint at the customer service desk.", "pron": "/kom-pléint/", "pron_de": "/bö-SHVER-de/"}'::jsonb,
        '{"term": "customer service", "meaning": "servicio al cliente", "de": "Kundendienst / Kundenservice", "ex": "Call customer service if you have a problem.", "pron": "/kás-to-mer sér-vis/", "pron_de": "/KUN-den-dinst/"}'::jsonb,
        '{"term": "bag", "meaning": "bolsa", "de": "Tüte / Tasche", "ex": "Do you need a bag for your shopping?", "pron": "/bag/", "pron_de": "/TÜÜ-te/"}'::jsonb,
        '{"term": "reusable bag", "meaning": "bolsa reutilizable", "de": "Mehrwegtasche", "ex": "Bring a reusable bag to avoid plastic waste.", "pron": "/ri-iú-sa-bel bag/", "pron_de": "/MEER-veg-ta-she/"}'::jsonb,
        '{"term": "wrap", "meaning": "envolver / empaquetar", "de": "einwickeln / verpacken", "ex": "Could you wrap it as a gift?", "pron": "/rap/", "pron_de": "/AIN-vi-keln/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 1115 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1115, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'Compras y Tiendas');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Einkaufen und Geschäfte');

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
