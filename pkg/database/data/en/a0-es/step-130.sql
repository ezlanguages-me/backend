-- ============================================================
-- Seed: A0 English Path – STEP 130 – Grammar – Formación Plural
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_grammar1_id UUID; 
    v_rule1_id UUID; 
    v_rule2_id UUID; 
    v_rule3_id UUID; 
    v_rule4_id UUID; 
    v_rule5_id UUID; 
    v_ex_id UUID; 
BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 130, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Formación del Plural', 
    '', 
    to_jsonb('## Formación del Plural
En inglés, el plural de los sustantivos se forma generalmente añadiendo una "S", pero existen varias reglas ortográficas importantes y algunas excepciones irregulares que cambian la palabra por completo.

##### 1. Regla General y terminación en O
*   **Resto de palabras:** A la gran mayoría se les agrega **-S**.
    *   *book* ➔ *books*
    *   *table* ➔ *tables*
*   **Terminadas en O:** Agregan **-ES** o **-S**.
    *   *domino* ➔ *dominoes* / *dominos*
    *   *hero* ➔ *heroes* / *heros*

##### 2. Terminaciones en S, X, Z, CH o SH
Si la palabra termina en estos sonidos, se añade **-ES**.
*   *box* ➔ *boxes*
*   *watch* ➔ *watches*

##### 3. Terminaciones en Y, F, FE o FF
*   **Consonante + Y:** Se cambia la Y por **-IES**.
    *   *city* ➔ *cities*
    *   *baby* ➔ *babies*
*   **Acaba en F, FE o FF:** Se cambia por **-VES**.
    *   *knife* ➔ *knives*
    *   *half* ➔ *halves*

##### 4. Plurales Irregulares
No siguen las reglas de la "S" y cambian su forma por completo. ¡Debes memorizarlos!
*   *man* ➔ *men*
*   *woman* ➔ *women*
*   *child* ➔ *children*
*   *person* ➔ *people*
*   *tooth* ➔ *teeth*
*   *foot* ➔ *feet*
*   *mouse* ➔ *mice*

##### 5. Plurales Invariables
Algunas palabras **no cambian** en plural. Se usan igual en singular y plural. El contexto (o un número) te indica si es singular o plural.
*   *one sheep / three sheep* (una oveja / tres ovejas)
*   *one fish / five fish* (un pez / cinco peces)
*   *one deer / many deer* (un ciervo / muchos ciervos)
*   *one series / two series* (una serie / dos series)
*   *one species / several species* (una especie / varias especies)'::text)
);

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
VALUES (
    v_grammar1_id,
    'de',
    'Pluralbildung',
    '',
    to_jsonb('## Pluralbildung
Im Englischen wird der Plural der Nomen in der Regel durch Anhängen eines "S" gebildet, aber es gibt wichtige Rechtschreibregeln und einige unregelmäßige Ausnahmen.

##### 1. Grundregel und Endung auf O
*   **Die meisten Wörter:** Einfach **-S** anhängen.
    *   *book* ➔ *books*
    *   *table* ➔ *tables*
*   **Endung auf O:** Es wird **-ES** oder **-S** angehängt.
    *   *domino* ➔ *dominoes* / *dominos*
    *   *hero* ➔ *heroes* / *heros*

##### 2. Endungen auf S, X, Z, CH oder SH
Bei diesen Klängen wird **-ES** angehängt.
*   *box* ➔ *boxes*
*   *watch* ➔ *watches*

##### 3. Endungen auf Y, F, FE oder FF
*   **Konsonant + Y:** Das Y wird durch **-IES** ersetzt.
    *   *city* ➔ *cities*
    *   *baby* ➔ *babies*
*   **Endung auf F, FE oder FF:** Wird durch **-VES** ersetzt.
    *   *knife* ➔ *knives*
    *   *half* ➔ *halves*

##### 4. Unregelmäßige Plurale
Diese folgen nicht den -S-Regeln und ändern ihre Form vollständig. Auswendig lernen!
*   *man* ➔ *men*
*   *woman* ➔ *women*
*   *child* ➔ *children*
*   *person* ➔ *people*
*   *tooth* ➔ *teeth*
*   *foot* ➔ *feet*
*   *mouse* ➔ *mice*

##### 5. Unveränderliche Plurale
Einige Wörter **ändern sich nicht** im Plural. Sie werden im Singular und Plural gleich geschrieben.
*   *one sheep / three sheep* (ein Schaf / drei Schafe)
*   *one fish / five fish* (ein Fisch / fünf Fische)
*   *one deer / many deer* (ein Hirsch / viele Hirsche)
*   *one series / two series* (eine Serie / zwei Serien)
*   *one species / several species* (eine Art / mehrere Arten)'::text)
);

-- 3. Insertar las 5 Reglas Gramaticales
-- Regla 1: Regla General y terminación en O
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Regla General y terminación en O', 'A la mayoría de palabras se les añade -S (book -> books). Si acaban en O, suelen agregar -ES (hero -> heroes).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'de', 'Grundregel und Endung auf O', 'Den meisten Wörtern wird -S angehängt (book -> books). Bei Endung auf O meist -ES (hero -> heroes).');

-- Regla 2: Sibilantes (S, X, Z, CH, SH)
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Terminaciones en S, X, Z, CH o SH', 'Si la palabra termina en s, x, z, ch o sh, debes añadir -ES para formar el plural (ej. box -> boxes).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'de', 'Endungen auf S, X, Z, CH oder SH', 'Bei Endung auf s, x, z, ch oder sh wird -ES angehängt (z.B. box -> boxes).');

-- Regla 3: Terminaciones en Y, F, FE
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Terminaciones Y, F, FE', 'Si acaba en consonante+Y, cambia a -IES (baby->babies). Si acaba en F/FE, cambia a -VES (knife->knives).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'de', 'Endungen auf Y, F, FE', 'Bei Konsonant+Y wird zu -IES (baby->babies). Bei F/FE wird zu -VES (knife->knives).');

-- Regla 4: Plurales Irregulares
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Plurales Irregulares', 'Recuerda que estas palabras cambian por completo: man->men, child->children, person->people, tooth->teeth.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'de', 'Unregelmäßige Plurale', 'Diese Wörter ändern sich vollständig: man->men, child->children, person->people, tooth->teeth.');

-- Regla 5: Plurales Invariables
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule5_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Plurales Invariables (sin cambio)', 'Estas palabras tienen la misma forma en singular y plural: sheep, fish, deer, series, species. No les añadas -s ni -es.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'de', 'Unveränderliche Plurale', 'Diese Wörter haben im Singular und Plural dieselbe Form: sheep, fish, deer, series, species. Kein -s oder -es anhängen.');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - General y terminación en O)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Compraste tres ___ (book) en la feria del libro.', '{"type":"typing","correct_answers":["books"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Du hast drei ___ (book) auf der Buchmesse gekauft.', '{"type":"typing","correct_answers":["books"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El restaurante tiene cinco ___ (table) disponibles esta noche.', '{"type":"typing","correct_answers":["tables"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Restaurant hat heute Abend fünf ___ (table) frei.', '{"type":"typing","correct_answers":["tables"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En el parking hay dos ___ (car) aparcados en fila.', '{"type":"typing","correct_answers":["cars"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Auf dem Parkplatz stehen zwei ___ (car) in einer Reihe.', '{"type":"typing","correct_answers":["cars"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Necesito unos ___ (pen) para tomar apuntes en clase.', '{"type":"typing","correct_answers":["pens"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ich brauche einige ___ (pen), um im Unterricht Notizen zu machen.', '{"type":"typing","correct_answers":["pens"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los niños quieren disfrazarse de sus ___ (hero) favoritos.', '{"type":"typing","correct_answers":["heroes","heros"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Kinder wollen sich als ihre Lieblings-___ (hero) verkleiden.', '{"type":"typing","correct_answers":["heroes","heros"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El juego de mesa incluye veintiocho ___ (domino).', '{"type":"typing","correct_answers":["dominoes","dominos"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Brettspiel enthält achtundzwanzig ___ (domino).', '{"type":"typing","correct_answers":["dominoes","dominos"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Necesito cuatro ___ (apple) para hacer la tarta.', '{"type":"typing","correct_answers":["apples"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ich brauche vier ___ (apple) für den Kuchen.', '{"type":"typing","correct_answers":["apples"],"case_sensitive":false}'::jsonb);

-- (R2 - S, X, Z, CH, SH)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los mudanceros trajeron seis ___ (box) enormes al apartamento.', '{"type":"typing","correct_answers":["boxes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Umzugshelfer brachten sechs riesige ___ (box) in die Wohnung.', '{"type":"typing","correct_answers":["boxes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La tienda vende varios tipos de ___ (watch).', '{"type":"typing","correct_answers":["watches"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Geschäft verkauft verschiedene Arten von ___ (watch).', '{"type":"typing","correct_answers":["watches"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Hay dos ___ (bus) que van directamente al aeropuerto.', '{"type":"typing","correct_answers":["buses"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Es gibt zwei ___ (bus), die direkt zum Flughafen fahren.', '{"type":"typing","correct_answers":["buses"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Tengo tres ___ (class) de inglés esta semana.', '{"type":"typing","correct_answers":["classes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ich habe diese Woche drei ___ (class) Englisch.', '{"type":"typing","correct_answers":["classes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El artista usa varios ___ (brush) de distinto tamaño.', '{"type":"typing","correct_answers":["brushes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Künstler benutzt verschiedene ___ (brush) unterschiedlicher Größe.', '{"type":"typing","correct_answers":["brushes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Compramos diez ___ (match) para encender la barbacoa.', '{"type":"typing","correct_answers":["matches"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wir kauften zehn ___ (match), um den Grill anzuzünden.', '{"type":"typing","correct_answers":["matches"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El guardabosques vio tres ___ (fox) cruzando el camino.', '{"type":"typing","correct_answers":["foxes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Förster sah drei ___ (fox), die den Weg überquerten.', '{"type":"typing","correct_answers":["foxes"],"case_sensitive":false}'::jsonb);

-- (R3 - Y, F, FE)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Visitamos cuatro ___ (city) importantes durante el viaje.', '{"type":"typing","correct_answers":["cities"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wir besuchten vier wichtige ___ (city) während der Reise.', '{"type":"typing","correct_answers":["cities"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Hay dos ___ (baby) en la sala de espera de la clínica.', '{"type":"typing","correct_answers":["babies"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Es gibt zwei ___ (baby) im Wartezimmer der Klinik.', '{"type":"typing","correct_answers":["babies"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El chef preparó sus ___ (knife) antes de ponerse a cocinar.', '{"type":"typing","correct_answers":["knives"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Koch bereitete seine ___ (knife) vor dem Kochen vor.', '{"type":"typing","correct_answers":["knives"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Dividieron el pastel en dos ___ (half) iguales.', '{"type":"typing","correct_answers":["halves"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Sie teilten den Kuchen in zwei gleiche ___ (half).', '{"type":"typing","correct_answers":["halves"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Tres ___ (lady) esperaban su turno en la peluquería.', '{"type":"typing","correct_answers":["ladies"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Drei ___ (lady) warteten auf ihren Termin beim Friseur.', '{"type":"typing","correct_answers":["ladies"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los dos amigos llevaron a sus ___ (wife) a la cena de empresa.', '{"type":"typing","correct_answers":["wives"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die beiden Freunde brachten ihre ___ (wife) zum Firmendinner mit.', '{"type":"typing","correct_answers":["wives"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El suelo del parque estaba cubierto de ___ (leaf) amarillas.', '{"type":"typing","correct_answers":["leaves"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Boden des Parks war mit gelben ___ (leaf) bedeckt.', '{"type":"typing","correct_answers":["leaves"],"case_sensitive":false}'::jsonb);

-- (R4 - Irregulares)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Tres ___ (man) esperaban en la cola del banco.', '{"type":"typing","correct_answers":["men"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Drei ___ (man) warteten in der Schlange bei der Bank.', '{"type":"typing","correct_answers":["men"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Cuatro ___ (woman) participaron como ponentes en el debate.', '{"type":"typing","correct_answers":["women"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Vier ___ (woman) nahmen als Rednerinnen an der Diskussion teil.', '{"type":"typing","correct_answers":["women"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los ___ (child) jugaban en el parque esta tarde.', '{"type":"typing","correct_answers":["children"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die ___ (child) spielten heute Nachmittag im Park.', '{"type":"typing","correct_answers":["children"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Solo dos ___ (person) llegaron a tiempo a la reunión.', '{"type":"typing","correct_answers":["people"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Nur zwei ___ (person) kamen pünktlich zum Meeting.', '{"type":"typing","correct_answers":["people"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El dentista revisó sus ___ (tooth) durante la revisión.', '{"type":"typing","correct_answers":["teeth"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Zahnarzt untersuchte seine ___ (tooth) bei der Kontrolle.', '{"type":"typing","correct_answers":["teeth"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Me duelen los ___ (foot) de tanto caminar por la ciudad.', '{"type":"typing","correct_answers":["feet"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Mir tun die ___ (foot) vom vielen Laufen durch die Stadt weh.', '{"type":"typing","correct_answers":["feet"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El experimento de laboratorio requirió varios ___ (mouse).', '{"type":"typing","correct_answers":["mice"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Laborexperiment erforderte mehrere ___ (mouse).', '{"type":"typing","correct_answers":["mice"],"case_sensitive":false}'::jsonb);

-- (R5 - Plurales Invariables)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En la granja hay quince ___ (sheep) pastando en el campo.', '{"type":"typing","correct_answers":["sheep"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Auf dem Bauernhof grasen fünfzehn ___ (sheep) auf dem Feld.', '{"type":"typing","correct_answers":["sheep"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pescador capturó diez ___ (fish) en el rio.', '{"type":"typing","correct_answers":["fish"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Fischer fing zehn ___ (fish) im Fluss.', '{"type":"typing","correct_answers":["fish"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El guia vio tres ___ (deer) en el bosque.', '{"type":"typing","correct_answers":["deer"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Führer sah drei ___ (deer) im Wald.', '{"type":"typing","correct_answers":["deer"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En Netflix hay varias ___ (series) que quiero ver.', '{"type":"typing","correct_answers":["series"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Auf Netflix gibt es mehrere ___ (series), die ich sehen möchte.', '{"type":"typing","correct_answers":["series"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los cientificos descubrieron dos nuevas ___ (species) de insecto.', '{"type":"typing","correct_answers":["species"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Wissenschaftler entdeckten zwei neue ___ (species) von Insekten.', '{"type":"typing","correct_answers":["species"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El acuario tiene mas de cien ___ (fish) distintos.', '{"type":"typing","correct_answers":["fish"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Aquarium hat mehr als hundert verschiedene ___ (fish).', '{"type":"typing","correct_answers":["fish"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - General y terminación en O)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La biblioteca tiene cientos de ___ (book). ¿Cuál es el plural correcto?', '{"type":"multiple_choice","options":["books","bookes","bookies"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Bibliothek hat hunderte von ___ (book). Welches ist der richtige Plural?', '{"type":"multiple_choice","options":["books","bookes","bookies"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El restaurante reserva ocho ___ (table). ¿Cuál está bien escrito?', '{"type":"multiple_choice","options":["tablees","tables","tabls"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Restaurant reserviert acht ___ (table). Welche Schreibweise ist korrekt?', '{"type":"multiple_choice","options":["tablees","tables","tabls"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En la película hay varios ___ (hero). ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["heroes","heries","hereos"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Im Film gibt es mehrere ___ (hero). Welche Form ist richtig?', '{"type":"multiple_choice","options":["heroes","heries","hereos"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Dos ___ (car) bloqueaban la salida del garaje. ¿Cuál es el plural correcto?', '{"type":"multiple_choice","options":["cars","cares","carries"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Zwei ___ (car) blockierten die Ausfahrt der Garage. Welches ist der richtige Plural?', '{"type":"multiple_choice","options":["cars","cares","carries"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El set contiene veintiocho ___ (domino). ¿Cuál está bien escrito?', '{"type":"multiple_choice","options":["dominoes","dominies","domin"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Set enthält achtundzwanzig ___ (domino). Welche Schreibweise ist korrekt?', '{"type":"multiple_choice","options":["dominoes","dominies","domin"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Necesitas varios ___ (pen) para el examen. ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["pennes","pens","penes"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Du brauchst mehrere ___ (pen) für die Prüfung. Welche Form ist richtig?', '{"type":"multiple_choice","options":["pennes","pens","penes"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Traje cinco ___ (apple) para el desayuno. ¿Cuál es el plural correcto?', '{"type":"multiple_choice","options":["apples","applees","applys"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ich brachte fünf ___ (apple) zum Frühstück. Welches ist der richtige Plural?', '{"type":"multiple_choice","options":["apples","applees","applys"],"answer":0}'::jsonb);

-- (R2 - S, X, Z, CH, SH)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Hay cuatro ___ (box) en el almacén. ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["boxs","boxes","boxies"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Es gibt vier ___ (box) im Lager. Welche Form ist richtig?', '{"type":"multiple_choice","options":["boxs","boxes","boxies"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La tienda exhibe tres modelos de ___ (watch). ¿Cuál está bien escrito?', '{"type":"multiple_choice","options":["watchs","watchies","watches"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Geschäft zeigt drei Modelle von ___ (watch). Welche Schreibweise ist korrekt?', '{"type":"multiple_choice","options":["watchs","watchies","watches"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Dos ___ (bus) llegan al aeropuerto a la misma hora. ¿Cuál es correcto?', '{"type":"multiple_choice","options":["buses","bus","busies"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Zwei ___ (bus) kommen gleichzeitig am Flughafen an. Welche ist korrekt?', '{"type":"multiple_choice","options":["buses","bus","busies"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Esta semana tengo cuatro ___ (class) de inglés. ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["classs","classes","class"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Diese Woche habe ich vier ___ (class) Englisch. Welche Form ist richtig?', '{"type":"multiple_choice","options":["classs","classes","class"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pintor usa tres ___ (brush) distintos. ¿Cuál está bien escrito?', '{"type":"multiple_choice","options":["brushes","brushs","brushies"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Maler benutzt drei verschiedene ___ (brush). Welche Schreibweise ist korrekt?', '{"type":"multiple_choice","options":["brushes","brushs","brushies"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Compré un paquete de ___ (match) para la barbacoa. ¿Cuál es correcto?', '{"type":"multiple_choice","options":["mathces","matchs","matches"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ich kaufte ein Päckchen ___ (match) für den Grill. Welche ist korrekt?', '{"type":"multiple_choice","options":["mathces","matchs","matches"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El naturalista observó tres ___ (fox) en el bosque. ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["foxes","foxs","foxxes"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Naturforscher beobachtete drei ___ (fox) im Wald. Welche Form ist richtig?', '{"type":"multiple_choice","options":["foxes","foxs","foxxes"],"answer":0}'::jsonb);

-- (R3 - Y, F, FE)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El país tiene varias ___ (city) importantes. ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["cityes","citys","cities"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Land hat mehrere wichtige ___ (city). Welche Form ist richtig?', '{"type":"multiple_choice","options":["cityes","citys","cities"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Hay dos ___ (baby) en la guardería esta mañana. ¿Cuál está bien escrito?', '{"type":"multiple_choice","options":["babies","babys","babyes"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Es gibt zwei ___ (baby) in der Krippe heute Morgen. Welche Schreibweise ist korrekt?', '{"type":"multiple_choice","options":["babies","babys","babyes"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El chef afiló sus ___ (knife) antes del servicio. ¿Cuál es correcto?', '{"type":"multiple_choice","options":["knifes","knives","knivs"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Koch schärfte seine ___ (knife) vor dem Service. Welche ist korrekt?', '{"type":"multiple_choice","options":["knifes","knives","knivs"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Partieron el pastel en dos ___ (half) iguales. ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["halfs","halfes","halves"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Sie teilten den Kuchen in zwei gleiche ___ (half). Welche Form ist richtig?', '{"type":"multiple_choice","options":["halfs","halfes","halves"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Tres ___ (lady) esperan turno en la consulta. ¿Cuál está bien escrito?', '{"type":"multiple_choice","options":["ladys","ladies","ladyes"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Drei ___ (lady) warten in der Praxis auf ihren Termin. Welche Schreibweise ist korrekt?', '{"type":"multiple_choice","options":["ladys","ladies","ladyes"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Llevaron a sus ___ (wife) a la cena de aniversario. ¿Cuál es correcto?', '{"type":"multiple_choice","options":["wives","wifes","wiffes"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Sie brachten ihre ___ (wife) zum Jubiläumsdinner mit. Welche ist korrekt?', '{"type":"multiple_choice","options":["wives","wifes","wiffes"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El otoño cubre el suelo de ___ (leaf). ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["leafs","leaffs","leaves"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Herbst bedeckt den Boden mit ___ (leaf). Welche Form ist richtig?', '{"type":"multiple_choice","options":["leafs","leaffs","leaves"],"answer":2}'::jsonb);

-- (R4 - Irregulares)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Tres ___ (man) esperaban su turno en la comisaria. ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["mans","men","mens"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Drei ___ (man) warteten an der Polizeiwache auf ihren Termin. Welche Form ist richtig?', '{"type":"multiple_choice","options":["mans","men","mens"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Cuatro ___ (woman) participaron como oradoras. ¿Cuál está bien escrito?', '{"type":"multiple_choice","options":["womans","women","womens"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Vier ___ (woman) nahmen als Rednerinnen teil. Welche Schreibweise ist korrekt?', '{"type":"multiple_choice","options":["womans","women","womens"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los ___ (child) del barrio jugaban en la calle. ¿Cuál es correcto?', '{"type":"multiple_choice","options":["childs","children","childrens"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die ___ (child) aus der Nachbarschaft spielten auf der Straße. Welche ist korrekt?', '{"type":"multiple_choice","options":["childs","children","childrens"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Solo dos ___ (person) se presentaron a la entrevista. ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["persons","people","peoples"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Nur zwei ___ (person) erschienen zum Vorstellungsgespräch. Welche Form ist richtig?', '{"type":"multiple_choice","options":["persons","people","peoples"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El dentista revisó sus ___ (tooth) una a una. ¿Cuál está bien escrito?', '{"type":"multiple_choice","options":["tooths","teeth","teeths"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Zahnarzt untersuchte seine ___ (tooth) einzeln. Welche Schreibweise ist korrekt?', '{"type":"multiple_choice","options":["tooths","teeth","teeths"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Me duelen los ___ (foot) después de la caminata. ¿Cuál es correcto?', '{"type":"multiple_choice","options":["foots","feet","feets"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Mir tun die ___ (foot) nach der Wanderung weh. Welche ist korrekt?', '{"type":"multiple_choice","options":["foots","feet","feets"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El laboratorio usó varios ___ (mouse) en sus pruebas. ¿Cuál es la forma correcta?', '{"type":"multiple_choice","options":["mouses","mice","mices"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Labor verwendete mehrere ___ (mouse) in seinen Versuchen. Welche Form ist richtig?', '{"type":"multiple_choice","options":["mouses","mice","mices"],"answer":1}'::jsonb);

-- (R5 - Plurales Invariables)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En la granja hay veinte ___ (sheep). Cual es el plural correcto?', '{"type":"multiple_choice","options":["sheeps","sheep","sheepes"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Auf dem Bauernhof gibt es zwanzig ___ (sheep). Welches ist der richtige Plural?', '{"type":"multiple_choice","options":["sheeps","sheep","sheepes"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pescador atrapó cinco ___ (fish). Cual es la forma correcta?', '{"type":"multiple_choice","options":["fishes","fishs","fish"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Fischer fing fünf ___ (fish). Welche Form ist richtig?', '{"type":"multiple_choice","options":["fishes","fishs","fish"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Vimos tres ___ (deer) en el parque. Cual esta bien escrito?', '{"type":"multiple_choice","options":["deer","deers","deeres"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wir sahen drei ___ (deer) im Park. Welche Schreibweise ist korrekt?', '{"type":"multiple_choice","options":["deer","deers","deeres"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Netflix tiene dos nuevas ___ (series). Cual es correcta?', '{"type":"multiple_choice","options":["serieses","series","sereis"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Netflix hat zwei neue ___ (series). Welche ist korrekt?', '{"type":"multiple_choice","options":["serieses","series","sereis"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los biologos encontraron tres ___ (species) nuevas. Cual es la forma correcta?', '{"type":"multiple_choice","options":["specieses","speciess","species"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Biologen fanden drei neue ___ (species). Welche Form ist richtig?', '{"type":"multiple_choice","options":["specieses","speciess","species"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los plurales invariables son palabras que:', '{"type":"multiple_choice","options":["No cambian su forma en plural","Cambian por completo","Agregan -es siempre"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Unveränderliche Plurale sind Wörter, die:', '{"type":"multiple_choice","options":["No cambian su forma en plural","Cambian por completo","Agregan -es siempre"],"answer":0}'::jsonb);


-- ==============================================================================
-- TIPO 3: TRUE/FALSE (Verdadero o Falso) - 24 Ejercicios (6 por regla)
-- ==============================================================================

-- (R1 - General y terminación en O)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "book" es "bookes".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "book" ist "bookes".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A la mayoría de las palabras simplemente se les añade "-s".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Den meisten Wörtern wird einfach "-s" angehängt.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "hero" se escribe "heroes".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "hero" wird "heroes" geschrieben.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "table" es "tables".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "table" ist "tables".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Las palabras que acaban en "o" siempre cambian la vocal a "i" (ej: heries).', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wörter, die auf "o" enden, ändern den Vokal immer zu "i" (z.B.: heries).', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Heros" es también una forma ortográfica aceptada para el plural de "hero".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Heros" ist ebenfalls eine akzeptierte Schreibweise für den Plural von "hero".', '{"type":"true_false","answer":true}'::jsonb);

-- (R2 - S, X, Z, CH, SH)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Si una palabra termina en X, añadimos -es para su plural.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wenn ein Wort auf X endet, fügen wir -es für seinen Plural hinzu.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "box" es "boxs".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "box" ist "boxs".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "watch" se escribe "watches".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "watch" wird "watches" geschrieben.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A las palabras terminadas en CH se les añade solo una -s.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wörtern, die auf CH enden, wird nur ein -s angehängt.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "class" es "classes".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "class" ist "classes".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Las palabras que terminan en SH agregan -es para formar el plural (ej: brushes).', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wörter, die auf SH enden, fügen -es hinzu, um den Plural zu bilden (z.B.: brushes).', '{"type":"true_false","answer":true}'::jsonb);

-- (R3 - Y, F, FE)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Si una palabra termina en consonante + Y, la Y se cambia por -ies.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wenn ein Wort auf Konsonant + Y endet, wird das Y durch -ies ersetzt.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "baby" es "babys".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "baby" ist "babys".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "city" es "cities".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "city" ist "cities".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Si una palabra termina en F o FE, cambiamos esa terminación por -ves.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wenn ein Wort auf F oder FE endet, ersetzen wir diese Endung durch -ves.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "knife" es "knifes".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "knife" ist "knifes".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "half" es "halves".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "half" ist "halves".', '{"type":"true_false","answer":true}'::jsonb);

-- (R4 - Irregulares)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "man" se escribe "mans".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "man" wird "mans" geschrieben.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "child" es "children".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "child" ist "children".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "person" es "people".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "person" ist "people".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "tooth" es "teeth".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "tooth" ist "teeth".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "mouse" se escribe "mouses".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "mouse" wird "mouses" geschrieben.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los plurales irregulares cambian su forma por completo en lugar de añadir -s o -es.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Unregelmäßige Plurale ändern ihre Form vollständig, anstatt -s oder -es anzuhängen.', '{"type":"true_false","answer":true}'::jsonb);

-- (R5 - Plurales Invariables)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "sheep" es "sheeps".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Plural von "sheep" ist "sheeps".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Fish" puede ser tanto singular como plural.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Fish" kann sowohl Singular als auch Plural sein.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los plurales invariables en ingles agregan -es para su forma plural.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Unveränderliche Plurale im Englischen fügen -es für ihre Pluralform hinzu.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Three deer" es la forma correcta (no "three deers").', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Three deer" ist die korrekte Form (nicht "three deers").', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Two series" es correcto porque "series" no cambia en plural.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Two series" ist korrekt, weil "series" sich im Plural nicht ändert.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Several specieses" es la forma plural correcta de "species".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Several specieses" ist die korrekte Pluralform von "species".', '{"type":"true_false","answer":false}'::jsonb);

END;
$seed$;
