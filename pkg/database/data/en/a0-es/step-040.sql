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
        '{"v":"and","es":"y","ex":"She likes tea and coffee.","pron":"/and/"}',
        '{"v":"in addition","es":"además","ex":"The hotel has a pool. In addition, there is a spa.","pron":"/in a-dí-shon/"}',
        '{"v":"moreover","es":"además","ex":"The food was delicious. Moreover, the service was excellent.","pron":"/mor-óu-ver/"}',
        '{"v":"furthermore","es":"además","ex":"The plan is efficient. Furthermore, it is cost-effective.","pron":"/fér-der-mor/"}',
        '{"v":"besides","es":"además","ex":"Besides being cheap, it is also very practical.","pron":"/bi-sáids/"}',
        '{"v":"too","es":"también","ex":"I want to come too!","pron":"/tu/"}',
        '{"v":"as well as","es":"además de / así como / también","ex":"She speaks French as well as Spanish.","pron":"/as uel as/"}',
        '{"v":"both...and","es":"tanto...como","ex":"Both cats and dogs make great pets.","pron":"/bóuz...and/"}',
        '{"v":"not only... but also","es":"no solo... sino también","ex":"He is not only smart but also very kind.","pron":"/not ón-li... bat ól-sou/"}',
        '{"v":"similarly","es":"de manera similar","ex":"Dogs need daily exercise. Similarly, cats need regular play.","pron":"/sí-mi-lar-li/"}',
        '{"v":"likewise","es":"igualmente / asimismo","ex":"She smiled and he likewise smiled back.","pron":"/láik-uáis/"}',
        '{"v":"what is more","es":"lo que es más / además","ex":"The car is fast. What is more, it uses very little fuel.","pron":"/uát is mor/"}',
        '{"v":"but","es":"pero","ex":"I wanted to go, but I was too tired.","pron":"/bat/"}',
        '{"v":"however","es":"sin embargo","ex":"I studied hard. However, the exam was very difficult.","pron":"/hau-é-ver/"}',
        '{"v":"yet","es":"aún / sin embargo","ex":"She is young, yet she is very wise.","pron":"/iet/"}',
        '{"v":"although","es":"aunque","ex":"Although it was raining, we went for a walk.","pron":"/ol-dóu/"}',
        '{"v":"though","es":"aunque","ex":"I enjoyed the film, though the ending was a bit slow.","pron":"/dóu/"}',
        '{"v":"even though","es":"aunque","ex":"Even though she was tired, she finished the report.","pron":"/í-ven dóu/"}',
        '{"v":"even if","es":"incluso si / aunque","ex":"I''ll help you even if it takes all day.","pron":"/í-ven if/"}',
        '{"v":"nevertheless","es":"sin embargo / no obstante","ex":"It was cold. Nevertheless, they decided to go outside.","pron":"/ne-ver-de-lés/"}',
        '{"v":"nonetheless","es":"sin embargo / no obstante","ex":"The task was difficult. Nonetheless, they completed it on time.","pron":"/nan-de-lés/"}',
        '{"v":"whereas","es":"mientras que","ex":"Tom loves spicy food, whereas his sister prefers mild dishes.","pron":"/uer-ás/"}',
        '{"v":"while","es":"mientras","ex":"While he cooked dinner, she set the table.","pron":"/uáil/"}',
        '{"v":"despite","es":"a pesar de","ex":"Despite the rain, the concert was a huge success.","pron":"/dis-páit/"}',
        '{"v":"in spite of","es":"a pesar de","ex":"In spite of her illness, she came to work.","pron":"/in spáit of/"}',
        '{"v":"despite this","es":"a pesar de esto","ex":"The results were poor. Despite this, the team kept going.","pron":"/dis-páit dis/"}',
        '{"v":"in spite of this","es":"a pesar de esto","ex":"Sales dropped. In spite of this, they launched the new product.","pron":"/in spáit of dis/"}',
        '{"v":"on the other hand","es":"por otro lado","ex":"It''s expensive. On the other hand, it''s the most reliable.","pron":"/on di ó-der hand/"}',
        '{"v":"on the contrary","es":"por el contrario","ex":"I didn''t dislike it. On the contrary, I loved it.","pron":"/on de kón-tra-ri/"}',
        '{"v":"alternatively","es":"como alternativa","ex":"You can fly to Paris. Alternatively, you can take the train.","pron":"/ol-tér-na-tiv-li/"}',
        '{"v":"instead","es":"en lugar de eso / en cambio","ex":"I didn''t watch TV. Instead, I read a book.","pron":"/in-stéd/"}',
        '{"v":"even so","es":"aun así","ex":"The review was negative. Even so, the film was a big hit.","pron":"/í-ven sou/"}',
        '{"v":"because","es":"porque","ex":"She stayed home because she felt sick.","pron":"/bi-kós/"}',
        '{"v":"because of","es":"a causa de / debido a","ex":"The match was cancelled because of the heavy rain.","pron":"/bi-kós of/"}',
        '{"v":"since","es":"ya que / desde","ex":"Since you''re here, let''s start the meeting.","pron":"/sins/"}',
        '{"v":"as","es":"como / ya que","ex":"As it was late, we decided to leave.","pron":"/as/"}',
        '{"v":"due to","es":"debido a","ex":"The flight was delayed due to bad weather.","pron":"/du tu/"}',
        '{"v":"owing to","es":"debido a","ex":"Owing to his hard work, the project was a success.","pron":"/óu-in tu/"}',
        '{"v":"due to the fact that","es":"debido al hecho de que","ex":"The event was cancelled due to the fact that the venue was unavailable.","pron":"/du tu de fakt dat/"}',
        '{"v":"given that","es":"dado que","ex":"Given that it''s Monday, the roads will be busy.","pron":"/guí-ven dat/"}',
        '{"v":"owing to the fact that","es":"debido al hecho de que","ex":"Owing to the fact that prices rose, many customers switched brands.","pron":"/óu-in tu de fakt dat/"}',
        '{"v":"so","es":"así que","ex":"It was raining, so we took a taxi.","pron":"/sou/"}',
        '{"v":"therefore","es":"por lo tanto","ex":"She studied hard; therefore, she passed the exam.","pron":"/dér-for/"}',
        '{"v":"thus","es":"por lo tanto / así","ex":"He missed the bus; thus, he was late for work.","pron":"/das/"}',
        '{"v":"hence","es":"por lo tanto / de ahí","ex":"The report was incomplete; hence, the meeting was postponed.","pron":"/hens/"}',
        '{"v":"consequently","es":"en consecuencia","ex":"He didn''t train enough; consequently, he lost the race.","pron":"/kón-se-kuent-li/"}',
        '{"v":"accordingly","es":"en consecuencia / por consiguiente","ex":"The rules changed; accordingly, we must update our procedures.","pron":"/a-kór-din-li/"}',
        '{"v":"as a result","es":"como resultado","ex":"She practised every day. As a result, she became an excellent pianist.","pron":"/as a ri-sált/"}',
        '{"v":"as a consequence","es":"como consecuencia","ex":"He ignored the warning. As a consequence, he lost his job.","pron":"/as a kón-se-kuens/"}',
        '{"v":"for this reason","es":"por esta razón","ex":"The data is unreliable. For this reason, we cannot draw conclusions.","pron":"/for dis rí-son/"}',
        '{"v":"because of this","es":"por esto / a causa de esto","ex":"The roads were icy. Because of this, many drivers had accidents.","pron":"/bi-kós of dis/"}',
        '{"v":"if","es":"si","ex":"If you study hard, you will pass the test.","pron":"/if/"}',
        '{"v":"unless","es":"a menos que","ex":"I won''t go unless you come with me.","pron":"/an-lés/"}',
        '{"v":"whether","es":"si (condicional)","ex":"I''m not sure whether she will come or not.","pron":"/ué-der/"}',
        '{"v":"whether...or","es":"si...o","ex":"Whether you like it or not, rules must be followed.","pron":"/ué-der...or/"}',
        '{"v":"whether or not","es":"pase lo que pase / sin importar si","ex":"We''ll go whether or not it rains.","pron":"/ué-der or not/"}',
        '{"v":"only if","es":"solo si","ex":"I''ll agree only if you include everyone in the plan.","pron":"/ón-li if/"}',
        '{"v":"as long as","es":"siempre que / con tal de que","ex":"You can stay as long as you help with the chores.","pron":"/as long as/"}',
        '{"v":"provided that","es":"siempre y cuando","ex":"You can borrow my car provided that you drive carefully.","pron":"/pro-vái-did dat/"}',
        '{"v":"in case","es":"en caso de que / por si","ex":"Take an umbrella in case it rains later.","pron":"/in kéis/"}',
        '{"v":"otherwise","es":"de lo contrario / si no","ex":"Study hard, otherwise you will fail the exam.","pron":"/ó-der-uáis/"}',
        '{"v":"as if","es":"como si","ex":"He talked to me as if we had never met before.","pron":"/as if/"}',
        '{"v":"so that","es":"para que","ex":"She spoke slowly so that everyone could understand.","pron":"/sou dat/"}',
        '{"v":"in order to","es":"para / con objeto de","ex":"He woke up early in order to catch the first train.","pron":"/in ór-der tu/"}',
        '{"v":"so as to","es":"para / con el fin de","ex":"They left quietly so as to not wake the baby.","pron":"/sou as tu/"}',
        '{"v":"when","es":"cuando","ex":"Call me when you arrive at the station.","pron":"/uen/"}',
        '{"v":"before","es":"antes","ex":"Wash your hands before you eat.","pron":"/bi-fór/"}',
        '{"v":"after","es":"después","ex":"We went for a walk after dinner.","pron":"/áf-ter/"}',
        '{"v":"until","es":"hasta","ex":"She waited until he came home.","pron":"/an-tíl/"}',
        '{"v":"then","es":"entonces / luego","ex":"First mix the flour and eggs, then add the milk.","pron":"/den/"}',
        '{"v":"once","es":"una vez que","ex":"Once she finished her homework, she watched TV.","pron":"/uans/"}',
        '{"v":"as soon as","es":"en cuanto / tan pronto como","ex":"As soon as I got home, I made a cup of tea.","pron":"/as sun as/"}',
        '{"v":"now that","es":"ahora que","ex":"Now that you''re back, we can start the meeting.","pron":"/nau dat/"}',
        '{"v":"firstly","es":"en primer lugar","ex":"Firstly, I want to thank everyone for coming today.","pron":"/férst-li/"}',
        '{"v":"the following","es":"el siguiente / los siguientes","ex":"Please read the following instructions carefully.","pron":"/de fó-lo-uin/"}',
        '{"v":"meanwhile","es":"mientras tanto","ex":"She cooked dinner. Meanwhile, he set the table.","pron":"/mín-uáil/"}',
        '{"v":"subsequently","es":"posteriormente","ex":"He left the company. Subsequently, he started his own business.","pron":"/sáb-si-kuent-li/"}',
        '{"v":"eventually","es":"finalmente / a la larga","ex":"Eventually, she got the job she had always wanted.","pron":"/i-vén-chu-a-li/"}',
        '{"v":"for example","es":"por ejemplo","ex":"Many animals hibernate in winter; for example, bears and hedgehogs.","pron":"/for ek-sám-pel/"}',
        '{"v":"for instance","es":"por ejemplo","ex":"Some vegetables are root vegetables; for instance, carrots and parsnips.","pron":"/for ín-stans/"}',
        '{"v":"such as","es":"tales como","ex":"She loves outdoor activities such as hiking and cycling.","pron":"/sach as/"}',
        '{"v":"to illustrate","es":"para ilustrar","ex":"To illustrate, consider what happened during the last economic crisis.","pron":"/tu í-lus-treit/"}',
        '{"v":"in other words","es":"en otras palabras","ex":"He was dismissed. In other words, he was fired.","pron":"/in ó-der uerds/"}',
        '{"v":"that is to say","es":"es decir","ex":"The deadline is end of Q1, that is to say, the 31st of March.","pron":"/dat is tu séi/"}',
        '{"v":"namely","es":"a saber / es decir","ex":"Two students passed with distinction, namely Ana and Carlos.","pron":"/néim-li/"}',
        '{"v":"in other terms","es":"en otros términos","ex":"The process failed. In other terms, we need to start again.","pron":"/in ó-der terms/"}',
        '{"v":"actually","es":"en realidad / de hecho","ex":"I thought the film was boring. Actually, it got much better.","pron":"/ák-chu-a-li/"}',
        '{"v":"in fact","es":"de hecho","ex":"The restaurant looks small. In fact, it has three floors.","pron":"/in fakt/"}',
        '{"v":"indeed","es":"en efecto / de hecho","ex":"It is indeed a very complex problem.","pron":"/in-díd/"}',
        '{"v":"as it happens","es":"da la casualidad que","ex":"As it happens, I know her sister quite well.","pron":"/as it há-pens/"}',
        '{"v":"of course","es":"por supuesto","ex":"Of course you can borrow my bike!","pron":"/of kors/"}',
        '{"v":"clearly","es":"claramente","ex":"Clearly, more time is needed to finish the project.","pron":"/klír-li/"}',
        '{"v":"certainly","es":"ciertamente","ex":"It was certainly the best meal I''ve ever had.","pron":"/sér-ten-li/"}',
        '{"v":"significantly","es":"significativamente","ex":"Profits have increased significantly this quarter.","pron":"/sig-ní-fi-kant-li/"}',
        '{"v":"notably","es":"notablemente","ex":"Several countries, notably France and Germany, opposed the plan.","pron":"/nóu-ta-bli/"}',
        '{"v":"evidently","es":"evidentemente","ex":"Evidently, no one had read the instructions.","pron":"/é-vi-dent-li/"}',
        '{"v":"surely","es":"seguramente","ex":"Surely there must be a better solution than this.","pron":"/shúr-li/"}',
        '{"v":"undoubtedly","es":"indudablemente","ex":"She is undoubtedly the best candidate for the position.","pron":"/an-dáu-tid-li/"}',
        '{"v":"to be sure","es":"para estar seguro / sin duda","ex":"It is difficult, to be sure, but not impossible.","pron":"/tu bi shur/"}',
        '{"v":"above all","es":"sobre todo","ex":"Above all, remember to stay calm under pressure.","pron":"/a-bóv ol/"}',
        '{"v":"specifically","es":"específicamente","ex":"Avoid certain foods, specifically sugar and salt.","pron":"/spe-sí-fi-ka-li/"}',
        '{"v":"it seems likely","es":"parece probable","ex":"It seems likely that the project will be delayed.","pron":"/it sims láik-li/"}',
        '{"v":"it seems to me","es":"me parece a mí","ex":"It seems to me that we need a completely different approach.","pron":"/it sims tu mi/"}',
        '{"v":"I would say that","es":"yo diría que","ex":"I would say that honesty is the most important value.","pron":"/ai uúd séi dat/"}',
        '{"v":"as far as I know","es":"por lo que sé","ex":"As far as I know, the meeting hasn''t been cancelled.","pron":"/as far as ai nóu/"}',
        '{"v":"in my opinion","es":"en mi opinión","ex":"In my opinion, the new design is much better.","pron":"/in mai o-pí-nion/"}',
        '{"v":"in my view","es":"desde mi punto de vista","ex":"In my view, we should invest more in education.","pron":"/in mai viú/"}',
        '{"v":"as far as I am concerned","es":"por lo que a mí respecta","ex":"As far as I am concerned, the matter is closed.","pron":"/as far as ai am kon-sérnd/"}',
        '{"v":"from my point of view","es":"desde mi punto de vista","ex":"From my point of view, the risks outweigh the benefits.","pron":"/from mai póint of viú/"}',
        '{"v":"may I suggest","es":"podría sugerir","ex":"May I suggest a short break before we continue?","pron":"/méi ai sa-yést/"}',
        '{"v":"I would like to suggest","es":"me gustaría sugerir","ex":"I would like to suggest a completely different approach.","pron":"/ai uúd láik tu sa-yést/"}',
        '{"v":"as a suggestion","es":"como sugerencia","ex":"As a suggestion, why not ask the team for ideas first?","pron":"/as a sa-yés-chon/"}',
        '{"v":"having said that","es":"habiendo dicho eso","ex":"It''s a tough challenge. Having said that, I think we can do it.","pron":"/há-vin sed dat/"}',
        '{"v":"in general","es":"en general","ex":"In general, people prefer sunny weather for outdoor events.","pron":"/in yé-ne-ral/"}',
        '{"v":"on the whole","es":"en general","ex":"On the whole, the conference was a great success.","pron":"/on de hóul/"}',
        '{"v":"in conclusion","es":"en conclusión","ex":"In conclusion, the results clearly support our hypothesis.","pron":"/in kon-klú-shon/"}',
        '{"v":"to conclude","es":"para concluir","ex":"To conclude, I would like to thank all the speakers.","pron":"/tu kon-klúd/"}',
        '{"v":"in summary","es":"en resumen","ex":"In summary, the main findings are as follows.","pron":"/in sá-ma-ri/"}',
        '{"v":"to sum up","es":"para resumir","ex":"To sum up, we need more time, more resources, and a clear plan.","pron":"/tu sam ap/"}',
        '{"v":"in short / brief","es":"en resumen","ex":"In short, the answer is no.","pron":"/in short / brif/"}',
        '{"v":"finally","es":"finalmente","ex":"Finally, don''t forget to save your work before closing.","pron":"/fái-na-li/"}',
        '{"v":"in closing","es":"para terminar","ex":"In closing, I want to express my gratitude to the entire team.","pron":"/in klóu-sin/"}'
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
    'Conectores y Marcadores del Discurso', 
    ''
);

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

    -- Vincular la palabra al mazo [9]
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

END LOOP;

END;
$seed$;
