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
        '{"term": "supermarket", "meaning": "supermercado", "de": "Supermarkt", "ex": "We buy milk at the supermarket.", "pron": "/ˈsuːpəmɑːkɪt/", "pron_de": "/ˈsuːpəmɑːkɪt/"}'::jsonb,
        '{"term": "department store", "meaning": "grandes almacenes", "de": "Kaufhaus", "ex": "The department store has five floors.", "pron": "/dɪˈpɑːtmənt stɔː/", "pron_de": "/dɪˈpɑːtmənt stɔː/"}'::jsonb,
        '{"term": "bakery", "meaning": "panadería", "de": "Bäckerei", "ex": "The bakery sells fresh rolls.", "pron": "/ˈbeɪkəri/", "pron_de": "/ˈbeɪkəri/"}'::jsonb,
        '{"term": "butcher", "meaning": "carnicería, carnicero", "de": "Metzger", "ex": "The butcher has chicken and beef.", "pron": "/ˈbʊtʃə/", "pron_de": "/ˈbʊtʃə/"}'::jsonb,
        '{"term": "greengrocer", "meaning": "frutería, verdulero", "de": "Obst- und Gemüsehändler", "ex": "The greengrocer has cheap apples today.", "pron": "/ˈɡriːnˌɡrəʊsə/", "pron_de": "/ˈɡriːnˌɡrəʊsə/"}'::jsonb,
        '{"term": "pharmacy", "meaning": "farmacia", "de": "Apotheke", "ex": "The pharmacy is open on Sundays.", "pron": "/ˈfɑːməsi/", "pron_de": "/ˈfɑːməsi/"}'::jsonb,
        '{"term": "bookshop", "meaning": "librería", "de": "Buchhandlung", "ex": "I buy a notebook at the bookshop.", "pron": "/ˈbʊkʃɒp/", "pron_de": "/ˈbʊkʃɒp/"}'::jsonb,
        '{"term": "clothes shop", "meaning": "tienda de ropa", "de": "Kleidungsgeschäft", "ex": "The clothes shop has blue jackets.", "pron": "/ˈkləʊðz ʃɒp/", "pron_de": "/ˈkləʊðz ʃɒp/"}'::jsonb,
        '{"term": "shoe shop", "meaning": "zapatería", "de": "Schuhladen", "ex": "The shoe shop is next to the bank.", "pron": "/ˈʃuː ʃɒp/", "pron_de": "/ˈʃuː ʃɒp/"}'::jsonb,
        '{"term": "cashier", "meaning": "cajero, cajera", "de": "Kassierer, Kassiererin", "ex": "The cashier gives me the receipt.", "pron": "/kæˈʃɪə/", "pron_de": "/kæˈʃɪə/"}'::jsonb,
        '{"term": "checkout", "meaning": "caja", "de": "Kasse", "ex": "The checkout is near the exit.", "pron": "/ˈtʃekaʊt/", "pron_de": "/ˈtʃekaʊt/"}'::jsonb,
        '{"term": "shopping cart", "meaning": "carrito de la compra", "de": "Einkaufswagen", "ex": "The shopping cart is full of food.", "pron": "/ˈʃɒpɪŋ kɑːt/", "pron_de": "/ˈʃɒpɪŋ kɑːt/"}'::jsonb,
        '{"term": "basket", "meaning": "cesta", "de": "Korb", "ex": "Take a basket for small items.", "pron": "/ˈbɑːskɪt/", "pron_de": "/ˈbɑːskɪt/"}'::jsonb,
        '{"term": "aisle", "meaning": "pasillo", "de": "Gang", "ex": "Rice is in aisle three.", "pron": "/aɪl/", "pron_de": "/aɪl/"}'::jsonb,
        '{"term": "shelf", "meaning": "estante", "de": "Regal", "ex": "The tea is on the top shelf.", "pron": "/ʃelf/", "pron_de": "/ʃelf/"}'::jsonb,
        '{"term": "price tag", "meaning": "etiqueta de precio", "de": "Preisschild", "ex": "Look at the price tag first.", "pron": "/ˈpraɪs tæɡ/", "pron_de": "/ˈpraɪs tæɡ/"}'::jsonb,
        '{"term": "receipt", "meaning": "recibo, ticket", "de": "Kassenbon", "ex": "Keep the receipt in your bag.", "pron": "/rɪˈsiːt/", "pron_de": "/rɪˈsiːt/"}'::jsonb,
        '{"term": "discount", "meaning": "descuento", "de": "Rabatt", "ex": "There is a discount on soap today.", "pron": "/ˈdɪskaʊnt/", "pron_de": "/ˈdɪskaʊnt/"}'::jsonb,
        '{"term": "sale", "meaning": "rebajas, oferta", "de": "Ausverkauf, Sale", "ex": "The red sign says sale.", "pron": "/seɪl/", "pron_de": "/seɪl/"}'::jsonb,
        '{"term": "fitting room", "meaning": "probador", "de": "Umkleidekabine", "ex": "The fitting room is on the second floor.", "pron": "/ˈfɪtɪŋ ruːm/", "pron_de": "/ˈfɪtɪŋ ruːm/"}'::jsonb,
        '{"term": "size", "meaning": "talla", "de": "Größe", "ex": "I need size 38, please.", "pron": "/saɪz/", "pron_de": "/saɪz/"}'::jsonb,
        '{"term": "cash", "meaning": "efectivo", "de": "Bargeld", "ex": "Do you pay by cash or card?", "pron": "/kæʃ/", "pron_de": "/kæʃ/"}'::jsonb,
        '{"term": "card", "meaning": "tarjeta", "de": "Karte", "ex": "I pay by card.", "pron": "/kɑːd/", "pron_de": "/kɑːd/"}'::jsonb,
        '{"term": "customer", "meaning": "cliente", "de": "Kunde", "ex": "The customer asks for a receipt.", "pron": "/ˈkʌstəmə/", "pron_de": "/ˈkʌstəmə/"}'::jsonb,
        '{"term": "shop assistant", "meaning": "dependiente, dependienta", "de": "Verkäufer, Verkäuferin", "ex": "The shop assistant is very helpful.", "pron": "/ʃɒp əˈsɪstənt/", "pron_de": "/ʃɒp əˈsɪstənt/"}'::jsonb,
        '{"term": "return", "meaning": "devolver, devolución", "de": "zurückgeben, Rückgabe", "ex": "You can return the shirt tomorrow.", "pron": "/rɪˈtɜːn/", "pron_de": "/rɪˈtɜːn/"}'::jsonb,
        '{"term": "exchange", "meaning": "cambiar, cambio", "de": "umtauschen, Umtausch", "ex": "Can I exchange these shoes?", "pron": "/ɪksˈtʃeɪndʒ/", "pron_de": "/ɪksˈtʃeɪndʒ/"}'::jsonb,
        '{"term": "open", "meaning": "abierto", "de": "offen", "ex": "The toy shop is open until 8 PM.", "pron": "/ˈəʊpən/", "pron_de": "/ˈəʊpən/"}'::jsonb,
        '{"term": "closed", "meaning": "cerrado", "de": "geschlossen", "ex": "The bakery is closed on Monday.", "pron": "/kləʊzd/", "pron_de": "/kləʊzd/"}'::jsonb,
        '{"term": "bag", "meaning": "bolsa", "de": "Tasche", "ex": "Do you need a bag?", "pron": "/bæɡ/", "pron_de": "/bæɡ/"}'::jsonb,
        '{"term": "queue", "meaning": "cola", "de": "Schlange", "ex": "There is a long queue at the checkout.", "pron": "/kjuː/", "pron_de": "/kjuː/"}'::jsonb,
        '{"term": "bargain", "meaning": "ganga", "de": "Schnäppchen", "ex": "This coat is a real bargain.", "pron": "/ˈbɑːɡən/", "pron_de": "/ˈbɑːɡən/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 1115 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1115, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES
        (v_deck_id, 'es', 'Compras y Tiendas', 'Vocabulario esencial sobre tipos de tienda, productos, pago y atención al cliente.'),
        (v_deck_id, 'de', 'Einkaufen und Geschäfte', 'Grundwortschatz zu Geschäftsarten, Produkten, Bezahlen und Kundenservice.');

    FOREACH card IN ARRAY v_cards LOOP
        INSERT INTO word (term, is_root, source_language, example)
        VALUES (card->>'term', TRUE, 'en', card->>'ex')
        RETURNING uuid INTO v_word_id;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES
            (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron'),
            (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');

        INSERT INTO deck_words (deck_uuid, word_uuid)
        VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;
