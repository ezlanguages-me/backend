-- ============================================================
-- Seed: A0 English Path – STEP 40 – Grammar – CONECTORES Y CONJUNCIONES (Posición temprana: lista unificada para empezar a enlazar ideas)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_deck_id UUID; 
    v_root_id UUID; 
    v_item JSONB;
    v_connectors JSONB[] := ARRAY[
        '{"v":"and","es":"y","de":"und","ex":"She likes tea and coffee.","pron":"/and/","pron_de":"/AND/"}',
        '{"v":"in addition","es":"además","de":"außerdem / darüber hinaus","ex":"The hotel has a pool. In addition, there is a spa.","pron":"/in a-dí-shon/","pron_de":"/in ö-DI-schön/"}',
        '{"v":"moreover","es":"además","de":"überdies / darüber hinaus","ex":"The food was delicious. Moreover, the service was excellent.","pron":"/mor-óu-ver/","pron_de":"/moo-OU-wö/"}',
        '{"v":"furthermore","es":"además","de":"des Weiteren / außerdem","ex":"The plan is efficient. Furthermore, it is cost-effective.","pron":"/fér-der-mor/","pron_de":"/FÖÖ-dö-moo/"}',
        '{"v":"besides","es":"además","de":"außerdem / abgesehen davon","ex":"Besides being cheap, it is also very practical.","pron":"/bi-sáids/","pron_de":"/bi-SAIDZ/"}',
        '{"v":"too","es":"también","de":"auch / ebenfalls","ex":"I want to come too!","pron":"/tu/","pron_de":"/TUU/"}',
        '{"v":"as well as","es":"además de / así como / también","de":"sowie / als auch","ex":"She speaks French as well as Spanish.","pron":"/as uel as/","pron_de":"/äs WEL äs/"}',
        '{"v":"both...and","es":"tanto...como","de":"sowohl...als auch","ex":"Both cats and dogs make great pets.","pron":"/bóuz...and/","pron_de":"/BOUS änd/"}',
        '{"v":"not only... but also","es":"no solo... sino también","de":"nicht nur...sondern auch","ex":"He is not only smart but also very kind.","pron":"/not ón-li... bat ól-sou/","pron_de":"/NOT oun-lie bat OOL-sou/"}',
        '{"v":"similarly","es":"de manera similar","de":"ähnlich / gleichermaßen","ex":"Dogs need daily exercise. Similarly, cats need regular play.","pron":"/sí-mi-lar-li/","pron_de":"/SI-mi-lö-lie/"}',
        '{"v":"likewise","es":"igualmente / asimismo","de":"ebenso / gleichermaßen","ex":"She smiled and he likewise smiled back.","pron":"/láik-uáis/","pron_de":"/LAIK-wais/"}',
        '{"v":"what is more","es":"lo que es más / además","de":"überdies / noch dazu","ex":"The car is fast. What is more, it uses very little fuel.","pron":"/uát is mor/","pron_de":"/WAT is moo/"}',
        '{"v":"but","es":"pero","de":"aber","ex":"I wanted to go, but I was too tired.","pron":"/bat/","pron_de":"/BAT/"}',
        '{"v":"however","es":"sin embargo","de":"jedoch / allerdings","ex":"I studied hard. However, the exam was very difficult.","pron":"/hau-é-ver/","pron_de":"/hau-EW-wö/"}',
        '{"v":"yet","es":"aún / sin embargo","de":"dennoch / trotzdem","ex":"She is young, yet she is very wise.","pron":"/iet/","pron_de":"/JET/"}',
        '{"v":"although","es":"aunque","de":"obwohl / obgleich","ex":"Although it was raining, we went for a walk.","pron":"/ol-dóu/","pron_de":"/ool-DOU/"}',
        '{"v":"though","es":"aunque","de":"obwohl / wenn auch","ex":"I enjoyed the film, though the ending was a bit slow.","pron":"/dóu/","pron_de":"/DOU/"}',
        '{"v":"even though","es":"aunque","de":"auch wenn / obwohl","ex":"Even though she was tired, she finished the report.","pron":"/í-ven dóu/","pron_de":"/IE-wön DOU/"}',
        '{"v":"even if","es":"incluso si / aunque","de":"auch wenn / selbst wenn","ex":"I''ll help you even if it takes all day.","pron":"/í-ven if/","pron_de":"/IE-wön IF/"}',
        '{"v":"nevertheless","es":"sin embargo / no obstante","de":"trotzdem / dennoch","ex":"It was cold. Nevertheless, they decided to go outside.","pron":"/ne-ver-de-lés/","pron_de":"/ne-wö-dö-LES/"}',
        '{"v":"nonetheless","es":"sin embargo / no obstante","de":"trotzdem / nichtsdestotrotz","ex":"The task was difficult. Nonetheless, they completed it on time.","pron":"/nan-de-lés/","pron_de":"/nan-dö-LES/"}',
        '{"v":"whereas","es":"mientras que","de":"während / wohingegen","ex":"Tom loves spicy food, whereas his sister prefers mild dishes.","pron":"/uer-ás/","pron_de":"/wer-ÄS/"}',
        '{"v":"while","es":"mientras","de":"während / obwohl","ex":"While he cooked dinner, she set the table.","pron":"/uáil/","pron_de":"/WAIL/"}',
        '{"v":"despite","es":"a pesar de","de":"trotz","ex":"Despite the rain, the concert was a huge success.","pron":"/dis-páit/","pron_de":"/dis-PAIT/"}',
        '{"v":"in spite of","es":"a pesar de","de":"trotz","ex":"In spite of her illness, she came to work.","pron":"/in spáit of/","pron_de":"/in SPAIT ow/"}',
        '{"v":"despite this","es":"a pesar de esto","de":"trotz dessen","ex":"The results were poor. Despite this, the team kept going.","pron":"/dis-páit dis/","pron_de":"/dis-PAIT dis/"}',
        '{"v":"in spite of this","es":"a pesar de esto","de":"trotz dessen","ex":"Sales dropped. In spite of this, they launched the new product.","pron":"/in spáit of dis/","pron_de":"/in SPAIT ow dis/"}',
        '{"v":"on the other hand","es":"por otro lado","de":"andererseits","ex":"It''s expensive. On the other hand, it''s the most reliable.","pron":"/on di ó-der hand/","pron_de":"/on di OU-dö hend/"}',
        '{"v":"on the contrary","es":"por el contrario","de":"im Gegenteil","ex":"I didn''t dislike it. On the contrary, I loved it.","pron":"/on de kón-tra-ri/","pron_de":"/on dö KON-trö-ri/"}',
        '{"v":"alternatively","es":"como alternativa","de":"alternativ / oder aber","ex":"You can fly to Paris. Alternatively, you can take the train.","pron":"/ol-tér-na-tiv-li/","pron_de":"/ool-TÖ-nö-tiv-lie/"}',
        '{"v":"instead","es":"en lugar de eso / en cambio","de":"stattdessen","ex":"I didn''t watch TV. Instead, I read a book.","pron":"/in-stéd/","pron_de":"/in-STED/"}',
        '{"v":"even so","es":"aun así","de":"trotzdem / dennoch","ex":"The review was negative. Even so, the film was a big hit.","pron":"/í-ven sou/","pron_de":"/IE-wön SOU/"}',
        '{"v":"because","es":"porque","de":"weil / da","ex":"She stayed home because she felt sick.","pron":"/bi-kós/","pron_de":"/bi-KOS/"}',
        '{"v":"because of","es":"a causa de / debido a","de":"aufgrund von / wegen","ex":"The match was cancelled because of the heavy rain.","pron":"/bi-kós of/","pron_de":"/bi-KOS ow/"}',
        '{"v":"since","es":"ya que / desde","de":"da / seit","ex":"Since you''re here, let''s start the meeting.","pron":"/sins/","pron_de":"/SINS/"}',
        '{"v":"as","es":"como / ya que","de":"da / weil / als","ex":"As it was late, we decided to leave.","pron":"/as/","pron_de":"/ÄS/"}',
        '{"v":"due to","es":"debido a","de":"aufgrund von","ex":"The flight was delayed due to bad weather.","pron":"/du tu/","pron_de":"/DUU tö/"}',
        '{"v":"owing to","es":"debido a","de":"aufgrund von / wegen","ex":"Owing to his hard work, the project was a success.","pron":"/óu-in tu/","pron_de":"/OU-ing tö/"}',
        '{"v":"due to the fact that","es":"debido al hecho de que","de":"aufgrund der Tatsache, dass","ex":"The event was cancelled due to the fact that the venue was unavailable.","pron":"/du tu de fakt dat/","pron_de":"/DUU tö dö FÄKT dät/"}',
        '{"v":"given that","es":"dado que","de":"da / angesichts der Tatsache, dass","ex":"Given that it''s Monday, the roads will be busy.","pron":"/guí-ven dat/","pron_de":"/GI-wön dät/"}',
        '{"v":"owing to the fact that","es":"debido al hecho de que","de":"aufgrund der Tatsache, dass","ex":"Owing to the fact that prices rose, many customers switched brands.","pron":"/óu-in tu de fakt dat/","pron_de":"/OU-ing tö dö FÄKT dät/"}',
        '{"v":"so","es":"así que","de":"also / daher","ex":"It was raining, so we took a taxi.","pron":"/sou/","pron_de":"/SOU/"}',
        '{"v":"therefore","es":"por lo tanto","de":"daher / deshalb","ex":"She studied hard; therefore, she passed the exam.","pron":"/dér-for/","pron_de":"/DÄÖ-foo/"}',
        '{"v":"thus","es":"por lo tanto / así","de":"so / somit","ex":"He missed the bus; thus, he was late for work.","pron":"/das/","pron_de":"/DAS/"}',
        '{"v":"hence","es":"por lo tanto / de ahí","de":"daher / folglich","ex":"The report was incomplete; hence, the meeting was postponed.","pron":"/hens/","pron_de":"/HENS/"}',
        '{"v":"consequently","es":"en consecuencia","de":"folglich / infolgedessen","ex":"He didn''t train enough; consequently, he lost the race.","pron":"/kón-se-kuent-li/","pron_de":"/KON-si-kwönt-lie/"}',
        '{"v":"accordingly","es":"en consecuencia / por consiguiente","de":"dementsprechend / folglich","ex":"The rules changed; accordingly, we must update our procedures.","pron":"/a-kór-din-li/","pron_de":"/ö-KOO-ding-lie/"}',
        '{"v":"as a result","es":"como resultado","de":"infolgedessen / als Ergebnis","ex":"She practised every day. As a result, she became an excellent pianist.","pron":"/as a ri-sált/","pron_de":"/äs ö ri-SALT/"}',
        '{"v":"as a consequence","es":"como consecuencia","de":"als Konsequenz / infolgedessen","ex":"He ignored the warning. As a consequence, he lost his job.","pron":"/as a kón-se-kuens/","pron_de":"/äs ö KON-si-kwöns/"}',
        '{"v":"for this reason","es":"por esta razón","de":"aus diesem Grund","ex":"The data is unreliable. For this reason, we cannot draw conclusions.","pron":"/for dis rí-son/","pron_de":"/foo dis RIE-sön/"}',
        '{"v":"because of this","es":"por esto / a causa de esto","de":"deshalb / aus diesem Grund","ex":"The roads were icy. Because of this, many drivers had accidents.","pron":"/bi-kós of dis/","pron_de":"/bi-KOS ow dis/"}',
        '{"v":"if","es":"si","de":"wenn / falls","ex":"If you study hard, you will pass the test.","pron":"/if/","pron_de":"/IF/"}',
        '{"v":"unless","es":"a menos que","de":"es sei denn / außer wenn","ex":"I won''t go unless you come with me.","pron":"/an-lés/","pron_de":"/an-LES/"}',
        '{"v":"whether","es":"si (condicional)","de":"ob","ex":"I''m not sure whether she will come or not.","pron":"/ué-der/","pron_de":"/WE-dö/"}',
        '{"v":"whether...or","es":"si...o","de":"ob...oder","ex":"Whether you like it or not, rules must be followed.","pron":"/ué-der...or/","pron_de":"/WE-dö...oo/"}',
        '{"v":"whether or not","es":"pase lo que pase / sin importar si","de":"ob oder nicht","ex":"We''ll go whether or not it rains.","pron":"/ué-der or not/","pron_de":"/WE-dö oo NOT/"}',
        '{"v":"only if","es":"solo si","de":"nur wenn","ex":"I''ll agree only if you include everyone in the plan.","pron":"/ón-li if/","pron_de":"/OUN-lie IF/"}',
        '{"v":"as long as","es":"siempre que / con tal de que","de":"solange / sofern","ex":"You can stay as long as you help with the chores.","pron":"/as long as/","pron_de":"/äs LONG äs/"}',
        '{"v":"provided that","es":"siempre y cuando","de":"vorausgesetzt dass","ex":"You can borrow my car provided that you drive carefully.","pron":"/pro-vái-did dat/","pron_de":"/prö-VAI-did dät/"}',
        '{"v":"in case","es":"en caso de que / por si","de":"für den Fall dass / falls","ex":"Take an umbrella in case it rains later.","pron":"/in kéis/","pron_de":"/in KEIS/"}',
        '{"v":"otherwise","es":"de lo contrario / si no","de":"sonst / andernfalls","ex":"Study hard, otherwise you will fail the exam.","pron":"/ó-der-uáis/","pron_de":"/O-dö-wais/"}',
        '{"v":"as if","es":"como si","de":"als ob","ex":"He talked to me as if we had never met before.","pron":"/as if/","pron_de":"/äs IF/"}',
        '{"v":"so that","es":"para que","de":"damit / sodass","ex":"She spoke slowly so that everyone could understand.","pron":"/sou dat/","pron_de":"/SOU dät/"}',
        '{"v":"in order to","es":"para / con objeto de","de":"um...zu","ex":"He woke up early in order to catch the first train.","pron":"/in ór-der tu/","pron_de":"/in OO-dö tö/"}',
        '{"v":"so as to","es":"para / con el fin de","de":"um...zu / damit","ex":"They left quietly so as to not wake the baby.","pron":"/sou as tu/","pron_de":"/SOU äs tö/"}',
        '{"v":"when","es":"cuando","de":"wenn / als","ex":"Call me when you arrive at the station.","pron":"/uen/","pron_de":"/WEN/"}',
        '{"v":"before","es":"antes","de":"bevor / vor","ex":"Wash your hands before you eat.","pron":"/bi-fór/","pron_de":"/bi-FOO/"}',
        '{"v":"after","es":"después","de":"nachdem / nach","ex":"We went for a walk after dinner.","pron":"/áf-ter/","pron_de":"/ÄF-tö/"}',
        '{"v":"until","es":"hasta","de":"bis","ex":"She waited until he came home.","pron":"/an-tíl/","pron_de":"/an-TIL/"}',
        '{"v":"then","es":"entonces / luego","de":"dann / danach","ex":"First mix the flour and eggs, then add the milk.","pron":"/den/","pron_de":"/DEN/"}',
        '{"v":"once","es":"una vez que","de":"sobald / einmal","ex":"Once she finished her homework, she watched TV.","pron":"/uans/","pron_de":"/WANS/"}',
        '{"v":"as soon as","es":"en cuanto / tan pronto como","de":"sobald","ex":"As soon as I got home, I made a cup of tea.","pron":"/as sun as/","pron_de":"/äs SUUN äs/"}',
        '{"v":"now that","es":"ahora que","de":"jetzt wo / nun da","ex":"Now that you''re back, we can start the meeting.","pron":"/nau dat/","pron_de":"/NAU dät/"}',
        '{"v":"firstly","es":"en primer lugar","de":"erstens / zunächst","ex":"Firstly, I want to thank everyone for coming today.","pron":"/férst-li/","pron_de":"/FÖRST-lie/"}',
        '{"v":"the following","es":"el siguiente / los siguientes","de":"das Folgende / die Folgenden","ex":"Please read the following instructions carefully.","pron":"/de fó-lo-uin/","pron_de":"/dö FO-löu-ing/"}',
        '{"v":"meanwhile","es":"mientras tanto","de":"unterdessen / inzwischen","ex":"She cooked dinner. Meanwhile, he set the table.","pron":"/mín-uáil/","pron_de":"/MIEN-wail/"}',
        '{"v":"subsequently","es":"posteriormente","de":"anschließend / danach","ex":"He left the company. Subsequently, he started his own business.","pron":"/sáb-si-kuent-li/","pron_de":"/SAB-si-kwönt-lie/"}',
        '{"v":"eventually","es":"finalmente / a la larga","de":"schließlich / letztendlich","ex":"Eventually, she got the job she had always wanted.","pron":"/i-vén-chu-a-li/","pron_de":"/i-WEN-tschü-ö-lie/"}',
        '{"v":"for example","es":"por ejemplo","de":"zum Beispiel","ex":"Many animals hibernate in winter; for example, bears and hedgehogs.","pron":"/for ek-sám-pel/","pron_de":"/foo ig-SAM-pöl/"}',
        '{"v":"for instance","es":"por ejemplo","de":"zum Beispiel / beispielsweise","ex":"Some vegetables are root vegetables; for instance, carrots and parsnips.","pron":"/for ín-stans/","pron_de":"/foo IN-stöns/"}',
        '{"v":"such as","es":"tales como","de":"wie zum Beispiel / wie etwa","ex":"She loves outdoor activities such as hiking and cycling.","pron":"/sach as/","pron_de":"/SATSCH äs/"}',
        '{"v":"to illustrate","es":"para ilustrar","de":"um dies zu veranschaulichen","ex":"To illustrate, consider what happened during the last economic crisis.","pron":"/tu í-lus-treit/","pron_de":"/tö I-las-treit/"}',
        '{"v":"in other words","es":"en otras palabras","de":"mit anderen Worten","ex":"He was dismissed. In other words, he was fired.","pron":"/in ó-der uerds/","pron_de":"/in O-dö wödz/"}',
        '{"v":"that is to say","es":"es decir","de":"das heißt","ex":"The deadline is end of Q1, that is to say, the 31st of March.","pron":"/dat is tu séi/","pron_de":"/dät is tö SEI/"}',
        '{"v":"namely","es":"a saber / es decir","de":"nämlich","ex":"Two students passed with distinction, namely Ana and Carlos.","pron":"/néim-li/","pron_de":"/NEIM-lie/"}',
        '{"v":"in other terms","es":"en otros términos","de":"in anderen Worten","ex":"The process failed. In other terms, we need to start again.","pron":"/in ó-der terms/","pron_de":"/in O-dö töms/"}',
        '{"v":"actually","es":"en realidad / de hecho","de":"eigentlich / tatsächlich","ex":"I thought the film was boring. Actually, it got much better.","pron":"/ák-chu-a-li/","pron_de":"/ÄK-tschü-ö-lie/"}',
        '{"v":"in fact","es":"de hecho","de":"tatsächlich / in der Tat","ex":"The restaurant looks small. In fact, it has three floors.","pron":"/in fakt/","pron_de":"/in FÄKT/"}',
        '{"v":"indeed","es":"en efecto / de hecho","de":"tatsächlich / in der Tat","ex":"It is indeed a very complex problem.","pron":"/in-díd/","pron_de":"/in-DIED/"}',
        '{"v":"as it happens","es":"da la casualidad que","de":"wie es sich ergibt / zufälligerweise","ex":"As it happens, I know her sister quite well.","pron":"/as it há-pens/","pron_de":"/äs it HÄ-pöns/"}',
        '{"v":"of course","es":"por supuesto","de":"natürlich / selbstverständlich","ex":"Of course you can borrow my bike!","pron":"/of kors/","pron_de":"/ow KOOS/"}',
        '{"v":"clearly","es":"claramente","de":"offensichtlich / klar","ex":"Clearly, more time is needed to finish the project.","pron":"/klír-li/","pron_de":"/KLII-lie/"}',
        '{"v":"certainly","es":"ciertamente","de":"sicherlich / gewiss","ex":"It was certainly the best meal I''ve ever had.","pron":"/sér-ten-li/","pron_de":"/SÖ-tön-lie/"}',
        '{"v":"significantly","es":"significativamente","de":"bedeutend / erheblich","ex":"Profits have increased significantly this quarter.","pron":"/sig-ní-fi-kant-li/","pron_de":"/sig-NI-fi-könt-lie/"}',
        '{"v":"notably","es":"notablemente","de":"bemerkenswert / insbesondere","ex":"Several countries, notably France and Germany, opposed the plan.","pron":"/nóu-ta-bli/","pron_de":"/NOU-tö-blie/"}',
        '{"v":"evidently","es":"evidentemente","de":"offensichtlich / offenbar","ex":"Evidently, no one had read the instructions.","pron":"/é-vi-dent-li/","pron_de":"/E-wi-dönt-lie/"}',
        '{"v":"surely","es":"seguramente","de":"sicherlich / gewiss","ex":"Surely there must be a better solution than this.","pron":"/shúr-li/","pron_de":"/SCHUU-lie/"}',
        '{"v":"undoubtedly","es":"indudablemente","de":"zweifellos / unbestreitbar","ex":"She is undoubtedly the best candidate for the position.","pron":"/an-dáu-tid-li/","pron_de":"/an-DAU-tid-lie/"}',
        '{"v":"to be sure","es":"para estar seguro / sin duda","de":"gewiss / sicherlich","ex":"It is difficult, to be sure, but not impossible.","pron":"/tu bi shur/","pron_de":"/tö bi SCHUU/"}',
        '{"v":"above all","es":"sobre todo","de":"vor allem","ex":"Above all, remember to stay calm under pressure.","pron":"/a-bóv ol/","pron_de":"/ö-BAW OOL/"}',
        '{"v":"specifically","es":"específicamente","de":"insbesondere / speziell","ex":"Avoid certain foods, specifically sugar and salt.","pron":"/spe-sí-fi-ka-li/","pron_de":"/spö-SI-fi-kö-lie/"}',
        '{"v":"it seems likely","es":"parece probable","de":"es scheint wahrscheinlich","ex":"It seems likely that the project will be delayed.","pron":"/it sims láik-li/","pron_de":"/it siems LAIK-lie/"}',
        '{"v":"it seems to me","es":"me parece a mí","de":"es scheint mir","ex":"It seems to me that we need a completely different approach.","pron":"/it sims tu mi/","pron_de":"/it siems tö mii/"}',
        '{"v":"I would say that","es":"yo diría que","de":"ich würde sagen, dass","ex":"I would say that honesty is the most important value.","pron":"/ai uúd séi dat/","pron_de":"/ai wud SEI dät/"}',
        '{"v":"as far as I know","es":"por lo que sé","de":"soweit ich weiß","ex":"As far as I know, the meeting hasn''t been cancelled.","pron":"/as far as ai nóu/","pron_de":"/äs faa äs ai NOU/"}',
        '{"v":"in my opinion","es":"en mi opinión","de":"meiner Meinung nach","ex":"In my opinion, the new design is much better.","pron":"/in mai o-pí-nion/","pron_de":"/in mai ö-PI-niön/"}',
        '{"v":"in my view","es":"desde mi punto de vista","de":"aus meiner Sicht","ex":"In my view, we should invest more in education.","pron":"/in mai viú/","pron_de":"/in mai WJUU/"}',
        '{"v":"as far as I am concerned","es":"por lo que a mí respecta","de":"was mich betrifft","ex":"As far as I am concerned, the matter is closed.","pron":"/as far as ai am kon-sérnd/","pron_de":"/äs faa äs ai äm kön-SÖND/"}',
        '{"v":"from my point of view","es":"desde mi punto de vista","de":"von meinem Standpunkt aus","ex":"From my point of view, the risks outweigh the benefits.","pron":"/from mai póint of viú/","pron_de":"/from mai POINT ow wjuu/"}',
        '{"v":"may I suggest","es":"podría sugerir","de":"darf ich vorschlagen","ex":"May I suggest a short break before we continue?","pron":"/méi ai sa-yést/","pron_de":"/MEI ai sö-DSCHEST/"}',
        '{"v":"I would like to suggest","es":"me gustaría sugerir","de":"ich würde gerne vorschlagen","ex":"I would like to suggest a completely different approach.","pron":"/ai uúd láik tu sa-yést/","pron_de":"/ai wud LAIK tö sö-DSCHEST/"}',
        '{"v":"as a suggestion","es":"como sugerencia","de":"als Vorschlag","ex":"As a suggestion, why not ask the team for ideas first?","pron":"/as a sa-yés-chon/","pron_de":"/äs ö sö-DSCHEST-tschön/"}',
        '{"v":"having said that","es":"habiendo dicho eso","de":"trotz allem / das gesagt habend","ex":"It''s a tough challenge. Having said that, I think we can do it.","pron":"/há-vin sed dat/","pron_de":"/HÄ-wing sed dät/"}',
        '{"v":"in general","es":"en general","de":"im Allgemeinen","ex":"In general, people prefer sunny weather for outdoor events.","pron":"/in yé-ne-ral/","pron_de":"/in DSCHE-nö-röl/"}',
        '{"v":"on the whole","es":"en general","de":"im Großen und Ganzen","ex":"On the whole, the conference was a great success.","pron":"/on de hóul/","pron_de":"/on dö HOUL/"}',
        '{"v":"in conclusion","es":"en conclusión","de":"abschließend / zusammenfassend","ex":"In conclusion, the results clearly support our hypothesis.","pron":"/in kon-klú-shon/","pron_de":"/in kön-KLUU-schön/"}',
        '{"v":"to conclude","es":"para concluir","de":"abschließend","ex":"To conclude, I would like to thank all the speakers.","pron":"/tu kon-klúd/","pron_de":"/tö kön-KLUUD/"}',
        '{"v":"in summary","es":"en resumen","de":"zusammenfassend","ex":"In summary, the main findings are as follows.","pron":"/in sá-ma-ri/","pron_de":"/in SA-mö-ri/"}',
        '{"v":"to sum up","es":"para resumir","de":"zusammenfassend","ex":"To sum up, we need more time, more resources, and a clear plan.","pron":"/tu sam ap/","pron_de":"/tö SAM ap/"}',
        '{"v":"in short / brief","es":"en resumen","de":"kurz gesagt","ex":"In short, the answer is no.","pron":"/in short / brif/","pron_de":"/in SCHOOT / brief/"}',
        '{"v":"finally","es":"finalmente","de":"schließlich / endlich","ex":"Finally, don''t forget to save your work before closing.","pron":"/fái-na-li/","pron_de":"/FAI-nö-lie/"}',
        '{"v":"in closing","es":"para terminar","de":"abschließend","ex":"In closing, I want to express my gratitude to the entire team.","pron":"/in klóu-sin/","pron_de":"/in KLOU-sing/"}'
    ];

BEGIN

-- 1. Obtener el path del idioma [6, 7]
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Deck [8]
INSERT INTO deck (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 40, 'en', 'deck') 
RETURNING uuid INTO v_deck_id;

-- 3. Insertar Traducción y Metadata del Deck [8, 9]
INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (
    v_deck_id, 
    'es', 
    'Puentes de ideas', 
    ''
);

INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (v_deck_id, 'de', 'Verbindungswörter', '');

-- 4. Bucle para insertar los conectores [7, 9]
FOREACH v_item IN ARRAY v_connectors
LOOP
    -- Insertar el conector (siempre es raíz porque no se conjuga) [7]
    INSERT INTO word (term, is_root, source_language, example) 
    VALUES (v_item->>'v', TRUE, 'en', v_item->>'ex') 
    RETURNING uuid INTO v_root_id;

    -- Insertar la traducción y pronunciación [7]
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_root_id, 'es', jsonb_build_object('translation', v_item->>'es'), v_item->>'pron');

    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_root_id, 'de', jsonb_build_object('translation', v_item->>'de'), v_item->>'pron_de');

    -- Vincular la palabra al mazo [9]
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

END LOOP;

END;
$seed$;
