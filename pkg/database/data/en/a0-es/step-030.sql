-- ============================================================
-- Seed: A0 English Path – STEP 30 – Deck – VERBOS (Lista maestra en posición temprana: verbos de acción, estados y necesidades básicas)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$ 
DECLARE 
    v_path_id UUID; 
    v_deck_id UUID; 
    v_root_id UUID; 
    v_past_id UUID; 
    v_pp_id UUID; 
    v_item JSONB;
    v_verbs JSONB[] := ARRAY[
        '{"v":"arise","p":"arose","pp":"arisen","es":"surgir","ex":"A problem arose during the meeting.","pron_v":"/a-ráis/","pron_p":"/a-róus/","pron_pp":"/a-rí-sen/"}'::jsonb,
        '{"v":"awake","p":"awoke","pp":"awoken","es":"despertar","ex":"She awoke early every morning.","pron_v":"/a-uéik/","pron_p":"/a-uóuk/","pron_pp":"/a-uóu-ken/"}'::jsonb,
        '{"v":"be","p":"was / were","pp":"been","es":"ser / estar","ex":"She is a doctor. He is tired.","pron_v":"/bi/","pron_p":"/uós / uér/","pron_pp":"/bin/"}'::jsonb,
        '{"v":"beat","p":"beat","pp":"beaten","es":"golpear / vencer","ex":"Our team beat the champions last night.","pron_v":"/bit/","pron_p":"/bit/","pron_pp":"/bí-ten/"}'::jsonb,
        '{"v":"bear","p":"bore","pp":"borne / born","es":"soportar / aguantar","ex":"I can''t bear the noise in this street.","pron_v":"/ber/","pron_p":"/bor/","pron_pp":"/born/"}'::jsonb,
        '{"v":"become","p":"became","pp":"become","es":"convertirse en","ex":"He became a famous writer at 30.","pron_v":"/bi-kám/","pron_p":"/bi-kéim/","pron_pp":"/bi-kám/"}'::jsonb,
        '{"v":"begin","p":"began","pp":"begun","es":"empezar / comenzar","ex":"The movie begins at 8 p.m.","pron_v":"/bi-guín/","pron_p":"/bi-gán/","pron_pp":"/bi-gán/"}'::jsonb,
        '{"v":"bend","p":"bent","pp":"bent","es":"doblar / agacharse","ex":"She bent down to pick up her keys.","pron_v":"/bend/","pron_p":"/bent/","pron_pp":"/bent/"}'::jsonb,
        '{"v":"bet","p":"bet","pp":"bet","es":"apostar","ex":"I bet you can''t eat all that pizza!","pron_v":"/bet/","pron_p":"/bet/","pron_pp":"/bet/"}'::jsonb,
        '{"v":"bite","p":"bit","pp":"bitten","es":"morder","ex":"The dog bit the mailman yesterday.","pron_v":"/báit/","pron_p":"/bit/","pron_pp":"/bí-ten/"}'::jsonb,
        '{"v":"bid","p":"bid","pp":"bid","es":"pujar / ofrecer","ex":"He bid $500 for the painting at the auction.","pron_v":"/bid/","pron_p":"/bid/","pron_pp":"/bid/"}'::jsonb,
        '{"v":"bind","p":"bound","pp":"bound","es":"atar / encuadernar","ex":"They bound the prisoner''s hands.","pron_v":"/báind/","pron_p":"/báund/","pron_pp":"/báund/"}'::jsonb,
        '{"v":"bleed","p":"bled","pp":"bled","es":"sangrar","ex":"His knee was bleeding after the fall.","pron_v":"/blid/","pron_p":"/bled/","pron_pp":"/bled/"}'::jsonb,
        '{"v":"blow","p":"blew","pp":"blown","es":"soplar","ex":"The wind blew all the leaves off the tree.","pron_v":"/blou/","pron_p":"/blu/","pron_pp":"/bloun/"}'::jsonb,
        '{"v":"break","p":"broke","pp":"broken","es":"romper","ex":"She broke a glass while washing dishes.","pron_v":"/breik/","pron_p":"/brouk/","pron_pp":"/bróu-ken/"}'::jsonb,
        '{"v":"breed","p":"bred","pp":"bred","es":"criar / reproducir","ex":"Farmers breed cows and pigs here.","pron_v":"/brid/","pron_p":"/bred/","pron_pp":"/bred/"}'::jsonb,
        '{"v":"bring","p":"brought","pp":"brought","es":"traer","ex":"Can you bring me a glass of water, please?","pron_v":"/brin/","pron_p":"/brot/","pron_pp":"/brot/"}'::jsonb,
        '{"v":"broadcast","p":"broadcast","pp":"broadcast","es":"transmitir / emitir","ex":"The news is broadcast live every evening.","pron_v":"/bród-kast/","pron_p":"/bród-kast/","pron_pp":"/bród-kast/"}'::jsonb,
        '{"v":"build","p":"built","pp":"built","es":"construir / edificar","ex":"They are building a new school in the town.","pron_v":"/bild/","pron_p":"/bilt/","pron_pp":"/bilt/"}'::jsonb,
        '{"v":"burn","p":"burnt / burned","pp":"burnt / burned","es":"quemar / arder","ex":"I burned my finger on the hot pan.","pron_v":"/bern/","pron_p":"/bernt / bernd/","pron_pp":"/bernt / bernd/"}'::jsonb,
        '{"v":"burst","p":"burst","pp":"burst","es":"estallar / explotar","ex":"The balloon burst with a loud bang.","pron_v":"/berst/","pron_p":"/berst/","pron_pp":"/berst/"}'::jsonb,
        '{"v":"buy","p":"bought","pp":"bought","es":"comprar","ex":"I bought a new jacket at the market.","pron_v":"/bái/","pron_p":"/bot/","pron_pp":"/bot/"}'::jsonb,
        '{"v":"catch","p":"caught","pp":"caught","es":"atrapar / coger","ex":"She caught the ball with one hand.","pron_v":"/kach/","pron_p":"/kot/","pron_pp":"/kot/"}'::jsonb,
        '{"v":"cast","p":"cast","pp":"cast","es":"lanzar / proyectar","ex":"He cast the fishing line into the river.","pron_v":"/kast/","pron_p":"/kast/","pron_pp":"/kast/"}'::jsonb,
        '{"v":"choose","p":"chose","pp":"chosen","es":"elegir / escoger","ex":"You can choose any color you like.","pron_v":"/chus/","pron_p":"/chous/","pron_pp":"/chóu-sen/"}'::jsonb,
        '{"v":"come","p":"came","pp":"come","es":"venir","ex":"Come here! Dinner is ready.","pron_v":"/kam/","pron_p":"/keim/","pron_pp":"/kam/"}'::jsonb,
        '{"v":"cost","p":"cost","pp":"cost","es":"costar","ex":"How much does this shirt cost?","pron_v":"/kost/","pron_p":"/kost/","pron_pp":"/kost/"}'::jsonb,
        '{"v":"creep","p":"crept","pp":"crept","es":"arrastrarse / avanzar sigiloso","ex":"The cat crept slowly towards the bird.","pron_v":"/krip/","pron_p":"/krept/","pron_pp":"/krept/"}'::jsonb,
        '{"v":"cut","p":"cut","pp":"cut","es":"cortar","ex":"She cut the bread into slices.","pron_v":"/kat/","pron_p":"/kat/","pron_pp":"/kat/"}'::jsonb,
        '{"v":"cling","p":"clung","pp":"clung","es":"aferrarse / pegarse","ex":"The wet shirt clung to his skin.","pron_v":"/klin/","pron_p":"/klan/","pron_pp":"/klan/"}'::jsonb,
        '{"v":"deal","p":"dealt","pp":"dealt","es":"tratar / repartir / gestionar","ex":"The manager dealt with the complaint quickly.","pron_v":"/dil/","pron_p":"/delt/","pron_pp":"/delt/"}'::jsonb,
        '{"v":"do","p":"did","pp":"done","es":"hacer","ex":"What did you do last weekend?","pron_v":"/du/","pron_p":"/did/","pron_pp":"/dan/"}'::jsonb,
        '{"v":"dig","p":"dug","pp":"dug","es":"cavar / excavar","ex":"The dog dug a hole in the garden.","pron_v":"/dig/","pron_p":"/dag/","pron_pp":"/dag/"}'::jsonb,
        '{"v":"draw","p":"drew","pp":"drawn","es":"dibujar / sacar / empatar","ex":"She drew a portrait of her mother.","pron_v":"/dro/","pron_p":"/dru/","pron_pp":"/dron/"}'::jsonb,
        '{"v":"dream","p":"dreamt/dreamed","pp":"dreamt/dreamed","es":"soñar","ex":"I dreamt about flying over the mountains.","pron_v":"/drim/","pron_p":"/dremt / drimd/","pron_pp":"/dremt / drimd/"}'::jsonb,
        '{"v":"drink","p":"drank","pp":"drunk","es":"beber / tomar","ex":"He drinks two glasses of water every morning.","pron_v":"/drink/","pron_p":"/drank/","pron_pp":"/drank/"}'::jsonb,
        '{"v":"drive","p":"drove","pp":"driven","es":"conducir / manejar","ex":"She drives to work every day.","pron_v":"/dráiv/","pron_p":"/drouv/","pron_pp":"/drí-ven/"}'::jsonb,
        '{"v":"eat","p":"ate","pp":"eaten","es":"comer","ex":"We eat dinner together as a family.","pron_v":"/it/","pron_p":"/eit/","pron_pp":"/í-ten/"}'::jsonb,
        '{"v":"fall","p":"fell","pp":"fallen","es":"caer / caerse","ex":"Leaves fall from the trees in autumn.","pron_v":"/fol/","pron_p":"/fel/","pron_pp":"/fó-len/"}'::jsonb,
        '{"v":"feed","p":"fed","pp":"fed","es":"alimentar / dar de comer","ex":"She feeds the ducks in the park every Sunday.","pron_v":"/fid/","pron_p":"/fed/","pron_pp":"/fed/"}'::jsonb,
        '{"v":"feel","p":"felt","pp":"felt","es":"sentir / sentirse","ex":"I feel great after a good night''s sleep.","pron_v":"/fil/","pron_p":"/felt/","pron_pp":"/felt/"}'::jsonb,
        '{"v":"fight","p":"fought","pp":"fought","es":"pelear / luchar","ex":"They fought hard for their rights.","pron_v":"/fáit/","pron_p":"/fot/","pron_pp":"/fot/"}'::jsonb,
        '{"v":"find","p":"found","pp":"found","es":"encontrar / hallar","ex":"Did you find your keys?","pron_v":"/fáind/","pron_p":"/faund/","pron_pp":"/faund/"}'::jsonb,
        '{"v":"flee","p":"fled","pp":"fled","es":"huir / escaparse","ex":"The thief fled when he saw the police.","pron_v":"/fli/","pron_p":"/fled/","pron_pp":"/fled/"}'::jsonb,
        '{"v":"fly","p":"flew","pp":"flown","es":"volar","ex":"The bird flew over the lake.","pron_v":"/flái/","pron_p":"/flu/","pron_pp":"/floun/"}'::jsonb,
        '{"v":"forget","p":"forgot","pp":"forgotten","es":"olvidar","ex":"Don''t forget to call me tonight.","pron_v":"/for-guét/","pron_p":"/for-gót/","pron_pp":"/for-gó-ten/"}'::jsonb,
        '{"v":"forbid","p":"forbade","pp":"forbidden","es":"prohibir","ex":"Smoking is forbidden in this area.","pron_v":"/for-bíd/","pron_p":"/for-béid/","pron_pp":"/for-bí-den/"}'::jsonb,
        '{"v":"forgive","p":"forgave","pp":"forgiven","es":"perdonar","ex":"She finally forgave him for his mistake.","pron_v":"/for-guív/","pron_p":"/for-guéiv/","pron_pp":"/for-guí-ven/"}'::jsonb,
        '{"v":"forsake","p":"forsook","pp":"forsaken","es":"abandonar / renunciar a","ex":"He forsook his career to travel the world.","pron_v":"/for-séik/","pron_p":"/for-súk/","pron_pp":"/for-séi-ken/"}'::jsonb,
        '{"v":"freeze","p":"froze","pp":"frozen","es":"congelar / helarse","ex":"The pipes froze during the cold winter night.","pron_v":"/fris/","pron_p":"/frous/","pron_pp":"/fróu-zen/"}'::jsonb,
        '{"v":"get","p":"got","pp":"got","es":"obtener / conseguir / ponerse","ex":"I got a new job last month. It''s getting cold.","pron_v":"/guet/","pron_p":"/got/","pron_pp":"/got/"}'::jsonb,
        '{"v":"give","p":"gave","pp":"given","es":"dar / regalar","ex":"She gave me a book for my birthday.","pron_v":"/guiv/","pron_p":"/gueiv/","pron_pp":"/guí-ven/"}'::jsonb,
        '{"v":"go","p":"went","pp":"gone","es":"ir","ex":"We go to the gym three times a week.","pron_v":"/gou/","pron_p":"/uent/","pron_pp":"/gon/"}'::jsonb,
        '{"v":"grind","p":"ground","pp":"ground","es":"moler / triturar","ex":"She grinds fresh coffee beans every morning.","pron_v":"/gráind/","pron_p":"/graund/","pron_pp":"/graund/"}'::jsonb,
        '{"v":"grow","p":"grew","pp":"grown","es":"crecer / cultivar","ex":"Children grow so fast. They grow tomatoes in the garden.","pron_v":"/grou/","pron_p":"/gru/","pron_pp":"/groun/"}'::jsonb,
        '{"v":"hang","p":"hung","pp":"hung","es":"colgar","ex":"She hung her coat on the hook by the door.","pron_v":"/han/","pron_p":"/han/","pron_pp":"/han/"}'::jsonb,
        '{"v":"have","p":"had","pp":"had","es":"tener / haber","ex":"I have two brothers and a sister.","pron_v":"/hav/","pron_p":"/had/","pron_pp":"/had/"}'::jsonb,
        '{"v":"hear","p":"heard","pp":"heard","es":"oír / escuchar","ex":"Did you hear that noise outside?","pron_v":"/hir/","pron_p":"/herd/","pron_pp":"/herd/"}'::jsonb,
        '{"v":"hide","p":"hid","pp":"hidden","es":"esconder / esconderse","ex":"The kids hid behind the sofa.","pron_v":"/háid/","pron_p":"/hid/","pron_pp":"/hí-den/"}'::jsonb,
        '{"v":"hit","p":"hit","pp":"hit","es":"golpear / chocar","ex":"The ball hit the window and broke it.","pron_v":"/hit/","pron_p":"/hit/","pron_pp":"/hit/"}'::jsonb,
        '{"v":"hold","p":"held","pp":"held","es":"sostener / sujetar / celebrar","ex":"She held the baby in her arms.","pron_v":"/hould/","pron_p":"/held/","pron_pp":"/held/"}'::jsonb,
        '{"v":"hurt","p":"hurt","pp":"hurt","es":"herir / doler","ex":"My back hurts after all that lifting.","pron_v":"/hert/","pron_p":"/hert/","pron_pp":"/hert/"}'::jsonb,
        '{"v":"keep","p":"kept","pp":"kept","es":"mantener / guardar / seguir","ex":"Keep quiet, the baby is sleeping.","pron_v":"/kip/","pron_p":"/kept/","pron_pp":"/kept/"}'::jsonb,
        '{"v":"kneel","p":"knelt","pp":"knelt","es":"arrodillarse","ex":"He knelt down to propose to her.","pron_v":"/nil/","pron_p":"/nelt/","pron_pp":"/nelt/"}'::jsonb,
        '{"v":"know","p":"knew","pp":"known","es":"saber / conocer","ex":"I know how to cook pasta. Do you know her?","pron_v":"/nou/","pron_p":"/niu/","pron_pp":"/noun/"}'::jsonb,
        '{"v":"lead","p":"led","pp":"led","es":"liderar / llevar","ex":"She led her team to victory.","pron_v":"/lid/","pron_p":"/led/","pron_pp":"/led/"}'::jsonb,
        '{"v":"lay","p":"laid","pp":"laid","es":"poner / colocar / tumbar","ex":"The hen laid three eggs this morning.","pron_v":"/lei/","pron_p":"/leid/","pron_pp":"/leid/"}'::jsonb,
        '{"v":"learn","p":"learnt/learned","pp":"learnt/learned","es":"aprender","ex":"He learned to play guitar at age ten.","pron_v":"/lern/","pron_p":"/lernt / lernd/","pron_pp":"/lernt / lernd/"}'::jsonb,
        '{"v":"lean","p":"leant","pp":"leant","es":"apoyarse / inclinarse","ex":"She leaned against the wall waiting for the bus.","pron_v":"/lin/","pron_p":"/lent/","pron_pp":"/lent/"}'::jsonb,
        '{"v":"leap","p":"leapt","pp":"leapt","es":"saltar / dar un salto","ex":"The cat leapt onto the table.","pron_v":"/lip/","pron_p":"/lept/","pron_pp":"/lept/"}'::jsonb,
        '{"v":"leave","p":"left","pp":"left","es":"dejar / irse / salir","ex":"She left her umbrella on the bus.","pron_v":"/liv/","pron_p":"/left/","pron_pp":"/left/"}'::jsonb,
        '{"v":"lend","p":"lent","pp":"lent","es":"prestar","ex":"Can you lend me your pen for a moment?","pron_v":"/lend/","pron_p":"/lent/","pron_pp":"/lent/"}'::jsonb,
        '{"v":"let","p":"let","pp":"let","es":"permitir / dejar","ex":"Let me know when you arrive home.","pron_v":"/let/","pron_p":"/let/","pron_pp":"/let/"}'::jsonb,
        '{"v":"lose","p":"lost","pp":"lost","es":"perder","ex":"I lost my wallet at the airport.","pron_v":"/lus/","pron_p":"/lost/","pron_pp":"/lost/"}'::jsonb,
        '{"v":"light","p":"lit","pp":"lit","es":"iluminar / encender","ex":"He lit a candle during the power cut.","pron_v":"/láit/","pron_p":"/lit/","pron_pp":"/lit/"}'::jsonb,
        '{"v":"make","p":"made","pp":"made","es":"hacer / fabricar / preparar","ex":"She made a cake for the party.","pron_v":"/meik/","pron_p":"/meid/","pron_pp":"/meid/"}'::jsonb,
        '{"v":"mean","p":"meant","pp":"meant","es":"significar / querer decir","ex":"What does this word mean in English?","pron_v":"/min/","pron_p":"/ment/","pron_pp":"/ment/"}'::jsonb,
        '{"v":"meet","p":"met","pp":"met","es":"conocer / encontrarse con","ex":"Nice to meet you! We met at a cafe.","pron_v":"/mit/","pron_p":"/met/","pron_pp":"/met/"}'::jsonb,
        '{"v":"mistake","p":"mistook","pp":"mistaken","es":"equivocarse / confundir","ex":"I mistook him for his brother.","pron_v":"/mis-téik/","pron_p":"/mis-túk/","pron_pp":"/mis-téi-ken/"}'::jsonb,
        '{"v":"overcome","p":"overcame","pp":"overcome","es":"superar / vencer","ex":"She overcame her fear of flying.","pron_v":"/ou-ver-kám/","pron_p":"/ou-ver-kéim/","pron_pp":"/ou-ver-kám/"}'::jsonb,
        '{"v":"pay","p":"paid","pp":"paid","es":"pagar","ex":"I paid the bill with my credit card.","pron_v":"/pei/","pron_p":"/peid/","pron_pp":"/peid/"}'::jsonb,
        '{"v":"put","p":"put","pp":"put","es":"poner / colocar","ex":"Put your phone on the table, please.","pron_v":"/put/","pron_p":"/put/","pron_pp":"/put/"}'::jsonb,
        '{"v":"quit","p":"quit/quitted","pp":"quit/quitted","es":"dejar / renunciar / parar","ex":"He quit his job to start his own business.","pron_v":"/kuit/","pron_p":"/kuit/","pron_pp":"/kuit/"}'::jsonb,
        '{"v":"read","p":"read","pp":"read","es":"leer","ex":"She reads a book before going to bed every night.","pron_v":"/rid/","pron_p":"/red/","pron_pp":"/red/"}'::jsonb,
        '{"v":"ride","p":"rode","pp":"ridden","es":"montar / ir en","ex":"He rode his bike to school.","pron_v":"/ráid/","pron_p":"/roud/","pron_pp":"/rí-den/"}'::jsonb,
        '{"v":"ring","p":"rang","pp":"rung","es":"sonar / llamar (por telefono)","ex":"The phone rang three times before she answered.","pron_v":"/rin/","pron_p":"/ran/","pron_pp":"/ran/"}'::jsonb,
        '{"v":"rise","p":"rose","pp":"risen","es":"levantarse / subir / aumentar","ex":"The sun rises in the east. Prices rose again.","pron_v":"/ráis/","pron_p":"/rous/","pron_pp":"/rí-sen/"}'::jsonb,
        '{"v":"run","p":"ran","pp":"run","es":"correr / funcionar","ex":"I run five kilometers every morning.","pron_v":"/ran/","pron_p":"/ran/","pron_pp":"/ran/"}'::jsonb,
        '{"v":"say","p":"said","pp":"said","es":"decir","ex":"She said goodbye and walked out.","pron_v":"/sei/","pron_p":"/sed/","pron_pp":"/sed/"}'::jsonb,
        '{"v":"see","p":"saw","pp":"seen","es":"ver","ex":"I saw a great film last night.","pron_v":"/si/","pron_p":"/so/","pron_pp":"/sin/"}'::jsonb,
        '{"v":"seek","p":"sought","pp":"sought","es":"buscar / intentar","ex":"He sought medical advice after the accident.","pron_v":"/sik/","pron_p":"/sot/","pron_pp":"/sot/"}'::jsonb,
        '{"v":"sell","p":"sold","pp":"sold","es":"vender","ex":"They sell fresh bread at that bakery.","pron_v":"/sel/","pron_p":"/sould/","pron_pp":"/sould/"}'::jsonb,
        '{"v":"send","p":"sent","pp":"sent","es":"enviar / mandar","ex":"She sent an email to her boss.","pron_v":"/send/","pron_p":"/sent/","pron_pp":"/sent/"}'::jsonb,
        '{"v":"set","p":"set","pp":"set","es":"establecer / fijar / poner","ex":"Set the alarm for 7 a.m. The sun sets at 8 p.m.","pron_v":"/set/","pron_p":"/set/","pron_pp":"/set/"}'::jsonb,
        '{"v":"shake","p":"shook","pp":"shaken","es":"sacudir / agitar / temblar","ex":"Shake the bottle before opening it.","pron_v":"/sheik/","pron_p":"/shuk/","pron_pp":"/shéi-ken/"}'::jsonb,
        '{"v":"shine","p":"shone","pp":"shone","es":"brillar / relucir","ex":"The stars shine brightly on a clear night.","pron_v":"/sháin/","pron_p":"/shoun/","pron_pp":"/shoun/"}'::jsonb,
        '{"v":"shoot","p":"shot","pp":"shot","es":"disparar / lanzar","ex":"The goalkeeper shot the ball to the other side.","pron_v":"/shut/","pron_p":"/shot/","pron_pp":"/shot/"}'::jsonb,
        '{"v":"show","p":"showed","pp":"shown/showed","es":"mostrar / enseñar","ex":"Can you show me the way to the station?","pron_v":"/shou/","pron_p":"/shoud/","pron_pp":"/shoun/"}'::jsonb,
        '{"v":"shrink","p":"shrank/shrunk","pp":"shrunk","es":"encoger / reducirse","ex":"My shirt shrank after I washed it hot.","pron_v":"/shrink/","pron_p":"/shrank/","pron_pp":"/shrank/"}'::jsonb,
        '{"v":"shut","p":"shut","pp":"shut","es":"cerrar","ex":"Please shut the door when you leave.","pron_v":"/shat/","pron_p":"/shat/","pron_pp":"/shat/"}'::jsonb,
        '{"v":"sing","p":"sang","pp":"sung","es":"cantar","ex":"She sang a beautiful song at the concert.","pron_v":"/sin/","pron_p":"/san/","pron_pp":"/san/"}'::jsonb,
        '{"v":"sink","p":"sank","pp":"sunk","es":"hundirse / irse a pique","ex":"The ship sank in the middle of the ocean.","pron_v":"/sink/","pron_p":"/sank/","pron_pp":"/sank/"}'::jsonb,
        '{"v":"sit","p":"sat","pp":"sat","es":"sentarse","ex":"Please sit down and make yourself comfortable.","pron_v":"/sit/","pron_p":"/sat/","pron_pp":"/sat/"}'::jsonb,
        '{"v":"sleep","p":"slept","pp":"slept","es":"dormir","ex":"I slept eight hours and feel much better.","pron_v":"/slip/","pron_p":"/slept/","pron_pp":"/slept/"}'::jsonb,
        '{"v":"slide","p":"slid","pp":"slid","es":"deslizarse / resbalar","ex":"The children slid down the snowy hill.","pron_v":"/sláid/","pron_p":"/slid/","pron_pp":"/slid/"}'::jsonb,
        '{"v":"smell","p":"smelt","pp":"smelt","es":"oler / oler a","ex":"The soup smells delicious!","pron_v":"/smel/","pron_p":"/smelt/","pron_pp":"/smelt/"}'::jsonb,
        '{"v":"sow","p":"sowed","pp":"sown/sowed","es":"sembrar","ex":"Farmers sow wheat seeds in early spring.","pron_v":"/sou/","pron_p":"/soud/","pron_pp":"/soun/"}'::jsonb,
        '{"v":"speak","p":"spoke","pp":"spoken","es":"hablar","ex":"She speaks three languages fluently.","pron_v":"/spik/","pron_p":"/spouk/","pron_pp":"/spóu-ken/"}'::jsonb,
        '{"v":"speed","p":"sped","pp":"sped","es":"acelerar / ir a alta velocidad","ex":"He was caught speeding on the highway.","pron_v":"/spid/","pron_p":"/sped/","pron_pp":"/sped/"}'::jsonb,
        '{"v":"spell","p":"spelt/spelled","pp":"spelt/spelled","es":"deletrear / escribir correctamente","ex":"Can you spell your last name for me?","pron_v":"/spel/","pron_p":"/spelt / speld/","pron_pp":"/spelt / speld/"}'::jsonb,
        '{"v":"spend","p":"spent","pp":"spent","es":"gastar / pasar (tiempo)","ex":"I spent 50 euros on groceries. We spent the day at the beach.","pron_v":"/spend/","pron_p":"/spent/","pron_pp":"/spent/"}'::jsonb,
        '{"v":"spill","p":"spilt/spilled","pp":"spilt/spilled","es":"derramar / verter","ex":"I spilled coffee on my shirt this morning.","pron_v":"/spil/","pron_p":"/spilt / spild/","pron_pp":"/spilt / spild/"}'::jsonb,
        '{"v":"spin","p":"spun","pp":"spun","es":"girar / dar vueltas","ex":"The Earth spins on its own axis.","pron_v":"/spin/","pron_p":"/span/","pron_pp":"/span/"}'::jsonb,
        '{"v":"spit","p":"spat","pp":"spat","es":"escupir","ex":"Please don''t spit on the floor.","pron_v":"/spit/","pron_p":"/spat/","pron_pp":"/spat/"}'::jsonb,
        '{"v":"split","p":"split","pp":"split","es":"dividir / partir","ex":"They split the bill equally between the four of them.","pron_v":"/split/","pron_p":"/split/","pron_pp":"/split/"}'::jsonb,
        '{"v":"spoil","p":"spoilt/spoiled","pp":"spoilt/spoiled","es":"estropear / echar a perder","ex":"Don''t spoil the surprise--she doesn''t know yet.","pron_v":"/spóil/","pron_p":"/spóilt / spóild/","pron_pp":"/spóilt / spóild/"}'::jsonb,
        '{"v":"spread","p":"spread","pp":"spread","es":"extender / untar / propagar","ex":"She spread butter on the toast.","pron_v":"/spred/","pron_p":"/spred/","pron_pp":"/spred/"}'::jsonb,
        '{"v":"spring","p":"sprang","pp":"sprung","es":"saltar / brotar / surgir de repente","ex":"He sprang out of bed when he heard the alarm.","pron_v":"/sprin/","pron_p":"/spran/","pron_pp":"/spran/"}'::jsonb,
        '{"v":"stand","p":"stood","pp":"stood","es":"estar de pie / soportar","ex":"We stood in line for an hour.","pron_v":"/stand/","pron_p":"/stud/","pron_pp":"/stud/"}'::jsonb,
        '{"v":"steal","p":"stole","pp":"stolen","es":"robar / hurtar","ex":"Someone stole my bicycle from outside the shop.","pron_v":"/stil/","pron_p":"/stoul/","pron_pp":"/stóu-len/"}'::jsonb,
        '{"v":"stick","p":"stuck","pp":"stuck","es":"pegar / clavar / quedarse pegado","ex":"Stick the stamp on the envelope.","pron_v":"/stik/","pron_p":"/stak/","pron_pp":"/stak/"}'::jsonb,
        '{"v":"sting","p":"stung","pp":"stung","es":"picar / escocer","ex":"A bee stung me on the arm at the park.","pron_v":"/stin/","pron_p":"/stan/","pron_pp":"/stan/"}'::jsonb,
        '{"v":"stink","p":"stank/stunk","pp":"stunk","es":"apestar / oler muy mal","ex":"These wet socks stink!","pron_v":"/stink/","pron_p":"/stank/","pron_pp":"/stank/"}'::jsonb,
        '{"v":"stride","p":"strode","pp":"stridden","es":"caminar a zancadas","ex":"He strode confidently into the room.","pron_v":"/stráid/","pron_p":"/stroud/","pron_pp":"/strí-den/"}'::jsonb,
        '{"v":"swear","p":"swore","pp":"sworn","es":"jurar / maldecir","ex":"She swore to tell the truth.","pron_v":"/suér/","pron_p":"/suor/","pron_pp":"/suorn/"}'::jsonb,
        '{"v":"sweat","p":"sweat","pp":"sweat","es":"sudar","ex":"He sweated a lot during the race.","pron_v":"/suét/","pron_p":"/suét/","pron_pp":"/suét/"}'::jsonb,
        '{"v":"sweep","p":"swept","pp":"swept","es":"barrer","ex":"She swept the kitchen floor after dinner.","pron_v":"/suíp/","pron_p":"/suept/","pron_pp":"/suept/"}'::jsonb,
        '{"v":"swell","p":"swelled","pp":"swollen","es":"hincharse / inflamarse","ex":"His ankle swelled up after the fall.","pron_v":"/suél/","pron_p":"/suéld/","pron_pp":"/suóu-len/"}'::jsonb,
        '{"v":"swim","p":"swam","pp":"swum","es":"nadar","ex":"She swam across the lake on a hot summer day.","pron_v":"/suím/","pron_p":"/suam/","pron_pp":"/suam/"}'::jsonb,
        '{"v":"swing","p":"swung","pp":"swung","es":"balancearse / mecer","ex":"The children were swinging in the park.","pron_v":"/suín/","pron_p":"/suan/","pron_pp":"/suan/"}'::jsonb,
        '{"v":"take","p":"took","pp":"taken","es":"tomar / coger / llevar","ex":"Take an umbrella--it looks like rain.","pron_v":"/teik/","pron_p":"/tuk/","pron_pp":"/téi-ken/"}'::jsonb,
        '{"v":"teach","p":"taught","pp":"taught","es":"enseñar / dar clase de","ex":"She teaches mathematics at the local school.","pron_v":"/tich/","pron_p":"/tot/","pron_pp":"/tot/"}'::jsonb,
        '{"v":"tear","p":"tore","pp":"torn","es":"rasgar / desgarrar","ex":"He tore the letter open impatiently.","pron_v":"/ter/","pron_p":"/tor/","pron_pp":"/torn/"}'::jsonb,
        '{"v":"tell","p":"told","pp":"told","es":"decir / contar","ex":"Tell me about your trip to Japan!","pron_v":"/tel/","pron_p":"/tould/","pron_pp":"/tould/"}'::jsonb,
        '{"v":"think","p":"thought","pp":"thought","es":"pensar / creer","ex":"I think you''re right about that.","pron_v":"/zink/","pron_p":"/zot/","pron_pp":"/zot/"}'::jsonb,
        '{"v":"throw","p":"threw","pp":"thrown","es":"lanzar / tirar","ex":"She threw the ball to her dog.","pron_v":"/zrou/","pron_p":"/zru/","pron_pp":"/zroun/"}'::jsonb,
        '{"v":"thrust","p":"thrust","pp":"thrust","es":"empujar con fuerza","ex":"He thrust the door open and stormed out.","pron_v":"/zrast/","pron_p":"/zrast/","pron_pp":"/zrast/"}'::jsonb,
        '{"v":"tread","p":"trode","pp":"trodden/trod","es":"pisar / andar por","ex":"Tread carefully--the floor is wet.","pron_v":"/tred/","pron_p":"/troud/","pron_pp":"/tró-den/"}'::jsonb,
        '{"v":"understand","p":"understood","pp":"understood","es":"entender / comprender","ex":"Do you understand the instructions?","pron_v":"/an-der-stánd/","pron_p":"/an-der-stúd/","pron_pp":"/an-der-stúd/"}'::jsonb,
        '{"v":"undergo","p":"underwent","pp":"undergone","es":"someterse a / pasar por","ex":"She underwent surgery last week and is recovering.","pron_v":"/an-der-góu/","pron_p":"/an-der-uént/","pron_pp":"/an-der-gón/"}'::jsonb,
        '{"v":"undertake","p":"undertook","pp":"undertaken","es":"emprender / llevar a cabo","ex":"He undertook the challenge without hesitation.","pron_v":"/an-der-téik/","pron_p":"/an-der-túk/","pron_pp":"/an-der-téi-ken/"}'::jsonb,
        '{"v":"wake","p":"woke","pp":"woken","es":"despertar / levantarse","ex":"What time did you wake up this morning?","pron_v":"/uéik/","pron_p":"/uóuk/","pron_pp":"/uóu-ken/"}'::jsonb,
        '{"v":"wear","p":"wore","pp":"worn","es":"llevar puesto / vestir","ex":"She''s wearing a red dress at the party.","pron_v":"/uer/","pron_p":"/uor/","pron_pp":"/uorn/"}'::jsonb,
        '{"v":"weep","p":"wept","pp":"wept","es":"llorar / sollozar","ex":"She wept when she heard the sad news.","pron_v":"/uíp/","pron_p":"/uept/","pron_pp":"/uept/"}'::jsonb,
        '{"v":"wet","p":"wet","pp":"wet","es":"mojar / humedecer","ex":"Don''t wet the floor--I just cleaned it!","pron_v":"/uet/","pron_p":"/uet/","pron_pp":"/uet/"}'::jsonb,
        '{"v":"win","p":"won","pp":"won","es":"ganar","ex":"Spain won the championship last year.","pron_v":"/uin/","pron_p":"/uan/","pron_pp":"/uan/"}'::jsonb,
        '{"v":"wring","p":"wrung","pp":"wrung","es":"retorcer / escurrir","ex":"She wrung out the wet towel after washing it.","pron_v":"/rin/","pron_p":"/ran/","pron_pp":"/ran/"}'::jsonb,
        '{"v":"write","p":"wrote","pp":"written","es":"escribir","ex":"He wrote a long letter to his old friend.","pron_v":"/ráit/","pron_p":"/rout/","pron_pp":"/rí-ten/"}'::jsonb,
        '{"v":"accept","p":"accepted","pp":"accepted","es":"aceptar","ex":"She accepted the job offer immediately.","pron_v":"/ak-sépt/","pron_p":"/ak-sép-tid/","pron_pp":"/ak-sép-tid/"}'::jsonb,
        '{"v":"achieve","p":"achieved","pp":"achieved","es":"lograr / alcanzar","ex":"He achieved his goal of running a marathon.","pron_v":"/a-chív/","pron_p":"/a-chívd/","pron_pp":"/a-chívd/"}'::jsonb,
        '{"v":"admire","p":"admired","pp":"admired","es":"admirar","ex":"Everyone admires her dedication to her work.","pron_v":"/ad-máir/","pron_p":"/ad-máird/","pron_pp":"/ad-máird/"}'::jsonb,
        '{"v":"affect","p":"affected","pp":"affected","es":"afectar / influir en","ex":"The bad weather affected our travel plans.","pron_v":"/a-fékt/","pron_p":"/a-fék-tid/","pron_pp":"/a-fék-tid/"}'::jsonb,
        '{"v":"agree","p":"agreed","pp":"agreed","es":"estar de acuerdo / acordar","ex":"We all agreed to meet at noon.","pron_v":"/a-grí/","pron_p":"/a-gríd/","pron_pp":"/a-gríd/"}'::jsonb,
        '{"v":"amuse","p":"amused","pp":"amused","es":"divertir / entretener","ex":"The clown amused the children for hours.","pron_v":"/a-miús/","pron_p":"/a-miúsd/","pron_pp":"/a-miúsd/"}'::jsonb,
        '{"v":"answer","p":"answered","pp":"answered","es":"responder / contestar","ex":"Please answer the phone--it''s been ringing!","pron_v":"/án-ser/","pron_p":"/án-serd/","pron_pp":"/án-serd/"}'::jsonb,
        '{"v":"appear","p":"appeared","pp":"appeared","es":"aparecer / parecer","ex":"A rainbow appeared after the storm.","pron_v":"/a-pír/","pron_p":"/a-pírd/","pron_pp":"/a-pírd/"}'::jsonb,
        '{"v":"arrive","p":"arrived","pp":"arrived","es":"llegar","ex":"The train arrives at 9:15 every morning.","pron_v":"/a-ráiv/","pron_p":"/a-ráivd/","pron_pp":"/a-ráivd/"}'::jsonb,
        '{"v":"ask","p":"asked","pp":"asked","es":"preguntar / pedir","ex":"She asked me for directions to the museum.","pron_v":"/ask/","pron_p":"/askt/","pron_pp":"/askt/"}'::jsonb,
        '{"v":"attack","p":"attacked","pp":"attacked","es":"atacar","ex":"A dog attacked the cyclist near the park.","pron_v":"/a-ták/","pron_p":"/a-tákt/","pron_pp":"/a-tákt/"}'::jsonb,
        '{"v":"bake","p":"baked","pp":"baked","es":"hornear","ex":"She baked a loaf of bread from scratch.","pron_v":"/béik/","pron_p":"/béikt/","pron_pp":"/béikt/"}'::jsonb,
        '{"v":"behave","p":"behaved","pp":"behaved","es":"comportarse","ex":"Please behave yourselves at the dinner table.","pron_v":"/bi-héiv/","pron_p":"/bi-héivd/","pron_pp":"/bi-héivd/"}'::jsonb,
        '{"v":"believe","p":"believed","pp":"believed","es":"creer","ex":"I believe you--tell me what happened.","pron_v":"/bi-lív/","pron_p":"/bi-lívd/","pron_pp":"/bi-lívd/"}'::jsonb,
        '{"v":"belong","p":"belonged","pp":"belonged","es":"pertenecer / ser de","ex":"This jacket belongs to my sister.","pron_v":"/bi-lón/","pron_p":"/bi-lónd/","pron_pp":"/bi-lónd/"}'::jsonb,
        '{"v":"blame","p":"blamed","pp":"blamed","es":"culpar / echar la culpa a","ex":"Don''t blame me--it wasn''t my idea!","pron_v":"/bléim/","pron_p":"/bléimd/","pron_pp":"/bléimd/"}'::jsonb,
        '{"v":"borrow","p":"borrowed","pp":"borrowed","es":"pedir prestado / tomar prestado","ex":"Can I borrow your umbrella? It''s starting to rain.","pron_v":"/bó-rou/","pron_p":"/bó-roud/","pron_pp":"/bó-roud/"}'::jsonb,
        '{"v":"bother","p":"bothered","pp":"bothered","es":"molestar / preocuparse por","ex":"Sorry to bother you--do you have a minute?","pron_v":"/bó-der/","pron_p":"/bó-derd/","pron_pp":"/bó-derd/"}'::jsonb,
        '{"v":"call","p":"called","pp":"called","es":"llamar (telefono) / llamar a alguien","ex":"I''ll call you when I get home.","pron_v":"/kol/","pron_p":"/kold/","pron_pp":"/kold/"}'::jsonb,
        '{"v":"cancel","p":"canceled","pp":"canceled","es":"cancelar","ex":"They cancelled the flight due to the storm.","pron_v":"/kán-sel/","pron_p":"/kán-seld/","pron_pp":"/kán-seld/"}'::jsonb,
        '{"v":"carry","p":"carried","pp":"carried","es":"llevar / cargar","ex":"Can you carry these bags to the car?","pron_v":"/ká-ri/","pron_p":"/ká-rid/","pron_pp":"/ká-rid/"}'::jsonb,
        '{"v":"cause","p":"caused","pp":"caused","es":"causar / provocar","ex":"The heavy rain caused flooding in the area.","pron_v":"/kos/","pron_p":"/kost/","pron_pp":"/kost/"}'::jsonb,
        '{"v":"celebrate","p":"celebrated","pp":"celebrated","es":"celebrar / festejar","ex":"We celebrated our anniversary with a romantic dinner.","pron_v":"/sé-le-breit/","pron_p":"/sé-le-brei-tid/","pron_pp":"/sé-le-brei-tid/"}'::jsonb,
        '{"v":"clean","p":"cleaned","pp":"cleaned","es":"limpiar","ex":"She cleaned the whole apartment on Saturday.","pron_v":"/klin/","pron_p":"/klind/","pron_pp":"/klind/"}'::jsonb,
        '{"v":"climb","p":"climbed","pp":"climbed","es":"escalar / subir","ex":"They climbed to the top of the mountain.","pron_v":"/kláim/","pron_p":"/kláimd/","pron_pp":"/kláimd/"}'::jsonb,
        '{"v":"close","p":"closed","pp":"closed","es":"cerrar","ex":"Please close the window--it''s cold outside.","pron_v":"/klous/","pron_p":"/klouzd/","pron_pp":"/klouzd/"}'::jsonb,
        '{"v":"compare","p":"compared","pp":"compared","es":"comparar","ex":"Don''t compare yourself to others--just do your best.","pron_v":"/kom-pér/","pron_p":"/kom-pérd/","pron_pp":"/kom-pérd/"}'::jsonb,
        '{"v":"complete","p":"completed","pp":"completed","es":"completar / terminar","ex":"Have you completed the application form?","pron_v":"/kom-plít/","pron_p":"/kom-plí-tid/","pron_pp":"/kom-plí-tid/"}'::jsonb,
        '{"v":"contain","p":"contained","pp":"contained","es":"contener / incluir","ex":"This box contains all your old letters.","pron_v":"/kon-téin/","pron_p":"/kon-téind/","pron_pp":"/kon-téind/"}'::jsonb,
        '{"v":"continue","p":"continued","pp":"continued","es":"continuar / seguir","ex":"Please continue--I''m listening.","pron_v":"/kon-tí-niu/","pron_p":"/kon-tí-niud/","pron_pp":"/kon-tí-niud/"}'::jsonb,
        '{"v":"cough","p":"coughed","pp":"coughed","es":"toser","ex":"He coughed all night because of his cold.","pron_v":"/kof/","pron_p":"/koft/","pron_pp":"/koft/"}'::jsonb,
        '{"v":"count","p":"counted","pp":"counted","es":"contar / importar","ex":"Count the coins before putting them in the jar.","pron_v":"/kaunt/","pron_p":"/káun-tid/","pron_pp":"/káun-tid/"}'::jsonb,
        '{"v":"crash","p":"crashed","pp":"crashed","es":"chocar / estrellarse","ex":"Two cars crashed at the intersection.","pron_v":"/krash/","pron_p":"/krasht/","pron_pp":"/krasht/"}'::jsonb,
        '{"v":"create","p":"created","pp":"created","es":"crear","ex":"She created a beautiful sculpture from wood.","pron_v":"/kri-éit/","pron_p":"/kri-éi-tid/","pron_pp":"/kri-éi-tid/"}'::jsonb,
        '{"v":"cross","p":"crossed","pp":"crossed","es":"cruzar","ex":"Look both ways before you cross the street.","pron_v":"/kros/","pron_p":"/krost/","pron_pp":"/krost/"}'::jsonb,
        '{"v":"curse","p":"cursed","pp":"cursed","es":"maldecir / insultar","ex":"He cursed under his breath when he missed the bus.","pron_v":"/kers/","pron_p":"/kerst/","pron_pp":"/kerst/"}'::jsonb,
        '{"v":"change","p":"changed","pp":"changed","es":"cambiar","ex":"She changed her mind at the last minute.","pron_v":"/chéindj/","pron_p":"/chéindjd/","pron_pp":"/chéindjd/"}'::jsonb,
        '{"v":"chase","p":"chased","pp":"chased","es":"perseguir","ex":"The police chased the thief through the streets.","pron_v":"/chéis/","pron_p":"/chéist/","pron_pp":"/chéist/"}'::jsonb,
        '{"v":"chat","p":"chatted","pp":"chatted","es":"charlar / chatear","ex":"We chatted for hours over coffee.","pron_v":"/chat/","pron_p":"/chá-tid/","pron_pp":"/chá-tid/"}'::jsonb,
        '{"v":"check","p":"checked","pp":"checked","es":"comprobar / verificar","ex":"Check the timetable before you leave.","pron_v":"/chek/","pron_p":"/chekt/","pron_pp":"/chekt/"}'::jsonb,
        '{"v":"damage","p":"damaged","pp":"damaged","es":"dañar / estropear","ex":"The storm damaged several houses in the village.","pron_v":"/dá-medj/","pron_p":"/dá-medjd/","pron_pp":"/dá-medjd/"}'::jsonb,
        '{"v":"decide","p":"decided","pp":"decided","es":"decidir","ex":"We decided to go to the beach for the weekend.","pron_v":"/di-sáid/","pron_p":"/di-sái-did/","pron_pp":"/di-sái-did/"}'::jsonb,
        '{"v":"deliver","p":"delivered","pp":"delivered","es":"entregar / repartir","ex":"The courier delivered the parcel this morning.","pron_v":"/di-lí-ver/","pron_p":"/di-lí-verd/","pron_pp":"/di-lí-verd/"}'::jsonb,
        '{"v":"depend","p":"depended","pp":"depended","es":"depender","ex":"It depends on the weather--we''ll see.","pron_v":"/di-pénd/","pron_p":"/di-pén-did/","pron_pp":"/di-pén-did/"}'::jsonb,
        '{"v":"describe","p":"described","pp":"described","es":"describir","ex":"Can you describe what the man looked like?","pron_v":"/dis-kráib/","pron_p":"/dis-kráibd/","pron_pp":"/dis-kráibd/"}'::jsonb,
        '{"v":"design","p":"designed","pp":"designed","es":"diseñar","ex":"She designed her own wedding dress.","pron_v":"/di-sáin/","pron_p":"/di-sáind/","pron_pp":"/di-sáind/"}'::jsonb,
        '{"v":"destroy","p":"destroyed","pp":"destroyed","es":"destruir / arrasar","ex":"The earthquake destroyed many buildings.","pron_v":"/dis-trói/","pron_p":"/dis-tróid/","pron_pp":"/dis-tróid/"}'::jsonb,
        '{"v":"decrease","p":"decreased","pp":"decreased","es":"disminuir / reducir","ex":"The number of accidents has decreased this year.","pron_v":"/di-krís/","pron_p":"/di-kríst/","pron_pp":"/di-kríst/"}'::jsonb,
        '{"v":"die","p":"died","pp":"died","es":"morir / morirse","ex":"The flowers died because nobody watered them.","pron_v":"/dái/","pron_p":"/dáid/","pron_pp":"/dáid/"}'::jsonb,
        '{"v":"disagree","p":"disagreed","pp":"disagreed","es":"no estar de acuerdo","ex":"They disagreed about which film to watch.","pron_v":"/dis-a-grí/","pron_p":"/dis-a-gríd/","pron_pp":"/dis-a-gríd/"}'::jsonb,
        '{"v":"discover","p":"discovered","pp":"discovered","es":"descubrir","ex":"Columbus discovered America in 1492.","pron_v":"/dis-kó-ver/","pron_p":"/dis-kó-verd/","pron_pp":"/dis-kó-verd/"}'::jsonb,
        '{"v":"discuss","p":"discussed","pp":"discussed","es":"hablar de / debatir","ex":"We discussed the project over lunch.","pron_v":"/dis-kás/","pron_p":"/dis-kást/","pron_pp":"/dis-kást/"}'::jsonb,
        '{"v":"disturb","p":"disturbed","pp":"disturbed","es":"molestar / interrumpir","ex":"Please don''t disturb me--I''m studying.","pron_v":"/dis-térb/","pron_p":"/dis-térbd/","pron_pp":"/dis-térbd/"}'::jsonb,
        '{"v":"dress","p":"dressed","pp":"dressed","es":"vestir / vestirse","ex":"She dressed the baby in warm clothes.","pron_v":"/dres/","pron_p":"/drest/","pron_pp":"/drest/"}'::jsonb,
        '{"v":"dry","p":"dried","pp":"dried","es":"secar / secarse","ex":"He dried his hair with a towel.","pron_v":"/drái/","pron_p":"/dráid/","pron_pp":"/dráid/"}'::jsonb,
        '{"v":"end","p":"ended","pp":"ended","es":"terminar / acabar","ex":"The meeting ended earlier than expected.","pron_v":"/end/","pron_p":"/én-did/","pron_pp":"/én-did/"}'::jsonb,
        '{"v":"enjoy","p":"enjoyed","pp":"enjoyed","es":"disfrutar / gozar de","ex":"I really enjoyed the concert last night.","pron_v":"/en-djói/","pron_p":"/en-djóid/","pron_pp":"/en-djóid/"}'::jsonb,
        '{"v":"entertain","p":"entertained","pp":"entertained","es":"entretener / divertir","ex":"He entertained the guests with funny stories.","pron_v":"/en-ter-téin/","pron_p":"/en-ter-téind/","pron_pp":"/en-ter-téind/"}'::jsonb,
        '{"v":"exhibit","p":"exhibited","pp":"exhibited","es":"exhibir / exponer","ex":"Her photographs are being exhibited in a gallery.","pron_v":"/eg-zí-bit/","pron_p":"/eg-zí-bi-tid/","pron_pp":"/eg-zí-bi-tid/"}'::jsonb,
        '{"v":"expect","p":"expected","pp":"expected","es":"esperar / prever","ex":"I''m expecting a call from the office.","pron_v":"/eks-pékt/","pron_p":"/eks-pék-tid/","pron_pp":"/eks-pék-tid/"}'::jsonb,
        '{"v":"express","p":"expressed","pp":"expressed","es":"expresar","ex":"It''s important to express your feelings clearly.","pron_v":"/eks-prés/","pron_p":"/eks-prést/","pron_pp":"/eks-prést/"}'::jsonb,
        '{"v":"fix","p":"fixed","pp":"fixed","es":"arreglar / reparar","ex":"Can you fix my bike? The tire is flat.","pron_v":"/fiks/","pron_p":"/fikst/","pron_pp":"/fikst/"}'::jsonb,
        '{"v":"follow","p":"followed","pp":"followed","es":"seguir / continuar","ex":"Follow the signs to the city centre.","pron_v":"/fó-lou/","pron_p":"/fó-loud/","pron_pp":"/fó-loud/"}'::jsonb,
        '{"v":"fry","p":"fried","pp":"fried","es":"freir","ex":"She fried eggs and bacon for breakfast.","pron_v":"/frái/","pron_p":"/fráid/","pron_pp":"/fráid/"}'::jsonb,
        '{"v":"greet","p":"greeted","pp":"greeted","es":"saludar","ex":"He greeted every customer with a smile.","pron_v":"/grit/","pron_p":"/grí-tid/","pron_pp":"/grí-tid/"}'::jsonb,
        '{"v":"handle","p":"handled","pp":"handled","es":"manejar / gestionar","ex":"She handles the most difficult customers brilliantly.","pron_v":"/hán-dol/","pron_p":"/hán-dold/","pron_pp":"/hán-dold/"}'::jsonb,
        '{"v":"happen","p":"happened","pp":"happened","es":"suceder / pasar / ocurrir","ex":"What happened to you last night?","pron_v":"/há-pen/","pron_p":"/há-pend/","pron_pp":"/há-pend/"}'::jsonb,
        '{"v":"hate","p":"hated","pp":"hated","es":"odiar / detestar","ex":"I hate waking up early on Mondays.","pron_v":"/héit/","pron_p":"/héi-tid/","pron_pp":"/héi-tid/"}'::jsonb,
        '{"v":"help","p":"helped","pp":"helped","es":"ayudar","ex":"She helped me move to my new flat.","pron_v":"/help/","pron_p":"/helpt/","pron_pp":"/helpt/"}'::jsonb,
        '{"v":"identify","p":"identified","pp":"identified","es":"identificar","ex":"Can you identify the suspect from these photos?","pron_v":"/ai-dén-ti-fai/","pron_p":"/ai-dén-ti-faid/","pron_pp":"/ai-dén-ti-faid/"}'::jsonb,
        '{"v":"ignore","p":"ignored","pp":"ignored","es":"ignorar / hacer caso omiso de","ex":"He just ignored my messages all day.","pron_v":"/ig-nór/","pron_p":"/ig-nórd/","pron_pp":"/ig-nórd/"}'::jsonb,
        '{"v":"imagine","p":"imagined","pp":"imagined","es":"imaginar / imaginarse","ex":"Imagine living on a tropical island!","pron_v":"/i-má-djin/","pron_p":"/i-má-djind/","pron_pp":"/i-má-djind/"}'::jsonb,
        '{"v":"impress","p":"impressed","pp":"impressed","es":"impresionar","ex":"Her presentation really impressed the board.","pron_v":"/im-prés/","pron_p":"/im-prést/","pron_pp":"/im-prést/"}'::jsonb,
        '{"v":"improve","p":"improved","pp":"improved","es":"mejorar","ex":"His English has improved a lot this year.","pron_v":"/im-prúv/","pron_p":"/im-prúvd/","pron_pp":"/im-prúvd/"}'::jsonb,
        '{"v":"include","p":"included","pp":"included","es":"incluir","ex":"Does the price include breakfast?","pron_v":"/in-klúd/","pron_p":"/in-klú-did/","pron_pp":"/in-klú-did/"}'::jsonb,
        '{"v":"increase","p":"increased","pp":"increased","es":"aumentar / incrementar","ex":"Sales have increased by 20% this quarter.","pron_v":"/in-krís/","pron_p":"/in-kríst/","pron_pp":"/in-kríst/"}'::jsonb,
        '{"v":"introduce","p":"introduced","pp":"introduced","es":"presentar / introducir","ex":"Let me introduce you to my colleague.","pron_v":"/in-tro-diús/","pron_p":"/in-tro-diúst/","pron_pp":"/in-tro-diúst/"}'::jsonb,
        '{"v":"invite","p":"invited","pp":"invited","es":"invitar","ex":"She invited me to her birthday party.","pron_v":"/in-váit/","pron_p":"/in-vái-tid/","pron_pp":"/in-vái-tid/"}'::jsonb,
        '{"v":"join","p":"joined","pp":"joined","es":"unirse a / apuntarse a","ex":"Why don''t you join us for dinner?","pron_v":"/djóin/","pron_p":"/djóind/","pron_pp":"/djóind/"}'::jsonb,
        '{"v":"jump","p":"jumped","pp":"jumped","es":"saltar","ex":"The kids love jumping on the trampoline.","pron_v":"/djamp/","pron_p":"/djampt/","pron_pp":"/djampt/"}'::jsonb,
        '{"v":"knock","p":"knocked","pp":"knocked","es":"llamar a la puerta / golpear","ex":"Someone knocked on the door at midnight.","pron_v":"/nok/","pron_p":"/nokt/","pron_pp":"/nokt/"}'::jsonb,
        '{"v":"label","p":"labeled","pp":"labeled","es":"etiquetar / poner nombre a","ex":"Label all your files before putting them away.","pron_v":"/léi-bol/","pron_p":"/léi-bold/","pron_pp":"/léi-bold/"}'::jsonb,
        '{"v":"land","p":"landed","pp":"landed","es":"aterrizar / llegar","ex":"The plane landed safely after a long delay.","pron_v":"/land/","pron_p":"/lán-did/","pron_pp":"/lán-did/"}'::jsonb,
        '{"v":"last","p":"lasted","pp":"lasted","es":"durar","ex":"The battery lasts about ten hours.","pron_v":"/last/","pron_p":"/lás-tid/","pron_pp":"/lás-tid/"}'::jsonb,
        '{"v":"like","p":"liked","pp":"liked","es":"gustar / agradar","ex":"I like going for walks in the morning.","pron_v":"/láik/","pron_p":"/láikt/","pron_pp":"/láikt/"}'::jsonb,
        '{"v":"link","p":"linked","pp":"linked","es":"enlazar / conectar","ex":"This road links the two main towns.","pron_v":"/link/","pron_p":"/linkt/","pron_pp":"/linkt/"}'::jsonb,
        '{"v":"list","p":"listed","pp":"listed","es":"listar / enumerar","ex":"List all your skills on your CV.","pron_v":"/list/","pron_p":"/lís-tid/","pron_pp":"/lís-tid/"}'::jsonb,
        '{"v":"listen","p":"listened","pp":"listened","es":"escuchar","ex":"Please listen carefully to the instructions.","pron_v":"/lí-sen/","pron_p":"/lí-send/","pron_pp":"/lí-send/"}'::jsonb,
        '{"v":"live","p":"lived","pp":"lived","es":"vivir","ex":"She lives in a small flat near the park.","pron_v":"/liv/","pron_p":"/livd/","pron_pp":"/livd/"}'::jsonb,
        '{"v":"locate","p":"located","pp":"located","es":"localizar / ubicar","ex":"Can you locate the nearest pharmacy on the map?","pron_v":"/lóu-keit/","pron_p":"/lóu-kei-tid/","pron_pp":"/lóu-kei-tid/"}'::jsonb,
        '{"v":"look","p":"looked","pp":"looked","es":"mirar / buscar","ex":"Look at those beautiful mountains!","pron_v":"/luk/","pron_p":"/lukt/","pron_pp":"/lukt/"}'::jsonb,
        '{"v":"love","p":"loved","pp":"loved","es":"amar / encantar","ex":"She loves reading mystery novels.","pron_v":"/lav/","pron_p":"/lavd/","pron_pp":"/lavd/"}'::jsonb,
        '{"v":"match","p":"matched","pp":"matched","es":"emparejar / combinar","ex":"Match the words with their correct definitions.","pron_v":"/mach/","pron_p":"/macht/","pron_pp":"/macht/"}'::jsonb,
        '{"v":"measure","p":"measured","pp":"measured","es":"medir","ex":"He measured the room before buying new furniture.","pron_v":"/mé-shur/","pron_p":"/mé-shurd/","pron_pp":"/mé-shurd/"}'::jsonb,
        '{"v":"mention","p":"mentioned","pp":"mentioned","es":"mencionar","ex":"Did she mention what time she''ll be here?","pron_v":"/mén-shon/","pron_p":"/mén-shond/","pron_pp":"/mén-shond/"}'::jsonb,
        '{"v":"miss","p":"missed","pp":"missed","es":"perder / echar de menos / fallar","ex":"I missed the last bus home. I miss you so much.","pron_v":"/mis/","pron_p":"/mist/","pron_pp":"/mist/"}'::jsonb,
        '{"v":"move","p":"moved","pp":"moved","es":"mover / mudarse","ex":"They moved to a bigger house last summer.","pron_v":"/muv/","pron_p":"/muvd/","pron_pp":"/muvd/"}'::jsonb,
        '{"v":"name","p":"named","pp":"named","es":"nombrar / llamar","ex":"They named their daughter Sofia.","pron_v":"/neim/","pron_p":"/neimd/","pron_pp":"/neimd/"}'::jsonb,
        '{"v":"need","p":"needed","pp":"needed","es":"necesitar","ex":"I need a few more minutes to get ready.","pron_v":"/nid/","pron_p":"/ní-did/","pron_pp":"/ní-did/"}'::jsonb,
        '{"v":"note","p":"noted","pp":"noted","es":"anotar / tomar nota de","ex":"Note the important dates on your calendar.","pron_v":"/nout/","pron_p":"/nóu-tid/","pron_pp":"/nóu-tid/"}'::jsonb,
        '{"v":"notice","p":"noticed","pp":"noticed","es":"notar / darse cuenta de","ex":"Did you notice she was upset?","pron_v":"/nóu-tis/","pron_p":"/nóu-tist/","pron_pp":"/nóu-tist/"}'::jsonb,
        '{"v":"number","p":"numbered","pp":"numbered","es":"numerar","ex":"Number the pages from 1 to 100.","pron_v":"/nám-ber/","pron_p":"/nám-berd/","pron_pp":"/nám-berd/"}'::jsonb,
        '{"v":"offer","p":"offered","pp":"offered","es":"ofrecer","ex":"She offered to help me carry the boxes.","pron_v":"/ó-fer/","pron_p":"/ó-ferd/","pron_pp":"/ó-ferd/"}'::jsonb,
        '{"v":"order","p":"ordered","pp":"ordered","es":"ordenar / pedir (en restaurante)","ex":"She ordered a pizza and a salad.","pron_v":"/ór-der/","pron_p":"/ór-derd/","pron_pp":"/ór-derd/"}'::jsonb,
        '{"v":"organize","p":"organized","pp":"organized","es":"organizar","ex":"He organized the whole event by himself.","pron_v":"/ór-ga-naiz/","pron_p":"/ór-ga-naizd/","pron_pp":"/ór-ga-naizd/"}'::jsonb,
        '{"v":"paint","p":"painted","pp":"painted","es":"pintar","ex":"They painted the living room a warm yellow.","pron_v":"/peint/","pron_p":"/péin-tid/","pron_pp":"/péin-tid/"}'::jsonb,
        '{"v":"park","p":"parked","pp":"parked","es":"aparcar / estacionar","ex":"Where can I park my car near here?","pron_v":"/park/","pron_p":"/parkt/","pron_pp":"/parkt/"}'::jsonb,
        '{"v":"participate","p":"participated","pp":"participated","es":"participar","ex":"All students participated in the school play.","pron_v":"/par-tí-si-peit/","pron_p":"/par-tí-si-pei-tid/","pron_pp":"/par-tí-si-pei-tid/"}'::jsonb,
        '{"v":"pass","p":"passed","pp":"passed","es":"pasar / aprobar / adelantar","ex":"She passed her driving test on the first try.","pron_v":"/pas/","pron_p":"/past/","pron_pp":"/past/"}'::jsonb,
        '{"v":"perform","p":"performed","pp":"performed","es":"actuar / realizar / ejecutar","ex":"The band performed for over two hours.","pron_v":"/per-fórm/","pron_p":"/per-fórmd/","pron_pp":"/per-fórmd/"}'::jsonb,
        '{"v":"persuade","p":"persuaded","pp":"persuaded","es":"persuadir / convencer","ex":"He persuaded me to try the spicy dish.","pron_v":"/per-suéid/","pron_p":"/per-suéi-did/","pron_pp":"/per-suéi-did/"}'::jsonb,
        '{"v":"plan","p":"planned","pp":"planned","es":"planear / planificar","ex":"We''re planning a trip to Japan next year.","pron_v":"/plan/","pron_p":"/pland/","pron_pp":"/pland/"}'::jsonb,
        '{"v":"play","p":"played","pp":"played","es":"jugar / tocar (instrumento)","ex":"He plays guitar in a rock band. Do you play chess?","pron_v":"/plei/","pron_p":"/pleid/","pron_pp":"/pleid/"}'::jsonb,
        '{"v":"please","p":"pleased","pp":"pleased","es":"complacer / agradar","ex":"It''s hard to please everyone all the time.","pron_v":"/plis/","pron_p":"/plist/","pron_pp":"/plist/"}'::jsonb,
        '{"v":"practice","p":"practiced","pp":"practiced","es":"practicar","ex":"Practice makes perfect--keep at it!","pron_v":"/prák-tis/","pron_p":"/prák-tist/","pron_pp":"/prák-tist/"}'::jsonb,
        '{"v":"predict","p":"predicted","pp":"predicted","es":"predecir / pronosticar","ex":"It''s hard to predict the weather in spring.","pron_v":"/pri-díkt/","pron_p":"/pri-dík-tid/","pron_pp":"/pri-dík-tid/"}'::jsonb,
        '{"v":"prefer","p":"preferred","pp":"preferred","es":"preferir","ex":"I prefer tea to coffee in the mornings.","pron_v":"/pri-fér/","pron_p":"/pri-férd/","pron_pp":"/pri-férd/"}'::jsonb,
        '{"v":"program","p":"programmed","pp":"programmed","es":"programar","ex":"He programmed the robot to avoid obstacles.","pron_v":"/próu-gram/","pron_p":"/próu-gramd/","pron_pp":"/próu-gramd/"}'::jsonb,
        '{"v":"protect","p":"protected","pp":"protected","es":"proteger","ex":"Sunscreen protects your skin from UV rays.","pron_v":"/pro-tékt/","pron_p":"/pro-ték-tid/","pron_pp":"/pro-ték-tid/"}'::jsonb,
        '{"v":"provide","p":"provided","pp":"provided","es":"proporcionar / dar","ex":"The company provides free meals for its employees.","pron_v":"/pro-váid/","pron_p":"/pro-vái-did/","pron_pp":"/pro-vái-did/"}'::jsonb,
        '{"v":"purchase","p":"purchased","pp":"purchased","es":"comprar / adquirir","ex":"She purchased new furniture for her office.","pron_v":"/pér-chas/","pron_p":"/pér-chast/","pron_pp":"/pér-chast/"}'::jsonb,
        '{"v":"receive","p":"received","pp":"received","es":"recibir","ex":"I received a letter from the bank this morning.","pron_v":"/ri-sív/","pron_p":"/ri-sívd/","pron_pp":"/ri-sívd/"}'::jsonb,
        '{"v":"recommend","p":"recommended","pp":"recommended","es":"recomendar","ex":"Can you recommend a good restaurant nearby?","pron_v":"/re-ko-ménd/","pron_p":"/re-ko-mén-did/","pron_pp":"/re-ko-mén-did/"}'::jsonb,
        '{"v":"relate","p":"related","pp":"related","es":"relacionar","ex":"Can you relate this problem to what we studied last week?","pron_v":"/ri-léit/","pron_p":"/ri-léi-tid/","pron_pp":"/ri-léi-tid/"}'::jsonb,
        '{"v":"relax","p":"relaxed","pp":"relaxed","es":"relajarse","ex":"She relaxed with a good book after a long day.","pron_v":"/ri-láks/","pron_p":"/ri-lákst/","pron_pp":"/ri-lákst/"}'::jsonb,
        '{"v":"remember","p":"remembered","pp":"remembered","es":"recordar / acordarse de","ex":"Do you remember the first time we met?","pron_v":"/ri-mém-ber/","pron_p":"/ri-mém-berd/","pron_pp":"/ri-mém-berd/"}'::jsonb,
        '{"v":"repair","p":"repaired","pp":"repaired","es":"reparar / arreglar","ex":"The mechanic repaired the car in two hours.","pron_v":"/ri-pér/","pron_p":"/ri-pérd/","pron_pp":"/ri-pérd/"}'::jsonb,
        '{"v":"repeat","p":"repeated","pp":"repeated","es":"repetir","ex":"Could you repeat that? I didn''t hear you.","pron_v":"/ri-pít/","pron_p":"/ri-pí-tid/","pron_pp":"/ri-pí-tid/"}'::jsonb,
        '{"v":"resist","p":"resisted","pp":"resisted","es":"resistir","ex":"I couldn''t resist eating another slice of cake!","pron_v":"/ri-síst/","pron_p":"/ri-sís-tid/","pron_pp":"/ri-sís-tid/"}'::jsonb,
        '{"v":"rest","p":"rested","pp":"rested","es":"descansar","ex":"You should rest--you look exhausted.","pron_v":"/rest/","pron_p":"/rés-tid/","pron_pp":"/rés-tid/"}'::jsonb,
        '{"v":"return","p":"returned","pp":"returned","es":"volver / devolver","ex":"She returned home after a long trip abroad.","pron_v":"/ri-térn/","pron_p":"/ri-térnd/","pron_pp":"/ri-térnd/"}'::jsonb,
        '{"v":"sail","p":"sailed","pp":"sailed","es":"navegar (en barco)","ex":"They sailed from Barcelona to Mallorca.","pron_v":"/seil/","pron_p":"/seild/","pron_pp":"/seild/"}'::jsonb,
        '{"v":"save","p":"saved","pp":"saved","es":"ahorrar / guardar / salvar","ex":"He saved her life by calling the ambulance.","pron_v":"/seiv/","pron_p":"/seivd/","pron_pp":"/seivd/"}'::jsonb,
        '{"v":"scan","p":"scanned","pp":"scanned","es":"escanear / leer rapido","ex":"Scan the barcode to get the price.","pron_v":"/skan/","pron_p":"/skand/","pron_pp":"/skand/"}'::jsonb,
        '{"v":"scare","p":"scared","pp":"scared","es":"asustar","ex":"Don''t scare me like that!","pron_v":"/sker/","pron_p":"/skerd/","pron_pp":"/skerd/"}'::jsonb,
        '{"v":"share","p":"shared","pp":"shared","es":"compartir","ex":"She shared her lunch with a friend.","pron_v":"/sher/","pron_p":"/sherd/","pron_pp":"/sherd/"}'::jsonb,
        '{"v":"shout","p":"shouted","pp":"shouted","es":"gritar","ex":"Stop shouting--I can hear you perfectly.","pron_v":"/shaut/","pron_p":"/sháu-tid/","pron_pp":"/sháu-tid/"}'::jsonb,
        '{"v":"ski","p":"skied","pp":"skied","es":"esquiar","ex":"They go skiing in the Alps every winter.","pron_v":"/ski/","pron_p":"/skid/","pron_pp":"/skid/"}'::jsonb,
        '{"v":"slow","p":"slowed","pp":"slowed","es":"reducir la velocidad / ir mas despacio","ex":"Slow down--there''s a school ahead.","pron_v":"/slou/","pron_p":"/sloud/","pron_pp":"/sloud/"}'::jsonb,
        '{"v":"sneeze","p":"sneezed","pp":"sneezed","es":"estornudar","ex":"He sneezed three times and then blew his nose.","pron_v":"/snis/","pron_p":"/snist/","pron_pp":"/snist/"}'::jsonb,
        '{"v":"snow","p":"snowed","pp":"snowed","es":"nevar","ex":"It snowed heavily overnight and the roads are icy.","pron_v":"/snou/","pron_p":"/snoud/","pron_pp":"/snoud/"}'::jsonb,
        '{"v":"solve","p":"solved","pp":"solved","es":"resolver / solucionar","ex":"She solved the math problem in seconds.","pron_v":"/solv/","pron_p":"/solvd/","pron_pp":"/solvd/"}'::jsonb,
        '{"v":"start","p":"started","pp":"started","es":"empezar / arrancar","ex":"The car won''t start--the battery is dead.","pron_v":"/start/","pron_p":"/stár-tid/","pron_pp":"/stár-tid/"}'::jsonb,
        '{"v":"step","p":"stepped","pp":"stepped","es":"dar un paso / pisar","ex":"Step aside, please--I need to get through.","pron_v":"/step/","pron_p":"/stept/","pron_pp":"/stept/"}'::jsonb,
        '{"v":"stop","p":"stopped","pp":"stopped","es":"parar / dejar de","ex":"Stop talking and listen, please.","pron_v":"/stop/","pron_p":"/stopt/","pron_pp":"/stopt/"}'::jsonb,
        '{"v":"stress","p":"stressed","pp":"stressed","es":"estresar / subrayar / hacer hincapie en","ex":"Don''t stress about it--everything will be fine.","pron_v":"/stres/","pron_p":"/strest/","pron_pp":"/strest/"}'::jsonb,
        '{"v":"study","p":"studied","pp":"studied","es":"estudiar","ex":"She studied for three hours straight.","pron_v":"/stá-di/","pron_p":"/stá-did/","pron_pp":"/stá-did/"}'::jsonb,
        '{"v":"substitute","p":"substituted","pp":"substituted","es":"sustituir / reemplazar","ex":"You can substitute butter with olive oil in this recipe.","pron_v":"/sáb-sti-tiut/","pron_p":"/sáb-sti-tiu-tid/","pron_pp":"/sáb-sti-tiu-tid/"}'::jsonb,
        '{"v":"suggest","p":"suggested","pp":"suggested","es":"sugerir","ex":"I suggest we leave early to avoid the traffic.","pron_v":"/sa-djést/","pron_p":"/sa-djés-tid/","pron_pp":"/sa-djés-tid/"}'::jsonb,
        '{"v":"surprise","p":"surprised","pp":"surprised","es":"sorprender","ex":"She surprised her parents with a big birthday party.","pron_v":"/ser-práis/","pron_p":"/ser-práist/","pron_pp":"/ser-práist/"}'::jsonb,
        '{"v":"talk","p":"talked","pp":"talked","es":"hablar / conversar","ex":"We talked for hours about our plans for the future.","pron_v":"/tok/","pron_p":"/tokt/","pron_pp":"/tokt/"}'::jsonb,
        '{"v":"taste","p":"tasted","pp":"tasted","es":"probar / saber a","ex":"Taste the sauce and tell me if it needs more salt.","pron_v":"/teist/","pron_p":"/téis-tid/","pron_pp":"/téis-tid/"}'::jsonb,
        '{"v":"terrorize","p":"terrorized","pp":"terrorized","es":"aterrorizar","ex":"The serial thief terrorized the neighbourhood for months.","pron_v":"/té-ro-raiz/","pron_p":"/té-ro-raizd/","pron_pp":"/té-ro-raizd/"}'::jsonb,
        '{"v":"thank","p":"thanked","pp":"thanked","es":"agradecer","ex":"She thanked me for helping her move house.","pron_v":"/zank/","pron_p":"/zankt/","pron_pp":"/zankt/"}'::jsonb,
        '{"v":"touch","p":"touched","pp":"touched","es":"tocar","ex":"Don''t touch the painting--it''s still wet!","pron_v":"/tach/","pron_p":"/tacht/","pron_pp":"/tacht/"}'::jsonb,
        '{"v":"travel","p":"traveled","pp":"traveled","es":"viajar","ex":"He has traveled to over 40 countries.","pron_v":"/trá-vel/","pron_p":"/trá-veld/","pron_pp":"/trá-veld/"}'::jsonb,
        '{"v":"try","p":"tried","pp":"tried","es":"intentar / probar","ex":"Try this chocolate--it''s amazing!","pron_v":"/trai/","pron_p":"/traid/","pron_pp":"/traid/"}'::jsonb,
        '{"v":"turn","p":"turned","pp":"turned","es":"girar / convertirse en / poner","ex":"Turn left at the traffic lights.","pron_v":"/tern/","pron_p":"/ternd/","pron_pp":"/ternd/"}'::jsonb,
        '{"v":"use","p":"used","pp":"used","es":"usar / utilizar","ex":"Use a dictionary if you don''t know the word.","pron_v":"/ius/","pron_p":"/iust/","pron_pp":"/iust/"}'::jsonb,
        '{"v":"vary","p":"varied","pp":"varied","es":"variar / cambiar","ex":"Prices vary depending on the season.","pron_v":"/vé-ri/","pron_p":"/vé-rid/","pron_pp":"/vé-rid/"}'::jsonb,
        '{"v":"wait","p":"waited","pp":"waited","es":"esperar","ex":"Wait for me here--I''ll be back in five minutes.","pron_v":"/ueit/","pron_p":"/uéi-tid/","pron_pp":"/uéi-tid/"}'::jsonb,
        '{"v":"walk","p":"walked","pp":"walked","es":"caminar / andar","ex":"We walked along the beach at sunset.","pron_v":"/uok/","pron_p":"/uokt/","pron_pp":"/uokt/"}'::jsonb,
        '{"v":"want","p":"wanted","pp":"wanted","es":"querer / desear","ex":"I want a coffee and a piece of cake, please.","pron_v":"/uont/","pron_p":"/uón-tid/","pron_pp":"/uón-tid/"}'::jsonb,
        '{"v":"warn","p":"warned","pp":"warned","es":"advertir / avisar","ex":"She warned me not to touch the electric fence.","pron_v":"/uorn/","pron_p":"/uornd/","pron_pp":"/uornd/"}'::jsonb,
        '{"v":"wash","p":"washed","pp":"washed","es":"lavar / lavarse","ex":"Wash your hands before eating.","pron_v":"/uash/","pron_p":"/uasht/","pron_pp":"/uasht/"}'::jsonb,
        '{"v":"watch","p":"watched","pp":"watched","es":"observar / ver / vigilar","ex":"We watched the sunset from the rooftop.","pron_v":"/uach/","pron_p":"/uacht/","pron_pp":"/uacht/"}'::jsonb,
        '{"v":"water","p":"watered","pp":"watered","es":"regar","ex":"Don''t forget to water the plants while I''m away.","pron_v":"/uó-ter/","pron_p":"/uó-terd/","pron_pp":"/uó-terd/"}'::jsonb,
        '{"v":"welcome","p":"welcomed","pp":"welcomed","es":"dar la bienvenida / acoger","ex":"They welcomed us with open arms.","pron_v":"/uél-kom/","pron_p":"/uél-komd/","pron_pp":"/uél-komd/"}'::jsonb,
        '{"v":"wish","p":"wished","pp":"wished","es":"desear","ex":"I wish you a very happy birthday!","pron_v":"/uish/","pron_p":"/uisht/","pron_pp":"/uisht/"}'::jsonb,
        '{"v":"work","p":"worked","pp":"worked","es":"trabajar / funcionar","ex":"He works in a hospital as a nurse.","pron_v":"/uork/","pron_p":"/uorkt/","pron_pp":"/uorkt/"}'::jsonb,
        '{"v":"worry","p":"worried","pp":"worried","es":"preocuparse","ex":"Don''t worry--everything will be fine.","pron_v":"/uó-ri/","pron_p":"/uó-rid/","pron_pp":"/uó-rid/"}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- Prevenir duplicados en testing borrando si ya existía el paso 30 en decks
DELETE FROM deck WHERE step_order = 30 AND path_uuid = v_path_id;

-- 2. Insertar el Deck
INSERT INTO deck (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 30, 'en', 'vocabulary') 
RETURNING uuid INTO v_deck_id;

-- 3. Insertar Traducción y Metadata del Deck
INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (
    v_deck_id, 
    'es', 
    'Verbos regulares e irregulares', 
    ''
);

-- 4. Bucle para insertar los verbos y sus inflexiones
FOREACH v_item IN ARRAY v_verbs
LOOP
    -- ==================================================
    -- A) Insertar el verbo raíz (Infinitive)
    -- ==================================================
    INSERT INTO word (term, is_root, source_language, example) 
    VALUES (v_item->>'v', TRUE, 'en', v_item->>'ex') 
    RETURNING uuid INTO v_root_id;

    -- A.1) Traducción y pronunciación de la raíz
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_root_id, 'es', jsonb_build_object('translation', v_item->>'es'), v_item->>'pron_v');

    -- A.2) Vincular el verbo raíz al deck
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

    -- ==================================================
    -- B) Insertar la inflexión en Pasado Simple (Past)
    -- ==================================================
    INSERT INTO word (term, is_root, source_language, inflection_type, root_word) 
    VALUES (v_item->>'p', FALSE, 'en', 'past', v_root_id) 
    RETURNING uuid INTO v_past_id;

    -- B.1) Traducción y PRONUNCIACIÓN del Pasado Simple
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_past_id, 'es', jsonb_build_object('translation', v_item->>'es'), v_item->>'pron_p');

    -- B.2) Vincular Inflexión
    INSERT INTO word_inflection (word_uuid, inflection_uuid) 
    VALUES (v_root_id, v_past_id);

    -- ==================================================
    -- C) Insertar la inflexión en Participio Pasado (Past Participle)
    -- ==================================================
    INSERT INTO word (term, is_root, source_language, inflection_type, root_word) 
    VALUES (v_item->>'pp', FALSE, 'en', 'past_participle', v_root_id) 
    RETURNING uuid INTO v_pp_id;

    -- C.1) Traducción y PRONUNCIACIÓN del Participio Pasado
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_pp_id, 'es', jsonb_build_object('translation', v_item->>'es'), v_item->>'pron_pp');

    -- C.2) Vincular Inflexión
    INSERT INTO word_inflection (word_uuid, inflection_uuid) 
    VALUES (v_root_id, v_pp_id);

END LOOP;
END;
$seed$;