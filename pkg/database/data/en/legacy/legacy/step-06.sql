-- ============================================================
-- Seed: A0 English Path – STEP 11: Deck – 150 Verbos Regulares e Inflexiones
-- Source language: Spanish
-- ============================================================

DO $$
DECLARE
  v_path_id  UUID;
  v_deck11_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- ── STEP 11: Deck – 150 Verbos Regulares e Inflexiones ──────────────────────
-- ============================================================================

INSERT INTO deck (path_id, step_order, type, source_language) 
VALUES (v_path_id, 8, 'deck', 'en') 
RETURNING uuid INTO v_deck11_id;

INSERT INTO deck_translation (deck_id, language, title, description) 
VALUES (v_deck11_id, 'es', '150 Verbos Regulares Esenciales', 'Domina el vocabulario con una extensa lista de 150 verbos regulares, incluyendo todas sus conjugaciones (pasado, gerundio y tercera persona).');

WITH verb_data(root, past, gerund, third_p, pr_root, pr_past, pr_gerund, pr_third, meaning) AS (
  VALUES
  ('accept', 'accepted', 'accepting', 'accepts', 'aksépt', 'akséptid', 'akséptin', 'aksépts', 'Aceptar'),
  ('add', 'added', 'adding', 'adds', 'ad', 'ádid', 'ádin', 'ads', 'Añadir'),
  ('agree', 'agreed', 'agreeing', 'agrees', 'agrí', 'agríid', 'agríin', 'agrís', 'Estar de acuerdo'),
  ('allow', 'allowed', 'allowing', 'allows', 'aláu', 'aláud', 'alauin', 'aláus', 'Permitir'),
  ('answer', 'answered', 'answering', 'answers', 'ánser', 'ánserd', 'ánserin', 'ánsers', 'Responder'),
  ('appear', 'appeared', 'appearing', 'appears', 'apíir', 'apíird', 'apíirin', 'apíirs', 'Aparecer'),
  ('arrive', 'arrived', 'arriving', 'arrives', 'arráiv', 'arráivd', 'arráivin', 'arráivs', 'Llegar'),
  ('ask', 'asked', 'asking', 'asks', 'ask', 'askt', 'askin', 'asks', 'Preguntar'),
  ('bake', 'baked', 'baking', 'bakes', 'béik', 'béikt', 'béikin', 'béiks', 'Hornear'),
  ('beg', 'begged', 'begging', 'begs', 'beg', 'begd', 'béguin', 'begs', 'Rogar'),
  ('behave', 'behaved', 'behaving', 'behaves', 'bijéiv', 'bijéivd', 'bijéivin', 'bijéivs', 'Comportarse'),
  ('believe', 'believed', 'believing', 'believes', 'bilíiv', 'bilíivd', 'bilíivin', 'bilíivs', 'Creer'),
  ('belong', 'belonged', 'belonging', 'belongs', 'bilóng', 'bilóngd', 'bilóngin', 'bilóngs', 'Pertenecer'),
  ('borrow', 'borrowed', 'borrowing', 'borrows', 'bórrou', 'bórroud', 'bórrouin', 'bórrous', 'Pedir prestado'),
  ('brush', 'brushed', 'brushing', 'brushes', 'brash', 'brasht', 'bráshin', 'bráshis', 'Cepillar'),
  ('call', 'called', 'calling', 'calls', 'kol', 'kold', 'kólin', 'kols', 'Llamar'),
  ('care', 'cared', 'caring', 'cares', 'ker', 'kerd', 'kérin', 'kers', 'Importar / Cuidar'),
  ('carry', 'carried', 'carrying', 'carries', 'kárri', 'kárrid', 'kárriyin', 'kárris', 'Llevar / Cargar'),
  ('cause', 'caused', 'causing', 'causes', 'koz', 'kozd', 'kózin', 'kózis', 'Causar'),
  ('change', 'changed', 'changing', 'changes', 'chéinch', 'chéincht', 'chéinchin', 'chéinchis', 'Cambiar'),
  ('chase', 'chased', 'chasing', 'chases', 'chéis', 'chéist', 'chéisin', 'chéisis', 'Perseguir'),
  ('clean', 'cleaned', 'cleaning', 'cleans', 'klin', 'klind', 'klínin', 'klins', 'Limpiar'),
  ('close', 'closed', 'closing', 'closes', 'klóus', 'klóuzd', 'klóuzin', 'klóuzis', 'Cerrar'),
  ('compare', 'compared', 'comparing', 'compares', 'kompér', 'kompérd', 'kompérin', 'kompérs', 'Comparar'),
  ('complain', 'complained', 'complaining', 'complains', 'kompléin', 'kompléind', 'kompléinin', 'kompléins', 'Quejarse'),
  ('complete', 'completed', 'completing', 'completes', 'komplíit', 'komplíitid', 'komplíitin', 'komplíits', 'Completar'),
  ('continue', 'continued', 'continuing', 'continues', 'kontíniu', 'kontíniud', 'kontíniuin', 'kontínius', 'Continuar'),
  ('cook', 'cooked', 'cooking', 'cooks', 'kuk', 'kukt', 'kúkin', 'kuks', 'Cocinar'),
  ('copy', 'copied', 'copying', 'copies', 'kópi', 'kópid', 'kópiin', 'kópis', 'Copiar'),
  ('count', 'counted', 'counting', 'counts', 'káunt', 'káuntid', 'káuntin', 'káunts', 'Contar'),
  ('cry', 'cried', 'crying', 'cries', 'krái', 'kráid', 'kráiin', 'kráis', 'Llorar'),
  ('dance', 'danced', 'dancing', 'dances', 'dans', 'danst', 'dánsin', 'dánsis', 'Bailar'),
  ('decide', 'decided', 'deciding', 'decides', 'disáid', 'disáidid', 'disáidin', 'disáids', 'Decidir'),
  ('delay', 'delayed', 'delaying', 'delays', 'diléi', 'diléid', 'diléiin', 'diléis', 'Retrasar'),
  ('deliver', 'delivered', 'delivering', 'delivers', 'dilíver', 'dilíverd', 'dilíverin', 'dilívers', 'Entregar'),
  ('describe', 'described', 'describing', 'describes', 'discráib', 'discráibd', 'discráibin', 'discráibs', 'Describir'),
  ('design', 'designed', 'designing', 'designs', 'disáin', 'disáind', 'disáinin', 'disáins', 'Diseñar'),
  ('destroy', 'destroyed', 'destroying', 'destroys', 'distrói', 'distróid', 'distróiin', 'distróis', 'Destruir'),
  ('die', 'died', 'dying', 'dies', 'dái', 'dáid', 'dáiin', 'dáis', 'Morir'),
  ('disagree', 'disagreed', 'disagreeing', 'disagrees', 'disagrí', 'disagríid', 'disagríin', 'disagrís', 'Estar en desacuerdo'),
  ('discover', 'discovered', 'discovering', 'discovers', 'diskóver', 'diskóverd', 'diskóverin', 'diskóvers', 'Descubrir'),
  ('discuss', 'discussed', 'discussing', 'discusses', 'diskás', 'diskást', 'diskásin', 'diskásis', 'Debatir / Discutir'),
  ('dress', 'dressed', 'dressing', 'dresses', 'dres', 'drest', 'drésin', 'drésis', 'Vestir'),
  ('drop', 'dropped', 'dropping', 'drops', 'drop', 'dropt', 'drópin', 'drops', 'Dejar caer'),
  ('dry', 'dried', 'drying', 'dries', 'drái', 'dráid', 'dráiin', 'dráis', 'Secar'),
  ('earn', 'earned', 'earning', 'earns', 'ern', 'ernd', 'érnin', 'erns', 'Ganar (dinero)'),
  ('end', 'ended', 'ending', 'ends', 'end', 'éndid', 'éndin', 'ends', 'Terminar'),
  ('enjoy', 'enjoyed', 'enjoying', 'enjoys', 'enllói', 'enllóid', 'enllóiin', 'enllóis', 'Disfrutar'),
  ('enter', 'entered', 'entering', 'enters', 'énter', 'énterd', 'énterin', 'énters', 'Entrar'),
  ('escape', 'escaped', 'escaping', 'escapes', 'eskéip', 'eskéipt', 'eskéipin', 'eskéips', 'Escapar'),
  ('excuse', 'excused', 'excusing', 'excuses', 'ekskiús', 'ekskiúzd', 'ekskiúzin', 'ekskiúzis', 'Excusar / Perdonar'),
  ('expect', 'expected', 'expecting', 'expects', 'ekspékt', 'ekspéktid', 'ekspéktin', 'ekspékts', 'Esperar (expectativa)'),
  ('explain', 'explained', 'explaining', 'explains', 'ekspléin', 'ekspléind', 'ekspléinin', 'ekspléins', 'Explicar'),
  ('fail', 'failed', 'failing', 'fails', 'féil', 'féild', 'féilin', 'féils', 'Fallar / Fracasar'),
  ('fear', 'feared', 'fearing', 'fears', 'fíir', 'fíird', 'fíirin', 'fíirs', 'Temer'),
  ('fill', 'filled', 'filling', 'fills', 'fil', 'fild', 'fílin', 'fils', 'Llenar'),
  ('finish', 'finished', 'finishing', 'finishes', 'fínish', 'fínisht', 'fínishin', 'fínishis', 'Terminar / Acabar'),
  ('fix', 'fixed', 'fixing', 'fixes', 'fiks', 'fikst', 'fíksin', 'fíksis', 'Arreglar'),
  ('follow', 'followed', 'following', 'follows', 'fólou', 'fóloud', 'fólouin', 'fólous', 'Seguir'),
  ('guess', 'guessed', 'guessing', 'guesses', 'gues', 'guest', 'guésin', 'guésis', 'Adivinar'),
  ('happen', 'happened', 'happening', 'happens', 'jápen', 'jápend', 'jápenin', 'jápens', 'Suceder / Pasar'),
  ('hate', 'hated', 'hating', 'hates', 'jéit', 'jéitid', 'jéitin', 'jéits', 'Odiar'),
  ('help', 'helped', 'helping', 'helps', 'jelp', 'jelpt', 'jélpin', 'jelps', 'Ayudar'),
  ('hope', 'hoped', 'hoping', 'hopes', 'jóup', 'jóupt', 'jóupin', 'jóups', 'Esperar (deseo)'),
  ('hurry', 'hurried', 'hurrying', 'hurries', 'járri', 'járrid', 'járriin', 'járris', 'Apurarse'),
  ('identify', 'identified', 'identifying', 'identifies', 'aidéntifai', 'aidéntifaid', 'aidéntifaiin', 'aidéntifais', 'Identificar'),
  ('imagine', 'imagined', 'imagining', 'imagines', 'imáyin', 'imáyind', 'imáyinin', 'imáyins', 'Imaginar'),
  ('improve', 'improved', 'improving', 'improves', 'imprúv', 'imprúvd', 'imprúvin', 'imprúvs', 'Mejorar'),
  ('include', 'included', 'including', 'includes', 'inklúd', 'inklúdid', 'inklúdin', 'inklúds', 'Incluir'),
  ('increase', 'increased', 'increasing', 'increases', 'inkríis', 'inkríist', 'inkríisin', 'inkríisis', 'Aumentar'),
  ('invite', 'invited', 'inviting', 'invites', 'inváit', 'inváitid', 'inváitin', 'inváits', 'Invitar'),
  ('join', 'joined', 'joining', 'joins', 'llóin', 'llóind', 'llóinin', 'llóins', 'Unirse'),
  ('jump', 'jumped', 'jumping', 'jumps', 'llamp', 'llampt', 'llámpin', 'llamps', 'Saltar'),
  ('kick', 'kicked', 'kicking', 'kicks', 'kik', 'kikt', 'kíkin', 'kiks', 'Patear'),
  ('kill', 'killed', 'killing', 'kills', 'kil', 'kild', 'kílin', 'kils', 'Matar'),
  ('kiss', 'kissed', 'kissing', 'kisses', 'kis', 'kist', 'kísin', 'kísis', 'Besar'),
  ('laugh', 'laughed', 'laughing', 'laughs', 'laf', 'laft', 'láfin', 'lafs', 'Reír'),
  ('learn', 'learned', 'learning', 'learns', 'lern', 'lernd', 'lérnin', 'lerns', 'Aprender'),
  ('lie', 'lied', 'lying', 'lies', 'lái', 'láid', 'láiin', 'láis', 'Mentir'),
  ('like', 'liked', 'liking', 'likes', 'láik', 'láikt', 'láikin', 'láiks', 'Gustar'),
  ('listen', 'listened', 'listening', 'listens', 'lísen', 'lísend', 'lísenin', 'lísens', 'Escuchar'),
  ('live', 'lived', 'living', 'lives', 'liv', 'livd', 'lívin', 'livs', 'Vivir'),
  ('look', 'looked', 'looking', 'looks', 'luk', 'lukt', 'lúkin', 'luks', 'Mirar'),
  ('love', 'loved', 'loving', 'loves', 'lov', 'lovd', 'lóvin', 'lovs', 'Amar'),
  ('manage', 'managed', 'managing', 'manages', 'mánich', 'mánicht', 'mánichin', 'mánichis', 'Manejar / Lograr'),
  ('mark', 'marked', 'marking', 'marks', 'mark', 'markt', 'márkin', 'marks', 'Marcar'),
  ('match', 'matched', 'matching', 'matches', 'mach', 'macht', 'máchin', 'máchis', 'Emparejar / Coincidir'),
  ('measure', 'measured', 'measuring', 'measures', 'méshur', 'méshurd', 'méshurin', 'méshurs', 'Medir'),
  ('melt', 'melted', 'melting', 'melts', 'melt', 'méltid', 'méltin', 'melts', 'Derretir'),
  ('miss', 'missed', 'missing', 'misses', 'mis', 'mist', 'mísin', 'mísis', 'Extrañar / Perder'),
  ('move', 'moved', 'moving', 'moves', 'muv', 'muvd', 'múvin', 'muvs', 'Mover'),
  ('multiply', 'multiplied', 'multiplying', 'multiplies', 'múltiplai', 'múltiplaid', 'múltiplaiin', 'múltiplais', 'Multiplicar'),
  ('need', 'needed', 'needing', 'needs', 'niid', 'níidid', 'níidin', 'niids', 'Necesitar'),
  ('notice', 'noticed', 'noticing', 'notices', 'nóutis', 'nóutist', 'nóutisin', 'nóutisis', 'Notar / Darse cuenta'),
  ('offer', 'offered', 'offering', 'offers', 'ófer', 'óferd', 'óferin', 'ófers', 'Ofrecer'),
  ('open', 'opened', 'opening', 'opens', 'óupen', 'óupend', 'óupenin', 'óupens', 'Abrir'),
  ('order', 'ordered', 'ordering', 'orders', 'órder', 'órderd', 'órderin', 'órders', 'Ordenar / Pedir'),
  ('pack', 'packed', 'packing', 'packs', 'pak', 'pakt', 'pákin', 'paks', 'Empacar'),
  ('paint', 'painted', 'painting', 'paints', 'péint', 'péintid', 'péintin', 'péints', 'Pintar'),
  ('pass', 'passed', 'passing', 'passes', 'pas', 'past', 'pásin', 'pásis', 'Pasar / Aprobar'),
  ('pause', 'paused', 'pausing', 'pauses', 'poz', 'pozd', 'pózin', 'pózis', 'Pausar'),
  ('perform', 'performed', 'performing', 'performs', 'perfórm', 'perfórmd', 'perfórmin', 'perfórms', 'Realizar / Actuar'),
  ('phone', 'phoned', 'phoning', 'phones', 'fóun', 'fóund', 'fóunin', 'fóuns', 'Telefonear'),
  ('plan', 'planned', 'planning', 'plans', 'plan', 'pland', 'plánin', 'plans', 'Planear'),
  ('play', 'played', 'playing', 'plays', 'pléi', 'pléid', 'pléiin', 'pléis', 'Jugar / Tocar'),
  ('please', 'pleased', 'pleasing', 'pleases', 'plíiz', 'plíizd', 'plíizin', 'plíizis', 'Complacer / Agradar'),
  ('practice', 'practiced', 'practicing', 'practices', 'práktis', 'práktist', 'práktisin', 'práktisis', 'Practicar'),
  ('prefer', 'preferred', 'preferring', 'prefers', 'prifér', 'priférd', 'priférin', 'priférs', 'Preferir'),
  ('prepare', 'prepared', 'preparing', 'prepares', 'pripér', 'pripérd', 'pripérin', 'pripérs', 'Preparar'),
  ('present', 'presented', 'presenting', 'presents', 'prizént', 'prizéntid', 'prizéntin', 'prizénts', 'Presentar'),
  ('promise', 'promised', 'promising', 'promises', 'prómis', 'prómist', 'prómisin', 'prómisis', 'Prometer'),
  ('protect', 'protected', 'protecting', 'protects', 'protékt', 'protéktid', 'protéktin', 'protékts', 'Proteger'),
  ('provide', 'provided', 'providing', 'provides', 'prováid', 'prováidid', 'prováidin', 'prováids', 'Proveer / Proporcionar'),
  ('pull', 'pulled', 'pulling', 'pulls', 'pul', 'puld', 'púlin', 'puls', 'Tirar / Jalar'),
  ('push', 'pushed', 'pushing', 'pushes', 'push', 'pusht', 'púshin', 'púshis', 'Empujar'),
  ('rain', 'rained', 'raining', 'rains', 'réin', 'réind', 'réinin', 'réins', 'Llover'),
  ('receive', 'received', 'receiving', 'receives', 'risíiv', 'risíivd', 'risíivin', 'risíivs', 'Recibir'),
  ('record', 'recorded', 'recording', 'records', 'rikórd', 'rikórdid', 'rikórdin', 'rikórds', 'Grabar'),
  ('reduce', 'reduced', 'reducing', 'reduces', 'ridiús', 'ridiúst', 'ridiúsin', 'ridiúsis', 'Reducir'),
  ('relax', 'relaxed', 'relaxing', 'relaxes', 'riláks', 'rilákst', 'riláksin', 'riláksis', 'Relajar'),
  ('remember', 'remembered', 'remembering', 'remembers', 'rimémber', 'rimémberd', 'rimémberin', 'rimémbers', 'Recordar'),
  ('remove', 'removed', 'removing', 'removes', 'rimúv', 'rimúvd', 'rimúvin', 'rimúvs', 'Quitar / Remover'),
  ('rent', 'rented', 'renting', 'rents', 'rent', 'réntid', 'réntin', 'rents', 'Alquilar / Rentar'),
  ('repair', 'repaired', 'repairing', 'repairs', 'ripér', 'ripérd', 'ripérin', 'ripérs', 'Reparar'),
  ('repeat', 'repeated', 'repeating', 'repeats', 'ripíit', 'ripíitid', 'ripíitin', 'ripíits', 'Repetir'),
  ('reply', 'replied', 'replying', 'replies', 'riplái', 'ripláid', 'ripláiin', 'ripláis', 'Responder / Replicar'),
  ('report', 'reported', 'reporting', 'reports', 'ripórt', 'ripórtid', 'ripórtin', 'ripórts', 'Reportar / Informar'),
  ('require', 'required', 'requiring', 'requires', 'rikuáir', 'rikuáird', 'rikuáirin', 'rikuáirs', 'Requerir'),
  ('rest', 'rested', 'resting', 'rests', 'rest', 'réstid', 'réstin', 'rests', 'Descansar'),
  ('return', 'returned', 'returning', 'returns', 'ritérn', 'ritérnd', 'ritérnin', 'ritérns', 'Regresar / Devolver'),
  ('save', 'saved', 'saving', 'saves', 'séiv', 'séivd', 'séivin', 'séivs', 'Guardar / Ahorrar'),
  ('seem', 'seemed', 'seeming', 'seems', 'síim', 'síimd', 'síimin', 'síims', 'Parecer'),
  ('share', 'shared', 'sharing', 'shares', 'sher', 'sherd', 'shérin', 'shers', 'Compartir'),
  ('shop', 'shopped', 'shopping', 'shops', 'shop', 'shopt', 'shópin', 'shops', 'Comprar (ir de compras)'),
  ('show', 'showed', 'showing', 'shows', 'shóu', 'shóud', 'shóuin', 'shóus', 'Mostrar / Enseñar'),
  ('sign', 'signed', 'signing', 'signs', 'sáin', 'sáind', 'sáinin', 'sáins', 'Firmar'),
  ('smile', 'smiled', 'smiling', 'smiles', 'smáil', 'smáild', 'smáilin', 'smáils', 'Sonreír'),
  ('smoke', 'smoked', 'smoking', 'smokes', 'smóuk', 'smóukt', 'smóukin', 'smóuks', 'Fumar'),
  ('sound', 'sounded', 'sounding', 'sounds', 'sáund', 'sáundid', 'sáundin', 'sáunds', 'Sonar'),
  ('spell', 'spelled', 'spelling', 'spells', 'spel', 'speld', 'spélin', 'spels', 'Deletrear'),
  ('start', 'started', 'starting', 'starts', 'start', 'stártid', 'stártin', 'starts', 'Empezar / Iniciar'),
  ('stop', 'stopped', 'stopping', 'stops', 'stop', 'stopt', 'stópin', 'stops', 'Detener / Parar'),
  ('study', 'studied', 'studying', 'studies', 'stádi', 'stádid', 'stádiin', 'stádis', 'Estudiar'),
  ('talk', 'talked', 'talking', 'talks', 'tok', 'tokt', 'tókin', 'toks', 'Hablar'),
  ('taste', 'tasted', 'tasting', 'tastes', 'téist', 'téistid', 'téistin', 'téists', 'Probar (sabor)'),
  ('thank', 'thanked', 'thanking', 'thanks', 'zank', 'zankt', 'zánkin', 'zanks', 'Agradecer'),
  ('touch', 'touched', 'touching', 'touches', 'tach', 'tacht', 'táchin', 'táchis', 'Tocar'),
  ('travel', 'traveled', 'traveling', 'travels', 'trável', 'tráveld', 'trávelin', 'trávels', 'Viajar'),
  ('try', 'tried', 'trying', 'tries', 'trái', 'tráid', 'tráiin', 'tráis', 'Intentar / Probar'),
  ('walk', 'walked', 'walking', 'walks', 'uók', 'uókt', 'uókin', 'uóks', 'Caminar'),
  ('want', 'wanted', 'wanting', 'wants', 'uánt', 'uántid', 'uántin', 'uánts', 'Querer'),
  ('wash', 'washed', 'washing', 'washes', 'uósh', 'uósht', 'uóshin', 'uóshis', 'Lavar'),
  ('watch', 'watched', 'watching', 'watches', 'uóch', 'uócht', 'uóchin', 'uóchis', 'Mirar / Observar'),
  ('wish', 'wished', 'wishing', 'wishes', 'uísh', 'uísht', 'uíshin', 'uíshis', 'Desear'),
  ('work', 'worked', 'working', 'works', 'uérk', 'uérkt', 'uérkin', 'uérks', 'Trabajar')
),
-- 1. Insertamos las raíces
root_insert AS (
  INSERT INTO word (term, is_root, source_language)
  SELECT root, true, 'en' FROM verb_data
  RETURNING uuid, term
),
-- 2. Vinculamos las raíces al deck
deck_link AS (
  INSERT INTO deck_words (deck_id, word_id)
  SELECT v_deck11_id, uuid FROM root_insert
),
-- 3. Preparamos un mapeo general (UUID de la raíz <-> sus datos)
inflection_prep AS (
  SELECT r.uuid AS root_uuid, v.*
  FROM root_insert r
  JOIN verb_data v ON r.term = v.root
),
-- 4. Insertamos TODAS las inflexiones (pasado, participio, gerundio, 3ra persona)
inflection_insert AS (
  INSERT INTO word (term, is_root, source_language, inflection_type, root_word)
  SELECT past, false, 'en', 'past', root_uuid FROM inflection_prep UNION ALL
  SELECT past, false, 'en', 'past_participle', root_uuid FROM inflection_prep UNION ALL
  SELECT gerund, false, 'en', 'gerund', root_uuid FROM inflection_prep UNION ALL
  SELECT third_p, false, 'en', 'third_person_singular', root_uuid FROM inflection_prep
  RETURNING uuid, term, inflection_type, root_word
),
-- 5. Llenamos la tabla puente para relacionar cada palabra con sus inflexiones
bridge_insert AS (
  INSERT INTO word_inflection (word_id, inflection_id)
  SELECT root_word, uuid FROM inflection_insert
),
-- 6. Generamos una vista unificada de las traducciones que hay que insertar (Raíces + Inflexiones)
trans_prep AS (
  -- Traducciones y pronunciación de las raíces
  SELECT 
    root_uuid as word_id, 
    pr_root as pronun, 
    jsonb_build_array(jsonb_build_object('kind', 'VERB', 'definition', meaning)) as mean_json
  FROM inflection_prep
  UNION ALL
  -- Traducciones y pronunciación (dinámica) de las inflexiones
  SELECT 
    ii.uuid as word_id,
    CASE ii.inflection_type
      WHEN 'past' THEN ip.pr_past
      WHEN 'past_participle' THEN ip.pr_past
      WHEN 'gerund' THEN ip.pr_gerund
      WHEN 'third_person_singular' THEN ip.pr_third
    END as pronun,
    '[{"kind":"VERB","definition":"Forma conjugada"}]'::jsonb as mean_json
  FROM inflection_insert ii
  JOIN inflection_prep ip ON ii.root_word = ip.root_uuid
)
-- 7. Finalmente, insertamos en word_translation
INSERT INTO word_translation (word_id, language, pronunciation, meaning)
SELECT word_id, 'es', pronun, mean_json FROM trans_prep;

END;
$$;
