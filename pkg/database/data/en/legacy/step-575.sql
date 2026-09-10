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
        -- Estado de ánimo básico
        '{"term":"happy",        "meaning":"feliz / contento",           "de":"glücklich",             "ex":"I feel happy when I see my friends.",             "pron":"/há-pi/",          "pron_de":"/GLÜ-klij/"}'::jsonb,
        '{"term":"sad",          "meaning":"triste",                     "de":"traurig",              "ex":"She feels sad on rainy days.",                    "pron":"/sad/",           "pron_de":"/TRAU-rig/"}'::jsonb,
        '{"term":"fine",         "meaning":"bien / bien de ánimo",       "de":"gut / in Ordnung",     "ex":"I feel fine today, thank you.",                   "pron":"/fain/",          "pron_de":"/gut/"}'::jsonb,
        '{"term":"okay",         "meaning":"bien / sin novedades",       "de":"okay / in Ordnung",    "ex":"Are you okay? Yes, I am okay.",                   "pron":"/ou-kéi/",        "pron_de":"/o-KÉI/"}'::jsonb,
        '{"term":"better",       "meaning":"mejor / más animado",       "de":"besser",               "ex":"I feel better after some rest.",                  "pron":"/bé-ter/",        "pron_de":"/BÉ-ser/"}'::jsonb,
        '{"term":"awful",        "meaning":"horrible / muy mal",         "de":"schrecklich / furchtbar","ex":"I feel awful today. I have a headache.",          "pron":"/ó-fel/",          "pron_de":"/SHREK-lij/"}'::jsonb,
        '{"term":"sick",         "meaning":"enfermo / mal",              "de":"krank / unwohl",       "ex":"I feel sick. I need to rest today.",              "pron":"/sik/",           "pron_de":"/krank/"}'::jsonb,

        -- Emociones positivas
        '{"term":"excited",      "meaning":"emocionado / entusiasmado",  "de":"aufgeregt",            "ex":"We are excited about the trip.",                  "pron":"/ik-sái-tid/",    "pron_de":"/AUF-ge-regt/"}'::jsonb,
        '{"term":"proud",        "meaning":"orgulloso",                  "de":"stolz",                "ex":"Her parents are proud of her work.",              "pron":"/práud/",          "pron_de":"/SHTOLTS/"}'::jsonb,
        '{"term":"grateful",     "meaning":"agradecido",                 "de":"dankbar",              "ex":"I am grateful for your help.",                    "pron":"/gréit-fel/",     "pron_de":"/DANK-bar/"}'::jsonb,
        '{"term":"cheerful",     "meaning":"alegre / animado",           "de":"fröhlich",            "ex":"Our teacher is cheerful in the morning.",         "pron":"/chír-fel/",      "pron_de":"/FRÖ-lij/"}'::jsonb,
        '{"term":"hopeful",      "meaning":"esperanzado / con esperanza","de":"hoffnungsvoll",        "ex":"She is hopeful about the interview result.",      "pron":"/hóup-fel/",      "pron_de":"/HÓF-nungs-fol/"}'::jsonb,
        '{"term":"confident",    "meaning":"seguro de sí mismo",        "de":"selbstsicher",         "ex":"She feels confident in class today.",             "pron":"/kón-fi-dent/",  "pron_de":"/ZELBST-zi-jer/"}'::jsonb,
        '{"term":"curious",      "meaning":"curioso",                    "de":"neugierig",            "ex":"Children are curious about everything.",          "pron":"/kiú-rios/",       "pron_de":"/NOI-gui-rig/"}'::jsonb,
        '{"term":"brave",        "meaning":"valiente",                   "de":"mutig",                "ex":"You were very brave at the doctor.",              "pron":"/bréiv/",          "pron_de":"/MU-tig/"}'::jsonb,
        '{"term":"relaxed",      "meaning":"relajado",                   "de":"entspannt",            "ex":"He feels relaxed at home.",                       "pron":"/ri-lákst/",      "pron_de":"/ent-SHPANT/"}'::jsonb,
        '{"term":"calm",         "meaning":"tranquilo / calmado",        "de":"ruhig",                "ex":"Take a deep breath and stay calm.",               "pron":"/kam/",           "pron_de":"/RU-ij/"}'::jsonb,

        -- Emociones negativas
        '{"term":"angry",        "meaning":"enfadado / enojado",         "de":"wütend",              "ex":"He is angry because the bus is late.",            "pron":"/án-gri/",        "pron_de":"/VÜ-tent/"}'::jsonb,
        '{"term":"upset",        "meaning":"alterado / disgustado",      "de":"aufgebracht",          "ex":"He is upset because the plan changed.",           "pron":"/ap-sét/",        "pron_de":"/AUF-ge-braxt/"}'::jsonb,
        '{"term":"worried",      "meaning":"preocupado",                 "de":"besorgt",              "ex":"My mother is worried about the weather.",         "pron":"/uó-rid/",         "pron_de":"/be-ZORGT/"}'::jsonb,
        '{"term":"nervous",      "meaning":"nervioso",                   "de":"nervös",              "ex":"She is nervous before the test.",                 "pron":"/nér-vos/",       "pron_de":"/ner-VÖS/"}'::jsonb,
        '{"term":"scared",       "meaning":"asustado",                   "de":"ängstlich",           "ex":"The child feels scared in the dark.",             "pron":"/skérd/",         "pron_de":"/ÄNGS-tlix/"}'::jsonb,
        '{"term":"afraid",       "meaning":"con miedo / asustado",       "de":"verhängst / Angst haben","ex":"I am afraid of big dogs.",                 "pron":"/a-fréid/",       "pron_de":"/ÄNGST HA-ben/"}'::jsonb,
        '{"term":"stressed",     "meaning":"estresado",                  "de":"gestresst",            "ex":"She is stressed because of the exam tomorrow.",   "pron":"/strést/",         "pron_de":"/ge-SHTRÉST/"}'::jsonb,
        '{"term":"frustrated",   "meaning":"frustrado",                  "de":"frustriert",           "ex":"I feel frustrated when the app does not work.",   "pron":"/frás-trei-tid/", "pron_de":"/frus-TRIIRT/"}'::jsonb,
        '{"term":"disappointed", "meaning":"decepcionado",               "de":"enttäuscht",          "ex":"She is disappointed with the result.",            "pron":"/dis-a-póin-tid/","pron_de":"/ent-TOISHT/"}'::jsonb,
        '{"term":"embarrassed",  "meaning":"avergonzado",                "de":"verlegen",             "ex":"He feels embarrassed after the mistake.",         "pron":"/im-bá-rast/",    "pron_de":"/fer-LÉ-gen/"}'::jsonb,
        '{"term":"ashamed",      "meaning":"avergüenzado / con vergüenza","de":"beschämt",    "ex":"She felt ashamed after lying to her friend.",     "pron":"/a-shéimd/",      "pron_de":"/be-SHÉMT/"}'::jsonb,
        '{"term":"jealous",      "meaning":"celoso / envidioso",         "de":"eifersüchtig",        "ex":"He is jealous of his brother’s new bike.",          "pron":"/dyé-los/",       "pron_de":"/AI-fer-zü-tig/"}'::jsonb,
        '{"term":"grumpy",       "meaning":"malhumorado / gruñón",       "de":"griesgrämig / launisch","ex":"He is grumpy in the morning before coffee.",    "pron":"/grám-pi/",       "pron_de":"/GRIUS-grä-mig/"}'::jsonb,

        -- Estados especiales
        '{"term":"tired",        "meaning":"cansado",                    "de":"müde",                "ex":"I am tired after school.",                        "pron":"/tái-erd/",       "pron_de":"/MÜ-de/"}'::jsonb,
        '{"term":"exhausted",    "meaning":"agotado / rendido",          "de":"erschöpft",            "ex":"I am exhausted after the long journey.",           "pron":"/ig-sós-tid/",    "pron_de":"/er-SHÖPFT/"}'::jsonb,
        '{"term":"bored",        "meaning":"aburrido",                   "de":"gelangweilt",          "ex":"They are bored in the long class.",                "pron":"/bord/",          "pron_de":"/ge-LANG-vailt/"}'::jsonb,
        '{"term":"confused",     "meaning":"confundido",                 "de":"verwirrt",             "ex":"He looks confused after the question.",            "pron":"/ken-fiúzd/",     "pron_de":"/fer-VIIRT/"}'::jsonb,
        '{"term":"comfortable",  "meaning":"cómodo",                     "de":"behaglich / wohl",     "ex":"I feel comfortable in this room.",                "pron":"/kámf-ter-bol/", "pron_de":"/be-HÁ-glij/"}'::jsonb,
        '{"term":"lonely",       "meaning":"solo / solitario",           "de":"einsam",               "ex":"He feels lonely in a new city.",                   "pron":"/lóun-li/",       "pron_de":"/AIN-zam/"}'::jsonb,
        '{"term":"homesick",     "meaning":"con nostalgia de casa",      "de":"Heimweh haben",        "ex":"She feels homesick after one week abroad.",        "pron":"/hóum-sik/",      "pron_de":"/HAIM-ve HA-ben/"}'::jsonb,
        '{"term":"surprised",    "meaning":"sorprendido",                "de":"überrascht",          "ex":"I am surprised by the gift.",                     "pron":"/ser-práizd/",    "pron_de":"/Ü-ber-rasht/"}'::jsonb,
        '{"term":"shy",          "meaning":"tímido",                     "de":"schüchtern",           "ex":"She is shy but very kind.",                       "pron":"/shái/",          "pron_de":"/SHÜ-jtern/"}'::jsonb,
        '{"term":"impatient",    "meaning":"impaciente",                 "de":"ungeduldig",           "ex":"He is impatient when the queue is long.",          "pron":"/im-péi-shent/",  "pron_de":"/un-ge-DUL-dig/"}'::jsonb,

        -- Reacciones emocionales
        '{"term":"hurt",         "meaning":"herido / dolido (emocionalmente)","de":"verletzt / gekränkt","ex":"She felt hurt by his words.",               "pron":"/hért/",          "pron_de":"/fer-LÉTST/"}'::jsonb,
        '{"term":"miss",         "meaning":"echar de menos",             "de":"vermissen",            "ex":"I miss my family when I am abroad.",               "pron":"/mis/",           "pron_de":"/fer-MÍ-sen/"}'::jsonb,
        '{"term":"cry",          "meaning":"llorar",                     "de":"weinen",               "ex":"She cried when she heard the sad news.",           "pron":"/krái/",          "pron_de":"/VÁI-nen/"}'::jsonb,
        '{"term":"laugh",        "meaning":"reír",                       "de":"lachen",               "ex":"We laugh a lot when we are together.",            "pron":"/laf/",           "pron_de":"/LÁ-jen/"}'::jsonb,
        '{"term":"smile",        "meaning":"sonreír",                    "de":"lächeln",             "ex":"Please smile for the photo.",                     "pron":"/smáil/",         "pron_de":"/LÉ-jeln/"}'::jsonb,
        '{"term":"feel",         "meaning":"sentir / sentirse",          "de":"sich fühlen / fühlen","ex":"How do you feel today?",                    "pron":"/fiil/",          "pron_de":"/zij FÜ-len/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 575 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 575, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'Sentimientos y emociones');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Gefühle und Emotionen');

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
