-- ============================================================
-- Seed: A0 English Path – STEP 55 – Deck – Expresiones Cotidianas y Fórmulas Sociales
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_root_id UUID;
    v_item JSONB;
    v_expressions JSONB[] := ARRAY[
        '{"v":"Hello","es":"Hola","de":"Hallo","ex":"Hello! How are you today?","pron":"/je-lóu/","pron_de":"/JÖ-lou/"}',
        '{"v":"Hi","es":"Hola (informal)","de":"Hi","ex":"Hi! Great to see you again!","pron":"/jái/","pron_de":"/JAI/"}',
        '{"v":"Hey","es":"Oye / Hola (coloquial)","de":"Hey","ex":"Hey! Wait for me!","pron":"/jéi/","pron_de":"/JEJ/"}',
        '{"v":"Good morning","es":"Buenos días","de":"Guten Morgen","ex":"Good morning! Did you sleep well?","pron":"/gud mór-ning/","pron_de":"/GUD MOR-ning/"}',
        '{"v":"Good afternoon","es":"Buenas tardes","de":"Guten Tag","ex":"Good afternoon, everyone. Let''s begin the meeting.","pron":"/gud áf-ter-nuun/","pron_de":"/GUD AAF-tö-nuun/"}',
        '{"v":"Good evening","es":"Buenas tardes / noches (saludo)","de":"Guten Abend","ex":"Good evening, ladies and gentlemen. Welcome to the show.","pron":"/gud ív-ning/","pron_de":"/GUD IEV-ning/"}',
        '{"v":"Good night","es":"Buenas noches (despedida)","de":"Gute Nacht","ex":"Good night! Sleep well.","pron":"/gud náit/","pron_de":"/GUD NAIT/"}',
        '{"v":"Goodbye","es":"Adiós","de":"Auf Wiedersehen","ex":"Goodbye! See you next week.","pron":"/gud-bái/","pron_de":"/auf WIE-dö-se:n/"}',
        '{"v":"Bye","es":"Adiós (informal)","de":"Tschüss","ex":"Bye! Have a good day!","pron":"/bái/","pron_de":"/TSCHÜS/"}',
        '{"v":"See you later","es":"Hasta luego","de":"Bis später","ex":"I have to go now. See you later!","pron":"/sí yu léi-ter/","pron_de":"/bis SCHPÄ-tö/"}',
        '{"v":"See you soon","es":"Hasta pronto","de":"Bis bald","ex":"It was great talking to you. See you soon!","pron":"/sí yu suún/","pron_de":"/bis BALT/"}',
        '{"v":"See you tomorrow","es":"Hasta mañana","de":"Bis morgen","ex":"Thanks for coming. See you tomorrow!","pron":"/sí yu tu-mó-rou/","pron_de":"/bis MOR-gön/"}',
        '{"v":"Take care","es":"Cuídate","de":"Pass auf dich auf","ex":"The roads are icy. Take care!","pron":"/téik ker/","pron_de":"/PAS auf dich AUF/"}',
        '{"v":"Please","es":"Por favor","de":"Bitte","ex":"Could you pass the salt, please?","pron":"/plíis/","pron_de":"/BI-tö/"}',
        '{"v":"Thank you","es":"Gracias","de":"Danke","ex":"Thank you very much for your help.","pron":"/zánk yu/","pron_de":"/DAN-kö/"}',
        '{"v":"Thanks","es":"Gracias (informal)","de":"Danke schön","ex":"Thanks! You''re a lifesaver.","pron":"/zánks/","pron_de":"/DAN-kö schön/"}',
        '{"v":"You''re welcome","es":"De nada","de":"Bitte sehr / Gern geschehen","ex":"Thank you so much! – You''re welcome, anytime.","pron":"/yur uél-kem/","pron_de":"/BI-tö ze:r/"}',
        '{"v":"Excuse me","es":"Disculpe / Perdona","de":"Entschuldigung","ex":"Excuse me, where is the nearest bank?","pron":"/eks-kiús mi/","pron_de":"/ent-SCHUL-di-gung/"}',
        '{"v":"Sorry","es":"Lo siento / Perdona","de":"Sorry / Tut mir leid","ex":"Sorry, I didn''t mean to bump into you.","pron":"/só-ri/","pron_de":"/SO-rie/"}',
        '{"v":"I''m sorry","es":"Lo siento mucho","de":"Es tut mir leid","ex":"I''m sorry for being late.","pron":"/áim só-ri/","pron_de":"/es TUUT mie LAIT/"}',
        '{"v":"Pardon?","es":"¿Cómo? / ¿Perdona?","de":"Wie bitte?","ex":"Pardon? Could you speak a little louder?","pron":"/pár-don/","pron_de":"/wie BI-tö/"}',
        '{"v":"No problem","es":"No hay problema","de":"Kein Problem","ex":"Can you help me? – Sure, no problem!","pron":"/nóu pró-blem/","pron_de":"/kain PRO-blem/"}',
        '{"v":"Of course","es":"Por supuesto / Claro","de":"Natürlich","ex":"Can I sit here? – Of course, go ahead.","pron":"/ov kórs/","pron_de":"/na-TÜR-lich/"}',
        '{"v":"Nice to meet you","es":"Encantado/a de conocerte","de":"Schön, Sie kennenzulernen","ex":"Hi, I''m Alex. – Nice to meet you, Alex. I''m Sam.","pron":"/náis tu mít yu/","pron_de":"/schön SIE KEN-ön-tsu-ler-nön/"}',
        '{"v":"Nice to meet you too","es":"Igualmente / El gusto es mío","de":"Freut mich auch","ex":"Nice to meet you! – Nice to meet you too.","pron":"/náis tu mít yu tuu/","pron_de":"/FROYT mich auch/"}',
        '{"v":"How are you?","es":"¿Cómo estás?","de":"Wie geht es Ihnen? / Wie geht es dir?","ex":"Hello! How are you? – I''m fine, thanks.","pron":"/jáu ar yu/","pron_de":"/wie GEJT es II-nön/"}',
        '{"v":"I''m fine, thank you","es":"Estoy bien, gracias","de":"Mir geht es gut, danke","ex":"How are you? – I''m fine, thank you. And you?","pron":"/áim fáin zánk yu/","pron_de":"/mie GEJT es GUT DAN-kö/"}',
        '{"v":"Not bad","es":"No está mal / Regular","de":"Nicht schlecht","ex":"How was your weekend? – Not bad, thanks.","pron":"/not bad/","pron_de":"/nicht SCHLECHT/"}',
        '{"v":"What''s your name?","es":"¿Cómo te llamas? / ¿Cuál es tu nombre?","de":"Wie heißen Sie? / Wie heißt du?","ex":"Hello! What''s your name? – My name is Carlos.","pron":"/juóts yur néim/","pron_de":"/wie HAIS-ön SIE/"}',
        '{"v":"My name is...","es":"Me llamo... / Mi nombre es...","de":"Ich heiße... / Mein Name ist...","ex":"My name is Emma. Nice to meet you.","pron":"/mái néim is/","pron_de":"/ich HAI-sö/"}',
        '{"v":"Can you repeat that, please?","es":"¿Puedes repetir eso, por favor?","de":"Können Sie das bitte wiederholen?","ex":"I''m sorry, can you repeat that, please? I didn''t hear you.","pron":"/kan yu ri-pít dat plíis/","pron_de":"/KÖ-nön SIE das BI-tö WIE-dö-ho-lön/"}',
        '{"v":"I don''t understand","es":"No entiendo","de":"Ich verstehe nicht","ex":"I''m sorry, I don''t understand. Can you explain?","pron":"/ái dont an-der-stánd/","pron_de":"/ich fer-SCHE-ö nicht/"}',
        '{"v":"Can you speak more slowly, please?","es":"¿Puedes hablar más despacio, por favor?","de":"Können Sie bitte langsamer sprechen?","ex":"Can you speak more slowly, please? My English is not very good yet.","pron":"/kan yu spíik mor slóu-li plíis/","pron_de":"/KÖ-nön SIE BI-tö LANG-sa-mö SCHPRE-chön/"}',
        '{"v":"How do you say ... in English?","es":"¿Cómo se dice ... en inglés?","de":"Wie sagt man ... auf Englisch?","ex":"How do you say ''lluvia'' in English? – The word is ''rain''.","pron":"/jáu du yu séi ... in íng-lish/","pron_de":"/wie SAKT man ... auf ENG-lisch/"}'
    ];
BEGIN

    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 55, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (
        v_deck_id,
        'es',
        'Expresiones Cotidianas',
        ''
    );

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'de', 'Alltagsausdrücke und Höflichkeitsformeln', '');

    FOREACH v_item IN ARRAY v_expressions
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
