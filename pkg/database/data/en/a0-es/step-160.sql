-- ============================================================
-- Seed: A0 English Path – STEP 160 – Deck – ADJETIVOS (Colores, descripción física, personalidad y estados de ánimo)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_deck_id UUID; 
    v_root_id UUID; 
    v_item JSONB;
    v_adjectives JSONB[] := ARRAY[
        -- ==========================================
        -- 1. COLORES (Color)
        -- ==========================================
        '{"v":"red","es":"rojo","pron":"/red/"}',
        '{"v":"blue","es":"azul","pron":"/blu/"}',
        '{"v":"yellow","es":"amarillo","pron":"/ié-lou/"}',
        '{"v":"green","es":"verde","pron":"/grin/"}',
        '{"v":"black","es":"negro","pron":"/blak/"}',
        '{"v":"white","es":"blanco","pron":"/uáit/"}',
        '{"v":"gray","es":"gris","pron":"/gréi/"}',
        '{"v":"orange","es":"naranja","pron":"/ó-ranch/"}',
        '{"v":"purple","es":"morado","pron":"/pér-pol/"}',
        '{"v":"brown","es":"marrón / café","pron":"/bráun/"}',
        '{"v":"pink","es":"rosa","pron":"/pink/"}',
        '{"v":"silver","es":"plateado","pron":"/síl-ver/"}',
        '{"v":"gold","es":"dorado","pron":"/góuld/"}',
        '{"v":"cyan","es":"cian","pron":"/sái-an/"}',
        '{"v":"magenta","es":"magenta","pron":"/ma-yén-ta/"}',
        '{"v":"beige","es":"beis","pron":"/béish/"}',
        '{"v":"maroon","es":"granate / burdeos","pron":"/ma-rún/"}',
        '{"v":"turquoise","es":"turquesa","pron":"/tér-kois/"}',
        '{"v":"teal","es":"verde azulado","pron":"/til/"}',
        '{"v":"navy","es":"azul marino","pron":"/néi-vi/"}',
        '{"v":"olive","es":"verde oliva","pron":"/ó-liv/"}',
        '{"v":"indigo","es":"índigo / añil","pron":"/ín-di-gou/"}',
        '{"v":"peach","es":"color durazno","pron":"/pich/"}',
        '{"v":"violet","es":"violeta","pron":"/vái-o-let/"}',

        -- ==========================================
        -- 2. DESCRIPCIÓN FÍSICA
        -- ==========================================
        '{"v":"tall","es":"alto","pron":"/tol/"}',
        '{"v":"short","es":"bajo / corto","pron":"/short/"}',
        '{"v":"thin","es":"delgado","pron":"/zin/"}',
        '{"v":"slim","es":"esbelto","pron":"/slim/"}',
        '{"v":"fat","es":"gordo","pron":"/fat/"}',
        '{"v":"chubby","es":"rechoncho / gordito","pron":"/chá-bi/"}',
        '{"v":"muscular","es":"musculoso","pron":"/más-kiu-lar/"}',
        '{"v":"strong","es":"fuerte","pron":"/strong/"}',
        '{"v":"weak","es":"débil","pron":"/uík/"}',
        '{"v":"beautiful","es":"hermosa / bella","pron":"/biú-ti-ful/"}',
        '{"v":"handsome","es":"guapo (para hombres)","pron":"/hán-som/"}',
        '{"v":"ugly","es":"feo","pron":"/á-gli/"}',
        '{"v":"attractive","es":"atractivo","pron":"/a-trák-tiv/"}',
        '{"v":"bald","es":"calvo","pron":"/bold/"}',
        '{"v":"blonde","es":"rubio/a","pron":"/blond/"}',
        '{"v":"brunette","es":"castaña / morena","pron":"/bru-nét/"}',
        '{"v":"curvy","es":"con curvas","pron":"/kér-vi/"}',
        '{"v":"fit","es":"en forma","pron":"/fit/"}',
        '{"v":"gorgeous","es":"precioso/a / deslumbrante","pron":"/gór-chos/"}',
        '{"v":"plain","es":"sencillo / poco atractivo","pron":"/pléin/"}',
        '{"v":"stunning","es":"impresionante","pron":"/stá-nin/"}',
        '{"v":"pale","es":"pálido","pron":"/péil/"}',
        '{"v":"tanned","es":"bronceado","pron":"/tand/"}',
        '{"v":"wrinkled","es":"arrugado","pron":"/rín-kold/"}',
        '{"v":"smooth","es":"suave / liso","pron":"/smus/"}',
        '{"v":"rough","es":"áspero / rugoso","pron":"/raf/"}',
        '{"v":"heavy","es":"pesado","pron":"/hé-vi/"}',
        '{"v":"light","es":"ligero / liviano","pron":"/láit/"}',

        -- ==========================================
        -- 3. PERSONALIDAD
        -- ==========================================
        '{"v":"nice","es":"agradable / simpático","pron":"/náis/"}',
        '{"v":"kind","es":"amable / bondadoso","pron":"/káind/"}',
        '{"v":"polite","es":"educado / cortés","pron":"/po-láit/"}',
        '{"v":"rude","es":"grosero / maleducado","pron":"/rud/"}',
        '{"v":"funny","es":"divertido / gracioso","pron":"/fá-ni/"}',
        '{"v":"serious","es":"serio","pron":"/sí-ri-os/"}',
        '{"v":"shy","es":"tímido","pron":"/shái/"}',
        '{"v":"outgoing","es":"extrovertido / sociable","pron":"/aut-góu-in/"}',
        '{"v":"lazy","es":"perezoso / flojo","pron":"/léi-si/"}',
        '{"v":"hardworking","es":"trabajador","pron":"/hard-uér-kin/"}',
        '{"v":"smart","es":"inteligente / listo","pron":"/smart/"}',
        '{"v":"stupid","es":"estúpido / tonto","pron":"/stú-pid/"}',
        '{"v":"brave","es":"valiente","pron":"/bréiv/"}',
        '{"v":"cowardly","es":"cobarde","pron":"/káu-ard-li/"}',
        '{"v":"honest","es":"honesto","pron":"/ó-nest/"}',
        '{"v":"dishonest","es":"deshonesto","pron":"/dis-ó-nest/"}',
        '{"v":"arrogant","es":"arrogante","pron":"/á-ro-gant/"}',
        '{"v":"bossy","es":"mandón","pron":"/bó-si/"}',
        '{"v":"calm","es":"tranquilo","pron":"/kam/"}',
        '{"v":"careful","es":"cuidadoso","pron":"/kér-ful/"}',
        '{"v":"careless","es":"descuidado","pron":"/kér-les/"}',
        '{"v":"cheerful","es":"alegre","pron":"/chír-ful/"}',
        '{"v":"confident","es":"seguro de sí mismo","pron":"/kón-fi-dent/"}',
        '{"v":"crazy","es":"loco","pron":"/kréi-si/"}',
        '{"v":"cruel","es":"cruel","pron":"/kruel/"}',
        '{"v":"curious","es":"curioso","pron":"/kiú-ri-os/"}',
        '{"v":"friendly","es":"amigable","pron":"/frénd-li/"}',
        '{"v":"generous","es":"generoso","pron":"/yé-ne-ros/"}',
        '{"v":"greedy","es":"codicioso / avaro","pron":"/grí-di/"}',
        '{"v":"jealous","es":"celoso","pron":"/yé-los/"}',
        '{"v":"loyal","es":"leal","pron":"/ló-ial/"}',
        '{"v":"mean","es":"mezquino / malo","pron":"/min/"}',
        '{"v":"patient","es":"paciente","pron":"/péi-shent/"}',
        '{"v":"proud","es":"orgulloso","pron":"/práud/"}',
        '{"v":"selfish","es":"egoísta","pron":"/sél-fish/"}',
        '{"v":"silly","es":"tonto / bobo","pron":"/sí-li/"}',
        '{"v":"strict","es":"estricto","pron":"/stríkt/"}',
        '{"v":"stubborn","es":"terco / testarudo","pron":"/stá-born/"}',
        '{"v":"sweet","es":"dulce / tierno","pron":"/suit/"}',
        '{"v":"talkative","es":"hablador","pron":"/tó-ka-tiv/"}',
        '{"v":"quiet","es":"callado","pron":"/kuái-et/"}',

        -- ==========================================
        -- 4. ESTADOS DE ÁNIMO (Moods)
        -- ==========================================
        '{"v":"happy","es":"feliz","pron":"/há-pi/"}',
        '{"v":"sad","es":"triste","pron":"/sad/"}',
        '{"v":"angry","es":"enojado / enfadado","pron":"/án-gri/"}',
        '{"v":"mad","es":"furioso / enojado (US)","pron":"/mad/"}',
        '{"v":"upset","es":"molesto / disgustado","pron":"/ap-sét/"}',
        '{"v":"tired","es":"cansado","pron":"/táird/"}',
        '{"v":"exhausted","es":"exhausto","pron":"/eg-zós-tid/"}',
        '{"v":"hungry","es":"hambriento","pron":"/hán-gri/"}',
        '{"v":"thirsty","es":"sediento","pron":"/zérs-ti/"}',
        '{"v":"bored","es":"aburrido","pron":"/bord/"}',
        '{"v":"excited","es":"emocionado","pron":"/ek-sái-tid/"}',
        '{"v":"nervous","es":"nervioso","pron":"/nér-vos/"}',
        '{"v":"worried","es":"preocupado","pron":"/uó-rid/"}',
        '{"v":"relaxed","es":"relajado","pron":"/ri-lákst/"}',
        '{"v":"scared","es":"asustado","pron":"/skerd/"}',
        '{"v":"surprised","es":"sorprendido","pron":"/ser-práist/"}',
        '{"v":"afraid","es":"temeroso / con miedo","pron":"/a-fréid/"}',
        '{"v":"amazed","es":"asombrado","pron":"/a-méist/"}',
        '{"v":"annoyed","es":"irritado","pron":"/a-nóid/"}',
        '{"v":"anxious","es":"ansioso","pron":"/ánk-shos/"}',
        '{"v":"ashamed","es":"avergonzado","pron":"/a-shéimd/"}',
        '{"v":"confused","es":"confundido","pron":"/kon-fiúst/"}',
        '{"v":"depressed","es":"deprimido","pron":"/di-prést/"}',
        '{"v":"disappointed","es":"decepcionado","pron":"/dis-a-póin-tid/"}',
        '{"v":"disgusted","es":"asqueado","pron":"/dis-gás-tid/"}',
        '{"v":"eager","es":"entusiasmado / impaciente por algo","pron":"/í-guer/"}',
        '{"v":"embarrassed","es":"avergonzado (situación social)","pron":"/em-bá-rast/"}',
        '{"v":"frightened","es":"aterrado","pron":"/frái-tend/"}',
        '{"v":"frustrated","es":"frustrado","pron":"/fras-tréi-tid/"}',
        '{"v":"glad","es":"contento / complacido","pron":"/glad/"}',
        '{"v":"guilty","es":"culpable","pron":"/guíl-ti/"}',
        '{"v":"lonely","es":"solitario (sentimiento)","pron":"/lóun-li/"}',
        '{"v":"pleased","es":"complacido","pron":"/plist/"}',
        '{"v":"relieved","es":"aliviado","pron":"/ri-lívd/"}',
        '{"v":"shocked","es":"conmocionado","pron":"/shokt/"}',
        '{"v":"sleepy","es":"soñoliento","pron":"/slí-pi/"}',
        '{"v":"stressed","es":"estresado","pron":"/strest/"}',
        '{"v":"terrified","es":"aterrorizado","pron":"/té-ri-faid/"}',
        '{"v":"thankful","es":"agradecido","pron":"/zánk-ful/"}',
        '{"v":"thrilled","es":"emocionadísimo","pron":"/zrild/"}',

        -- ==========================================
        -- 5. OPINIÓN O JUICIO (Opinion / Judgment)
        -- ==========================================
        '{"v":"good","es":"bueno","pron":"/gud/"}',
        '{"v":"bad","es":"malo","pron":"/bad/"}',
        '{"v":"excellent","es":"excelente","pron":"/ék-se-lent/"}',
        '{"v":"terrible","es":"terrible","pron":"/té-ri-bol/"}',
        '{"v":"awful","es":"horrible / espantoso","pron":"/ó-fol/"}',
        '{"v":"wonderful","es":"maravilloso","pron":"/uán-der-ful/"}',
        '{"v":"awesome","es":"increíble / genial (US)","pron":"/ó-som/"}',
        '{"v":"expensive","es":"caro","pron":"/eks-pén-siv/"}',
        '{"v":"cheap","es":"barato","pron":"/chip/"}',
        '{"v":"important","es":"importante","pron":"/im-pór-tant/"}',
        '{"v":"useful","es":"útil","pron":"/iús-ful/"}',
        '{"v":"useless","es":"inútil","pron":"/iús-les/"}',
        '{"v":"easy","es":"fácil","pron":"/í-si/"}',
        '{"v":"difficult","es":"difícil","pron":"/dí-fi-kult/"}',
        '{"v":"right","es":"correcto / adecuado","pron":"/ráit/"}',
        '{"v":"wrong","es":"incorrecto / equivocado","pron":"/rong/"}',
        '{"v":"amazing","es":"asombroso","pron":"/a-méi-sin/"}',
        '{"v":"brilliant","es":"brillante / genial","pron":"/brí-liant/"}',
        '{"v":"dirty","es":"sucio","pron":"/dér-ti/"}',
        '{"v":"clean","es":"limpio","pron":"/klin/"}',
        '{"v":"dangerous","es":"peligroso","pron":"/déin-che-ros/"}',
        '{"v":"safe","es":"seguro","pron":"/séif/"}',
        '{"v":"fair","es":"justo","pron":"/fer/"}',
        '{"v":"unfair","es":"injusto","pron":"/an-fér/"}',
        '{"v":"famous","es":"famoso","pron":"/féi-mos/"}',
        '{"v":"fantastic","es":"fantástico","pron":"/fan-tás-tik/"}',
        '{"v":"foolish","es":"tonto / insensato","pron":"/fú-lish/"}',
        '{"v":"great","es":"genial / grandioso","pron":"/gréit/"}',
        '{"v":"horrible","es":"horrible","pron":"/hó-ri-bol/"}',
        '{"v":"perfect","es":"perfecto","pron":"/pér-fekt/"}',
        '{"v":"poor","es":"pobre / de mala calidad","pron":"/pur/"}',
        '{"v":"rich","es":"rico / adinerado","pron":"/rich/"}',
        '{"v":"special","es":"especial","pron":"/spé-shal/"}',
        '{"v":"strange","es":"extraño / raro","pron":"/stréinch/"}',
        '{"v":"weird","es":"raro / bizarro","pron":"/uird/"}',
        '{"v":"wild","es":"salvaje","pron":"/uáild/"}',
        '{"v":"valuable","es":"valioso","pron":"/vá-liu-bol/"}',
        '{"v":"worthless","es":"sin valor","pron":"/uérz-les/"}',

        -- ==========================================
        -- 6. TAMAÑO O LONGITUD (Size / Length)
        -- ==========================================
        '{"v":"big","es":"grande","pron":"/big/"}',
        '{"v":"large","es":"grande / amplio","pron":"/larch/"}',
        '{"v":"huge","es":"enorme","pron":"/hiuch/"}',
        '{"v":"small","es":"pequeño","pron":"/smol/"}',
        '{"v":"tiny","es":"diminuto","pron":"/tái-ni/"}',
        '{"v":"long","es":"largo","pron":"/long/"}',
        '{"v":"wide","es":"ancho","pron":"/uáid/"}',
        '{"v":"narrow","es":"estrecho","pron":"/ná-rou/"}',
        '{"v":"deep","es":"profundo","pron":"/dip/"}',
        '{"v":"shallow","es":"poco profundo / superficial","pron":"/shá-lou/"}',
        '{"v":"thick","es":"grueso / espeso","pron":"/zik/"}',
        '{"v":"thin (objects)","es":"fino (para objetos)","pron":"/zin/"}',
        '{"v":"gigantic","es":"gigantesco","pron":"/chai-gán-tik/"}',
        '{"v":"massive","es":"masivo / enorme","pron":"/má-siv/"}',
        '{"v":"enormous","es":"enorme","pron":"/i-nór-mos/"}',
        '{"v":"microscopic","es":"microscópico","pron":"/mai-kro-skó-pik/"}',
        '{"v":"petite","es":"pequeña y delgada (mujeres)","pron":"/pe-tít/"}',
        '{"v":"chunky","es":"robusto / rechoncho","pron":"/chán-ki/"}',
        '{"v":"hefty","es":"pesado / corpulento","pron":"/héf-ti/"}',
        '{"v":"broad","es":"amplio / ancho","pron":"/brod/"}',
        '{"v":"compact","es":"compacto","pron":"/kom-pákt/"}',
        '{"v":"endless","es":"interminable","pron":"/énd-les/"}',
        '{"v":"miniature","es":"en miniatura","pron":"/mí-nia-cher/"}',

        -- ==========================================
        -- 7. EDAD (Age)
        -- ==========================================
        '{"v":"new","es":"nuevo","pron":"/niu/"}',
        '{"v":"old","es":"viejo / antiguo","pron":"/óuld/"}',
        '{"v":"young","es":"joven","pron":"/iang/"}',
        '{"v":"modern","es":"moderno","pron":"/mó-dern/"}',
        '{"v":"ancient","es":"antiguo / milenario","pron":"/éin-shent/"}',
        '{"v":"recent","es":"reciente","pron":"/rí-sent/"}',
        '{"v":"elderly","es":"anciano / mayor","pron":"/él-der-li/"}',
        '{"v":"teenage","es":"adolescente","pron":"/tín-eich/"}',
        '{"v":"antique","es":"antiguo (de época/valor)","pron":"/an-tík/"}',
        '{"v":"contemporary","es":"contemporáneo","pron":"/kon-tém-po-re-ri/"}',
        '{"v":"current","es":"actual","pron":"/kér-rent/"}',
        '{"v":"fresh","es":"fresco / reciente","pron":"/fresh/"}',
        '{"v":"mature","es":"maduro","pron":"/ma-chúr/"}',
        '{"v":"outdated","es":"anticuado / obsoleto","pron":"/aut-déi-tid/"}',
        '{"v":"senior","es":"mayor / veterano","pron":"/sí-nior/"}',
        '{"v":"youthful","es":"juvenil","pron":"/iúz-ful/"}',
        '{"v":"middle-aged","es":"de mediana edad","pron":"/mí-del éicht/"}',

        -- ==========================================
        -- 8. TEMPERATURA (Temperature)
        -- ==========================================
        '{"v":"hot","es":"caliente / caluroso","pron":"/hot/"}',
        '{"v":"cold","es":"frío","pron":"/kóuld/"}',
        '{"v":"warm","es":"cálido / tibio","pron":"/uorm/"}',
        '{"v":"cool","es":"fresco","pron":"/kul/"}',
        '{"v":"freezing","es":"helado","pron":"/frí-sin/"}',
        '{"v":"boiling","es":"hirviendo","pron":"/bói-lin/"}',
        '{"v":"chilly","es":"frío / friolento","pron":"/chí-li/"}',
        '{"v":"lukewarm","es":"tibio","pron":"/lúk-uorm/"}',
        '{"v":"icy","es":"helado (con hielo)","pron":"/ái-si/"}',
        '{"v":"crisp","es":"fresco y seco (clima)","pron":"/krisp/"}',
        '{"v":"mild","es":"templado / suave","pron":"/máild/"}',
        '{"v":"scorching","es":"abrasador","pron":"/skór-chin/"}',
        '{"v":"burning","es":"ardiente","pron":"/bér-nin/"}',
        '{"v":"frosty","es":"escarchado / muy frío","pron":"/frós-ti/"}',

        -- ==========================================
        -- 9. FORMA (Shape)
        -- ==========================================
        '{"v":"round","es":"redondo","pron":"/ráund/"}',
        '{"v":"square","es":"cuadrado","pron":"/skuer/"}',
        '{"v":"rectangular","es":"rectangular","pron":"/rek-tán-giu-lar/"}',
        '{"v":"triangular","es":"triangular","pron":"/trai-án-giu-lar/"}',
        '{"v":"flat","es":"plano","pron":"/flat/"}',
        '{"v":"oval","es":"ovalado","pron":"/óu-val/"}',
        '{"v":"curved","es":"curvo","pron":"/kervd/"}',
        '{"v":"straight","es":"recto / liso","pron":"/stréit/"}',
        '{"v":"crooked","es":"torcido","pron":"/krú-kid/"}',
        '{"v":"circular","es":"circular","pron":"/sér-kiu-lar/"}',
        '{"v":"spherical","es":"esférico","pron":"/sfé-ri-kal/"}',
        '{"v":"cylindrical","es":"cilíndrico","pron":"/si-lín-dri-kal/"}',
        '{"v":"hollow","es":"hueco","pron":"/hó-lou/"}',
        '{"v":"solid","es":"sólido / macizo","pron":"/só-lid/"}',
        '{"v":"steep","es":"empinado","pron":"/stip/"}',
        '{"v":"wavy","es":"ondulado","pron":"/uéi-vi/"}',
        '{"v":"zigzag","es":"en zigzag","pron":"/síg-sag/"}',
        '{"v":"symmetrical","es":"simétrico","pron":"/si-mé-tri-kal/"}',

        -- ==========================================
        -- 10. ORIGEN (Origin)
        -- ==========================================
        '{"v":"American","es":"estadounidense","pron":"/a-mé-ri-kan/"}',
        '{"v":"Mexican","es":"mexicano","pron":"/mék-si-kan/"}',
        '{"v":"Canadian","es":"canadiense","pron":"/ka-néi-di-an/"}',
        '{"v":"Spanish","es":"español","pron":"/spá-nish/"}',
        '{"v":"British","es":"británico","pron":"/brí-tish/"}',
        '{"v":"European","es":"europeo","pron":"/iu-ro-pí-an/"}',
        '{"v":"Asian","es":"asiático","pron":"/éi-shan/"}',
        '{"v":"Latin","es":"latino","pron":"/lá-tin/"}',
        '{"v":"African","es":"africano","pron":"/á-fri-kan/"}',
        '{"v":"Australian","es":"australiano","pron":"/os-tréi-lian/"}',
        '{"v":"Brazilian","es":"brasileño","pron":"/bra-sí-lian/"}',
        '{"v":"Chinese","es":"chino","pron":"/chái-nis/"}',
        '{"v":"French","es":"francés","pron":"/french/"}',
        '{"v":"German","es":"alemán","pron":"/yér-man/"}',
        '{"v":"Indian","es":"indio","pron":"/ín-dian/"}',
        '{"v":"Italian","es":"italiano","pron":"/i-tá-lian/"}',
        '{"v":"Japanese","es":"japonés","pron":"/ya-pa-nís/"}',
        '{"v":"Korean","es":"coreano","pron":"/ko-rí-an/"}',
        '{"v":"Russian","es":"ruso","pron":"/rá-shan/"}',

        -- ==========================================
        -- 11. MATERIAL (Material)
        -- ==========================================
        '{"v":"wooden","es":"de madera","pron":"/uú-den/"}',
        '{"v":"iron","es":"de hierro","pron":"/ái-ron/"}',
        '{"v":"plastic","es":"de plástico","pron":"/plás-tik/"}',
        '{"v":"metal","es":"de metal","pron":"/mé-tal/"}',
        '{"v":"glass","es":"de vidrio","pron":"/glas/"}',
        '{"v":"leather","es":"de cuero","pron":"/lé-der/"}',
        '{"v":"cotton","es":"de algodón","pron":"/kó-ton/"}',
        '{"v":"wool","es":"de lana","pron":"/uul/"}',
        '{"v":"silk","es":"de seda","pron":"/silk/"}',
        '{"v":"paper","es":"de papel","pron":"/péi-per/"}',
        '{"v":"rubber","es":"de goma / caucho","pron":"/rá-ber/"}',
        '{"v":"ceramic","es":"de cerámica","pron":"/se-rá-mik/"}',
        '{"v":"concrete","es":"de hormigón / concreto","pron":"/kón-krit/"}',
        '{"v":"diamond","es":"de diamante","pron":"/dái-mond/"}',
        '{"v":"fabric","es":"de tela","pron":"/fá-brik/"}',
        '{"v":"marble","es":"de mármol","pron":"/már-bol/"}',
        '{"v":"nylon","es":"de nailon","pron":"/nái-lon/"}',
        '{"v":"polyester","es":"de poliéster","pron":"/po-li-és-ter/"}',
        '{"v":"stone","es":"de piedra","pron":"/stóun/"}',
        '{"v":"brick","es":"de ladrillo","pron":"/brik/"}'
    ];

BEGIN

-- 1. Obtener el path del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Deck en la base de datos en el Step 160
INSERT INTO deck (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 160, 'en', 'deck') 
RETURNING uuid INTO v_deck_id;

-- 3. Insertar Traducción y Metadata del Deck
INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (
    v_deck_id, 
    'es', 
    'Adjetivos', 
    ''
);

-- 4. Bucle para insertar todas las palabras del mazo
FOREACH v_item IN ARRAY v_adjectives
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
