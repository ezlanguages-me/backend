-- ============================================================
-- Seed: A0 English Path – STEP 330 – Deck – El Entorno Inmediato I (El Hogar: habitaciones, objetos y mobiliario)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_deck_id UUID; 
    v_root_id UUID; 
    v_item JSONB;
    v_house_vocab JSONB[] := ARRAY[
        -- ==========================================
        -- 1. TIPOS DE VIVIENDA, EXTERIORES Y ARQUITECTURA
        -- ==========================================
        '{"v":"house","es":"casa","de":"Haus","pron":"/háus/","pron_de":"/HAUS/"}',
        '{"v":"apartment","es":"apartamento / piso","de":"Wohnung","pron":"/a-párt-ment/","pron_de":"/ö-PAAT-mönt/"}',
        '{"v":"building","es":"edificio","de":"Gebäude","pron":"/bíl-din/","pron_de":"/BIL-ding/"}',
        '{"v":"condo (condominium)","es":"condominio / piso en propiedad","de":"Eigentumswohnung","pron":"/kón-dou/","pron_de":"/KON-dou/"}',
        '{"v":"townhouse","es":"casa adosada","de":"Reihenhaus","pron":"/táun-haus/","pron_de":"/TAUN-haus/"}',
        '{"v":"front yard","es":"jardín delantero (US)","de":"Vorgarten","pron":"/frant iard/","pron_de":"/FRANT jaad/"}',
        '{"v":"backyard","es":"patio trasero (US)","de":"Hinterhof","pron":"/bák-iard/","pron_de":"/BÄK-jaad/"}',
        '{"v":"garage","es":"garaje","de":"Garage","pron":"/ga-rásh/","pron_de":"/gö-RAASCH/"}',
        '{"v":"roof","es":"techo / tejado","de":"Dach","pron":"/ruf/","pron_de":"/RUUF/"}',
        '{"v":"shingles","es":"tejas","de":"Dachschindeln","pron":"/shín-gols/","pron_de":"/SCHING-öls/"}',
        '{"v":"gutter","es":"canalón","de":"Dachrinne","pron":"/gá-ter/","pron_de":"/GA-tö/"}',
        '{"v":"downspout","es":"bajante de agua","de":"Fallrohr","pron":"/dáun-spaut/","pron_de":"/DAUN-spaut/"}',
        '{"v":"wall","es":"pared / muro","de":"Wand","pron":"/uol/","pron_de":"/WOOL/"}',
        '{"v":"floor","es":"suelo / piso","de":"Boden","pron":"/flor/","pron_de":"/FLOOR/"}',
        '{"v":"ceiling","es":"techo (interior)","de":"Decke","pron":"/sí-lin/","pron_de":"/SIE-ling/"}',
        '{"v":"window","es":"ventana","de":"Fenster","pron":"/uín-dou/","pron_de":"/WIN-dou/"}',
        '{"v":"windowsill","es":"alféizar de la ventana","de":"Fensterbank","pron":"/uín-dou-sil/","pron_de":"/WIN-dou-sil/"}',
        '{"v":"shutters","es":"contraventanas","de":"Fensterläden","pron":"/shá-ters/","pron_de":"/SCHA-törs/"}',
        '{"v":"door","es":"puerta","de":"Tür","pron":"/dor/","pron_de":"/DOOR/"}',
        '{"v":"front door","es":"puerta principal","de":"Haustür","pron":"/frant dor/","pron_de":"/FRANT DOOR/"}',
        '{"v":"fence","es":"cerca / valla","de":"Zaun","pron":"/fens/","pron_de":"/FENS/"}',
        '{"v":"gate","es":"verja / puerta exterior","de":"Tor","pron":"/guéit/","pron_de":"/GEJT/"}',
        '{"v":"driveway","es":"entrada para el auto","de":"Einfahrt","pron":"/drái-vuei/","pron_de":"/DRAIV-wej/"}',
        '{"v":"mailbox","es":"buzón","de":"Briefkasten","pron":"/méil-boks/","pron_de":"/MEJL-boks/"}',
        '{"v":"chimney","es":"chimenea (exterior)","de":"Schornstein","pron":"/chím-ni/","pron_de":"/TSCHIM-ni/"}',
        '{"v":"balcony","es":"balcón","de":"Balkon","pron":"/bál-ko-ni/","pron_de":"/BÄL-kö-ni/"}',
        '{"v":"porch","es":"porche / pórtico","de":"Veranda","pron":"/porch/","pron_de":"/OORTSCH/"}',
        '{"v":"deck","es":"terraza de madera","de":"Holzterrasse","pron":"/dek/","pron_de":"/DEK/"}',
        '{"v":"patio","es":"patio (pavimentado)","de":"Innenhof","pron":"/pá-ti-ou/","pron_de":"/PÄ-ti-ou/"}',
        '{"v":"lawn","es":"césped","de":"Rasen","pron":"/lon/","pron_de":"/LOON/"}',
        '{"v":"flower bed","es":"arriate / parterre de flores","de":"Blumenbeet","pron":"/fláu-er bed/","pron_de":"/FLAU-ö BED/"}',
        '{"v":"sprinkler","es":"aspersor","de":"Sprinkler","pron":"/sprín-kler/","pron_de":"/SPRING-klö/"}',
        '{"v":"hose","es":"manguera","de":"Gartenschlauch","pron":"/hóus/","pron_de":"/HOUS/"}',
        '{"v":"shed","es":"cobertizo","de":"Schuppen","pron":"/shed/","pron_de":"/SCHED/"}',
        '{"v":"doorbell","es":"timbre","de":"Türklingel","pron":"/dór-bel/","pron_de":"/DOOR-bel/"}',
        '{"v":"swimming pool","es":"piscina","de":"Schwimmbecken","pron":"/suí-min pul/","pron_de":"/SWIM-ing PUUL/"}',
        
        -- ==========================================
        -- 2. HABITACIONES Y ÁREAS (Rooms)
        -- ==========================================
        '{"v":"room","es":"habitación / cuarto","de":"Zimmer","pron":"/rum/","pron_de":"/RUUM/"}',
        '{"v":"living room","es":"sala de estar / salón","de":"Wohnzimmer","pron":"/lí-vin rum/","pron_de":"/LIV-ing RUUM/"}',
        '{"v":"bedroom","es":"dormitorio","de":"Schlafzimmer","pron":"/béd-rum/","pron_de":"/BED-ruum/"}',
        '{"v":"master bedroom","es":"dormitorio principal","de":"Hauptschlafzimmer","pron":"/más-ter béd-rum/","pron_de":"/MÄS-tö BED-ruum/"}',
        '{"v":"guest room","es":"habitación de invitados","de":"Gästezimmer","pron":"/guest rum/","pron_de":"/GUEST RUUM/"}',
        '{"v":"bathroom","es":"baño","de":"Badezimmer","pron":"/báz-rum/","pron_de":"/BÄS-ruum/"}',
        '{"v":"half bath","es":"medio baño (sin ducha)","de":"Gäste-WC","pron":"/haf baz/","pron_de":"/HÄF BÄS/"}',
        '{"v":"kitchen","es":"cocina (habitación)","de":"Küche","pron":"/kí-chen/","pron_de":"/KI-tschin/"}',
        '{"v":"dining room","es":"comedor","de":"Esszimmer","pron":"/dái-nin rum/","pron_de":"/DAI-ning RUUM/"}',
        '{"v":"laundry room","es":"cuarto de lavado","de":"Waschraum","pron":"/lón-dri rum/","pron_de":"/LOON-dri RUUM/"}',
        '{"v":"utility room","es":"cuarto de servicio/máquinas","de":"Abstellraum","pron":"/iu-tí-li-ti rum/","pron_de":"/juu-TI-li-ti RUUM/"}',
        '{"v":"basement","es":"sótano","de":"Keller","pron":"/béis-ment/","pron_de":"/BEJS-mönt/"}',
        '{"v":"cellar","es":"bodega / sótano pequeño","de":"Weinkeller","pron":"/sé-lar/","pron_de":"/SE-lö/"}',
        '{"v":"attic","es":"ático","de":"Dachboden","pron":"/á-tik/","pron_de":"/Ä-tik/"}',
        '{"v":"hallway","es":"pasillo","de":"Flur","pron":"/hól-uei/","pron_de":"/HOOL-wej/"}',
        '{"v":"stairs","es":"escaleras","de":"Treppe","pron":"/sters/","pron_de":"/STERS/"}',
        '{"v":"landing","es":"rellano de la escalera","de":"Treppenabsatz","pron":"/lán-din/","pron_de":"/LÄN-ding/"}',
        '{"v":"pantry","es":"despensa","de":"Vorratskammer","pron":"/pán-tri/","pron_de":"/PÄN-tri/"}',
        '{"v":"nursery","es":"cuarto del bebé","de":"Kinderzimmer","pron":"/nér-se-ri/","pron_de":"/NÖ-sö-ri/"}',
        '{"v":"home office","es":"despacho / oficina en casa","de":"Heimbüro","pron":"/hóum ó-fis/","pron_de":"/HOUM O-fis/"}',
        '{"v":"walk-in closet","es":"vestidor","de":"Begehbarer Kleiderschrank","pron":"/uók-in kló-set/","pron_de":"/WOOK-in KLO-sit/"}',
        '{"v":"mudroom","es":"recibidor (para abrigos/zapatos sucios)","de":"Windfang","pron":"/mád-rum/","pron_de":"/MAD-ruum/"}',
        '{"v":"playroom","es":"cuarto de juegos","de":"Spielzimmer","pron":"/pléi-rum/","pron_de":"/PLEJ-ruum/"}',
        '{"v":"foyer / entryway","es":"entrada / vestíbulo","de":"Eingangshalle","pron":"/fói-er / én-tri-uei/","pron_de":"/FOI-ö / EN-tri-wej/"}',
        
        -- ==========================================
        -- 3. MUEBLES (Furniture)
        -- ==========================================
        '{"v":"furniture","es":"muebles / mobiliario","de":"Möbel","pron":"/fér-ni-cher/","pron_de":"/FÖ-ni-tschö/"}',
        '{"v":"sofa / couch","es":"sofá","de":"Sofa / Couch","pron":"/sóu-fa / káuch/","pron_de":"/SOU-fö / KAUTSCH/"}',
        '{"v":"sectional","es":"sofá esquinero / modular","de":"Ecksofa","pron":"/sék-sho-nal/","pron_de":"/SEK-schö-nöl/"}',
        '{"v":"loveseat","es":"sofá de dos plazas","de":"Zweisitzer","pron":"/láv-sit/","pron_de":"/LAV-siet/"}',
        '{"v":"armchair","es":"sillón","de":"Sessel","pron":"/árm-cher/","pron_de":"/AARM-tschö/"}',
        '{"v":"recliner","es":"sillón reclinable","de":"Liegestuhl","pron":"/ri-klái-ner/","pron_de":"/ri-KLAI-nö/"}',
        '{"v":"rocking chair","es":"mecedora","de":"Schaukelstuhl","pron":"/ró-kin cher/","pron_de":"/RO-king TSCHÖ/"}',
        '{"v":"ottoman","es":"puf / reposapiés","de":"Polsterhocker","pron":"/ó-to-man/","pron_de":"/O-tö-mön/"}',
        '{"v":"coffee table","es":"mesa de centro","de":"Couchtisch","pron":"/kó-fi téi-bol/","pron_de":"/KO-fi TEJ-böl/"}',
        '{"v":"end table","es":"mesa auxiliar / lateral","de":"Beistelltisch","pron":"/end téi-bol/","pron_de":"/END TEJ-böl/"}',
        '{"v":"bed","es":"cama","de":"Bett","pron":"/bed/","pron_de":"/BED/"}',
        '{"v":"bunk bed","es":"litera","de":"Etagenbett","pron":"/bank bed/","pron_de":"/BANGK BED/"}',
        '{"v":"daybed","es":"diván / cama de día","de":"Tagesbett","pron":"/déi-bed/","pron_de":"/DEJ-bed/"}',
        '{"v":"headboard","es":"cabecero de la cama","de":"Kopfteil","pron":"/héd-bord/","pron_de":"/HED-bood/"}',
        '{"v":"closet","es":"armario (US)","de":"Einbauschrank","pron":"/kló-set/","pron_de":"/KLO-sit/"}',
        '{"v":"wardrobe","es":"armario (mueble independiente)","de":"Kleiderschrank","pron":"/uór-droub/","pron_de":"/WOOR-droub/"}',
        '{"v":"dresser","es":"cómoda (mueble con cajones)","de":"Kommode","pron":"/dré-ser/","pron_de":"/DRE-sö/"}',
        '{"v":"nightstand","es":"mesita de noche (US)","de":"Nachttisch","pron":"/náit-stand/","pron_de":"/NAIT-ständ/"}',
        '{"v":"desk","es":"escritorio","de":"Schreibtisch","pron":"/desk/","pron_de":"/DESK/"}',
        '{"v":"swivel chair","es":"silla giratoria / de oficina","de":"Drehstuhl","pron":"/suí-vel cher/","pron_de":"/SWI-völ TSCHÖ/"}',
        '{"v":"dining table","es":"mesa de comedor","de":"Esstisch","pron":"/dái-nin téi-bol/","pron_de":"/DAI-ning TEJ-böl/"}',
        '{"v":"chair","es":"silla","de":"Stuhl","pron":"/cher/","pron_de":"/TSCHÖ/"}',
        '{"v":"high chair","es":"trona (silla para bebé)","de":"Kinderhochstuhl","pron":"/hái cher/","pron_de":"/HAI TSCHÖ/"}',
        '{"v":"stool","es":"taburete","de":"Hocker","pron":"/stul/","pron_de":"/STUUL/"}',
        '{"v":"bench","es":"banco (de sentarse)","de":"Bank","pron":"/bench/","pron_de":"/BENTSCH/"}',
        '{"v":"bookshelf / bookcase","es":"estantería para libros","de":"Bücherregal","pron":"/búk-shelf / búk-keis/","pron_de":"/BUK-schelf / BUK-kejs/"}',
        '{"v":"TV stand","es":"mueble para el televisor","de":"Fernsehschrank","pron":"/tí-ví stand/","pron_de":"/TIE-VIE STÄND/"}',
        '{"v":"china cabinet","es":"vitrina para la vajilla","de":"Vitrine","pron":"/chái-na ká-bi-net/","pron_de":"/TSCHAI-nö KÄ-bi-nit/"}',
        '{"v":"crib","es":"cuna","de":"Kinderbett","pron":"/krib/","pron_de":"/KRIB/"}',
        
        -- ==========================================
        -- 4. ROPA DE CAMA, TEXTILES Y DECORACIÓN
        -- ==========================================
        '{"v":"mattress","es":"colchón","de":"Matratze","pron":"/má-tres/","pron_de":"/MÄ-tris/"}',
        '{"v":"fitted sheet","es":"sábana bajera (ajustable)","de":"Spannbettlaken","pron":"/fí-ted shit/","pron_de":"/FI-tid SCHIET/"}',
        '{"v":"flat sheet","es":"sábana encimera","de":"Bettlaken","pron":"/flat shit/","pron_de":"/FLÄT SCHIET/"}',
        '{"v":"blanket","es":"manta / cobija","de":"Decke","pron":"/blán-ket/","pron_de":"/BLÄNG-kit/"}',
        '{"v":"comforter","es":"edredón (US)","de":"Steppdecke","pron":"/kóm-for-ter/","pron_de":"/KAM-fö-tö/"}',
        '{"v":"duvet","es":"funda nórdica / plumón","de":"Bettdecke","pron":"/du-véi/","pron_de":"/duu-WEJ/"}',
        '{"v":"quilt","es":"colcha / edredón cosido","de":"Steppdecke / Quilt","pron":"/kuilt/","pron_de":"/KWILT/"}',
        '{"v":"pillow","es":"almohada","de":"Kopfkissen","pron":"/pí-lou/","pron_de":"/PI-lou/"}',
        '{"v":"pillowcase","es":"funda de almohada","de":"Kissenbezug","pron":"/pí-lou-keis/","pron_de":"/PI-lou-kejs/"}',
        '{"v":"throw pillow","es":"cojín decorativo","de":"Zierkissen","pron":"/zróu pí-lou/","pron_de":"/SSROU PI-lou/"}',
        '{"v":"cushion","es":"cojín","de":"Kissen","pron":"/kú-shon/","pron_de":"/KU-schön/"}',
        '{"v":"rug","es":"alfombra (de área)","de":"Teppich","pron":"/rag/","pron_de":"/RAG/"}',
        '{"v":"carpet","es":"moqueta / alfombra de pared a pared","de":"Teppichboden","pron":"/kár-pet/","pron_de":"/KAAR-pit/"}',
        '{"v":"curtains","es":"cortinas","de":"Vorhänge","pron":"/kér-tens/","pron_de":"/KÖ-töns/"}',
        '{"v":"drapes","es":"cortinajes (gruesos)","de":"Schwere Vorhänge","pron":"/dréips/","pron_de":"/DREJS/"}',
        '{"v":"blinds","es":"persianas","de":"Jalousien","pron":"/bláinds/","pron_de":"/BLAINDS/"}',
        '{"v":"lamp","es":"lámpara","de":"Lampe","pron":"/lamp/","pron_de":"/LÄMP/"}',
        '{"v":"lampshade","es":"pantalla de lámpara","de":"Lampenschirm","pron":"/lámp-sheid/","pron_de":"/LÄMP-schejd/"}',
        '{"v":"chandelier","es":"araña de luces","de":"Kronleuchter","pron":"/shan-de-líer/","pron_de":"/schän-dö-LIÖ/"}',
        '{"v":"ceiling fan","es":"ventilador de techo","de":"Deckenventilator","pron":"/sí-lin fan/","pron_de":"/SIE-ling FÄN/"}',
        '{"v":"mirror","es":"espejo","de":"Spiegel","pron":"/mí-ror/","pron_de":"/MI-rö/"}',
        '{"v":"picture frame","es":"marco de fotos","de":"Bilderrahmen","pron":"/pík-cher fréim/","pron_de":"/PIK-tschö FREJM/"}',
        '{"v":"painting","es":"cuadro / pintura","de":"Gemälde","pron":"/péin-tin/","pron_de":"/PEJN-ting/"}',
        '{"v":"vase","es":"jarrón / florero","de":"Vase","pron":"/véis/","pron_de":"/VEJS/"}',
        '{"v":"fireplace","es":"chimenea (interior)","de":"Kamin","pron":"/fáir-pleis/","pron_de":"/FAIÖ-plejs/"}',
        '{"v":"mantel","es":"repisa de la chimenea","de":"Kaminsims","pron":"/mán-tol/","pron_de":"/MÄN-töl/"}',
        '{"v":"firewood","es":"leña","de":"Brennholz","pron":"/fáir-uud/","pron_de":"/FAIÖ-wud/"}',
        
        -- ==========================================
        -- 5. COCINA: ELECTRODOMÉSTICOS Y UTENSILIOS
        -- ==========================================
        '{"v":"appliance","es":"electrodoméstico","de":"Haushaltsgerät","pron":"/a-plái-ans/","pron_de":"/ö-PLAI-öns/"}',
        '{"v":"stove","es":"estufa / cocina de fogones (US)","de":"Herd","pron":"/stóuv/","pron_de":"/STOUV/"}',
        '{"v":"oven","es":"horno","de":"Ofen","pron":"/ó-ven/","pron_de":"/A-vön/"}',
        '{"v":"range hood","es":"campana extractora","de":"Dunstabzugshaube","pron":"/reinch hud/","pron_de":"/REJNDSCH HUD/"}',
        '{"v":"refrigerator / fridge","es":"refrigerador / nevera","de":"Kühlschrank","pron":"/ri-frí-ye-rei-tor / frich/","pron_de":"/ri-FRI-dschö-rej-tö / FRIDSCH/"}',
        '{"v":"freezer","es":"congelador","de":"Gefrierschrank","pron":"/frí-ser/","pron_de":"/FRIE-sö/"}',
        '{"v":"microwave","es":"microondas","de":"Mikrowelle","pron":"/mái-kro-ueiv/","pron_de":"/MAI-krou-wejv/"}',
        '{"v":"dishwasher","es":"lavavajillas","de":"Geschirrspüler","pron":"/dísh-ua-sher/","pron_de":"/DISH-wo-schö/"}',
        '{"v":"garbage disposal","es":"triturador de basura (US)","de":"Küchenabfallzerkleinerer","pron":"/gár-bich dis-póu-sal/","pron_de":"/GAAR-bidsch di-SPOU-söl/"}',
        '{"v":"trash compactor","es":"compactador de basura","de":"Müllverdichter","pron":"/trash kom-pák-ter/","pron_de":"/TRÄSCH köm-PÄK-tö/"}',
        '{"v":"toaster","es":"tostadora","de":"Toaster","pron":"/tóus-ter/","pron_de":"/TOUS-tö/"}',
        '{"v":"blender","es":"licuadora","de":"Mixer","pron":"/blén-der/","pron_de":"/BLEN-dö/"}',
        '{"v":"food processor","es":"procesador de alimentos","de":"Küchenmaschine","pron":"/fud pró-se-sor/","pron_de":"/FUUD PRO-se-sö/"}',
        '{"v":"mixer","es":"batidora eléctrica","de":"Rührgerät","pron":"/mík-ser/","pron_de":"/MIK-sö/"}',
        '{"v":"coffee maker","es":"cafetera","de":"Kaffeemaschine","pron":"/kó-fi méi-ker/","pron_de":"/KO-fi MEJ-kö/"}',
        '{"v":"kettle","es":"hervidor de agua / pava","de":"Wasserkocher","pron":"/ké-tel/","pron_de":"/KE-töl/"}',
        '{"v":"crockpot / slow cooker","es":"olla de cocción lenta (US)","de":"Schongarer","pron":"/krók-pot / slóu kú-ker/","pron_de":"/KROK-pot / SLOU KU-kö/"}',
        '{"v":"air fryer","es":"freidora de aire","de":"Heißluftfritteuse","pron":"/er frái-er/","pron_de":"/Ö FRAI-ö/"}',
        '{"v":"sink","es":"fregadero / lavabo","de":"Spüle","pron":"/sink/","pron_de":"/SINGK/"}',
        '{"v":"faucet","es":"grifo (US)","de":"Wasserhahn","pron":"/fó-set/","pron_de":"/FOO-sit/"}',
        '{"v":"cutting board","es":"tabla de cortar","de":"Schneidebrett","pron":"/ká-tin bord/","pron_de":"/KA-ting BOOD/"}',
        '{"v":"frying pan / skillet","es":"sartén","de":"Bratpfanne","pron":"/frái-in pan / skí-let/","pron_de":"/FRAI-ing PÄN / SKI-lit/"}',
        '{"v":"pot","es":"olla","de":"Topf","pron":"/pot/","pron_de":"/POT/"}',
        '{"v":"saucepan","es":"cacerola","de":"Kasserolle","pron":"/sós-pan/","pron_de":"/SOOS-pän/"}',
        '{"v":"lid","es":"tapa (de olla/sartén)","de":"Deckel","pron":"/lid/","pron_de":"/LID/"}',
        '{"v":"colander","es":"colador (grande para pasta)","de":"Sieb","pron":"/kó-lan-der/","pron_de":"/KO-lön-dö/"}',
        '{"v":"strainer","es":"colador (pequeño)","de":"Küchensieb","pron":"/stréi-ner/","pron_de":"/STREJ-nö/"}',
        '{"v":"spatula","es":"espátula","de":"Pfannenwender","pron":"/spá-chu-la/","pron_de":"/SPÄTSCHU-lö/"}',
        '{"v":"whisk","es":"batidor de varillas","de":"Schneebesen","pron":"/uísk/","pron_de":"/WISK/"}',
        '{"v":"ladle","es":"cucharón","de":"Schöpfkelle","pron":"/léi-del/","pron_de":"/LEJ-döl/"}',
        '{"v":"tongs","es":"pinzas","de":"Zange","pron":"/tongs/","pron_de":"/TONGS/"}',
        '{"v":"peeler","es":"pelador","de":"Sparschäler","pron":"/pí-ler/","pron_de":"/PIE-lö/"}',
        '{"v":"grater","es":"rallador","de":"Reibe","pron":"/gréi-ter/","pron_de":"/GREJ-tö/"}',
        '{"v":"rolling pin","es":"rodillo (de amasar)","de":"Nudelholz","pron":"/róu-lin pin/","pron_de":"/ROU-ling PIN/"}',
        '{"v":"can opener","es":"abrelatas","de":"Dosenöffner","pron":"/kan óu-pe-ner/","pron_de":"/KÄN OU-pö-nö/"}',
        '{"v":"corkscrew","es":"sacacorchos","de":"Korkenzieher","pron":"/kórk-skru/","pron_de":"/KOORK-skruu/"}',
        '{"v":"measuring cup","es":"taza medidora","de":"Messbecher","pron":"/mé-sho-rin kap/","pron_de":"/ME-schö-ring KAP/"}',
        '{"v":"silverware","es":"cubiertos (US)","de":"Besteck","pron":"/síl-ver-uer/","pron_de":"/SIL-vö-wö/"}',
        '{"v":"fork","es":"tenedor","de":"Gabel","pron":"/fork/","pron_de":"/FOORK/"}',
        '{"v":"spoon","es":"cuchara","de":"Löffel","pron":"/spun/","pron_de":"/SPUUN/"}',
        '{"v":"knife","es":"cuchillo","de":"Messer","pron":"/náif/","pron_de":"/NAIF/"}',
        '{"v":"plate","es":"plato","de":"Teller","pron":"/pléit/","pron_de":"/PLEJT/"}',
        '{"v":"saucer","es":"platillo","de":"Untertasse","pron":"/só-ser/","pron_de":"/SOO-sö/"}',
        '{"v":"bowl","es":"tazón / cuenco","de":"Schüssel","pron":"/bóul/","pron_de":"/BOUL/"}',
        '{"v":"mug","es":"taza (grande)","de":"Becher","pron":"/mag/","pron_de":"/MAG/"}',
        '{"v":"glass","es":"vaso","de":"Glas","pron":"/glas/","pron_de":"/GLÄS/"}',
        '{"v":"pitcher","es":"jarra","de":"Krug","pron":"/pí-cher/","pron_de":"/PI-tschö/"}',
        '{"v":"Tupperware","es":"táper / recipiente de plástico","de":"Plastikbehälter","pron":"/tá-per-uer/","pron_de":"/TA-pö-wö/"}',
        '{"v":"napkin","es":"servilleta","de":"Serviette","pron":"/náp-kin/","pron_de":"/NÄP-kin/"}',
        '{"v":"tablecloth","es":"mantel","de":"Tischdecke","pron":"/téi-bol-kloz/","pron_de":"/TEJ-böl-kloss/"}',
        '{"v":"placemat","es":"salvamanteles / individual","de":"Tischset","pron":"/pléis-mat/","pron_de":"/PLEJS-mät/"}',
        '{"v":"coaster","es":"posavasos","de":"Untersetzer","pron":"/kóus-ter/","pron_de":"/KOUS-tö/"}',
        
        -- ==========================================
        -- 6. BAÑO Y ARTÍCULOS DE HIGIENE (Bathroom)
        -- ==========================================
        '{"v":"toilet","es":"inodoro / váter","de":"Toilette","pron":"/tói-let/","pron_de":"/TOI-lit/"}',
        '{"v":"toilet seat","es":"asiento del inodoro","de":"Toilettensitz","pron":"/tói-let sit/","pron_de":"/TOI-lit SIET/"}',
        '{"v":"toilet bowl","es":"taza del inodoro","de":"Toilettenbecken","pron":"/tói-let bóul/","pron_de":"/TOI-lit BOUL/"}',
        '{"v":"shower","es":"ducha","de":"Dusche","pron":"/shá-uer/","pron_de":"/SCHAU-ö/"}',
        '{"v":"showerhead","es":"cabezal de la ducha","de":"Duschkopf","pron":"/shá-uer-hed/","pron_de":"/SCHAU-ö-hed/"}',
        '{"v":"shower curtain","es":"cortina de ducha","de":"Duschvorhang","pron":"/shá-uer kér-ten/","pron_de":"/SCHAU-ö KÖ-tön/"}',
        '{"v":"bathtub / tub","es":"bañera","de":"Badewanne","pron":"/báz-tab / tab/","pron_de":"/BÄS-tab / TAB/"}',
        '{"v":"drain","es":"desagüe","de":"Abfluss","pron":"/dréin/","pron_de":"/DREJN/"}',
        '{"v":"towel rack","es":"toallero","de":"Handtuchhalter","pron":"/táu-el rak/","pron_de":"/TAU-öl RÄK/"}',
        '{"v":"towel","es":"toalla","de":"Handtuch","pron":"/táu-el/","pron_de":"/TAU-öl/"}',
        '{"v":"washcloth","es":"toallita (para la cara/cuerpo)","de":"Waschlappen","pron":"/uósh-kloz/","pron_de":"/WOSCH-kloss/"}',
        '{"v":"bath mat","es":"alfombrilla de baño","de":"Badematte","pron":"/baz mat/","pron_de":"/BÄS MÄT/"}',
        '{"v":"toothbrush","es":"cepillo de dientes","de":"Zahnbürste","pron":"/túz-brash/","pron_de":"/TUUS-brasch/"}',
        '{"v":"toothpaste","es":"pasta de dientes","de":"Zahnpasta","pron":"/túz-peist/","pron_de":"/TUUS-peist/"}',
        '{"v":"dental floss","es":"hilo dental","de":"Zahnseide","pron":"/dén-tal flos/","pron_de":"/DEN-töl FLOS/"}',
        '{"v":"mouthwash","es":"enjuague bucal","de":"Mundspülung","pron":"/máuz-uosh/","pron_de":"/MAUS-wosch/"}',
        '{"v":"bar of soap","es":"pastilla de jabón","de":"Seifenstück","pron":"/bar of sóup/","pron_de":"/BAAR öv SOUP/"}',
        '{"v":"soap dispenser","es":"dispensador de jabón","de":"Seifenspender","pron":"/sóup dis-pén-ser/","pron_de":"/SOUP di-SPEN-sö/"}',
        '{"v":"shampoo","es":"champú","de":"Shampoo","pron":"/sham-pú/","pron_de":"/schäm-PUU/"}',
        '{"v":"conditioner","es":"acondicionador","de":"Haarpflegespülung","pron":"/kon-dí-sho-ner/","pron_de":"/kön-DI-schö-nö/"}',
        '{"v":"lotion","es":"loción / crema corporal","de":"Körperlotion","pron":"/lóu-shon/","pron_de":"/LOU-schön/"}',
        '{"v":"toilet paper","es":"papel higiénico","de":"Toilettenpapier","pron":"/tói-let péi-per/","pron_de":"/TOI-lit PEJ-pö/"}',
        '{"v":"Q-tip / cotton swab","es":"bastoncillo de algodón (US)","de":"Wattestäbchen","pron":"/kiú-tip / kó-ton suab/","pron_de":"/KJUU-tip / KO-tön SWOB/"}',
        '{"v":"cotton ball","es":"bola de algodón","de":"Wattekugel","pron":"/kó-ton bol/","pron_de":"/KO-tön BOOL/"}',
        '{"v":"tweezers","es":"pinzas de depilar","de":"Pinzette","pron":"/tuí-sers/","pron_de":"/TWIE-sörs/"}',
        '{"v":"nail clippers","es":"cortaúñas","de":"Nagelknipser","pron":"/néil klí-pers/","pron_de":"/NEJL KLI-pörs/"}',
        '{"v":"Band-Aid","es":"tirita / curita (US)","de":"Pflaster","pron":"/bán-deid/","pron_de":"/BÄND-ejd/"}',
        '{"v":"razor","es":"maquinilla de afeitar","de":"Rasierapparat","pron":"/réi-sor/","pron_de":"/REJ-sö/"}',
        '{"v":"shaving cream","es":"crema de afeitar","de":"Rasiercreme","pron":"/shéi-vin krim/","pron_de":"/SCHEJV-ing KRIEM/"}',
        '{"v":"hair dryer","es":"secador de pelo","de":"Föhn","pron":"/her drái-er/","pron_de":"/HÖ DRAI-ö/"}',
        '{"v":"comb","es":"peine","de":"Kamm","pron":"/kóum/","pron_de":"/KOUM/"}',
        '{"v":"hairbrush","es":"cepillo de pelo","de":"Haarbürste","pron":"/hér-brash/","pron_de":"/HÖ-brasch/"}',
        '{"v":"scale","es":"báscula / balanza","de":"Waage","pron":"/skéil/","pron_de":"/SKEJL/"}',
        '{"v":"plunger","es":"desatascador / destapacaños","de":"Saugglocke","pron":"/plán-yer/","pron_de":"/PLAN-dschö/"}',
        '{"v":"toilet brush","es":"escobilla del baño","de":"Klobürste","pron":"/tói-let brash/","pron_de":"/TOI-lit BRASCH/"}',
        
        -- ==========================================
        -- 7. ÚTILES DE LIMPIEZA Y LAVANDERÍA (Cleaning)
        -- ==========================================
        '{"v":"washing machine / washer","es":"lavadora","de":"Waschmaschine","pron":"/uó-shin ma-shín / uó-sher/","pron_de":"/WO-sching mö-SCHIEN / WO-schö/"}',
        '{"v":"dryer","es":"secadora","de":"Wäschetrockner","pron":"/drái-er/","pron_de":"/DRAI-ö/"}',
        '{"v":"laundry detergent","es":"detergente para ropa","de":"Waschmittel","pron":"/lón-dri di-tér-jent/","pron_de":"/LOON-dri di-TÖ-dschönt/"}',
        '{"v":"fabric softener","es":"suavizante de telas","de":"Weichspüler","pron":"/fá-brik só-fe-ner/","pron_de":"/FÄ-brik SOF-tö-nö/"}',
        '{"v":"dryer sheet","es":"toallita para la secadora","de":"Weichspülertuch","pron":"/drái-er shit/","pron_de":"/DRAI-ö SCHIET/"}',
        '{"v":"bleach","es":"lejía / cloro","de":"Bleichmittel","pron":"/blich/","pron_de":"/BLIETSCH/"}',
        '{"v":"stain remover","es":"quitamanchas","de":"Fleckentferner","pron":"/stéin ri-mú-ver/","pron_de":"/STEJN ri-MUUV-ö/"}',
        '{"v":"clothesline","es":"tendedero (cuerda)","de":"Wäscheleine","pron":"/klóus-lain/","pron_de":"/KLOUS-lain/"}',
        '{"v":"clothespin","es":"pinza de la ropa","de":"Wäscheklammer","pron":"/klóus-pin/","pron_de":"/KLOUS-pin/"}',
        '{"v":"iron","es":"plancha","de":"Bügeleisen","pron":"/ái-ron/","pron_de":"/AI-ön/"}',
        '{"v":"ironing board","es":"tabla de planchar","de":"Bügelbrett","pron":"/ái-ro-nin bord/","pron_de":"/AI-ö-ning BOOD/"}',
        '{"v":"hanger","es":"percha / gancho para ropa","de":"Kleiderbügel","pron":"/hán-guer/","pron_de":"/HÄN-gö/"}',
        '{"v":"vacuum cleaner","es":"aspiradora","de":"Staubsauger","pron":"/vá-kium klí-ner/","pron_de":"/VÄ-kjum KLIE-nö/"}',
        '{"v":"broom","es":"escoba","de":"Besen","pron":"/brum/","pron_de":"/BRUUM/"}',
        '{"v":"dustpan","es":"recogedor","de":"Kehrschaufel","pron":"/dást-pan/","pron_de":"/DAST-pän/"}',
        '{"v":"mop","es":"fregona / trapeador","de":"Mopp","pron":"/mop/","pron_de":"/MOP/"}',
        '{"v":"bucket","es":"cubo / balde","de":"Eimer","pron":"/bá-kit/","pron_de":"/BA-kit/"}',
        '{"v":"sponge","es":"esponja","de":"Schwamm","pron":"/sponch/","pron_de":"/SPONDSCH/"}',
        '{"v":"scrub brush","es":"cepillo de fregar","de":"Schrubbbürste","pron":"/skrab brash/","pron_de":"/SKRAB BRASCH/"}',
        '{"v":"rubber gloves","es":"guantes de goma","de":"Gummihandschuhe","pron":"/rá-ber glovs/","pron_de":"/RA-bö GLAVS/"}',
        '{"v":"microfiber cloth","es":"paño de microfibra","de":"Mikrofasertuch","pron":"/mái-kro-fai-ber kloz/","pron_de":"/MAI-krou-fai-bö KLOSS/"}',
        '{"v":"feather duster","es":"plumero","de":"Staubwedel","pron":"/fé-der dás-ter/","pron_de":"/FE-dö DAS-tö/"}',
        '{"v":"glass cleaner","es":"limpiacristales","de":"Glasreiniger","pron":"/glas klí-ner/","pron_de":"/GLÄS KLIE-nö/"}',
        '{"v":"all-purpose cleaner","es":"limpiador multiusos","de":"Allzweckreiniger","pron":"/ol-pér-pos klí-ner/","pron_de":"/OOL-PÖ-pös KLIE-nö/"}',
        '{"v":"dish soap","es":"jabón para lavar platos","de":"Spülmittel","pron":"/dish sóup/","pron_de":"/DISH SOUP/"}',
        '{"v":"trash can / garbage can","es":"cubo de basura (US)","de":"Mülleimer","pron":"/trash kan / gár-bich kan/","pron_de":"/TRÄSCH KÄN / GAA-bidsch KÄN/"}',
        '{"v":"trash bag","es":"bolsa de basura","de":"Mülltüte","pron":"/trash bag/","pron_de":"/TRÄSCH BÄG/"}',
        '{"v":"recycling bin","es":"contenedor de reciclaje","de":"Recyclingtonne","pron":"/ri-sái-klin bin/","pron_de":"/ri-SAI-kling BIN/"}',
        
        -- ==========================================
        -- 8. TAREAS DEL HOGAR Y ACCIONES (Household Chores)
        -- ==========================================
        '{"v":"do the chores","es":"hacer las tareas del hogar","de":"Hausarbeiten erledigen","pron":"/du de chors/","pron_de":"/DUU DÖ TSCHOOORS/"}',
        '{"v":"clean","es":"limpiar","de":"reinigen / putzen","pron":"/klin/","pron_de":"/KLIEN/"}',
        '{"v":"sweep the floor","es":"barrer el suelo","de":"den Boden fegen","pron":"/suíp de flor/","pron_de":"/SWIEP DÖ FLOOR/"}',
        '{"v":"vacuum the rug","es":"pasar la aspiradora por la alfombra","de":"den Teppich saugen","pron":"/vá-kium de rag/","pron_de":"/VÄ-kjum DÖ RAG/"}',
        '{"v":"mop the floor","es":"fregar el suelo / trapear","de":"den Boden wischen","pron":"/mop de flor/","pron_de":"/MOP DÖ FLOOR/"}',
        '{"v":"dust the furniture","es":"quitar el polvo de los muebles","de":"Möbel abstauben","pron":"/dast de fér-ni-cher/","pron_de":"/DAST DÖ FÖ-ni-tschö/"}',
        '{"v":"do the dishes / wash the dishes","es":"fregar los platos","de":"das Geschirr spülen","pron":"/du de dí-shes / uosh de dí-shes/","pron_de":"/DUU DÖ DI-schös / WOSCH DÖ DI-schös/"}',
        '{"v":"wipe the counter","es":"limpiar la encimera (con un trapo)","de":"die Arbeitsfläche abwischen","pron":"/uáip de káun-ter/","pron_de":"/WAIP DÖ KAUN-tö/"}',
        '{"v":"do the laundry","es":"hacer la colada / lavar la ropa","de":"Wäsche waschen","pron":"/du de lón-dri/","pron_de":"/DUU DÖ LOON-dri/"}',
        '{"v":"fold the laundry","es":"doblar la ropa (limpia)","de":"die Wäsche falten","pron":"/fóuld de lón-dri/","pron_de":"/FOULD DÖ LOON-dri/"}',
        '{"v":"hang up the clothes","es":"colgar la ropa","de":"die Wäsche aufhängen","pron":"/hang ap de klóus/","pron_de":"/HÄNG AP DÖ KLOUS/"}',
        '{"v":"iron the clothes","es":"planchar la ropa","de":"die Wäsche bügeln","pron":"/ái-ron de klóus/","pron_de":"/AI-ön DÖ KLOUS/"}',
        '{"v":"make the bed","es":"hacer la cama","de":"das Bett machen","pron":"/méik de bed/","pron_de":"/MEJK DÖ BED/"}',
        '{"v":"change the sheets","es":"cambiar las sábanas","de":"die Bettwäsche wechseln","pron":"/chéinch de shits/","pron_de":"/TSCHEJNDSCH DÖ SCHIETS/"}',
        '{"v":"take out the trash","es":"sacar la basura (US)","de":"den Müll rausbringen","pron":"/téik aut de trash/","pron_de":"/TEJK AUT DÖ TRÄSCH/"}',
        '{"v":"sort the recycling","es":"separar el reciclaje","de":"das Recycling sortieren","pron":"/sort de ri-sái-klin/","pron_de":"/SOORT DÖ ri-SAI-kling/"}',
        '{"v":"scrub the tub","es":"fregar la bañera","de":"die Badewanne schrubben","pron":"/skrab de tab/","pron_de":"/SKRAB DÖ TAB/"}',
        '{"v":"unclog the toilet","es":"desatascar el inodoro","de":"das Klo entstopfen","pron":"/an-klóg de tói-let/","pron_de":"/an-KLOG DÖ TOI-lit/"}',
        '{"v":"set the table","es":"poner la mesa","de":"den Tisch decken","pron":"/set de téi-bol/","pron_de":"/SET DÖ TEJ-böl/"}',
        '{"v":"clear the table","es":"recoger / quitar la mesa","de":"den Tisch abräumen","pron":"/klir de téi-bol/","pron_de":"/KLIR DÖ TEJ-böl/"}',
        '{"v":"put away the groceries","es":"guardar la compra (comida)","de":"die Lebensmittel wegräumen","pron":"/put a-uéi de gróu-se-ris/","pron_de":"/PUT ö-WEJ DÖ GROU-sö-ris/"}',
        '{"v":"organize the closet","es":"organizar el armario","de":"den Schrank aufräumen","pron":"/ór-ga-nais de kló-set/","pron_de":"/OOR-gö-najs DÖ KLO-sit/"}',
        '{"v":"declutter the room","es":"despejar / ordenar la habitación","de":"das Zimmer aufräumen","pron":"/di-klá-ter de rum/","pron_de":"/di-KLA-tö DÖ RUUM/"}',
        '{"v":"mow the lawn","es":"cortar el césped","de":"den Rasen mähen","pron":"/móu de lon/","pron_de":"/MOU DÖ LOON/"}',
        '{"v":"water the plants","es":"regar las plantas","de":"die Pflanzen gießen","pron":"/uó-ter de plants/","pron_de":"/WOO-tö DÖ PLÄNTS/"}',
        '{"v":"rake the leaves","es":"rastrillar las hojas","de":"die Blätter harken","pron":"/réik de livs/","pron_de":"/REJK DÖ LIEVS/"}',
        '{"v":"weed the garden","es":"quitar las malas hierbas","de":"Unkraut jäten","pron":"/uíd de gár-den/","pron_de":"/WIED DÖ GAAR-dön/"}',
        '{"v":"trim the hedges","es":"podar los setos","de":"die Hecke schneiden","pron":"/trim de hé-ches/","pron_de":"/TRIM DÖ HE-dschös/"}',
        '{"v":"shovel the snow","es":"quitar la nieve (con pala)","de":"Schnee schaufeln","pron":"/shó-vel de snóu/","pron_de":"/SCHAV-öl DÖ SNOU/"}',
        '{"v":"feed the dog","es":"dar de comer al perro","de":"den Hund füttern","pron":"/fid de dog/","pron_de":"/FIED DÖ DOG/"}',
        '{"v":"walk the dog","es":"pasear al perro","de":"den Hund spazieren führen","pron":"/uok de dog/","pron_de":"/WOOK DÖ DOG/"}'
    ];

BEGIN

-- 1. Obtener el path del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Deck en la base de datos (Step 165)
INSERT INTO deck (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 165, 'en', 'deck') 
RETURNING uuid INTO v_deck_id;

-- 3. Insertar Traducción y Metadata del Deck
INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (
    v_deck_id, 
    'es', 
    'La vivienda', 
    ''
);

INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (v_deck_id, 'de', 'Zuhause und Wohnen', '');

-- 4. Bucle masivo para insertar todas las palabras del mazo
FOREACH v_item IN ARRAY v_house_vocab
LOOP
    -- Insertar el término en la tabla word como palabra raíz
    INSERT INTO word (term, is_root, source_language) 
    VALUES (v_item->>'v', TRUE, 'en') 
    RETURNING uuid INTO v_root_id;

    -- Insertar la traducción al español y su pronunciación
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (
        v_root_id, 
        'es', 
        jsonb_build_object('translation', v_item->>'es'), 
        v_item->>'pron'
    );

    -- Insertar la traducción al alemán y su pronunciación
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_root_id, 'de', jsonb_build_object('translation', v_item->>'de'), v_item->>'pron_de');

    -- Vincular la palabra creada al mazo actual
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

END LOOP;
END;
$seed$;
