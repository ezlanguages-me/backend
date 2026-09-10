-- ============================================================
-- Seed: A0 English Path – STEP 1080 – Deck – Tareas Domésticas
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "sweep", "meaning": "barrer", "de": "fegen / kehren", "ex": "Sweep the floor every morning.", "pron": "/suip/", "pron_de": "/FEE-gen/"}'::jsonb,
        '{"term": "mop", "meaning": "fregar el suelo / pasar la mopa", "de": "wischen / aufwischen", "ex": "Mop the kitchen floor after cooking.", "pron": "/mop/", "pron_de": "/VI-shen/"}'::jsonb,
        '{"term": "vacuum", "meaning": "pasar la aspiradora", "de": "Staub saugen", "ex": "Vacuum the carpet once a week.", "pron": "/vá-kium/", "pron_de": "/STAU-zau-gen/"}'::jsonb,
        '{"term": "dust", "meaning": "quitar el polvo", "de": "abstauben", "ex": "Dust the shelves and the furniture.", "pron": "/dast/", "pron_de": "/AP-shtau-ben/"}'::jsonb,
        '{"term": "scrub", "meaning": "fregar / restregar", "de": "schrubben", "ex": "Scrub the tiles until they are clean.", "pron": "/skrab/", "pron_de": "/SHRUB-ben/"}'::jsonb,
        '{"term": "wipe", "meaning": "limpiar / pasar un trapo", "de": "abwischen", "ex": "Wipe the table after every meal.", "pron": "/uaip/", "pron_de": "/AP-vi-shen/"}'::jsonb,
        '{"term": "rinse", "meaning": "enjuagar", "de": "spülen / ausspülen", "ex": "Rinse the vegetables before cooking.", "pron": "/rins/", "pron_de": "/SHPÜÜ-len/"}'::jsonb,
        '{"term": "disinfect", "meaning": "desinfectar", "de": "desinfizieren", "ex": "Disinfect the bathroom regularly.", "pron": "/dis-in-fekt/", "pron_de": "/des-in-fi-TSIR-en/"}'::jsonb,
        '{"term": "polish", "meaning": "abrillantar / lustrar", "de": "polieren", "ex": "Polish the shoes before going out.", "pron": "/pó-lish/", "pron_de": "/po-LIR-en/"}'::jsonb,
        '{"term": "tidy up", "meaning": "ordenar / recoger", "de": "aufräumen", "ex": "Tidy up your room before dinner.", "pron": "/tái-di ap/", "pron_de": "/AUF-roi-men/"}'::jsonb,
        '{"term": "declutter", "meaning": "deshacerse de lo innecesario / ordenar", "de": "ausmisten / entrümpeln", "ex": "Declutter the wardrobe and donate old clothes.", "pron": "/di-klá-ter/", "pron_de": "/AUS-mis-ten/"}'::jsonb,
        '{"term": "organise", "meaning": "organizar", "de": "organisieren", "ex": "Organise the kitchen cupboards by category.", "pron": "/ór-ga-naiz/", "pron_de": "/or-ga-ni-ZIR-en/"}'::jsonb,
        '{"term": "clean the bathroom", "meaning": "limpiar el baño", "de": "das Bad putzen", "ex": "Clean the bathroom every week.", "pron": "/klin de báz-rum/", "pron_de": "/das BAT PU-tsen/"}'::jsonb,
        '{"term": "clean the windows", "meaning": "limpiar las ventanas", "de": "die Fenster putzen", "ex": "Clean the windows so the light comes in.", "pron": "/klin de uín-dous/", "pron_de": "/dee FEN-shtö PU-tsen/"}'::jsonb,
        '{"term": "clean the oven", "meaning": "limpiar el horno", "de": "den Backofen reinigen", "ex": "Clean the oven once a month.", "pron": "/klin de á-ven/", "pron_de": "/den BAK-o-fen RAI-ni-gen/"}'::jsonb,
        '{"term": "clean the fridge", "meaning": "limpiar la nevera", "de": "den Kühlschrank reinigen", "ex": "Clean the fridge and throw away old food.", "pron": "/klin de fridyi/", "pron_de": "/den KÜÜL-shrank RAI-ni-gen/"}'::jsonb,
        '{"term": "scrub the toilet", "meaning": "limpiar el inodoro / fregar el váter", "de": "die Toilette putzen", "ex": "Scrub the toilet with a brush.", "pron": "/skrab de tói-let/", "pron_de": "/dee twa-LE-te PU-tsen/"}'::jsonb,
        '{"term": "unblock the drain", "meaning": "desatascar el desagüe", "de": "den Abfluss reinigen", "ex": "Unblock the drain with a plunger.", "pron": "/an-blok de drein/", "pron_de": "/den AP-flus RAI-ni-gen/"}'::jsonb,
        '{"term": "take out the rubbish", "meaning": "sacar la basura", "de": "den Müll rausbringen", "ex": "Take out the rubbish on Tuesday nights.", "pron": "/teik áut de rá-bish/", "pron_de": "/den MÜL RAUS-bring-en/"}'::jsonb,
        '{"term": "recycle", "meaning": "reciclar", "de": "recyceln", "ex": "We recycle glass and paper separately.", "pron": "/ri-sái-kel/", "pron_de": "/re-ZY-keln/"}'::jsonb,
        '{"term": "sort", "meaning": "clasificar / separar (basura)", "de": "sortieren", "ex": "Sort the rubbish into different bins.", "pron": "/sort/", "pron_de": "/zor-TIR-en/"}'::jsonb,
        '{"term": "air out", "meaning": "ventilar / airear", "de": "lüften", "ex": "Open the window to air out the room.", "pron": "/er áut/", "pron_de": "/LÜF-ten/"}'::jsonb,
        '{"term": "throw away", "meaning": "tirar / desechar", "de": "wegwerfen", "ex": "Throw away the empty bottles.", "pron": "/zrou a-uéi/", "pron_de": "/VEK-ver-fen/"}'::jsonb,
        '{"term": "donate", "meaning": "donar", "de": "spenden", "ex": "Donate clothes you no longer wear.", "pron": "/dou-néit/", "pron_de": "/SHPEN-den/"}'::jsonb,
        '{"term": "do the laundry", "meaning": "hacer la colada / lavar la ropa", "de": "die Wäsche waschen", "ex": "I do the laundry twice a week.", "pron": "/du de lón-dri/", "pron_de": "/dee VÄ-she VA-shen/"}'::jsonb,
        '{"term": "hang up the clothes", "meaning": "tender la ropa", "de": "die Wäsche aufhängen", "ex": "Hang up the clothes to dry outside.", "pron": "/hang ap de klóuds/", "pron_de": "/dee VÄ-she AUF-häng-en/"}'::jsonb,
        '{"term": "fold the clothes", "meaning": "doblar la ropa", "de": "die Wäsche falten", "ex": "Fold the clothes and put them in the drawer.", "pron": "/fould de klóuds/", "pron_de": "/dee VÄ-she FAL-ten/"}'::jsonb,
        '{"term": "iron", "meaning": "planchar", "de": "bügeln", "ex": "Iron your shirt before the interview.", "pron": "/ái-ern/", "pron_de": "/BÜÜ-geln/"}'::jsonb,
        '{"term": "tumble dry", "meaning": "secar en secadora", "de": "im Trockner trocknen", "ex": "Do not tumble dry this shirt.", "pron": "/tám-bel drai/", "pron_de": "/im TROK-nö TROK-nen/"}'::jsonb,
        '{"term": "sort the laundry", "meaning": "separar la ropa para lavar", "de": "Wäsche sortieren", "ex": "Sort the laundry by colour before washing.", "pron": "/sort de lón-dri/", "pron_de": "/VÄ-she zor-TIR-en/"}'::jsonb,
        '{"term": "remove a stain", "meaning": "quitar una mancha", "de": "einen Fleck entfernen", "ex": "Act quickly to remove a stain.", "pron": "/ri-múuv a stein/", "pron_de": "/AI-nen FLEK ent-FER-nen/"}'::jsonb,
        '{"term": "washing machine", "meaning": "lavadora", "de": "Waschmaschine", "ex": "Put the clothes in the washing machine.", "pron": "/uó-shing me-shín/", "pron_de": "/VASH-ma-shii-ne/"}'::jsonb,
        '{"term": "dryer", "meaning": "secadora", "de": "Wäschetrockner", "ex": "The dryer makes the towels very soft.", "pron": "/drái-er/", "pron_de": "/VÄ-she-trok-nö/"}'::jsonb,
        '{"term": "fabric softener", "meaning": "suavizante de tela", "de": "Weichspüler", "ex": "Add fabric softener for softer laundry.", "pron": "/fáb-rik só-fe-ner/", "pron_de": "/VAIJ-shpüü-lö/"}'::jsonb,
        '{"term": "washing powder / detergent", "meaning": "detergente en polvo / líquido", "de": "Waschmittel", "ex": "Add the right amount of washing powder.", "pron": "/uó-shing páu-der/", "pron_de": "/VASH-mi-tel/"}'::jsonb,
        '{"term": "stain remover", "meaning": "quitamanchas", "de": "Fleckentferner", "ex": "Apply stain remover before washing.", "pron": "/stein ri-mú-ver/", "pron_de": "/FLEK-ent-fer-nö/"}'::jsonb,
        '{"term": "clothes peg", "meaning": "pinza de tender", "de": "Wäscheklammer", "ex": "Use a clothes peg to hang the socks.", "pron": "/klóuds peg/", "pron_de": "/VÄ-she-kla-mer/"}'::jsonb,
        '{"term": "clothesline", "meaning": "tendedero / cuerda de tender", "de": "Wäscheleine", "ex": "Hang the sheets on the clothesline.", "pron": "/klóuds-lain/", "pron_de": "/VÄ-she-lai-ne/"}'::jsonb,
        '{"term": "clothes rack / airer", "meaning": "tendedero de interior", "de": "Wäscheständer", "ex": "Put the clothes on the rack to dry.", "pron": "/klóuds rak/", "pron_de": "/VÄ-she-shtän-dö/"}'::jsonb,
        '{"term": "laundry basket", "meaning": "cesto de la ropa sucia", "de": "Wäschekorb", "ex": "Put your dirty clothes in the laundry basket.", "pron": "/lón-dri bás-ket/", "pron_de": "/VÄ-she-korp/"}'::jsonb,
        '{"term": "clothes hanger", "meaning": "percha", "de": "Kleiderbügel", "ex": "Hang the jacket on a clothes hanger.", "pron": "/klóuds hán-ger/", "pron_de": "/KLAI-dö-büü-gel/"}'::jsonb,
        '{"term": "ironing board", "meaning": "tabla de planchar", "de": "Bügelbrett", "ex": "Set up the ironing board before you start.", "pron": "/ái-er-ning bord/", "pron_de": "/BÜÜ-gel-bret/"}'::jsonb,
        '{"term": "wash the dishes", "meaning": "lavar los platos", "de": "das Geschirr spülen", "ex": "Wash the dishes after every meal.", "pron": "/uosh de dí-shes/", "pron_de": "/das gö-SHIR SHPÜÜ-len/"}'::jsonb,
        '{"term": "dry the dishes", "meaning": "secar los platos", "de": "das Geschirr abtrocknen", "ex": "Dry the dishes and put them away.", "pron": "/drai de dí-shes/", "pron_de": "/das gö-SHIR AP-trok-nen/"}'::jsonb,
        '{"term": "set the table", "meaning": "poner la mesa", "de": "den Tisch decken", "ex": "Set the table before dinner.", "pron": "/set de téi-bel/", "pron_de": "/den TISH DE-ken/"}'::jsonb,
        '{"term": "clear the table", "meaning": "quitar / recoger la mesa", "de": "den Tisch abräumen", "ex": "Clear the table after eating.", "pron": "/klier de téi-bel/", "pron_de": "/den TISH AP-roi-men/"}'::jsonb,
        '{"term": "cook", "meaning": "cocinar", "de": "kochen", "ex": "She loves to cook for the whole family.", "pron": "/kuk/", "pron_de": "/KO-jen/"}'::jsonb,
        '{"term": "bake", "meaning": "hornear", "de": "backen", "ex": "Bake the bread for 30 minutes.", "pron": "/beik/", "pron_de": "/BA-ken/"}'::jsonb,
        '{"term": "boil", "meaning": "hervir", "de": "kochen / abkochen", "ex": "Boil the water before making tea.", "pron": "/boil/", "pron_de": "/KO-jen/"}'::jsonb,
        '{"term": "fry", "meaning": "freír", "de": "braten", "ex": "Fry the eggs in a little butter.", "pron": "/frai/", "pron_de": "/BRAA-ten/"}'::jsonb,
        '{"term": "grill", "meaning": "asar a la parrilla", "de": "grillen", "ex": "Grill the chicken for 20 minutes.", "pron": "/gril/", "pron_de": "/GRI-len/"}'::jsonb,
        '{"term": "roast", "meaning": "asar al horno", "de": "braten / rösten", "ex": "Roast the vegetables with olive oil.", "pron": "/roust/", "pron_de": "/RÖÖS-ten/"}'::jsonb,
        '{"term": "steam", "meaning": "cocinar al vapor", "de": "dämpfen", "ex": "Steam the broccoli to keep it crispy.", "pron": "/stim/", "pron_de": "/DÄMP-fen/"}'::jsonb,
        '{"term": "peel", "meaning": "pelar", "de": "schälen", "ex": "Peel the potatoes before boiling them.", "pron": "/pil/", "pron_de": "/SHÄÄ-len/"}'::jsonb,
        '{"term": "chop", "meaning": "picar / trocear", "de": "hacken / schneiden", "ex": "Chop the onion into small pieces.", "pron": "/chop/", "pron_de": "/HA-ken/"}'::jsonb,
        '{"term": "slice", "meaning": "cortar en rodajas", "de": "in Scheiben schneiden", "ex": "Slice the bread for sandwiches.", "pron": "/slais/", "pron_de": "/in SHAI-ben SHNAI-den/"}'::jsonb,
        '{"term": "dice", "meaning": "cortar en dados", "de": "würfeln", "ex": "Dice the carrots finely.", "pron": "/dais/", "pron_de": "/VÜR-feln/"}'::jsonb,
        '{"term": "grate", "meaning": "rallar", "de": "reiben", "ex": "Grate the cheese over the pasta.", "pron": "/greit/", "pron_de": "/RAI-ben/"}'::jsonb,
        '{"term": "stir", "meaning": "remover / mezclar", "de": "umrühren", "ex": "Stir the soup so it does not burn.", "pron": "/stir/", "pron_de": "/UM-rüü-ren/"}'::jsonb,
        '{"term": "mix", "meaning": "mezclar", "de": "mischen", "ex": "Mix the flour and eggs together.", "pron": "/miks/", "pron_de": "/MI-shen/"}'::jsonb,
        '{"term": "blend", "meaning": "batir / triturar", "de": "mixen / pürieren", "ex": "Blend the ingredients into a smooth sauce.", "pron": "/blend/", "pron_de": "/MIK-sen/"}'::jsonb,
        '{"term": "pour", "meaning": "verter / servir (líquidos)", "de": "einschenken / gießen", "ex": "Pour the sauce over the meat.", "pron": "/por/", "pron_de": "/AIN-shenk-en/"}'::jsonb,
        '{"term": "drain", "meaning": "escurrir / colar", "de": "abgießen / abtropfen", "ex": "Drain the pasta after cooking.", "pron": "/drein/", "pron_de": "/AP-gii-sen/"}'::jsonb,
        '{"term": "season", "meaning": "salpimentar / sazonar", "de": "würzen", "ex": "Season the steak with salt and pepper.", "pron": "/sí-son/", "pron_de": "/VÜR-tsen/"}'::jsonb,
        '{"term": "heat up", "meaning": "calentar", "de": "aufwärmen", "ex": "Heat up the leftovers in the microwave.", "pron": "/híit áp/", "pron_de": "/AUF-vär-men/"}'::jsonb,
        '{"term": "defrost", "meaning": "descongelar", "de": "auftauen", "ex": "Defrost the chicken the night before.", "pron": "/di-fróst/", "pron_de": "/AUF-tau-en/"}'::jsonb,
        '{"term": "put away", "meaning": "guardar / recoger", "de": "wegräumen / einräumen", "ex": "Put away the clean dishes after drying.", "pron": "/put a-uéi/", "pron_de": "/VEK-roi-men/"}'::jsonb,
        '{"term": "make the bed", "meaning": "hacer la cama", "de": "das Bett machen", "ex": "Make the bed every morning.", "pron": "/meik de bed/", "pron_de": "/das BET MA-jen/"}'::jsonb,
        '{"term": "change the sheets", "meaning": "cambiar las sábanas", "de": "die Bettwäsche wechseln", "ex": "Change the sheets once a week.", "pron": "/cheindy de shits/", "pron_de": "/dee BET-vä-she VEK-seln/"}'::jsonb,
        '{"term": "dishwasher", "meaning": "lavavajillas", "de": "Geschirrspüler", "ex": "Load the dishwasher after dinner.", "pron": "/dísh-uó-sher/", "pron_de": "/gö-SHIR-shpüü-lö/"}'::jsonb,
        '{"term": "microwave", "meaning": "microondas", "de": "Mikrowelle", "ex": "Heat the soup in the microwave.", "pron": "/mái-kro-ueiv/", "pron_de": "/MI-kro-ve-le/"}'::jsonb,
        '{"term": "oven", "meaning": "horno", "de": "Backofen", "ex": "Preheat the oven to 180 degrees.", "pron": "/á-ven/", "pron_de": "/BAK-o-fen/"}'::jsonb,
        '{"term": "hob / stovetop", "meaning": "placa de cocina / fogones", "de": "Herd / Kochfeld", "ex": "Put the pan on the hob.", "pron": "/hob/", "pron_de": "/HERD/"}'::jsonb,
        '{"term": "fridge", "meaning": "nevera / refrigerador", "de": "Kühlschrank", "ex": "Put the leftovers in the fridge.", "pron": "/fridyi/", "pron_de": "/KÜÜL-shrank/"}'::jsonb,
        '{"term": "freezer", "meaning": "congelador", "de": "Tiefkühlschrank / Gefriergerät", "ex": "Keep the meat in the freezer.", "pron": "/frí-ser/", "pron_de": "/TIIF-küül-shrank/"}'::jsonb,
        '{"term": "toaster", "meaning": "tostadora", "de": "Toaster", "ex": "Put the bread in the toaster.", "pron": "/tóus-ter/", "pron_de": "/TOO-stö/"}'::jsonb,
        '{"term": "kettle", "meaning": "hervidor / tetera eléctrica", "de": "Wasserkocher", "ex": "Boil the kettle for a cup of tea.", "pron": "/ké-tel/", "pron_de": "/VA-sö-ko-jö/"}'::jsonb,
        '{"term": "blender", "meaning": "batidora / licuadora", "de": "Mixer / Standmixer", "ex": "Use a blender to make a smoothie.", "pron": "/blén-der/", "pron_de": "/MIKS-ö/"}'::jsonb,
        '{"term": "food processor", "meaning": "robot de cocina", "de": "Küchenmaschine", "ex": "Use the food processor to chop vegetables.", "pron": "/fud pró-se-sor/", "pron_de": "/KÜÜ-jen-ma-shii-ne/"}'::jsonb,
        '{"term": "coffee machine", "meaning": "cafetera", "de": "Kaffeemaschine", "ex": "Turn on the coffee machine every morning.", "pron": "/kó-fi me-shín/", "pron_de": "/KA-fee-ma-shii-ne/"}'::jsonb,
        '{"term": "air fryer", "meaning": "freidora de aire", "de": "Heißluftfritteuse", "ex": "Cook chips in the air fryer.", "pron": "/er frái-er/", "pron_de": "/HAIS-luft-fri-töö-ze/"}'::jsonb,
        '{"term": "broom", "meaning": "escoba", "de": "Besen", "ex": "Use the broom to sweep the floor.", "pron": "/brum/", "pron_de": "/BEE-zen/"}'::jsonb,
        '{"term": "dustpan", "meaning": "recogedor", "de": "Kehrblech", "ex": "Sweep the dirt into the dustpan.", "pron": "/dást-pan/", "pron_de": "/KEER-bej/"}'::jsonb,
        '{"term": "bucket", "meaning": "cubo", "de": "Eimer", "ex": "Fill the bucket with water and soap.", "pron": "/bá-ket/", "pron_de": "/AI-mer/"}'::jsonb,
        '{"term": "sponge", "meaning": "esponja", "de": "Schwamm", "ex": "Use a sponge to clean the sink.", "pron": "/spandy/", "pron_de": "/SHVAM/"}'::jsonb,
        '{"term": "cloth / rag", "meaning": "trapo / paño", "de": "Tuch / Lappen", "ex": "Wipe the surface with a damp cloth.", "pron": "/kloz/", "pron_de": "/TUJ/"}'::jsonb,
        '{"term": "microfibre cloth", "meaning": "paño de microfibra", "de": "Mikrofasertuch", "ex": "Use a microfibre cloth for streak-free windows.", "pron": "/mái-kro-fai-ber kloz/", "pron_de": "/MI-kro-faa-zö-tuj/"}'::jsonb,
        '{"term": "detergent", "meaning": "detergente", "de": "Reinigungsmittel", "ex": "Use detergent to remove stains.", "pron": "/di-tér-dyent/", "pron_de": "/RAI-ni-gungs-mi-tel/"}'::jsonb,
        '{"term": "bleach", "meaning": "lejía / blanqueador", "de": "Bleichmittel", "ex": "Use bleach to disinfect the toilet.", "pron": "/blich/", "pron_de": "/BLAIJ-mi-tel/"}'::jsonb,
        '{"term": "spray bottle", "meaning": "botella pulverizadora / spray", "de": "Sprühflasche", "ex": "Fill the spray bottle with cleaning solution.", "pron": "/sprei bó-tel/", "pron_de": "/SHPRÜÜ-fla-she/"}'::jsonb,
        '{"term": "rubber gloves", "meaning": "guantes de goma", "de": "Gummihandschuhe", "ex": "Wear rubber gloves when using bleach.", "pron": "/rá-ber glovs/", "pron_de": "/GU-mi-hant-shuu-e/"}'::jsonb,
        '{"term": "toilet brush", "meaning": "cepillo del váter / escobilla", "de": "Toilettenbürste", "ex": "Use the toilet brush after every use.", "pron": "/tói-let brash/", "pron_de": "/twa-LE-ten-bürs-te/"}'::jsonb,
        '{"term": "plunger", "meaning": "desatascador / desatascacañerías", "de": "Saugglocke / Pömpel", "ex": "Use a plunger to unblock the drain.", "pron": "/plán-yer/", "pron_de": "/ZAU-glo-ke/"}'::jsonb,
        '{"term": "vacuum cleaner", "meaning": "aspiradora", "de": "Staubsauger", "ex": "The vacuum cleaner is in the cupboard.", "pron": "/vá-kium klí-ner/", "pron_de": "/STAU-zau-gö/"}'::jsonb,
        '{"term": "rubbish bag", "meaning": "bolsa de basura", "de": "Mülltüte", "ex": "Take a rubbish bag from under the sink.", "pron": "/rá-bish bag/", "pron_de": "/MÜL-tüü-te/"}'::jsonb,
        '{"term": "recycling bin", "meaning": "cubo de reciclaje", "de": "Recyclingtonne", "ex": "Put the bottles in the recycling bin.", "pron": "/ri-sái-kling bin/", "pron_de": "/re-ZY-kling-to-ne/"}'::jsonb,
        '{"term": "bin / dustbin", "meaning": "cubo de basura", "de": "Mülleimer", "ex": "Empty the bin before it overflows.", "pron": "/bin/", "pron_de": "/MÜL-ai-mer/"}'::jsonb,
        '{"term": "fix / repair", "meaning": "reparar / arreglar", "de": "reparieren", "ex": "Can you fix the leaking tap?", "pron": "/fiks/", "pron_de": "/re-pa-RIR-en/"}'::jsonb,
        '{"term": "paint", "meaning": "pintar", "de": "streichen", "ex": "They painted the living room white.", "pron": "/peint/", "pron_de": "/SHTRAI-jen/"}'::jsonb,
        '{"term": "drill", "meaning": "taladrar", "de": "bohren", "ex": "Drill a hole in the wall for the shelf.", "pron": "/dril/", "pron_de": "/BOO-ren/"}'::jsonb,
        '{"term": "hammer", "meaning": "clavar / martillar", "de": "hämmern", "ex": "Hammer the nail into the wall.", "pron": "/há-mer/", "pron_de": "/HÄ-mörn/"}'::jsonb,
        '{"term": "screw", "meaning": "atornillar", "de": "schrauben", "ex": "Screw the shelf to the wall.", "pron": "/skru/", "pron_de": "/SHRAU-ben/"}'::jsonb,
        '{"term": "hang a picture", "meaning": "colgar un cuadro", "de": "ein Bild aufhängen", "ex": "Hang the picture above the sofa.", "pron": "/hang a pík-cher/", "pron_de": "/ain BILT AUF-häng-en/"}'::jsonb,
        '{"term": "replace", "meaning": "reemplazar / cambiar", "de": "ersetzen / wechseln", "ex": "Replace the old batteries.", "pron": "/ri-pléis/", "pron_de": "/ö-ZET-tsen/"}'::jsonb,
        '{"term": "unblock", "meaning": "desatascar / desbloquear", "de": "entstopfen", "ex": "Unblock the kitchen sink.", "pron": "/an-blok/", "pron_de": "/ent-SHTOP-fen/"}'::jsonb,
        '{"term": "measure", "meaning": "medir", "de": "messen", "ex": "Measure the wall before buying the shelf.", "pron": "/mé-yer/", "pron_de": "/ME-sen/"}'::jsonb,
        '{"term": "toolbox", "meaning": "caja de herramientas", "de": "Werkzeugkasten", "ex": "The toolbox is in the garage.", "pron": "/túl-boks/", "pron_de": "/VERK-tsoik-kas-ten/"}'::jsonb,
        '{"term": "screwdriver", "meaning": "destornillador", "de": "Schraubenzieher", "ex": "Use a screwdriver to open the lid.", "pron": "/skrú-drai-ver/", "pron_de": "/SHRAU-ben-tsii-ö/"}'::jsonb,
        '{"term": "hammer (noun)", "meaning": "martillo", "de": "Hammer", "ex": "He hit the nail with a hammer.", "pron": "/há-mer/", "pron_de": "/HA-mö/"}'::jsonb,
        '{"term": "ladder", "meaning": "escalera de mano", "de": "Leiter", "ex": "Use the ladder to reach the light.", "pron": "/lá-der/", "pron_de": "/LAI-tö/"}'::jsonb,
        '{"term": "light bulb", "meaning": "bombilla", "de": "Glühbirne", "ex": "Replace the light bulb in the hallway.", "pron": "/lait balb/", "pron_de": "/GLÜÜ-bir-ne/"}'::jsonb,
        '{"term": "fuse", "meaning": "fusible", "de": "Sicherung", "ex": "The fuse blew during the storm.", "pron": "/fiuz/", "pron_de": "/ZI-je-rung/"}'::jsonb,
        '{"term": "plumber", "meaning": "fontanero / plomero", "de": "Klempner / Installateur", "ex": "Call a plumber to fix the pipe.", "pron": "/plá-mer/", "pron_de": "/KLEMP-nö/"}'::jsonb,
        '{"term": "electrician", "meaning": "electricista", "de": "Elektriker", "ex": "The electrician fixed the socket.", "pron": "/e-lek-trí-shon/", "pron_de": "/e-LEK-tri-kö/"}'::jsonb,
        '{"term": "water the plants", "meaning": "regar las plantas", "de": "die Pflanzen gießen", "ex": "Water the plants every other day.", "pron": "/uó-ter de plants/", "pron_de": "/dee PFLAN-tsen GIE-sen/"}'::jsonb,
        '{"term": "mow the lawn", "meaning": "cortar el césped", "de": "den Rasen mähen", "ex": "Mow the lawn on Saturday morning.", "pron": "/mou de lon/", "pron_de": "/den RAA-zen MÄÄ-en/"}'::jsonb,
        '{"term": "rake", "meaning": "rastrillar", "de": "harken", "ex": "Rake the leaves in autumn.", "pron": "/reik/", "pron_de": "/HAR-ken/"}'::jsonb,
        '{"term": "weed", "meaning": "quitar las malas hierbas", "de": "jäten", "ex": "Weed the garden once a month.", "pron": "/uid/", "pron_de": "/YÄÄ-ten/"}'::jsonb,
        '{"term": "prune", "meaning": "podar", "de": "beschneiden", "ex": "Prune the roses in spring.", "pron": "/prun/", "pron_de": "/bö-SHNAI-den/"}'::jsonb,
        '{"term": "dig", "meaning": "cavar / excavar", "de": "graben", "ex": "Dig a hole to plant the tree.", "pron": "/dig/", "pron_de": "/GRAA-ben/"}'::jsonb,
        '{"term": "plant", "meaning": "plantar", "de": "pflanzen", "ex": "Plant the seeds in spring.", "pron": "/plant/", "pron_de": "/PFLAN-tsen/"}'::jsonb,
        '{"term": "harvest", "meaning": "cosechar / recolectar", "de": "ernten", "ex": "Harvest the tomatoes when they are red.", "pron": "/hár-vest/", "pron_de": "/ERN-ten/"}'::jsonb,
        '{"term": "trim the hedge", "meaning": "recortar el seto", "de": "die Hecke schneiden", "ex": "Trim the hedge to keep it tidy.", "pron": "/trim de hédy/", "pron_de": "/dee HE-ke SHNAI-den/"}'::jsonb,
        '{"term": "compost", "meaning": "hacer compost / compostar", "de": "kompostieren", "ex": "Compost your vegetable peelings.", "pron": "/kóm-post/", "pron_de": "/kom-pos-TIR-en/"}'::jsonb,
        '{"term": "fertilise", "meaning": "abonar / fertilizar", "de": "düngen", "ex": "Fertilise the lawn in spring.", "pron": "/fér-ti-laiz/", "pron_de": "/DÜN-gen/"}'::jsonb,
        '{"term": "sweep the driveway", "meaning": "barrer la entrada / el camino", "de": "die Einfahrt fegen", "ex": "Sweep the driveway after the storm.", "pron": "/suip de dráiv-uei/", "pron_de": "/dee AIN-fart FEE-gen/"}'::jsonb,
        '{"term": "lawnmower", "meaning": "cortacésped / cortadora de césped", "de": "Rasenmäher", "ex": "The lawnmower is in the shed.", "pron": "/lon-móu-er/", "pron_de": "/RAA-zen-mä-ö/"}'::jsonb,
        '{"term": "garden hose", "meaning": "manguera de jardín", "de": "Gartenschlauch", "ex": "Use the garden hose to water the lawn.", "pron": "/gár-den hous/", "pron_de": "/GAR-ten-shlauj/"}'::jsonb,
        '{"term": "watering can", "meaning": "regadera", "de": "Gießkanne", "ex": "Fill the watering can at the tap.", "pron": "/uó-te-ring kan/", "pron_de": "/GIE-ska-ne/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 1080 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1080, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'Tareas Domésticas');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Haushaltsaufgaben');

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
