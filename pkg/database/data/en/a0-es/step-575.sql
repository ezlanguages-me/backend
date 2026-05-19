-- ============================================================
-- Seed: A0 English Path – STEP 575 – Deck – Sentimientos y Emociones
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        -- Emociones positivas
        '{"term":"happy","meaning":"feliz / contento","de":"glücklich","ex":"She felt happy when she heard the good news.","pron":"/há-pi/","pron_de":"/HÄ-pi/"}'::jsonb,
        '{"term":"excited","meaning":"emocionado / entusiasmado","de":"aufgeregt / begeistert","ex":"The children were excited about the trip.","pron":"/ik-sái-ted/","pron_de":"/auf-gö-REKT/"}'::jsonb,
        '{"term":"joyful","meaning":"alegre / lleno de alegría","de":"freudig","ex":"She had a joyful smile on her face.","pron":"/dyói-ful/","pron_de":"/FROJ-dij/"}'::jsonb,
        '{"term":"proud","meaning":"orgulloso","de":"stolz","ex":"His parents were proud of his achievements.","pron":"/práud/","pron_de":"/SCHTOÓLTS/"}'::jsonb,
        '{"term":"grateful","meaning":"agradecido","de":"dankbar","ex":"I am grateful for your help.","pron":"/gréit-ful/","pron_de":"/DANK-baa/"}'::jsonb,
        '{"term":"hopeful","meaning":"esperanzado","de":"hoffnungsvoll","ex":"She remained hopeful despite the difficulties.","pron":"/hóup-ful/","pron_de":"/HOF-nungs-fol/"}'::jsonb,
        '{"term":"confident","meaning":"seguro de sí mismo / confiado","de":"selbstsicher","ex":"He felt confident before the presentation.","pron":"/kón-fi-dent/","pron_de":"/SELBST-si-chö/"}'::jsonb,
        '{"term":"relaxed","meaning":"relajado","de":"entspannt","ex":"After the massage, she felt completely relaxed.","pron":"/ri-lákst/","pron_de":"/ent-SCHPANT/"}'::jsonb,
        '{"term":"calm","meaning":"tranquilo / en calma","de":"ruhig","ex":"Take a deep breath and stay calm.","pron":"/kam/","pron_de":"/RUU-ij/"}'::jsonb,
        '{"term":"amused","meaning":"divertido / entretenido","de":"amüsiert","ex":"She looked amused by the story.","pron":"/a-miúzd/","pron_de":"/ö-mjuu-SIERT/"}'::jsonb,

        -- Emociones negativas (tristeza/miedo)
        '{"term":"sad","meaning":"triste","de":"traurig","ex":"He felt sad when his friend moved away.","pron":"/sad/","pron_de":"/TRAU-rij/"}'::jsonb,
        '{"term":"angry","meaning":"enojado / furioso","de":"wütend / verärgert","ex":"She was angry because no one listened to her.","pron":"/án-gri/","pron_de":"/WÜU-tent/"}'::jsonb,
        '{"term":"scared","meaning":"asustado","de":"verängstigt / erschrocken","ex":"The child was scared of the dark.","pron":"/skérd/","pron_de":"/fö-ENGST-igt/"}'::jsonb,
        '{"term":"nervous","meaning":"nervioso","de":"nervös","ex":"She was nervous before the exam.","pron":"/nér-vos/","pron_de":"/nö-WÖÖS/"}'::jsonb,
        '{"term":"anxious","meaning":"ansioso / preocupado","de":"ängstlich / besorgt","ex":"He was anxious about the results.","pron":"/ánk-shos/","pron_de":"/ENGST-lich/"}'::jsonb,
        '{"term":"worried","meaning":"preocupado","de":"besorgt","ex":"She was worried about her son.","pron":"/uó-rid/","pron_de":"/bö-ZORGT/"}'::jsonb,
        '{"term":"frustrated","meaning":"frustrado","de":"frustriert","ex":"He felt frustrated after failing the test.","pron":"/frás-trei-ted/","pron_de":"/frus-TRIERT/"}'::jsonb,
        '{"term":"disappointed","meaning":"decepcionado","de":"enttäuscht","ex":"She was disappointed with the result.","pron":"/dis-a-póin-ted/","pron_de":"/ent-TOJSCHT/"}'::jsonb,
        '{"term":"jealous","meaning":"celoso / envidioso","de":"eifersüchtig","ex":"He was jealous of his brother's success.","pron":"/yé-los/","pron_de":"/AI-fö-züch-tig/"}'::jsonb,
        '{"term":"lonely","meaning":"solo / solitario","de":"einsam","ex":"She felt lonely in the new city.","pron":"/lóun-li/","pron_de":"/AIN-sam/"}'::jsonb,

        -- Emociones físico-mentales
        '{"term":"tired","meaning":"cansado","de":"müde","ex":"I am tired after working all day.","pron":"/táierd/","pron_de":"/MÜU-dö/"}'::jsonb,
        '{"term":"exhausted","meaning":"agotado","de":"erschöpft","ex":"After the marathon, he was completely exhausted.","pron":"/ig-zós-ted/","pron_de":"/ö-SCHÖPFT/"}'::jsonb,
        '{"term":"bored","meaning":"aburrido","de":"gelangweilt","ex":"The students looked bored during the long lecture.","pron":"/bord/","pron_de":"/gö-LANG-vailt/"}'::jsonb,
        '{"term":"confused","meaning":"confundido","de":"verwirrt","ex":"She was confused by the instructions.","pron":"/kon-fiúzd/","pron_de":"/fö-WIRT/"}'::jsonb,
        '{"term":"surprised","meaning":"sorprendido","de":"überrascht","ex":"He was surprised to see her there.","pron":"/sor-práizd/","pron_de":"/üü-bö-RASCHT/"}'::jsonb,
        '{"term":"shocked","meaning":"impactado / conmocionado","de":"schockiert","ex":"Everyone was shocked by the news.","pron":"/shokt/","pron_de":"/schok-KIERT/"}'::jsonb,
        '{"term":"embarrassed","meaning":"avergonzado","de":"verlegen","ex":"She felt embarrassed when she tripped in public.","pron":"/em-bá-rest/","pron_de":"/fö-LEJ-gen/"}'::jsonb,
        '{"term":"disgusted","meaning":"asqueado / con asco","de":"angewidert","ex":"He looked disgusted by the smell.","pron":"/dis-gás-ted/","pron_de":"/an-gö-WI-döt/"}'::jsonb,
        '{"term":"ashamed","meaning":"avergonzado (con culpa)","de":"beschämt","ex":"She felt ashamed of her behavior.","pron":"/a-shéimd/","pron_de":"/bö-SCHEJMT/"}'::jsonb,

        -- Expresiones comunes de estado
        '{"term":"feel like","meaning":"tener ganas de / sentirse como","de":"Lust haben auf / sich fühlen wie","ex":"I feel like going for a walk.","pron":"/fil láik/","pron_de":"/FÜÜL-len wie/"}'::jsonb,
        '{"term":"in a good mood","meaning":"de buen humor","de":"guter Laune sein","ex":"She is in a good mood today.","pron":"/in a gud mud/","pron_de":"/GUU-tö LAU-nö/"}'::jsonb,
        '{"term":"in a bad mood","meaning":"de mal humor","de":"schlechter Laune sein","ex":"Don't talk to him now, he is in a bad mood.","pron":"/in a bad mud/","pron_de":"/SCHLECH-tö LAU-nö/"}'::jsonb,
        '{"term":"stressed out","meaning":"muy estresado","de":"gestresst","ex":"She was stressed out before the deadline.","pron":"/strest áut/","pron_de":"/gö-SCHTREAST/"}'::jsonb,
        '{"term":"overwhelmed","meaning":"abrumado / desbordado","de":"überwältigt","ex":"He felt overwhelmed by all the tasks.","pron":"/ou-ver-uélmd/","pron_de":"/üü-bö-WEL-tigt/"}'::jsonb,
        '{"term":"homesick","meaning":"nostálgico / con morriña","de":"Heimweh haben","ex":"She felt homesick after a month abroad.","pron":"/hóum-sik/","pron_de":"/HAIM-wej/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 575 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 575, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'es', 'Sentimientos y Emociones', 'Vocabulario para expresar emociones y estados de ánimo en inglés.');

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES (v_deck_id, 'de', 'Gefühle und Emotionen', '');

    FOREACH card IN ARRAY v_cards
    LOOP
        INSERT INTO word (term, is_root, source_language, example)
        VALUES (card->>'term', TRUE, 'en', card->>'ex')
        RETURNING uuid INTO v_word_id;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron');

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');

        INSERT INTO deck_words (deck_uuid, word_uuid)
        VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;
