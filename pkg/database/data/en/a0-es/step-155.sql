-- ============================================================
-- Seed: A0 English Path – STEP 155 – Deck – Los Fundamentos (El Tiempo, fechas, horas y frecuencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_root_id UUID;
    v_item JSONB;
    v_time_vocab JSONB[] := ARRAY[
        -- Days of the week
        '{"v":"Monday","es":"lunes","de":"Montag","ex":"I have a team meeting on Monday morning.","pron":"/mán-dei/","pron_de":"/MAN-taak/"}',
        '{"v":"Tuesday","es":"martes","de":"Dienstag","ex":"The report is due on Tuesday.","pron":"/tiúus-dei/","pron_de":"/DIINS-taak/"}',
        '{"v":"Wednesday","es":"miércoles","de":"Mittwoch","ex":"We have a team lunch every Wednesday.","pron":"/uéns-dei/","pron_de":"/MIT-woch/"}',
        '{"v":"Thursday","es":"jueves","de":"Donnerstag","ex":"The package will arrive on Thursday.","pron":"/zárs-dei/","pron_de":"/DON-örs-taak/"}',
        '{"v":"Friday","es":"viernes","de":"Freitag","ex":"We finish work early on Friday.","pron":"/frái-dei/","pron_de":"/FRAI-taak/"}',
        '{"v":"Saturday","es":"sábado","de":"Samstag","ex":"I go to the farmers'' market on Saturday.","pron":"/sá-ter-dei/","pron_de":"/SAM-staak/"}',
        '{"v":"Sunday","es":"domingo","de":"Sonntag","ex":"The museum is closed on Sunday.","pron":"/sán-dei/","pron_de":"/ZON-taak/"}',
        -- Months
        '{"v":"January","es":"enero","de":"Januar","ex":"My birthday is in January.","pron":"/yá-niu-e-ri/","pron_de":"/YA-nu-ar/"}',
        '{"v":"February","es":"febrero","de":"Februar","ex":"Valentine''s Day is on February 14th.","pron":"/fé-bru-e-ri/","pron_de":"/FEB-ru-ar/"}',
        '{"v":"March","es":"marzo","de":"März","ex":"Spring begins in March.","pron":"/march/","pron_de":"/MERSS/"}',
        '{"v":"April","es":"abril","de":"April","ex":"Easter often falls in April.","pron":"/éi-pril/","pron_de":"/A-pril/"}',
        '{"v":"May","es":"mayo","de":"Mai","ex":"We planted the garden in May.","pron":"/méi/","pron_de":"/MAI/"}',
        '{"v":"June","es":"junio","de":"Juni","ex":"School finishes in June.","pron":"/yuún/","pron_de":"/YUU-ni/"}',
        '{"v":"July","es":"julio","de":"Juli","ex":"Independence Day is on July 4th.","pron":"/yu-lái/","pron_de":"/YUU-li/"}',
        '{"v":"August","es":"agosto","de":"August","ex":"We go on holiday in August.","pron":"/ó-gust/","pron_de":"/AU-gust/"}',
        '{"v":"September","es":"septiembre","de":"September","ex":"School starts again in September.","pron":"/sep-tém-ber/","pron_de":"/sep-TEM-bö/"}',
        '{"v":"October","es":"octubre","de":"Oktober","ex":"Halloween is on October 31st.","pron":"/ok-tóu-ber/","pron_de":"/ok-TOH-bö/"}',
        '{"v":"November","es":"noviembre","de":"November","ex":"Bonfire Night is in November in the UK.","pron":"/no-vém-ber/","pron_de":"/no-WEM-bö/"}',
        '{"v":"December","es":"diciembre","de":"Dezember","ex":"Christmas is on December 25th.","pron":"/di-sém-ber/","pron_de":"/de-SSEM-bö/"}',
        -- Seasons
        '{"v":"spring","es":"primavera","de":"Frühling","ex":"Flowers bloom in spring.","pron":"/spring/","pron_de":"/FRÜÜ-ling/"}',
        '{"v":"summer","es":"verano","de":"Sommer","ex":"We go swimming in summer.","pron":"/sá-mer/","pron_de":"/SO-mö/"}',
        '{"v":"autumn / fall","es":"otoño","de":"Herbst","ex":"The leaves change colour in autumn.","pron":"/ó-tem / fol/","pron_de":"/HERBST/"}',
        '{"v":"winter","es":"invierno","de":"Winter","ex":"It snows a lot in winter here.","pron":"/uín-ter/","pron_de":"/WIN-tö/"}',
        -- Times of day
        '{"v":"morning","es":"mañana (período del día)","de":"Morgen / Vormittag","ex":"I exercise every morning before work.","pron":"/mór-ning/","pron_de":"/MOR-gön/"}',
        '{"v":"afternoon","es":"tarde","de":"Nachmittag","ex":"She takes a nap in the afternoon.","pron":"/áf-ter-nuun/","pron_de":"/NACH-mi-taak/"}',
        '{"v":"evening","es":"tarde-noche (entre las 18:00 y 22:00)","de":"Abend","ex":"We usually have dinner in the evening.","pron":"/ív-ning/","pron_de":"/AH-bönt/"}',
        '{"v":"night","es":"noche","de":"Nacht","ex":"I can''t sleep at night when it''s noisy.","pron":"/náit/","pron_de":"/NACHT/"}',
        '{"v":"midnight","es":"medianoche","de":"Mitternacht","ex":"Cinderella had to leave by midnight.","pron":"/míd-nait/","pron_de":"/MI-tö-nacht/"}',
        '{"v":"noon / midday","es":"mediodía","de":"Mittag","ex":"We meet for lunch at noon.","pron":"/nuun / míd-dei/","pron_de":"/MI-taak/"}',
        -- Time units
        '{"v":"minute","es":"minuto","de":"Minute","ex":"The meeting starts in five minutes.","pron":"/mí-net/","pron_de":"/mi-NU-te/"}',
        '{"v":"hour","es":"hora","de":"Stunde","ex":"The flight is three hours long.","pron":"/áuer/","pron_de":"/SHTUN-de/"}',
        '{"v":"day","es":"día","de":"Tag","ex":"I work eight hours a day.","pron":"/déi/","pron_de":"/TAAK/"}',
        '{"v":"week","es":"semana","de":"Woche","ex":"There are seven days in a week.","pron":"/uíik/","pron_de":"/WO-che/"}',
        '{"v":"month","es":"mes","de":"Monat","ex":"She visits her parents once a month.","pron":"/manz/","pron_de":"/MO-nat/"}',
        '{"v":"year","es":"año","de":"Jahr","ex":"There are twelve months in a year.","pron":"/yier/","pron_de":"/YAAR/"}',
        -- Relative time
        '{"v":"today","es":"hoy","de":"heute","ex":"Today is Monday, so the report is due tomorrow.","pron":"/tu-déi/","pron_de":"/HOY-te/"}',
        '{"v":"tomorrow","es":"mañana (el día siguiente)","de":"morgen","ex":"I have a dentist appointment tomorrow.","pron":"/tu-mó-rou/","pron_de":"/MOR-gön/"}',
        '{"v":"yesterday","es":"ayer","de":"gestern","ex":"I saw that film yesterday.","pron":"/yés-ter-dei/","pron_de":"/GES-tern/"}',
        '{"v":"now","es":"ahora","de":"jetzt","ex":"I can''t talk right now. I''m in a meeting.","pron":"/náu/","pron_de":"/YETZT/"}',
        '{"v":"soon","es":"pronto","de":"bald","ex":"Don''t worry, the bus will arrive soon.","pron":"/suun/","pron_de":"/BALT/"}',
        '{"v":"later","es":"más tarde / luego","de":"später","ex":"I''ll call you later, okay?","pron":"/léi-ter/","pron_de":"/SCHPÄ-tö/"}',
        -- Frequency adverbs
        '{"v":"always","es":"siempre","de":"immer","ex":"She always arrives on time.","pron":"/ól-ueis/","pron_de":"/I-mö/"}',
        '{"v":"usually","es":"normalmente / usualmente","de":"gewöhnlich / meistens","ex":"I usually have coffee for breakfast.","pron":"/yúu-zhual-i/","pron_de":"/ge-WÖN-lich/"}',
        '{"v":"often","es":"a menudo / frecuentemente","de":"oft","ex":"We often go to the cinema on Saturdays.","pron":"/ó-fen/","pron_de":"/OFT/"}',
        '{"v":"sometimes","es":"a veces","de":"manchmal","ex":"I sometimes work from home.","pron":"/sám-taimz/","pron_de":"/MANCH-mal/"}',
        '{"v":"rarely","es":"raramente / pocas veces","de":"selten","ex":"She rarely eats fast food.","pron":"/rér-li/","pron_de":"/SEL-tön/"}',
        '{"v":"never","es":"nunca / jamás","de":"nie","ex":"I never drink alcohol.","pron":"/né-ver/","pron_de":"/NIE/"}',
        -- Clock & calendar expressions
        '{"v":"o''clock","es":"en punto (hora exacta)","de":"Uhr (genau)","ex":"The meeting is at three o''clock.","pron":"/o-klók/","pron_de":"/UUR/"}',
        '{"v":"half past","es":"y media","de":"halb (+ hora siguiente)","ex":"We leave at half past eight – that''s 8:30.","pron":"/jaf past/","pron_de":"/HALB/"}',
        '{"v":"weekend","es":"fin de semana","de":"Wochenende","ex":"What are you doing this weekend?","pron":"/uíik-end/","pron_de":"/WO-chön-en-de/"}',
        '{"v":"weekday","es":"día de la semana (laboral)","de":"Werktag","ex":"The bank is only open on weekdays.","pron":"/uíik-dei/","pron_de":"/WERK-taak/"}',
        '{"v":"on time","es":"a tiempo / puntual","de":"pünktlich","ex":"Please be on time for the meeting.","pron":"/on táim/","pron_de":"/PÜNKT-lich/"}',
        '{"v":"early","es":"temprano / pronto","de":"früh","ex":"I try to arrive early to avoid the traffic.","pron":"/ér-li/","pron_de":"/FRÜÜ/"}',
        '{"v":"late","es":"tarde / con retraso","de":"spät / zu spät","ex":"Sorry, the train was late.","pron":"/léit/","pron_de":"/SCHPÄT/"}'
    ];
BEGIN

    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 155, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (
        v_deck_id,
        'es',
        'El Tiempo, Fechas, Horas y Frecuencia',
        ''
    );

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'de', 'Zeit, Daten, Uhrzeiten und Häufigkeit', '');
    FOREACH v_item IN ARRAY v_time_vocab
    LOOP
        INSERT INTO word (term, is_root, source_language, example)
        VALUES (v_item->>'v', TRUE, 'en', v_item->>'ex')
        RETURNING uuid INTO v_root_id;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (
            v_root_id,
            'es',
            jsonb_build_object('translation', v_item->>'es'),
            v_item->>'pron'
        );

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_root_id, 'de', jsonb_build_object('translation', v_item->>'de'), v_item->>'pron_de');

        INSERT INTO deck_words (deck_uuid, word_uuid)
        VALUES (v_deck_id, v_root_id);
    END LOOP;

END;
$seed$;
