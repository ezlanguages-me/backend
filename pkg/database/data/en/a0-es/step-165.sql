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
        '{"v":"house","es":"casa","pron":"/háus/"}',
        '{"v":"apartment","es":"apartamento / piso","pron":"/a-párt-ment/"}',
        '{"v":"building","es":"edificio","pron":"/bíl-din/"}',
        '{"v":"condo (condominium)","es":"condominio / piso en propiedad","pron":"/kón-dou/"}',
        '{"v":"townhouse","es":"casa adosada","pron":"/táun-haus/"}',
        '{"v":"front yard","es":"jardín delantero (US)","pron":"/frant iard/"}',
        '{"v":"backyard","es":"patio trasero (US)","pron":"/bák-iard/"}',
        '{"v":"garage","es":"garaje","pron":"/ga-rásh/"}',
        '{"v":"roof","es":"techo / tejado","pron":"/ruf/"}',
        '{"v":"shingles","es":"tejas","pron":"/shín-gols/"}',
        '{"v":"gutter","es":"canalón","pron":"/gá-ter/"}',
        '{"v":"downspout","es":"bajante de agua","pron":"/dáun-spaut/"}',
        '{"v":"wall","es":"pared / muro","pron":"/uol/"}',
        '{"v":"floor","es":"suelo / piso","pron":"/flor/"}',
        '{"v":"ceiling","es":"techo (interior)","pron":"/sí-lin/"}',
        '{"v":"window","es":"ventana","pron":"/uín-dou/"}',
        '{"v":"windowsill","es":"alféizar de la ventana","pron":"/uín-dou-sil/"}',
        '{"v":"shutters","es":"contraventanas","pron":"/shá-ters/"}',
        '{"v":"door","es":"puerta","pron":"/dor/"}',
        '{"v":"front door","es":"puerta principal","pron":"/frant dor/"}',
        '{"v":"fence","es":"cerca / valla","pron":"/fens/"}',
        '{"v":"gate","es":"verja / puerta exterior","pron":"/guéit/"}',
        '{"v":"driveway","es":"entrada para el auto","pron":"/drái-vuei/"}',
        '{"v":"mailbox","es":"buzón","pron":"/méil-boks/"}',
        '{"v":"chimney","es":"chimenea (exterior)","pron":"/chím-ni/"}',
        '{"v":"balcony","es":"balcón","pron":"/bál-ko-ni/"}',
        '{"v":"porch","es":"porche / pórtico","pron":"/porch/"}',
        '{"v":"deck","es":"terraza de madera","pron":"/dek/"}',
        '{"v":"patio","es":"patio (pavimentado)","pron":"/pá-ti-ou/"}',
        '{"v":"lawn","es":"césped","pron":"/lon/"}',
        '{"v":"flower bed","es":"arriate / parterre de flores","pron":"/fláu-er bed/"}',
        '{"v":"sprinkler","es":"aspersor","pron":"/sprín-kler/"}',
        '{"v":"hose","es":"manguera","pron":"/hóus/"}',
        '{"v":"shed","es":"cobertizo","pron":"/shed/"}',
        '{"v":"doorbell","es":"timbre","pron":"/dór-bel/"}',
        '{"v":"swimming pool","es":"piscina","pron":"/suí-min pul/"}',
        
        -- ==========================================
        -- 2. HABITACIONES Y ÁREAS (Rooms)
        -- ==========================================
        '{"v":"room","es":"habitación / cuarto","pron":"/rum/"}',
        '{"v":"living room","es":"sala de estar / salón","pron":"/lí-vin rum/"}',
        '{"v":"bedroom","es":"dormitorio","pron":"/béd-rum/"}',
        '{"v":"master bedroom","es":"dormitorio principal","pron":"/más-ter béd-rum/"}',
        '{"v":"guest room","es":"habitación de invitados","pron":"/guest rum/"}',
        '{"v":"bathroom","es":"baño","pron":"/báz-rum/"}',
        '{"v":"half bath","es":"medio baño (sin ducha)","pron":"/haf baz/"}',
        '{"v":"kitchen","es":"cocina (habitación)","pron":"/kí-chen/"}',
        '{"v":"dining room","es":"comedor","pron":"/dái-nin rum/"}',
        '{"v":"laundry room","es":"cuarto de lavado","pron":"/lón-dri rum/"}',
        '{"v":"utility room","es":"cuarto de servicio/máquinas","pron":"/iu-tí-li-ti rum/"}',
        '{"v":"basement","es":"sótano","pron":"/béis-ment/"}',
        '{"v":"cellar","es":"bodega / sótano pequeño","pron":"/sé-lar/"}',
        '{"v":"attic","es":"ático","pron":"/á-tik/"}',
        '{"v":"hallway","es":"pasillo","pron":"/hól-uei/"}',
        '{"v":"stairs","es":"escaleras","pron":"/sters/"}',
        '{"v":"landing","es":"rellano de la escalera","pron":"/lán-din/"}',
        '{"v":"pantry","es":"despensa","pron":"/pán-tri/"}',
        '{"v":"nursery","es":"cuarto del bebé","pron":"/nér-se-ri/"}',
        '{"v":"home office","es":"despacho / oficina en casa","pron":"/hóum ó-fis/"}',
        '{"v":"walk-in closet","es":"vestidor","pron":"/uók-in kló-set/"}',
        '{"v":"mudroom","es":"recibidor (para abrigos/zapatos sucios)","pron":"/mád-rum/"}',
        '{"v":"playroom","es":"cuarto de juegos","pron":"/pléi-rum/"}',
        '{"v":"foyer / entryway","es":"entrada / vestíbulo","pron":"/fói-er / én-tri-uei/"}',
        
        -- ==========================================
        -- 3. MUEBLES (Furniture)
        -- ==========================================
        '{"v":"furniture","es":"muebles / mobiliario","pron":"/fér-ni-cher/"}',
        '{"v":"sofa / couch","es":"sofá","pron":"/sóu-fa / káuch/"}',
        '{"v":"sectional","es":"sofá esquinero / modular","pron":"/sék-sho-nal/"}',
        '{"v":"loveseat","es":"sofá de dos plazas","pron":"/láv-sit/"}',
        '{"v":"armchair","es":"sillón","pron":"/árm-cher/"}',
        '{"v":"recliner","es":"sillón reclinable","pron":"/ri-klái-ner/"}',
        '{"v":"rocking chair","es":"mecedora","pron":"/ró-kin cher/"}',
        '{"v":"ottoman","es":"puf / reposapiés","pron":"/ó-to-man/"}',
        '{"v":"coffee table","es":"mesa de centro","pron":"/kó-fi téi-bol/"}',
        '{"v":"end table","es":"mesa auxiliar / lateral","pron":"/end téi-bol/"}',
        '{"v":"bed","es":"cama","pron":"/bed/"}',
        '{"v":"bunk bed","es":"litera","pron":"/bank bed/"}',
        '{"v":"daybed","es":"diván / cama de día","pron":"/déi-bed/"}',
        '{"v":"headboard","es":"cabecero de la cama","pron":"/héd-bord/"}',
        '{"v":"closet","es":"armario (US)","pron":"/kló-set/"}',
        '{"v":"wardrobe","es":"armario (mueble independiente)","pron":"/uór-droub/"}',
        '{"v":"dresser","es":"cómoda (mueble con cajones)","pron":"/dré-ser/"}',
        '{"v":"nightstand","es":"mesita de noche (US)","pron":"/náit-stand/"}',
        '{"v":"desk","es":"escritorio","pron":"/desk/"}',
        '{"v":"swivel chair","es":"silla giratoria / de oficina","pron":"/suí-vel cher/"}',
        '{"v":"dining table","es":"mesa de comedor","pron":"/dái-nin téi-bol/"}',
        '{"v":"chair","es":"silla","pron":"/cher/"}',
        '{"v":"high chair","es":"trona (silla para bebé)","pron":"/hái cher/"}',
        '{"v":"stool","es":"taburete","pron":"/stul/"}',
        '{"v":"bench","es":"banco (de sentarse)","pron":"/bench/"}',
        '{"v":"bookshelf / bookcase","es":"estantería para libros","pron":"/búk-shelf / búk-keis/"}',
        '{"v":"TV stand","es":"mueble para el televisor","pron":"/tí-ví stand/"}',
        '{"v":"china cabinet","es":"vitrina para la vajilla","pron":"/chái-na ká-bi-net/"}',
        '{"v":"crib","es":"cuna","pron":"/krib/"}',
        
        -- ==========================================
        -- 4. ROPA DE CAMA, TEXTILES Y DECORACIÓN
        -- ==========================================
        '{"v":"mattress","es":"colchón","pron":"/má-tres/"}',
        '{"v":"fitted sheet","es":"sábana bajera (ajustable)","pron":"/fí-ted shit/"}',
        '{"v":"flat sheet","es":"sábana encimera","pron":"/flat shit/"}',
        '{"v":"blanket","es":"manta / cobija","pron":"/blán-ket/"}',
        '{"v":"comforter","es":"edredón (US)","pron":"/kóm-for-ter/"}',
        '{"v":"duvet","es":"funda nórdica / plumón","pron":"/du-véi/"}',
        '{"v":"quilt","es":"colcha / edredón cosido","pron":"/kuilt/"}',
        '{"v":"pillow","es":"almohada","pron":"/pí-lou/"}',
        '{"v":"pillowcase","es":"funda de almohada","pron":"/pí-lou-keis/"}',
        '{"v":"throw pillow","es":"cojín decorativo","pron":"/zróu pí-lou/"}',
        '{"v":"cushion","es":"cojín","pron":"/kú-shon/"}',
        '{"v":"rug","es":"alfombra (de área)","pron":"/rag/"}',
        '{"v":"carpet","es":"moqueta / alfombra de pared a pared","pron":"/kár-pet/"}',
        '{"v":"curtains","es":"cortinas","pron":"/kér-tens/"}',
        '{"v":"drapes","es":"cortinajes (gruesos)","pron":"/dréips/"}',
        '{"v":"blinds","es":"persianas","pron":"/bláinds/"}',
        '{"v":"lamp","es":"lámpara","pron":"/lamp/"}',
        '{"v":"lampshade","es":"pantalla de lámpara","pron":"/lámp-sheid/"}',
        '{"v":"chandelier","es":"araña de luces","pron":"/shan-de-líer/"}',
        '{"v":"ceiling fan","es":"ventilador de techo","pron":"/sí-lin fan/"}',
        '{"v":"mirror","es":"espejo","pron":"/mí-ror/"}',
        '{"v":"picture frame","es":"marco de fotos","pron":"/pík-cher fréim/"}',
        '{"v":"painting","es":"cuadro / pintura","pron":"/péin-tin/"}',
        '{"v":"vase","es":"jarrón / florero","pron":"/véis/"}',
        '{"v":"fireplace","es":"chimenea (interior)","pron":"/fáir-pleis/"}',
        '{"v":"mantel","es":"repisa de la chimenea","pron":"/mán-tol/"}',
        '{"v":"firewood","es":"leña","pron":"/fáir-uud/"}',
        
        -- ==========================================
        -- 5. COCINA: ELECTRODOMÉSTICOS Y UTENSILIOS
        -- ==========================================
        '{"v":"appliance","es":"electrodoméstico","pron":"/a-plái-ans/"}',
        '{"v":"stove","es":"estufa / cocina de fogones (US)","pron":"/stóuv/"}',
        '{"v":"oven","es":"horno","pron":"/ó-ven/"}',
        '{"v":"range hood","es":"campana extractora","pron":"/reinch hud/"}',
        '{"v":"refrigerator / fridge","es":"refrigerador / nevera","pron":"/ri-frí-ye-rei-tor / frich/"}',
        '{"v":"freezer","es":"congelador","pron":"/frí-ser/"}',
        '{"v":"microwave","es":"microondas","pron":"/mái-kro-ueiv/"}',
        '{"v":"dishwasher","es":"lavavajillas","pron":"/dísh-ua-sher/"}',
        '{"v":"garbage disposal","es":"triturador de basura (US)","pron":"/gár-bich dis-póu-sal/"}',
        '{"v":"trash compactor","es":"compactador de basura","pron":"/trash kom-pák-ter/"}',
        '{"v":"toaster","es":"tostadora","pron":"/tóus-ter/"}',
        '{"v":"blender","es":"licuadora","pron":"/blén-der/"}',
        '{"v":"food processor","es":"procesador de alimentos","pron":"/fud pró-se-sor/"}',
        '{"v":"mixer","es":"batidora eléctrica","pron":"/mík-ser/"}',
        '{"v":"coffee maker","es":"cafetera","pron":"/kó-fi méi-ker/"}',
        '{"v":"kettle","es":"hervidor de agua / pava","pron":"/ké-tel/"}',
        '{"v":"crockpot / slow cooker","es":"olla de cocción lenta (US)","pron":"/krók-pot / slóu kú-ker/"}',
        '{"v":"air fryer","es":"freidora de aire","pron":"/er frái-er/"}',
        '{"v":"sink","es":"fregadero / lavabo","pron":"/sink/"}',
        '{"v":"faucet","es":"grifo (US)","pron":"/fó-set/"}',
        '{"v":"cutting board","es":"tabla de cortar","pron":"/ká-tin bord/"}',
        '{"v":"frying pan / skillet","es":"sartén","pron":"/frái-in pan / skí-let/"}',
        '{"v":"pot","es":"olla","pron":"/pot/"}',
        '{"v":"saucepan","es":"cacerola","pron":"/sós-pan/"}',
        '{"v":"lid","es":"tapa (de olla/sartén)","pron":"/lid/"}',
        '{"v":"colander","es":"colador (grande para pasta)","pron":"/kó-lan-der/"}',
        '{"v":"strainer","es":"colador (pequeño)","pron":"/stréi-ner/"}',
        '{"v":"spatula","es":"espátula","pron":"/spá-chu-la/"}',
        '{"v":"whisk","es":"batidor de varillas","pron":"/uísk/"}',
        '{"v":"ladle","es":"cucharón","pron":"/léi-del/"}',
        '{"v":"tongs","es":"pinzas","pron":"/tongs/"}',
        '{"v":"peeler","es":"pelador","pron":"/pí-ler/"}',
        '{"v":"grater","es":"rallador","pron":"/gréi-ter/"}',
        '{"v":"rolling pin","es":"rodillo (de amasar)","pron":"/róu-lin pin/"}',
        '{"v":"can opener","es":"abrelatas","pron":"/kan óu-pe-ner/"}',
        '{"v":"corkscrew","es":"sacacorchos","pron":"/kórk-skru/"}',
        '{"v":"measuring cup","es":"taza medidora","pron":"/mé-sho-rin kap/"}',
        '{"v":"silverware","es":"cubiertos (US)","pron":"/síl-ver-uer/"}',
        '{"v":"fork","es":"tenedor","pron":"/fork/"}',
        '{"v":"spoon","es":"cuchara","pron":"/spun/"}',
        '{"v":"knife","es":"cuchillo","pron":"/náif/"}',
        '{"v":"plate","es":"plato","pron":"/pléit/"}',
        '{"v":"saucer","es":"platillo","pron":"/só-ser/"}',
        '{"v":"bowl","es":"tazón / cuenco","pron":"/bóul/"}',
        '{"v":"mug","es":"taza (grande)","pron":"/mag/"}',
        '{"v":"glass","es":"vaso","pron":"/glas/"}',
        '{"v":"pitcher","es":"jarra","pron":"/pí-cher/"}',
        '{"v":"Tupperware","es":"táper / recipiente de plástico","pron":"/tá-per-uer/"}',
        '{"v":"napkin","es":"servilleta","pron":"/náp-kin/"}',
        '{"v":"tablecloth","es":"mantel","pron":"/téi-bol-kloz/"}',
        '{"v":"placemat","es":"salvamanteles / individual","pron":"/pléis-mat/"}',
        '{"v":"coaster","es":"posavasos","pron":"/kóus-ter/"}',
        
        -- ==========================================
        -- 6. BAÑO Y ARTÍCULOS DE HIGIENE (Bathroom)
        -- ==========================================
        '{"v":"toilet","es":"inodoro / váter","pron":"/tói-let/"}',
        '{"v":"toilet seat","es":"asiento del inodoro","pron":"/tói-let sit/"}',
        '{"v":"toilet bowl","es":"taza del inodoro","pron":"/tói-let bóul/"}',
        '{"v":"shower","es":"ducha","pron":"/shá-uer/"}',
        '{"v":"showerhead","es":"cabezal de la ducha","pron":"/shá-uer-hed/"}',
        '{"v":"shower curtain","es":"cortina de ducha","pron":"/shá-uer kér-ten/"}',
        '{"v":"bathtub / tub","es":"bañera","pron":"/báz-tab / tab/"}',
        '{"v":"drain","es":"desagüe","pron":"/dréin/"}',
        '{"v":"towel rack","es":"toallero","pron":"/táu-el rak/"}',
        '{"v":"towel","es":"toalla","pron":"/táu-el/"}',
        '{"v":"washcloth","es":"toallita (para la cara/cuerpo)","pron":"/uósh-kloz/"}',
        '{"v":"bath mat","es":"alfombrilla de baño","pron":"/baz mat/"}',
        '{"v":"toothbrush","es":"cepillo de dientes","pron":"/túz-brash/"}',
        '{"v":"toothpaste","es":"pasta de dientes","pron":"/túz-peist/"}',
        '{"v":"dental floss","es":"hilo dental","pron":"/dén-tal flos/"}',
        '{"v":"mouthwash","es":"enjuague bucal","pron":"/máuz-uosh/"}',
        '{"v":"bar of soap","es":"pastilla de jabón","pron":"/bar of sóup/"}',
        '{"v":"soap dispenser","es":"dispensador de jabón","pron":"/sóup dis-pén-ser/"}',
        '{"v":"shampoo","es":"champú","pron":"/sham-pú/"}',
        '{"v":"conditioner","es":"acondicionador","pron":"/kon-dí-sho-ner/"}',
        '{"v":"lotion","es":"loción / crema corporal","pron":"/lóu-shon/"}',
        '{"v":"toilet paper","es":"papel higiénico","pron":"/tói-let péi-per/"}',
        '{"v":"Q-tip / cotton swab","es":"bastoncillo de algodón (US)","pron":"/kiú-tip / kó-ton suab/"}',
        '{"v":"cotton ball","es":"bola de algodón","pron":"/kó-ton bol/"}',
        '{"v":"tweezers","es":"pinzas de depilar","pron":"/tuí-sers/"}',
        '{"v":"nail clippers","es":"cortaúñas","pron":"/néil klí-pers/"}',
        '{"v":"Band-Aid","es":"tirita / curita (US)","pron":"/bán-deid/"}',
        '{"v":"razor","es":"maquinilla de afeitar","pron":"/réi-sor/"}',
        '{"v":"shaving cream","es":"crema de afeitar","pron":"/shéi-vin krim/"}',
        '{"v":"hair dryer","es":"secador de pelo","pron":"/her drái-er/"}',
        '{"v":"comb","es":"peine","pron":"/kóum/"}',
        '{"v":"hairbrush","es":"cepillo de pelo","pron":"/hér-brash/"}',
        '{"v":"scale","es":"báscula / balanza","pron":"/skéil/"}',
        '{"v":"plunger","es":"desatascador / destapacaños","pron":"/plán-yer/"}',
        '{"v":"toilet brush","es":"escobilla del baño","pron":"/tói-let brash/"}',
        
        -- ==========================================
        -- 7. ÚTILES DE LIMPIEZA Y LAVANDERÍA (Cleaning)
        -- ==========================================
        '{"v":"washing machine / washer","es":"lavadora","pron":"/uó-shin ma-shín / uó-sher/"}',
        '{"v":"dryer","es":"secadora","pron":"/drái-er/"}',
        '{"v":"laundry detergent","es":"detergente para ropa","pron":"/lón-dri di-tér-jent/"}',
        '{"v":"fabric softener","es":"suavizante de telas","pron":"/fá-brik só-fe-ner/"}',
        '{"v":"dryer sheet","es":"toallita para la secadora","pron":"/drái-er shit/"}',
        '{"v":"bleach","es":"lejía / cloro","pron":"/blich/"}',
        '{"v":"stain remover","es":"quitamanchas","pron":"/stéin ri-mú-ver/"}',
        '{"v":"clothesline","es":"tendedero (cuerda)","pron":"/klóus-lain/"}',
        '{"v":"clothespin","es":"pinza de la ropa","pron":"/klóus-pin/"}',
        '{"v":"iron","es":"plancha","pron":"/ái-ron/"}',
        '{"v":"ironing board","es":"tabla de planchar","pron":"/ái-ro-nin bord/"}',
        '{"v":"hanger","es":"percha / gancho para ropa","pron":"/hán-guer/"}',
        '{"v":"vacuum cleaner","es":"aspiradora","pron":"/vá-kium klí-ner/"}',
        '{"v":"broom","es":"escoba","pron":"/brum/"}',
        '{"v":"dustpan","es":"recogedor","pron":"/dást-pan/"}',
        '{"v":"mop","es":"fregona / trapeador","pron":"/mop/"}',
        '{"v":"bucket","es":"cubo / balde","pron":"/bá-kit/"}',
        '{"v":"sponge","es":"esponja","pron":"/sponch/"}',
        '{"v":"scrub brush","es":"cepillo de fregar","pron":"/skrab brash/"}',
        '{"v":"rubber gloves","es":"guantes de goma","pron":"/rá-ber glovs/"}',
        '{"v":"microfiber cloth","es":"paño de microfibra","pron":"/mái-kro-fai-ber kloz/"}',
        '{"v":"feather duster","es":"plumero","pron":"/fé-der dás-ter/"}',
        '{"v":"glass cleaner","es":"limpiacristales","pron":"/glas klí-ner/"}',
        '{"v":"all-purpose cleaner","es":"limpiador multiusos","pron":"/ol-pér-pos klí-ner/"}',
        '{"v":"dish soap","es":"jabón para lavar platos","pron":"/dish sóup/"}',
        '{"v":"trash can / garbage can","es":"cubo de basura (US)","pron":"/trash kan / gár-bich kan/"}',
        '{"v":"trash bag","es":"bolsa de basura","pron":"/trash bag/"}',
        '{"v":"recycling bin","es":"contenedor de reciclaje","pron":"/ri-sái-klin bin/"}',
        
        -- ==========================================
        -- 8. TAREAS DEL HOGAR Y ACCIONES (Household Chores)
        -- ==========================================
        '{"v":"do the chores","es":"hacer las tareas del hogar","pron":"/du de chors/"}',
        '{"v":"clean","es":"limpiar","pron":"/klin/"}',
        '{"v":"sweep the floor","es":"barrer el suelo","pron":"/suíp de flor/"}',
        '{"v":"vacuum the rug","es":"pasar la aspiradora por la alfombra","pron":"/vá-kium de rag/"}',
        '{"v":"mop the floor","es":"fregar el suelo / trapear","pron":"/mop de flor/"}',
        '{"v":"dust the furniture","es":"quitar el polvo de los muebles","pron":"/dast de fér-ni-cher/"}',
        '{"v":"do the dishes / wash the dishes","es":"fregar los platos","pron":"/du de dí-shes / uosh de dí-shes/"}',
        '{"v":"wipe the counter","es":"limpiar la encimera (con un trapo)","pron":"/uáip de káun-ter/"}',
        '{"v":"do the laundry","es":"hacer la colada / lavar la ropa","pron":"/du de lón-dri/"}',
        '{"v":"fold the laundry","es":"doblar la ropa (limpia)","pron":"/fóuld de lón-dri/"}',
        '{"v":"hang up the clothes","es":"colgar la ropa","pron":"/hang ap de klóus/"}',
        '{"v":"iron the clothes","es":"planchar la ropa","pron":"/ái-ron de klóus/"}',
        '{"v":"make the bed","es":"hacer la cama","pron":"/méik de bed/"}',
        '{"v":"change the sheets","es":"cambiar las sábanas","pron":"/chéinch de shits/"}',
        '{"v":"take out the trash","es":"sacar la basura (US)","pron":"/téik aut de trash/"}',
        '{"v":"sort the recycling","es":"separar el reciclaje","pron":"/sort de ri-sái-klin/"}',
        '{"v":"scrub the tub","es":"fregar la bañera","pron":"/skrab de tab/"}',
        '{"v":"unclog the toilet","es":"desatascar el inodoro","pron":"/an-klóg de tói-let/"}',
        '{"v":"set the table","es":"poner la mesa","pron":"/set de téi-bol/"}',
        '{"v":"clear the table","es":"recoger / quitar la mesa","pron":"/klir de téi-bol/"}',
        '{"v":"put away the groceries","es":"guardar la compra (comida)","pron":"/put a-uéi de gróu-se-ris/"}',
        '{"v":"organize the closet","es":"organizar el armario","pron":"/ór-ga-nais de kló-set/"}',
        '{"v":"declutter the room","es":"despejar / ordenar la habitación","pron":"/di-klá-ter de rum/"}',
        '{"v":"mow the lawn","es":"cortar el césped","pron":"/móu de lon/"}',
        '{"v":"water the plants","es":"regar las plantas","pron":"/uó-ter de plants/"}',
        '{"v":"rake the leaves","es":"rastrillar las hojas","pron":"/réik de livs/"}',
        '{"v":"weed the garden","es":"quitar las malas hierbas","pron":"/uíd de gár-den/"}',
        '{"v":"trim the hedges","es":"podar los setos","pron":"/trim de hé-ches/"}',
        '{"v":"shovel the snow","es":"quitar la nieve (con pala)","pron":"/shó-vel de snóu/"}',
        '{"v":"feed the dog","es":"dar de comer al perro","pron":"/fid de dog/"}',
        '{"v":"walk the dog","es":"pasear al perro","pron":"/uok de dog/"}'
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

    -- Vincular la palabra creada al mazo actual
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

END LOOP;
END;
$seed$;
