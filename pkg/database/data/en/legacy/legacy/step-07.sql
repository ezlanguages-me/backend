-- ============================================================
-- Seed: A0 English Path – STEP 12: Deck – Lugares de la Ciudad
-- Source language: Spanish
-- ============================================================

DO $$
DECLARE
  v_path_id   UUID;
  v_deck12_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO deck (path_id, step_order, source_language, type)
  VALUES (v_path_id, 12, 'en', 'deck')
  RETURNING uuid INTO v_deck12_id;

  INSERT INTO deck_translation (deck_id, language, title, description)
  VALUES (v_deck12_id, 'es', 'Lugares de la Ciudad (Inglés Americano)', 'Vocabulario extenso de lugares, tiendas, edificios e infraestructura urbana en inglés americano.');

  WITH place_data(term, pronun, meaning) AS (
    VALUES
    -- 1. Housing & Residential (Vivienda)
    ('house', 'jáus', 'Casa'),
    ('apartment', 'apártment', 'Apartamento'),
    ('apartment building', 'apártment bíldin', 'Edificio de apartamentos'),
    ('condo', 'kóndou', 'Condominio / Apartamento en propiedad'),
    ('condominium', 'kondomíniem', 'Condominio'),
    ('townhouse', 'táunjaus', 'Casa adosada'),
    ('duplex', 'dúpleks', 'Dúplex'),
    ('cabin', 'kábin', 'Cabaña'),
    ('mansion', 'mánshon', 'Mansión'),
    ('trailer', 'tréiler', 'Casa rodante'),
    ('mobile home', 'móubal jóum', 'Casa prefabricada móvil'),
    ('nursing home', 'nérsin jóum', 'Asilo de ancianos / Residencia'),
    ('shelter', 'shélter', 'Refugio / Albergue'),

    -- 2. Streets & Urban Infrastructure (Calles e Infraestructura)
    ('street', 'stríit', 'Calle'),
    ('avenue', 'áveniu', 'Avenida'),
    ('boulevard', 'búlevar', 'Bulevar'),
    ('alley', 'áli', 'Callejón'),
    ('dead end', 'ded end', 'Callejón sin salida'),
    ('cul-de-sac', 'kál-de-sak', 'Callejón sin salida (circular)'),
    ('intersection', 'intersékshon', 'Intersección / Cruce'),
    ('crosswalk', 'krósuok', 'Paso de peatones'),
    ('sidewalk', 'sáiduok', 'Acera / Vereda'),
    ('block', 'blok', 'Cuadra / Manzana'),
    ('neighborhood', 'néiborjud', 'Barrio / Vecindario'),
    ('downtown', 'dáuntaun', 'Centro de la ciudad (zona comercial)'),
    ('suburb', 'sáberb', 'Suburbio / Zona residencial'),
    ('city', 'síti', 'Ciudad'),
    ('town', 'táun', 'Pueblo / Ciudad pequeña'),
    ('village', 'vílich', 'Aldea'),
    ('square', 'skuér', 'Plaza'),

    -- 3. Shopping & Retail (Compras y Tiendas)
    ('store', 'stór', 'Tienda'),
    ('shopping mall', 'shópin mol', 'Centro comercial cerrado'),
    ('mall', 'mol', 'Centro comercial'),
    ('strip mall', 'strip mol', 'Centro comercial abierto (en línea)'),
    ('outlet mall', 'áutlet mol', 'Centro comercial de descuentos'),
    ('grocery store', 'gróuseri stor', 'Tienda de comestibles / Supermercado'),
    ('supermarket', 'súpermarket', 'Supermercado'),
    ('convenience store', 'konvíniens stor', 'Tienda de conveniencia / Minimarket'),
    ('drugstore', 'drágstor', 'Farmacia (con venta de artículos varios)'),
    ('pharmacy', 'fármasi', 'Farmacia (solo medicamentos)'),
    ('hardware store', 'járdwer stor', 'Ferretería'),
    ('pet store', 'pet stor', 'Tienda de mascotas'),
    ('liquor store', 'líkor stor', 'Licorería'),
    ('bakery', 'béikeri', 'Panadería'),
    ('butcher shop', 'búcher shop', 'Carnicería'),
    ('bookstore', 'búkstor', 'Librería'),
    ('shoe store', 'shú stor', 'Zapatería'),
    ('clothing store', 'klóudin stor', 'Tienda de ropa'),
    ('jewelry store', 'llúelri stor', 'Joyería'),
    ('flower shop', 'fláuer shop', 'Florería'),
    ('toy store', 'tói stor', 'Juguetería'),
    ('electronics store', 'ilektróniks stor', 'Tienda de electrónica'),
    ('department store', 'dipártment stor', 'Tienda departamental'),
    ('thrift store', 'zrift stor', 'Tienda de segunda mano'),
    ('pawn shop', 'pon shop', 'Casa de empeño'),
    ('laundromat', 'lóndromat', 'Lavandería automática'),
    ('dry cleaner', 'drái klíner', 'Tintorería'),
    ('hair salon', 'jer salón', 'Peluquería'),
    ('barber shop', 'bárber shop', 'Barbería'),
    ('nail salon', 'néil salón', 'Salón de manicura'),
    ('car dealership', 'kar dílership', 'Concesionario de autos'),

    -- 4. Food & Dining (Comida y Restaurantes)
    ('restaurant', 'réstorant', 'Restaurante'),
    ('fast food restaurant', 'fast fud réstorant', 'Restaurante de comida rápida'),
    ('diner', 'dáiner', 'Cenador / Restaurante típico americano'),
    ('cafe', 'kaféi', 'Cafetería'),
    ('coffee shop', 'kófi shop', 'Cafetería (especializada)'),
    ('food court', 'fud kort', 'Patio de comidas'),
    ('food truck', 'fud trak', 'Camión de comida'),
    ('steakhouse', 'stéikjaus', 'Asador / Restaurante de carnes'),
    ('bar', 'bar', 'Bar'),
    ('pub', 'pab', 'Pub'),
    ('tavern', 'távern', 'Taberna'),
    ('dive bar', 'dáiv bar', 'Bar de mala muerte / Bar local barato'),
    ('sports bar', 'sports bar', 'Bar deportivo'),
    ('ice cream parlor', 'áis krím párlor', 'Heladería'),
    ('deli', 'déli', 'Tienda de delicatessen / Emparedados'),
    ('cafeteria', 'kafiríria', 'Comedor escolar o laboral'),
    ('drive-thru', 'dráiv-zru', 'Autoservicio (comida desde el auto)'),
    ('pizzeria', 'pitsería', 'Pizzería'),

    -- 5. Public Services & Institutions (Servicios Públicos e Instituciones)
    ('school', 'skúul', 'Escuela'),
    ('preschool', 'prískul', 'Preescolar'),
    ('kindergarten', 'kíndergarten', 'Jardín de niños'),
    ('elementary school', 'eleméntari skul', 'Escuela primaria'),
    ('middle school', 'mídol skul', 'Escuela secundaria (grados 6-8)'),
    ('junior high', 'llúnior jái', 'Secundaria menor (grados 7-8)'),
    ('high school', 'jái skul', 'Escuela preparatoria/secundaria (grados 9-12)'),
    ('college', 'kólich', 'Universidad (generalmente de 4 años)'),
    ('university', 'iunivérsiti', 'Universidad (con posgrados)'),
    ('campus', 'kámpus', 'Campus universitario'),
    ('library', 'láibrari', 'Biblioteca'),
    ('museum', 'miuzíem', 'Museo'),
    ('city hall', 'síti jol', 'Ayuntamiento / Alcaldía'),
    ('courthouse', 'kórtjaus', 'Palacio de justicia / Tribunal'),
    ('embassy', 'émbasi', 'Embajada'),
    ('post office', 'póust ófis', 'Oficina de correos'),
    ('fire station', 'fáier stéishon', 'Estación de bomberos'),
    ('police station', 'polís stéishon', 'Estación de policía'),
    ('jail', 'lléil', 'Cárcel (local/temporal)'),
    ('prison', 'prízon', 'Prisión (estatal/federal)'),
    ('hospital', 'jóspital', 'Hospital'),
    ('clinic', 'klínik', 'Clínica'),
    ('urgent care', 'érllent ker', 'Centro de atención de urgencias'),
    ('dental clinic', 'déntal klínik', 'Clínica dental'),
    ('church', 'cherch', 'Iglesia'),
    ('cathedral', 'kazídral', 'Catedral'),
    ('temple', 'témpol', 'Templo'),
    ('mosque', 'mosk', 'Mezquita'),
    ('synagogue', 'sínagog', 'Sinagoga'),
    ('cemetery', 'sémeteri', 'Cementerio'),

    -- 6. Entertainment & Recreation (Entretenimiento y Recreación)
    ('movie theater', 'múvi zíater', 'Cine'),
    ('theater', 'zíater', 'Teatro (para obras teatrales)'),
    ('stadium', 'stéidiem', 'Estadio'),
    ('arena', 'arína', 'Arena / Coliseo cerrado'),
    ('ballpark', 'bólpark', 'Estadio de béisbol'),
    ('zoo', 'zu', 'Zoológico'),
    ('aquarium', 'akuáriem', 'Acuario'),
    ('amusement park', 'amiúzment park', 'Parque de atracciones'),
    ('theme park', 'zíim park', 'Parque temático'),
    ('water park', 'uóter park', 'Parque acuático'),
    ('gym', 'llim', 'Gimnasio'),
    ('fitness center', 'fítnes sénter', 'Centro de acondicionamiento físico'),
    ('rec center', 'rek sénter', 'Centro recreativo (recreation center)'),
    ('bowling alley', 'bóulin áli', 'Bolera / Boliche'),
    ('skating rink', 'skéitin rink', 'Pista de patinaje (hielo o ruedas)'),
    ('casino', 'kasínou', 'Casino'),
    ('nightclub', 'náitklab', 'Club nocturno / Discoteca'),
    ('country club', 'kántri klab', 'Club de campo (exclusivo)'),
    ('golf course', 'golf kors', 'Campo de golf'),
    ('playground', 'pléigraund', 'Parque infantil'),
    ('park', 'park', 'Parque público'),
    ('botanical garden', 'botánikal gárden', 'Jardín botánico'),

    -- 7. Transportation, Industrial & Lodging (Transporte, Industria y Alojamiento)
    ('airport', 'érport', 'Aeropuerto'),
    ('train station', 'tréin stéishon', 'Estación de tren'),
    ('bus station', 'bas stéishon', 'Estación de autobuses (terminal)'),
    ('bus stop', 'bas stop', 'Parada de autobús'),
    ('subway station', 'sábuei stéishon', 'Estación de metro'),
    ('gas station', 'gas stéishon', 'Gasolinera'),
    ('parking lot', 'párkin lot', 'Estacionamiento (al aire libre)'),
    ('parking garage', 'párkin garách', 'Estacionamiento (edificio de varios niveles)'),
    ('rest stop', 'rest stop', 'Área de descanso (en autopistas)'),
    ('toll booth', 'tóul bud', 'Cabina de peaje'),
    ('freeway', 'fríuei', 'Autopista (gratuita)'),
    ('highway', 'jáiuei', 'Carretera / Autopista'),
    ('port', 'port', 'Puerto'),
    ('dock', 'dok', 'Muelle'),
    ('pier', 'píir', 'Muelle / Espigón'),
    ('marina', 'marína', 'Puerto deportivo'),
    ('factory', 'fáktori', 'Fábrica'),
    ('warehouse', 'uérjaus', 'Almacén / Bodega'),
    ('workshop', 'uórkshop', 'Taller'),
    ('power plant', 'páuer plant', 'Planta de energía'),
    ('junkyard', 'llánkyard', 'Depósito de chatarra / Deshuesadero'),
    ('office', 'ófis', 'Oficina'),
    ('office building', 'ófis bíldin', 'Edificio de oficinas'),
    ('skyscraper', 'skáiskreiper', 'Rascacielos'),
    ('motel', 'moutél', 'Motel'),
    ('hotel', 'joutél', 'Hotel'),
    ('inn', 'in', 'Posada / Hotel pequeño'),
    ('resort', 'rizórt', 'Resort / Complejo turístico')
  ),
  inserted_words AS (
    INSERT INTO word (term, is_root, source_language)
    SELECT term, true, 'en' FROM place_data
    RETURNING uuid, term
  ),
  linked_deck AS (
    INSERT INTO deck_words (deck_id, word_id)
    SELECT v_deck12_id, uuid FROM inserted_words
  )
  INSERT INTO word_translation (word_id, language, pronunciation, meaning)
  SELECT
    iw.uuid,
    'es',
    pd.pronun,
    jsonb_build_array(jsonb_build_object('kind', 'NOUN', 'definition', pd.meaning))
  FROM inserted_words iw
  JOIN place_data pd ON iw.term = pd.term;

END;
$$;
