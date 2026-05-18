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
        '{"v":"red","es":"rojo","de":"rot","pron":"/red/","pron_de":"/red/"}',
        '{"v":"blue","es":"azul","de":"blau","pron":"/blu/","pron_de":"/bluu/"}',
        '{"v":"yellow","es":"amarillo","de":"gelb","pron":"/ié-lou/","pron_de":"/JE-lou/"}',
        '{"v":"green","es":"verde","de":"grün","pron":"/grin/","pron_de":"/grien/"}',
        '{"v":"black","es":"negro","de":"schwarz","pron":"/blak/","pron_de":"/bläk/"}',
        '{"v":"white","es":"blanco","de":"weiß","pron":"/uáit/","pron_de":"/wait/"}',
        '{"v":"gray","es":"gris","de":"grau","pron":"/gréi/","pron_de":"/grej/"}',
        '{"v":"orange","es":"naranja","de":"orange","pron":"/ó-ranch/","pron_de":"/O-rindsch/"}',
        '{"v":"purple","es":"morado","de":"lila / violett","pron":"/pér-pol/","pron_de":"/PÖ-pol/"}',
        '{"v":"brown","es":"marrón / café","de":"braun","pron":"/bráun/","pron_de":"/braun/"}',
        '{"v":"pink","es":"rosa","de":"rosa","pron":"/pink/","pron_de":"/pink/"}',
        '{"v":"silver","es":"plateado","de":"silber","pron":"/síl-ver/","pron_de":"/SIL-wö/"}',
        '{"v":"gold","es":"dorado","de":"golden / Gold","pron":"/góuld/","pron_de":"/gould/"}',
        '{"v":"cyan","es":"cian","de":"zyan","pron":"/sái-an/","pron_de":"/SAI-an/"}',
        '{"v":"magenta","es":"magenta","de":"magenta","pron":"/ma-yén-ta/","pron_de":"/mö-DSCHEN-tö/"}',
        '{"v":"beige","es":"beis","de":"beige","pron":"/béish/","pron_de":"/bejsch/"}',
        '{"v":"maroon","es":"granate / burdeos","de":"kastanienbraun / dunkelrot","pron":"/ma-rún/","pron_de":"/mö-RUUN/"}',
        '{"v":"turquoise","es":"turquesa","de":"türkis","pron":"/tér-kois/","pron_de":"/TÖ-kuois/"}',
        '{"v":"teal","es":"verde azulado","de":"blaugrün","pron":"/til/","pron_de":"/tiel/"}',
        '{"v":"navy","es":"azul marino","de":"marineblau","pron":"/néi-vi/","pron_de":"/NEJ-wi/"}',
        '{"v":"olive","es":"verde oliva","de":"olivgrün","pron":"/ó-liv/","pron_de":"/O-liw/"}',
        '{"v":"indigo","es":"índigo / añil","de":"indigo","pron":"/ín-di-gou/","pron_de":"/IN-di-gou/"}',
        '{"v":"peach","es":"color durazno","de":"pfirsichfarben","pron":"/pich/","pron_de":"/pietsch/"}',
        '{"v":"violet","es":"violeta","de":"violett / lila","pron":"/vái-o-let/","pron_de":"/WAI-ö-löt/"}',

        -- ==========================================
        -- 2. DESCRIPCIÓN FÍSICA
        -- ==========================================
        '{"v":"tall","es":"alto","de":"groß / hochgewachsen","pron":"/tol/","pron_de":"/tool/"}',
        '{"v":"short","es":"bajo / corto","de":"kurz / klein","pron":"/short/","pron_de":"/schoot/"}',
        '{"v":"thin","es":"delgado","de":"dünn","pron":"/zin/","pron_de":"/ssin/"}',
        '{"v":"slim","es":"esbelto","de":"schlank","pron":"/slim/","pron_de":"/slim/"}',
        '{"v":"fat","es":"gordo","de":"dick / fett","pron":"/fat/","pron_de":"/fät/"}',
        '{"v":"chubby","es":"rechoncho / gordito","de":"mollig / pummelig","pron":"/chá-bi/","pron_de":"/TSCHA-bi/"}',
        '{"v":"muscular","es":"musculoso","de":"muskulös","pron":"/más-kiu-lar/","pron_de":"/MA-skju-lö/"}',
        '{"v":"strong","es":"fuerte","de":"stark","pron":"/strong/","pron_de":"/strong/"}',
        '{"v":"weak","es":"débil","de":"schwach","pron":"/uík/","pron_de":"/wiek/"}',
        '{"v":"beautiful","es":"hermosa / bella","de":"schön / wunderschön","pron":"/biú-ti-ful/","pron_de":"/BJUU-ti-ful/"}',
        '{"v":"handsome","es":"guapo (para hombres)","de":"gutaussehend / hübsch","pron":"/hán-som/","pron_de":"/HÄN-söm/"}',
        '{"v":"ugly","es":"feo","de":"hässlich","pron":"/á-gli/","pron_de":"/A-gli/"}',
        '{"v":"attractive","es":"atractivo","de":"attraktiv","pron":"/a-trák-tiv/","pron_de":"/ö-TRÄK-tiw/"}',
        '{"v":"bald","es":"calvo","de":"kahl / glatzköpfig","pron":"/bold/","pron_de":"/boold/"}',
        '{"v":"blonde","es":"rubio/a","de":"blond","pron":"/blond/","pron_de":"/blond/"}',
        '{"v":"brunette","es":"castaña / morena","de":"brünett","pron":"/bru-nét/","pron_de":"/bruu-NET/"}',
        '{"v":"curvy","es":"con curvas","de":"kurvig","pron":"/kér-vi/","pron_de":"/KÖ-wi/"}',
        '{"v":"fit","es":"en forma","de":"fit / in Form","pron":"/fit/","pron_de":"/fit/"}',
        '{"v":"gorgeous","es":"precioso/a / deslumbrante","de":"wunderschön / hinreißend","pron":"/gór-chos/","pron_de":"/GOO-dschös/"}',
        '{"v":"plain","es":"sencillo / poco atractivo","de":"schlicht / unscheinbar","pron":"/pléin/","pron_de":"/plejn/"}',
        '{"v":"stunning","es":"impresionante","de":"atemberaubend","pron":"/stá-nin/","pron_de":"/STA-ning/"}',
        '{"v":"pale","es":"pálido","de":"blass","pron":"/péil/","pron_de":"/pejl/"}',
        '{"v":"tanned","es":"bronceado","de":"gebräunt / braun gebrannt","pron":"/tand/","pron_de":"/tänd/"}',
        '{"v":"wrinkled","es":"arrugado","de":"faltig / runzelig","pron":"/rín-kold/","pron_de":"/RING-köld/"}',
        '{"v":"smooth","es":"suave / liso","de":"glatt / weich","pron":"/smus/","pron_de":"/smuud/"}',
        '{"v":"rough","es":"áspero / rugoso","de":"rau / grob","pron":"/raf/","pron_de":"/raf/"}',
        '{"v":"heavy","es":"pesado","de":"schwer / schwerfällig","pron":"/hé-vi/","pron_de":"/HE-wi/"}',
        '{"v":"light","es":"ligero / liviano","de":"leicht / hell","pron":"/láit/","pron_de":"/lait/"}',

        -- ==========================================
        -- 3. PERSONALIDAD
        -- ==========================================
        '{"v":"nice","es":"agradable / simpático","de":"nett / sympathisch","pron":"/náis/","pron_de":"/nais/"}',
        '{"v":"kind","es":"amable / bondadoso","de":"freundlich / nett","pron":"/káind/","pron_de":"/kaind/"}',
        '{"v":"polite","es":"educado / cortés","de":"höflich","pron":"/po-láit/","pron_de":"/pö-LAIT/"}',
        '{"v":"rude","es":"grosero / maleducado","de":"unhöflich / grob","pron":"/rud/","pron_de":"/ruud/"}',
        '{"v":"funny","es":"divertido / gracioso","de":"lustig / witzig","pron":"/fá-ni/","pron_de":"/FA-ni/"}',
        '{"v":"serious","es":"serio","de":"ernst / ernsthaft","pron":"/sí-ri-os/","pron_de":"/SI-ri-ös/"}',
        '{"v":"shy","es":"tímido","de":"schüchtern","pron":"/shái/","pron_de":"/schai/"}',
        '{"v":"outgoing","es":"extrovertido / sociable","de":"gesellig / aufgeschlossen","pron":"/aut-góu-in/","pron_de":"/AUT-gou-ing/"}',
        '{"v":"lazy","es":"perezoso / flojo","de":"faul","pron":"/léi-si/","pron_de":"/LEJ-si/"}',
        '{"v":"hardworking","es":"trabajador","de":"fleißig","pron":"/hard-uér-kin/","pron_de":"/HAAD-wö-king/"}',
        '{"v":"smart","es":"inteligente / listo","de":"klug / intelligent","pron":"/smart/","pron_de":"/smaad/"}',
        '{"v":"stupid","es":"estúpido / tonto","de":"dumm / blöd","pron":"/stú-pid/","pron_de":"/STJUU-pid/"}',
        '{"v":"brave","es":"valiente","de":"mutig / tapfer","pron":"/bréiv/","pron_de":"/brejw/"}',
        '{"v":"cowardly","es":"cobarde","de":"feige","pron":"/káu-ard-li/","pron_de":"/KAU-öd-li/"}',
        '{"v":"honest","es":"honesto","de":"ehrlich","pron":"/ó-nest/","pron_de":"/O-nist/"}',
        '{"v":"dishonest","es":"deshonesto","de":"unehrlich","pron":"/dis-ó-nest/","pron_de":"/dis-O-nist/"}',
        '{"v":"arrogant","es":"arrogante","de":"arrogant","pron":"/á-ro-gant/","pron_de":"/Ä-rö-gönt/"}',
        '{"v":"bossy","es":"mandón","de":"herrisch / dominant","pron":"/bó-si/","pron_de":"/BO-si/"}',
        '{"v":"calm","es":"tranquilo","de":"ruhig / gelassen","pron":"/kam/","pron_de":"/kaam/"}',
        '{"v":"careful","es":"cuidadoso","de":"vorsichtig / sorgfältig","pron":"/kér-ful/","pron_de":"/KER-ful/"}',
        '{"v":"careless","es":"descuidado","de":"unvorsichtig / nachlässig","pron":"/kér-les/","pron_de":"/KER-lös/"}',
        '{"v":"cheerful","es":"alegre","de":"fröhlich / heiter","pron":"/chír-ful/","pron_de":"/TSCHI-ö-ful/"}',
        '{"v":"confident","es":"seguro de sí mismo","de":"selbstbewusst / zuversichtlich","pron":"/kón-fi-dent/","pron_de":"/KON-fi-dönt/"}',
        '{"v":"crazy","es":"loco","de":"verrückt / wahnsinnig","pron":"/kréi-si/","pron_de":"/KREJ-si/"}',
        '{"v":"cruel","es":"cruel","de":"grausam / brutal","pron":"/kruel/","pron_de":"/KRUU-öl/"}',
        '{"v":"curious","es":"curioso","de":"neugierig","pron":"/kiú-ri-os/","pron_de":"/KJUU-ri-ös/"}',
        '{"v":"friendly","es":"amigable","de":"freundlich","pron":"/frénd-li/","pron_de":"/FREND-li/"}',
        '{"v":"generous","es":"generoso","de":"großzügig","pron":"/yé-ne-ros/","pron_de":"/DSCHEN-ö-rös/"}',
        '{"v":"greedy","es":"codicioso / avaro","de":"gierig / habgierig","pron":"/grí-di/","pron_de":"/GRIE-di/"}',
        '{"v":"jealous","es":"celoso","de":"eifersüchtig / neidisch","pron":"/yé-los/","pron_de":"/DSCHEL-ös/"}',
        '{"v":"loyal","es":"leal","de":"loyal / treu","pron":"/ló-ial/","pron_de":"/LOI-öl/"}',
        '{"v":"mean","es":"mezquino / malo","de":"gemein / böse","pron":"/min/","pron_de":"/mien/"}',
        '{"v":"patient","es":"paciente","de":"geduldig","pron":"/péi-shent/","pron_de":"/PEJ-schönt/"}',
        '{"v":"proud","es":"orgulloso","de":"stolz","pron":"/práud/","pron_de":"/praud/"}',
        '{"v":"selfish","es":"egoísta","de":"selbstsüchtig / egoistisch","pron":"/sél-fish/","pron_de":"/SEL-fisch/"}',
        '{"v":"silly","es":"tonto / bobo","de":"albern / dumm","pron":"/sí-li/","pron_de":"/SI-li/"}',
        '{"v":"strict","es":"estricto","de":"streng / strikt","pron":"/stríkt/","pron_de":"/strikt/"}',
        '{"v":"stubborn","es":"terco / testarudo","de":"stur / eigensinnig","pron":"/stá-born/","pron_de":"/STA-bön/"}',
        '{"v":"sweet","es":"dulce / tierno","de":"süß / lieb","pron":"/suit/","pron_de":"/swiet/"}',
        '{"v":"talkative","es":"hablador","de":"redselig / gesprächig","pron":"/tó-ka-tiv/","pron_de":"/TOO-kö-tiw/"}',
        '{"v":"quiet","es":"callado","de":"ruhig / still / leise","pron":"/kuái-et/","pron_de":"/KWAI-öt/"}',

        -- ==========================================
        -- 4. ESTADOS DE ÁNIMO (Moods)
        -- ==========================================
        '{"v":"happy","es":"feliz","de":"glücklich / fröhlich","pron":"/há-pi/","pron_de":"/HÄ-pi/"}',
        '{"v":"sad","es":"triste","de":"traurig","pron":"/sad/","pron_de":"/säd/"}',
        '{"v":"angry","es":"enojado / enfadado","de":"wütend / verärgert","pron":"/án-gri/","pron_de":"/ÄNG-gri/"}',
        '{"v":"mad","es":"furioso / enojado (US)","de":"rasend / wütend","pron":"/mad/","pron_de":"/mäd/"}',
        '{"v":"upset","es":"molesto / disgustado","de":"aufgebracht / verstimmt","pron":"/ap-sét/","pron_de":"/ap-SET/"}',
        '{"v":"tired","es":"cansado","de":"müde / erschöpft","pron":"/táird/","pron_de":"/TAI-öd/"}',
        '{"v":"exhausted","es":"exhausto","de":"erschöpft / ausgelaugt","pron":"/eg-zós-tid/","pron_de":"/ek-SOOS-tid/"}',
        '{"v":"hungry","es":"hambriento","de":"hungrig","pron":"/hán-gri/","pron_de":"/HANG-gri/"}',
        '{"v":"thirsty","es":"sediento","de":"durstig","pron":"/zérs-ti/","pron_de":"/SSÖ-sti/"}',
        '{"v":"bored","es":"aburrido","de":"gelangweilt","pron":"/bord/","pron_de":"/bood/"}',
        '{"v":"excited","es":"emocionado","de":"aufgeregt / begeistert","pron":"/ek-sái-tid/","pron_de":"/ek-SAI-tid/"}',
        '{"v":"nervous","es":"nervioso","de":"nervös / aufgeregt","pron":"/nér-vos/","pron_de":"/NÖ-wös/"}',
        '{"v":"worried","es":"preocupado","de":"besorgt / beunruhigt","pron":"/uó-rid/","pron_de":"/WA-rid/"}',
        '{"v":"relaxed","es":"relajado","de":"entspannt / gelassen","pron":"/ri-lákst/","pron_de":"/ri-LÄKST/"}',
        '{"v":"scared","es":"asustado","de":"verängstigt / erschrocken","pron":"/skerd/","pron_de":"/sked/"}',
        '{"v":"surprised","es":"sorprendido","de":"überrascht","pron":"/ser-práist/","pron_de":"/sö-PRAIST/"}',
        '{"v":"afraid","es":"temeroso / con miedo","de":"verängstigt / in Angst","pron":"/a-fréid/","pron_de":"/ö-FREJD/"}',
        '{"v":"amazed","es":"asombrado","de":"erstaunt / verblüfft","pron":"/a-méist/","pron_de":"/ö-MEJST/"}',
        '{"v":"annoyed","es":"irritado","de":"genervt / verärgert","pron":"/a-nóid/","pron_de":"/ö-NOID/"}',
        '{"v":"anxious","es":"ansioso","de":"ängstlich / besorgt","pron":"/ánk-shos/","pron_de":"/ÄNK-schös/"}',
        '{"v":"ashamed","es":"avergonzado","de":"beschämt / schamhaft","pron":"/a-shéimd/","pron_de":"/ö-SCHEJMD/"}',
        '{"v":"confused","es":"confundido","de":"verwirrt","pron":"/kon-fiúst/","pron_de":"/kön-FJUUST/"}',
        '{"v":"depressed","es":"deprimido","de":"deprimiert / niedergeschlagen","pron":"/di-prést/","pron_de":"/di-PREST/"}',
        '{"v":"disappointed","es":"decepcionado","de":"enttäuscht","pron":"/dis-a-póin-tid/","pron_de":"/dis-ö-POIN-tid/"}',
        '{"v":"disgusted","es":"asqueado","de":"angeekelt / angewidert","pron":"/dis-gás-tid/","pron_de":"/dis-GAS-tid/"}',
        '{"v":"eager","es":"entusiasmado / impaciente por algo","de":"eifrig / begierig","pron":"/í-guer/","pron_de":"/IE-gö/"}',
        '{"v":"embarrassed","es":"avergonzado (situación social)","de":"verlegen / peinlich berührt","pron":"/em-bá-rast/","pron_de":"/im-BÄ-röst/"}',
        '{"v":"frightened","es":"aterrado","de":"erschrocken / verängstigt","pron":"/frái-tend/","pron_de":"/FRAI-tönd/"}',
        '{"v":"frustrated","es":"frustrado","de":"frustriert","pron":"/fras-tréi-tid/","pron_de":"/FRAS-trej-tid/"}',
        '{"v":"glad","es":"contento / complacido","de":"froh / erfreut","pron":"/glad/","pron_de":"/gläd/"}',
        '{"v":"guilty","es":"culpable","de":"schuldig","pron":"/guíl-ti/","pron_de":"/GIL-ti/"}',
        '{"v":"lonely","es":"solitario (sentimiento)","de":"einsam","pron":"/lóun-li/","pron_de":"/LOUN-li/"}',
        '{"v":"pleased","es":"complacido","de":"erfreut / zufrieden","pron":"/plist/","pron_de":"/pliest/"}',
        '{"v":"relieved","es":"aliviado","de":"erleichtert","pron":"/ri-lívd/","pron_de":"/ri-LIEWD/"}',
        '{"v":"shocked","es":"conmocionado","de":"schockiert / entsetzt","pron":"/shokt/","pron_de":"/schokt/"}',
        '{"v":"sleepy","es":"soñoliento","de":"schläfrig / müde","pron":"/slí-pi/","pron_de":"/SLIE-pi/"}',
        '{"v":"stressed","es":"estresado","de":"gestresst / angespannt","pron":"/strest/","pron_de":"/strest/"}',
        '{"v":"terrified","es":"aterrorizado","de":"entsetzt / verängstigt","pron":"/té-ri-faid/","pron_de":"/TE-ri-faid/"}',
        '{"v":"thankful","es":"agradecido","de":"dankbar","pron":"/zánk-ful/","pron_de":"/SSÄNK-ful/"}',
        '{"v":"thrilled","es":"emocionadísimo","de":"begeistert / aufgeregt","pron":"/zrild/","pron_de":"/ssrild/"}',

        -- ==========================================
        -- 5. OPINIÓN O JUICIO (Opinion / Judgment)
        -- ==========================================
        '{"v":"good","es":"bueno","de":"gut","pron":"/gud/","pron_de":"/gud/"}',
        '{"v":"bad","es":"malo","de":"schlecht / böse","pron":"/bad/","pron_de":"/bäd/"}',
        '{"v":"excellent","es":"excelente","de":"ausgezeichnet / hervorragend","pron":"/ék-se-lent/","pron_de":"/EK-sö-lönt/"}',
        '{"v":"terrible","es":"terrible","de":"schrecklich / furchtbar","pron":"/té-ri-bol/","pron_de":"/TE-ri-böl/"}',
        '{"v":"awful","es":"horrible / espantoso","de":"furchtbar / schrecklich","pron":"/ó-fol/","pron_de":"/OO-föl/"}',
        '{"v":"wonderful","es":"maravilloso","de":"wunderbar","pron":"/uán-der-ful/","pron_de":"/WAN-dö-ful/"}',
        '{"v":"awesome","es":"increíble / genial (US)","de":"großartig / toll","pron":"/ó-som/","pron_de":"/OO-söm/"}',
        '{"v":"expensive","es":"caro","de":"teuer","pron":"/eks-pén-siv/","pron_de":"/ek-SPEN-siw/"}',
        '{"v":"cheap","es":"barato","de":"billig / günstig","pron":"/chip/","pron_de":"/tschiep/"}',
        '{"v":"important","es":"importante","de":"wichtig","pron":"/im-pór-tant/","pron_de":"/im-POO-tönt/"}',
        '{"v":"useful","es":"útil","de":"nützlich / hilfreich","pron":"/iús-ful/","pron_de":"/JUUS-ful/"}',
        '{"v":"useless","es":"inútil","de":"nutzlos","pron":"/iús-les/","pron_de":"/JUUS-lös/"}',
        '{"v":"easy","es":"fácil","de":"einfach / leicht","pron":"/í-si/","pron_de":"/IE-si/"}',
        '{"v":"difficult","es":"difícil","de":"schwierig / schwer","pron":"/dí-fi-kult/","pron_de":"/DI-fi-költ/"}',
        '{"v":"right","es":"correcto / adecuado","de":"richtig / korrekt","pron":"/ráit/","pron_de":"/rait/"}',
        '{"v":"wrong","es":"incorrecto / equivocado","de":"falsch / verkehrt","pron":"/rong/","pron_de":"/rong/"}',
        '{"v":"amazing","es":"asombroso","de":"erstaunlich / beeindruckend","pron":"/a-méi-sin/","pron_de":"/ö-MEJ-sing/"}',
        '{"v":"brilliant","es":"brillante / genial","de":"brillant / genial","pron":"/brí-liant/","pron_de":"/BRIL-jönt/"}',
        '{"v":"dirty","es":"sucio","de":"schmutzig / dreckig","pron":"/dér-ti/","pron_de":"/DÖ-ti/"}',
        '{"v":"clean","es":"limpio","de":"sauber / rein","pron":"/klin/","pron_de":"/klien/"}',
        '{"v":"dangerous","es":"peligroso","de":"gefährlich","pron":"/déin-che-ros/","pron_de":"/DEJN-dschö-rös/"}',
        '{"v":"safe","es":"seguro","de":"sicher / ungefährlich","pron":"/séif/","pron_de":"/sejf/"}',
        '{"v":"fair","es":"justo","de":"fair / gerecht","pron":"/fer/","pron_de":"/feö/"}',
        '{"v":"unfair","es":"injusto","de":"unfair / ungerecht","pron":"/an-fér/","pron_de":"/an-FEÖ/"}',
        '{"v":"famous","es":"famoso","de":"berühmt","pron":"/féi-mos/","pron_de":"/FEJ-mös/"}',
        '{"v":"fantastic","es":"fantástico","de":"fantastisch","pron":"/fan-tás-tik/","pron_de":"/fän-TÄS-tik/"}',
        '{"v":"foolish","es":"tonto / insensato","de":"töricht / dumm","pron":"/fú-lish/","pron_de":"/FUUL-isch/"}',
        '{"v":"great","es":"genial / grandioso","de":"großartig / toll","pron":"/gréit/","pron_de":"/grejt/"}',
        '{"v":"horrible","es":"horrible","de":"schrecklich / furchtbar","pron":"/hó-ri-bol/","pron_de":"/HO-ri-böl/"}',
        '{"v":"perfect","es":"perfecto","de":"perfekt / vollkommen","pron":"/pér-fekt/","pron_de":"/PÖ-fikt/"}',
        '{"v":"poor","es":"pobre / de mala calidad","de":"arm / ärmlich","pron":"/pur/","pron_de":"/puö/"}',
        '{"v":"rich","es":"rico / adinerado","de":"reich / wohlhabend","pron":"/rich/","pron_de":"/ritsch/"}',
        '{"v":"special","es":"especial","de":"besonders / speziell","pron":"/spé-shal/","pron_de":"/SPE-schöl/"}',
        '{"v":"strange","es":"extraño / raro","de":"seltsam / merkwürdig","pron":"/stréinch/","pron_de":"/strejndsch/"}',
        '{"v":"weird","es":"raro / bizarro","de":"eigenartig / komisch","pron":"/uird/","pron_de":"/wiöd/"}',
        '{"v":"wild","es":"salvaje","de":"wild / ungezähmt","pron":"/uáild/","pron_de":"/waild/"}',
        '{"v":"valuable","es":"valioso","de":"wertvoll","pron":"/vá-liu-bol/","pron_de":"/VÄL-ju-böl/"}',
        '{"v":"worthless","es":"sin valor","de":"wertlos","pron":"/uérz-les/","pron_de":"/WÖ-sslös/"}',

        -- ==========================================
        -- 6. TAMAÑO O LONGITUD (Size / Length)
        -- ==========================================
        '{"v":"big","es":"grande","de":"groß / riesig","pron":"/big/","pron_de":"/big/"}',
        '{"v":"large","es":"grande / amplio","de":"groß / geräumig","pron":"/larch/","pron_de":"/laadsch/"}',
        '{"v":"huge","es":"enorme","de":"riesig / gewaltig","pron":"/hiuch/","pron_de":"/hjuudsch/"}',
        '{"v":"small","es":"pequeño","de":"klein","pron":"/smol/","pron_de":"/smool/"}',
        '{"v":"tiny","es":"diminuto","de":"winzig / klitzeklein","pron":"/tái-ni/","pron_de":"/TAI-ni/"}',
        '{"v":"long","es":"largo","de":"lang","pron":"/long/","pron_de":"/long/"}',
        '{"v":"wide","es":"ancho","de":"breit / weit","pron":"/uáid/","pron_de":"/waid/"}',
        '{"v":"narrow","es":"estrecho","de":"schmal / eng","pron":"/ná-rou/","pron_de":"/NÄ-rou/"}',
        '{"v":"deep","es":"profundo","de":"tief","pron":"/dip/","pron_de":"/diep/"}',
        '{"v":"shallow","es":"poco profundo / superficial","de":"seicht / flach","pron":"/shá-lou/","pron_de":"/SCHÄ-lou/"}',
        '{"v":"thick","es":"grueso / espeso","de":"dick / dicht","pron":"/zik/","pron_de":"/ssik/"}',
        '{"v":"thin (objects)","es":"fino (para objetos)","de":"dünn (für Objekte)","pron":"/zin/","pron_de":"/ssin/"}',
        '{"v":"gigantic","es":"gigantesco","de":"gigantisch / riesenhaft","pron":"/chai-gán-tik/","pron_de":"/dschai-GÄN-tik/"}',
        '{"v":"massive","es":"masivo / enorme","de":"massiv / gewaltig","pron":"/má-siv/","pron_de":"/MÄ-siw/"}',
        '{"v":"enormous","es":"enorme","de":"enorm / riesig","pron":"/i-nór-mos/","pron_de":"/i-NOO-möss/"}',
        '{"v":"microscopic","es":"microscópico","de":"mikroskopisch","pron":"/mai-kro-skó-pik/","pron_de":"/mai-krö-SKO-pik/"}',
        '{"v":"petite","es":"pequeña y delgada (mujeres)","de":"zierlich / klein (Frauen)","pron":"/pe-tít/","pron_de":"/pö-TIET/"}',
        '{"v":"chunky","es":"robusto / rechoncho","de":"stämmig / klobig","pron":"/chán-ki/","pron_de":"/TSCHANG-ki/"}',
        '{"v":"hefty","es":"pesado / corpulento","de":"schwer / kräftig","pron":"/héf-ti/","pron_de":"/HEF-ti/"}',
        '{"v":"broad","es":"amplio / ancho","de":"breit / weit","pron":"/brod/","pron_de":"/brood/"}',
        '{"v":"compact","es":"compacto","de":"kompakt","pron":"/kom-pákt/","pron_de":"/KOM-päkt/"}',
        '{"v":"endless","es":"interminable","de":"endlos / unendlich","pron":"/énd-les/","pron_de":"/END-lös/"}',
        '{"v":"miniature","es":"en miniatura","de":"winzig / im Miniaturformat","pron":"/mí-nia-cher/","pron_de":"/MI-ni-tschö/"}',

        -- ==========================================
        -- 7. EDAD (Age)
        -- ==========================================
        '{"v":"new","es":"nuevo","de":"neu","pron":"/niu/","pron_de":"/njuu/"}',
        '{"v":"old","es":"viejo / antiguo","de":"alt","pron":"/óuld/","pron_de":"/ould/"}',
        '{"v":"young","es":"joven","de":"jung","pron":"/iang/","pron_de":"/jang/"}',
        '{"v":"modern","es":"moderno","de":"modern","pron":"/mó-dern/","pron_de":"/MO-dön/"}',
        '{"v":"ancient","es":"antiguo / milenario","de":"uralt / antik","pron":"/éin-shent/","pron_de":"/EJN-schönt/"}',
        '{"v":"recent","es":"reciente","de":"kürzlich / aktuell","pron":"/rí-sent/","pron_de":"/RIE-sönt/"}',
        '{"v":"elderly","es":"anciano / mayor","de":"ältlich / betagt","pron":"/él-der-li/","pron_de":"/EL-dö-li/"}',
        '{"v":"teenage","es":"adolescente","de":"jugendlich / teenagerhaft","pron":"/tín-eich/","pron_de":"/TIEN-ejdsch/"}',
        '{"v":"antique","es":"antiguo (de época/valor)","de":"antik / altertümlich","pron":"/an-tík/","pron_de":"/än-TIEK/"}',
        '{"v":"contemporary","es":"contemporáneo","de":"zeitgenössisch","pron":"/kon-tém-po-re-ri/","pron_de":"/kön-TEM-pö-re-ri/"}',
        '{"v":"current","es":"actual","de":"aktuell / gegenwärtig","pron":"/kér-rent/","pron_de":"/KÖ-rönt/"}',
        '{"v":"fresh","es":"fresco / reciente","de":"frisch","pron":"/fresh/","pron_de":"/fresch/"}',
        '{"v":"mature","es":"maduro","de":"reif / ausgereift","pron":"/ma-chúr/","pron_de":"/mö-TSCHUU/"}',
        '{"v":"outdated","es":"anticuado / obsoleto","de":"veraltet / überholt","pron":"/aut-déi-tid/","pron_de":"/aut-DEJ-tid/"}',
        '{"v":"senior","es":"mayor / veterano","de":"älter / senior","pron":"/sí-nior/","pron_de":"/SIEN-jö/"}',
        '{"v":"youthful","es":"juvenil","de":"jugendlich / jung geblieben","pron":"/iúz-ful/","pron_de":"/JUUSS-ful/"}',
        '{"v":"middle-aged","es":"de mediana edad","de":"mittleren Alters / in den mittleren Jahren","pron":"/mí-del éicht/","pron_de":"/MI-döl-EJDSCHD/"}',

        -- ==========================================
        -- 8. TEMPERATURA (Temperature)
        -- ==========================================
        '{"v":"hot","es":"caliente / caluroso","de":"heiß / warm","pron":"/hot/","pron_de":"/hot/"}',
        '{"v":"cold","es":"frío","de":"kalt","pron":"/kóuld/","pron_de":"/kould/"}',
        '{"v":"warm","es":"cálido / tibio","de":"warm","pron":"/uorm/","pron_de":"/woorm/"}',
        '{"v":"cool","es":"fresco","de":"kühl","pron":"/kul/","pron_de":"/kuul/"}',
        '{"v":"freezing","es":"helado","de":"eiskalt / frierend","pron":"/frí-sin/","pron_de":"/FRIE-sing/"}',
        '{"v":"boiling","es":"hirviendo","de":"kochend heiß","pron":"/bói-lin/","pron_de":"/BOI-ling/"}',
        '{"v":"chilly","es":"frío / friolento","de":"kühl / frisch / kalt","pron":"/chí-li/","pron_de":"/TSCHI-li/"}',
        '{"v":"lukewarm","es":"tibio","de":"lauwarm","pron":"/lúk-uorm/","pron_de":"/LUUK-woorm/"}',
        '{"v":"icy","es":"helado (con hielo)","de":"eisig / vereist","pron":"/ái-si/","pron_de":"/AI-si/"}',
        '{"v":"crisp","es":"fresco y seco (clima)","de":"frisch und klar (Wetter)","pron":"/krisp/","pron_de":"/krisp/"}',
        '{"v":"mild","es":"templado / suave","de":"mild / angenehm","pron":"/máild/","pron_de":"/maild/"}',
        '{"v":"scorching","es":"abrasador","de":"sengend heiß / glühend","pron":"/skór-chin/","pron_de":"/SKOO-tschin/"}',
        '{"v":"burning","es":"ardiente","de":"brennend / glühend","pron":"/bér-nin/","pron_de":"/BÖ-ning/"}',
        '{"v":"frosty","es":"escarchado / muy frío","de":"frostig / eisig","pron":"/frós-ti/","pron_de":"/FROS-ti/"}',

        -- ==========================================
        -- 9. FORMA (Shape)
        -- ==========================================
        '{"v":"round","es":"redondo","de":"rund","pron":"/ráund/","pron_de":"/raund/"}',
        '{"v":"square","es":"cuadrado","de":"quadratisch / viereckig","pron":"/skuer/","pron_de":"/skweö/"}',
        '{"v":"rectangular","es":"rectangular","de":"rechteckig","pron":"/rek-tán-giu-lar/","pron_de":"/rek-TÄNG-gju-lö/"}',
        '{"v":"triangular","es":"triangular","de":"dreieckig","pron":"/trai-án-giu-lar/","pron_de":"/trai-ÄNG-gju-lö/"}',
        '{"v":"flat","es":"plano","de":"flach / eben","pron":"/flat/","pron_de":"/flätt/"}',
        '{"v":"oval","es":"ovalado","de":"oval","pron":"/óu-val/","pron_de":"/OU-wöl/"}',
        '{"v":"curved","es":"curvo","de":"gebogen / gekrümmt","pron":"/kervd/","pron_de":"/köwt/"}',
        '{"v":"straight","es":"recto / liso","de":"gerade","pron":"/stréit/","pron_de":"/strejt/"}',
        '{"v":"crooked","es":"torcido","de":"schief / krumm","pron":"/krú-kid/","pron_de":"/KRU-kid/"}',
        '{"v":"circular","es":"circular","de":"kreisförmig","pron":"/sér-kiu-lar/","pron_de":"/SÖ-kju-lö/"}',
        '{"v":"spherical","es":"esférico","de":"kugelförmig","pron":"/sfé-ri-kal/","pron_de":"/SFE-ri-köl/"}',
        '{"v":"cylindrical","es":"cilíndrico","de":"zylindrisch","pron":"/si-lín-dri-kal/","pron_de":"/si-LIN-dri-köl/"}',
        '{"v":"hollow","es":"hueco","de":"hohl","pron":"/hó-lou/","pron_de":"/HO-lou/"}',
        '{"v":"solid","es":"sólido / macizo","de":"fest / massiv","pron":"/só-lid/","pron_de":"/SO-lid/"}',
        '{"v":"steep","es":"empinado","de":"steil","pron":"/stip/","pron_de":"/stiep/"}',
        '{"v":"wavy","es":"ondulado","de":"wellenförmig / gewellt","pron":"/uéi-vi/","pron_de":"/WEJ-wi/"}',
        '{"v":"zigzag","es":"en zigzag","de":"zickzackförmig","pron":"/síg-sag/","pron_de":"/SIG-säg/"}',
        '{"v":"symmetrical","es":"simétrico","de":"symmetrisch","pron":"/si-mé-tri-kal/","pron_de":"/si-ME-tri-köl/"}',

        -- ==========================================
        -- 10. ORIGEN (Origin)
        -- ==========================================
        '{"v":"American","es":"estadounidense","de":"amerikanisch","pron":"/a-mé-ri-kan/","pron_de":"/ö-ME-ri-kön/"}',
        '{"v":"Mexican","es":"mexicano","de":"mexikanisch","pron":"/mék-si-kan/","pron_de":"/MEK-si-kön/"}',
        '{"v":"Canadian","es":"canadiense","de":"kanadisch","pron":"/ka-néi-di-an/","pron_de":"/kö-NEJ-di-ön/"}',
        '{"v":"Spanish","es":"español","de":"spanisch","pron":"/spá-nish/","pron_de":"/SPÄ-nisch/"}',
        '{"v":"British","es":"británico","de":"britisch","pron":"/brí-tish/","pron_de":"/BRI-tisch/"}',
        '{"v":"European","es":"europeo","de":"europäisch","pron":"/iu-ro-pí-an/","pron_de":"/juo-rö-PIE-ön/"}',
        '{"v":"Asian","es":"asiático","de":"asiatisch","pron":"/éi-shan/","pron_de":"/EJ-schön/"}',
        '{"v":"Latin","es":"latino","de":"lateinisch / lateinamerikanisch","pron":"/lá-tin/","pron_de":"/LÄ-tin/"}',
        '{"v":"African","es":"africano","de":"afrikanisch","pron":"/á-fri-kan/","pron_de":"/Ä-fri-kön/"}',
        '{"v":"Australian","es":"australiano","de":"australisch","pron":"/os-tréi-lian/","pron_de":"/os-TREJ-li-ön/"}',
        '{"v":"Brazilian","es":"brasileño","de":"brasilianisch","pron":"/bra-sí-lian/","pron_de":"/brö-SI-li-ön/"}',
        '{"v":"Chinese","es":"chino","de":"chinesisch","pron":"/chái-nis/","pron_de":"/tschai-NIES/"}',
        '{"v":"French","es":"francés","de":"französisch","pron":"/french/","pron_de":"/frentsch/"}',
        '{"v":"German","es":"alemán","de":"deutsch","pron":"/yér-man/","pron_de":"/DSCHÖ-mön/"}',
        '{"v":"Indian","es":"indio","de":"indisch","pron":"/ín-dian/","pron_de":"/IN-di-ön/"}',
        '{"v":"Italian","es":"italiano","de":"italienisch","pron":"/i-tá-lian/","pron_de":"/i-TÄ-li-ön/"}',
        '{"v":"Japanese","es":"japonés","de":"japanisch","pron":"/ya-pa-nís/","pron_de":"/dschä-pö-NIES/"}',
        '{"v":"Korean","es":"coreano","de":"koreanisch","pron":"/ko-rí-an/","pron_de":"/kö-RIE-ön/"}',
        '{"v":"Russian","es":"ruso","de":"russisch","pron":"/rá-shan/","pron_de":"/RA-schön/"}',

        -- ==========================================
        -- 11. MATERIAL (Material)
        -- ==========================================
        '{"v":"wooden","es":"de madera","de":"hölzern / aus Holz","pron":"/uú-den/","pron_de":"/WU-dön/"}',
        '{"v":"iron","es":"de hierro","de":"eisern / aus Eisen","pron":"/ái-ron/","pron_de":"/AI-ön/"}',
        '{"v":"plastic","es":"de plástico","de":"aus Plastik / Kunststoff-","pron":"/plás-tik/","pron_de":"/PLÄ-stik/"}',
        '{"v":"metal","es":"de metal","de":"metallisch / aus Metall","pron":"/mé-tal/","pron_de":"/ME-töl/"}',
        '{"v":"glass","es":"de vidrio","de":"gläsern / aus Glas","pron":"/glas/","pron_de":"/gläs/"}',
        '{"v":"leather","es":"de cuero","de":"ledern / aus Leder","pron":"/lé-der/","pron_de":"/LE-dö/"}',
        '{"v":"cotton","es":"de algodón","de":"baumwollen / aus Baumwolle","pron":"/kó-ton/","pron_de":"/KO-tön/"}',
        '{"v":"wool","es":"de lana","de":"wollen / aus Wolle","pron":"/uul/","pron_de":"/wul/"}',
        '{"v":"silk","es":"de seda","de":"seiden / aus Seide","pron":"/silk/","pron_de":"/silk/"}',
        '{"v":"paper","es":"de papel","de":"papieren / aus Papier","pron":"/péi-per/","pron_de":"/PEJ-pö/"}',
        '{"v":"rubber","es":"de goma / caucho","de":"gummihaltig / aus Gummi","pron":"/rá-ber/","pron_de":"/RA-bö/"}',
        '{"v":"ceramic","es":"de cerámica","de":"keramisch / aus Keramik","pron":"/se-rá-mik/","pron_de":"/sö-RÄ-mik/"}',
        '{"v":"concrete","es":"de hormigón / concreto","de":"betoniert / aus Beton","pron":"/kón-krit/","pron_de":"/KONG-kriet/"}',
        '{"v":"diamond","es":"de diamante","de":"diamanten / aus Diamant","pron":"/dái-mond/","pron_de":"/DAI-ö-mönd/"}',
        '{"v":"fabric","es":"de tela","de":"aus Stoff / Textil-","pron":"/fá-brik/","pron_de":"/FÄ-brik/"}',
        '{"v":"marble","es":"de mármol","de":"marmorn / aus Marmor","pron":"/már-bol/","pron_de":"/MAA-böl/"}',
        '{"v":"nylon","es":"de nailon","de":"aus Nylon","pron":"/nái-lon/","pron_de":"/NAI-lon/"}',
        '{"v":"polyester","es":"de poliéster","de":"aus Polyester","pron":"/po-li-és-ter/","pron_de":"/po-li-ES-tö/"}',
        '{"v":"stone","es":"de piedra","de":"steinern / aus Stein","pron":"/stóun/","pron_de":"/stoun/"}',
        '{"v":"brick","es":"de ladrillo","de":"aus Backstein / gemauert","pron":"/brik/","pron_de":"/brik/"}'
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

INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (v_deck_id, 'de', 'Adjektive', '');

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

    -- Insertar la traducción al alemán y su pronunciación
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_root_id, 'de', jsonb_build_object('translation', v_item->>'de'), v_item->>'pron_de');

    -- Vincular la palabra creada al mazo actual
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

END LOOP;
END;
$seed$;
