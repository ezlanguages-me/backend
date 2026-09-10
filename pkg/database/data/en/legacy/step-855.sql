-- ============================================================
-- Seed: A0 English Path – STEP 855 – Deck – La Escuela y la Universidad
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "nursery school", "meaning": "guardería / jardín de infantes", "de": "Kindergarten", "ex": "My son started nursery school at two.", "pron": "/nér-se-ri skul/", "pron_de": "/KIN-dö-gaar-ten/"}'::jsonb,
        '{"term": "primary school", "meaning": "escuela primaria", "de": "Grundschule", "ex": "She teaches at a primary school nearby.", "pron": "/prái-ma-ri skul/", "pron_de": "/GRUN-shuu-le/"}'::jsonb,
        '{"term": "secondary school", "meaning": "escuela secundaria", "de": "weiterführende Schule", "ex": "He starts secondary school next year.", "pron": "/sé-kon-da-ri skul/", "pron_de": "/VAI-tö-füü-ren-de SHUU-le/"}'::jsonb,
        '{"term": "high school", "meaning": "bachillerato / instituto", "de": "Gymnasium / Oberschule", "ex": "She graduated from high school last June.", "pron": "/hái skul/", "pron_de": "/gim-NAA-zi-um/"}'::jsonb,
        '{"term": "university", "meaning": "universidad", "de": "Universität", "ex": "She studied medicine at the university.", "pron": "/iu-ni-vér-si-ti/", "pron_de": "/u-ni-vöö-si-TÄT/"}'::jsonb,
        '{"term": "college", "meaning": "universidad / facultad", "de": "Hochschule / College", "ex": "He attended college in New York.", "pron": "/kó-lidy/", "pron_de": "/KO-ledy/"}'::jsonb,
        '{"term": "vocational school", "meaning": "escuela de formación profesional", "de": "Berufsschule", "ex": "He studied at a vocational school.", "pron": "/vo-kéi-sho-nal skul/", "pron_de": "/bö-RUFS-shuu-le/"}'::jsonb,
        '{"term": "boarding school", "meaning": "internado", "de": "Internat", "ex": "She went to a boarding school in Scotland.", "pron": "/bór-ding skul/", "pron_de": "/IN-tö-naat/"}'::jsonb,
        '{"term": "private school", "meaning": "escuela privada / colegio concertado", "de": "Privatschule", "ex": "The private school has excellent results.", "pron": "/prái-vet skul/", "pron_de": "/pri-VAAT-shuu-le/"}'::jsonb,
        '{"term": "state school", "meaning": "escuela pública", "de": "staatliche Schule", "ex": "Most children attend the local state school.", "pron": "/steit skul/", "pron_de": "/SHTAAT-li-je SHUU-le/"}'::jsonb,
        '{"term": "classroom", "meaning": "aula / sala de clase", "de": "Klassenzimmer", "ex": "The classroom has 30 students.", "pron": "/klás-rum/", "pron_de": "/KLA-sen-tsim-mer/"}'::jsonb,
        '{"term": "library", "meaning": "biblioteca", "de": "Bibliothek", "ex": "She went to the library to study for the exam.", "pron": "/lái-bra-ri/", "pron_de": "/bib-lio-TEK/"}'::jsonb,
        '{"term": "laboratory", "meaning": "laboratorio", "de": "Labor", "ex": "They did an experiment in the chemistry lab.", "pron": "/lá-bo-ra-to-ri/", "pron_de": "/la-BOR/"}'::jsonb,
        '{"term": "gymnasium", "meaning": "gimnasio escolar", "de": "Sporthalle", "ex": "They had PE class in the gymnasium.", "pron": "/dyim-néi-zi-om/", "pron_de": "/SHPORT-ha-le/"}'::jsonb,
        '{"term": "cafeteria", "meaning": "cafetería / comedor escolar", "de": "Mensa / Cafeteria", "ex": "Students eat lunch in the cafeteria.", "pron": "/ka-fi-tí-ria/", "pron_de": "/MEN-za/"}'::jsonb,
        '{"term": "playground", "meaning": "patio de recreo", "de": "Schulhof / Spielplatz", "ex": "Children play in the playground during break.", "pron": "/pléi-graund/", "pron_de": "/SHPIL-plats/"}'::jsonb,
        '{"term": "auditorium", "meaning": "auditorio", "de": "Aula / Auditorium", "ex": "The ceremony took place in the auditorium.", "pron": "/o-di-tó-rium/", "pron_de": "/au-di-TO-ri-um/"}'::jsonb,
        '{"term": "canteen", "meaning": "cantina / comedor", "de": "Kantine", "ex": "The canteen serves lunch from 12 to 2.", "pron": "/kan-tín/", "pron_de": "/kan-TI-ne/"}'::jsonb,
        '{"term": "dormitory", "meaning": "dormitorio / residencia universitaria", "de": "Wohnheim", "ex": "He lives in a university dormitory.", "pron": "/dór-mi-to-ri/", "pron_de": "/VOON-haim/"}'::jsonb,
        '{"term": "sports field", "meaning": "campo de deportes", "de": "Sportplatz", "ex": "Football practice is on the sports field.", "pron": "/sports fild/", "pron_de": "/SHPORT-plats/"}'::jsonb,
        '{"term": "corridor / hallway", "meaning": "pasillo / corredor", "de": "Flur / Gang", "ex": "Wait for me in the corridor.", "pron": "/kó-ri-dor/", "pron_de": "/FLUUR/"}'::jsonb,
        '{"term": "staff room", "meaning": "sala de profesores", "de": "Lehrerzimmer", "ex": "Teachers meet in the staff room.", "pron": "/staf rum/", "pron_de": "/LEE-rö-tsim-mer/"}'::jsonb,
        '{"term": "school office", "meaning": "secretaría / administración", "de": "Sekretariat", "ex": "Pick up your form at the school office.", "pron": "/skul ó-fis/", "pron_de": "/ze-kre-ta-ri-AAT/"}'::jsonb,
        '{"term": "locker", "meaning": "taquilla / casillero", "de": "Schließfach", "ex": "Put your bag in your locker.", "pron": "/ló-ker/", "pron_de": "/SHLIES-faj/"}'::jsonb,
        '{"term": "notice board", "meaning": "tablón de anuncios", "de": "Schwarzes Brett", "ex": "Check the notice board for updates.", "pron": "/nóu-tis bord/", "pron_de": "/SHVAR-tses BRET/"}'::jsonb,
        '{"term": "changing room", "meaning": "vestuario", "de": "Umkleideraum", "ex": "Get changed in the changing room.", "pron": "/chéin-ying rum/", "pron_de": "/UM-klai-de-raum/"}'::jsonb,
        '{"term": "student", "meaning": "estudiante / alumno", "de": "Schüler(in) / Student(in)", "ex": "She is a very dedicated student.", "pron": "/stú-dent/", "pron_de": "/SHÜÜ-lö/"}'::jsonb,
        '{"term": "teacher", "meaning": "profesor / maestra", "de": "Lehrer(in)", "ex": "Our teacher explained the lesson clearly.", "pron": "/tí-cher/", "pron_de": "/LEE-rö/"}'::jsonb,
        '{"term": "professor", "meaning": "profesor universitario / catedrático", "de": "Professor(in)", "ex": "The professor published a new book.", "pron": "/pro-fé-sor/", "pron_de": "/pro-FE-sö/"}'::jsonb,
        '{"term": "headmaster / principal", "meaning": "director / directora de escuela", "de": "Schulleiter(in)", "ex": "The principal addressed the students at assembly.", "pron": "/héd-más-ter/", "pron_de": "/SHUL-lai-tö/"}'::jsonb,
        '{"term": "classmate", "meaning": "compañero/a de clase", "de": "Klassenkamerad(in)", "ex": "She is one of my classmates.", "pron": "/klás-meit/", "pron_de": "/KLA-sen-ka-me-raat/"}'::jsonb,
        '{"term": "tutor", "meaning": "tutor / profesor particular", "de": "Tutor(in)", "ex": "He hired a tutor to help him with maths.", "pron": "/tú-tor/", "pron_de": "/TUU-tö/"}'::jsonb,
        '{"term": "dean", "meaning": "decano", "de": "Dekan(in)", "ex": "She spoke to the dean about the problem.", "pron": "/din/", "pron_de": "/de-KAAN/"}'::jsonb,
        '{"term": "substitute teacher", "meaning": "profesor sustituto", "de": "Vertretungslehrer(in)", "ex": "We had a substitute teacher today.", "pron": "/sáb-sti-tiut tí-cher/", "pron_de": "/fö-TREE-tungs-lee-rö/"}'::jsonb,
        '{"term": "librarian", "meaning": "bibliotecario/a", "de": "Bibliothekar(in)", "ex": "Ask the librarian for help finding the book.", "pron": "/lai-bré-rian/", "pron_de": "/bib-lio-te-KAAR/"}'::jsonb,
        '{"term": "school counsellor", "meaning": "orientador/a escolar", "de": "Schulberater(in)", "ex": "She spoke to the school counsellor about her worries.", "pron": "/skul káun-se-lor/", "pron_de": "/SHUL-bö-raa-tö/"}'::jsonb,
        '{"term": "exchange student", "meaning": "estudiante de intercambio", "de": "Austauschstudent(in)", "ex": "We have an exchange student from Japan.", "pron": "/eks-chéindy stú-dent/", "pron_de": "/AUS-tausch-shtu-dent/"}'::jsonb,
        '{"term": "classmates / peers", "meaning": "compañeros / iguales", "de": "Mitschüler(innen)", "ex": "He gets on well with all his classmates.", "pron": "/klás-meits/", "pron_de": "/MIT-shüü-lö/"}'::jsonb,
        '{"term": "textbook", "meaning": "libro de texto", "de": "Lehrbuch", "ex": "Open your textbook to page 45.", "pron": "/tékst-buk/", "pron_de": "/LEE-buj/"}'::jsonb,
        '{"term": "notebook", "meaning": "cuaderno", "de": "Heft / Notizbuch", "ex": "She took notes in her notebook.", "pron": "/nóut-buk/", "pron_de": "/NO-tits-buj/"}'::jsonb,
        '{"term": "pencil", "meaning": "lápiz", "de": "Bleistift", "ex": "Can I borrow your pencil?", "pron": "/pén-sel/", "pron_de": "/BLAI-shtift/"}'::jsonb,
        '{"term": "pen", "meaning": "bolígrafo / pluma", "de": "Kugelschreiber", "ex": "Sign the form with a pen.", "pron": "/pen/", "pron_de": "/KUU-göl-shrai-bö/"}'::jsonb,
        '{"term": "eraser", "meaning": "borrador / goma de borrar", "de": "Radiergummi", "ex": "Do you have an eraser I can use?", "pron": "/i-réi-ser/", "pron_de": "/ra-DEER-gu-mi/"}'::jsonb,
        '{"term": "ruler", "meaning": "regla", "de": "Lineal", "ex": "Use a ruler to draw a straight line.", "pron": "/rú-ler/", "pron_de": "/li-ne-AAL/"}'::jsonb,
        '{"term": "highlighter", "meaning": "rotulador fluorescente / marca-textos", "de": "Textmarker", "ex": "Use a highlighter for important sentences.", "pron": "/hái-lai-ter/", "pron_de": "/TEKST-maar-kö/"}'::jsonb,
        '{"term": "scissors", "meaning": "tijeras", "de": "Schere", "ex": "Cut along the line with scissors.", "pron": "/sí-sors/", "pron_de": "/SHE-re/"}'::jsonb,
        '{"term": "glue", "meaning": "pegamento / cola", "de": "Kleber / Klebstoff", "ex": "Use glue to stick the pieces together.", "pron": "/glu/", "pron_de": "/KLEE-bö/"}'::jsonb,
        '{"term": "calculator", "meaning": "calculadora", "de": "Taschenrechner", "ex": "You can use a calculator in the maths exam.", "pron": "/kal-kiu-léi-tor/", "pron_de": "/TA-shen-rej-nö/"}'::jsonb,
        '{"term": "backpack", "meaning": "mochila", "de": "Rucksack", "ex": "He carries all his books in his backpack.", "pron": "/bák-pak/", "pron_de": "/RUK-zak/"}'::jsonb,
        '{"term": "pencil case", "meaning": "estuche / portalápices", "de": "Mäppchen / Federmappe", "ex": "She keeps her pens in her pencil case.", "pron": "/pén-sel keis/", "pron_de": "/MÄP-jen/"}'::jsonb,
        '{"term": "whiteboard", "meaning": "pizarra blanca", "de": "Whiteboard / Tafel", "ex": "The teacher wrote on the whiteboard.", "pron": "/uáit-bord/", "pron_de": "/WAIT-bool/"}'::jsonb,
        '{"term": "blackboard", "meaning": "pizarra negra", "de": "Tafel", "ex": "The teacher drew a diagram on the blackboard.", "pron": "/blák-bord/", "pron_de": "/TAA-fel/"}'::jsonb,
        '{"term": "folder / binder", "meaning": "carpeta / archivador", "de": "Mappe / Ordner", "ex": "Keep all your worksheets in a folder.", "pron": "/fóul-der/", "pron_de": "/MAP-e/"}'::jsonb,
        '{"term": "workbook", "meaning": "libro de ejercicios / cuaderno de actividades", "de": "Arbeitsheft", "ex": "Complete exercises 1 to 5 in your workbook.", "pron": "/wérk-buk/", "pron_de": "/AR-baits-heft/"}'::jsonb,
        '{"term": "dictionary", "meaning": "diccionario", "de": "Wörterbuch", "ex": "Look up the word in the dictionary.", "pron": "/dík-shon-a-ri/", "pron_de": "/VÖR-tö-buj/"}'::jsonb,
        '{"term": "compass", "meaning": "compás", "de": "Zirkel", "ex": "Use a compass to draw a circle.", "pron": "/kám-pas/", "pron_de": "/TSIR-kel/"}'::jsonb,
        '{"term": "protractor", "meaning": "transportador", "de": "Winkelmesser / Geodreieck", "ex": "Use a protractor to measure the angle.", "pron": "/pro-trák-tor/", "pron_de": "/VIN-kel-me-sö/"}'::jsonb,
        '{"term": "marker / felt-tip pen", "meaning": "rotulador / marcador", "de": "Filzstift / Marker", "ex": "Write the title with a red marker.", "pron": "/már-ker/", "pron_de": "/FILTS-shtift/"}'::jsonb,
        '{"term": "sticky note", "meaning": "nota adhesiva / post-it", "de": "Haftnotiz", "ex": "She left a sticky note on the book.", "pron": "/stí-ki nout/", "pron_de": "/HAFT-no-tits/"}'::jsonb,
        '{"term": "stapler", "meaning": "grapadora", "de": "Hefter / Tacker", "ex": "Use the stapler to bind the pages.", "pron": "/stéi-pler/", "pron_de": "/HEF-tö/"}'::jsonb,
        '{"term": "maths / mathematics", "meaning": "matemáticas", "de": "Mathematik", "ex": "She is very good at maths.", "pron": "/mazs/", "pron_de": "/ma-te-ma-TIK/"}'::jsonb,
        '{"term": "science", "meaning": "ciencias", "de": "Naturwissenschaften", "ex": "We did a science experiment today.", "pron": "/sáiens/", "pron_de": "/na-TUUR-vi-sen-shaf-ten/"}'::jsonb,
        '{"term": "biology", "meaning": "biología", "de": "Biologie", "ex": "We studied cells in biology class.", "pron": "/bai-ó-lo-dyi/", "pron_de": "/bio-lo-GII/"}'::jsonb,
        '{"term": "chemistry", "meaning": "química", "de": "Chemie", "ex": "She loves chemistry experiments.", "pron": "/ké-mis-tri/", "pron_de": "/je-MII/"}'::jsonb,
        '{"term": "physics", "meaning": "física", "de": "Physik", "ex": "Physics is one of the hardest subjects.", "pron": "/fí-ziks/", "pron_de": "/füü-ZIK/"}'::jsonb,
        '{"term": "history", "meaning": "historia", "de": "Geschichte", "ex": "He loves learning about world history.", "pron": "/hís-to-ri/", "pron_de": "/gö-SHIJ-te/"}'::jsonb,
        '{"term": "geography", "meaning": "geografía", "de": "Geografie / Erdkunde", "ex": "We studied maps in geography today.", "pron": "/dyi-ó-gra-fi/", "pron_de": "/geo-gra-FII/"}'::jsonb,
        '{"term": "literature", "meaning": "literatura", "de": "Literatur", "ex": "They read Shakespeare in literature class.", "pron": "/lí-te-ra-cher/", "pron_de": "/li-te-ra-TUUR/"}'::jsonb,
        '{"term": "art", "meaning": "arte / dibujo", "de": "Kunst", "ex": "She painted a landscape in art class.", "pron": "/art/", "pron_de": "/KUNST/"}'::jsonb,
        '{"term": "music", "meaning": "música", "de": "Musik", "ex": "He plays violin in music class.", "pron": "/miú-zik/", "pron_de": "/mu-ZIK/"}'::jsonb,
        '{"term": "PE / physical education", "meaning": "educación física", "de": "Sport / Sportunterricht", "ex": "We play football in PE.", "pron": "/pii-ii/", "pron_de": "/SHPORT/"}'::jsonb,
        '{"term": "ICT / computer science", "meaning": "informática / TIC", "de": "Informatik", "ex": "She learned to code in ICT class.", "pron": "/ai-sii-tii/", "pron_de": "/in-for-ma-TIK/"}'::jsonb,
        '{"term": "drama / theatre", "meaning": "teatro / dramatismo", "de": "Darstellendes Spiel", "ex": "He got the lead role in the drama class play.", "pron": "/drá-ma/", "pron_de": "/DAR-shte-len-des SHPIL/"}'::jsonb,
        '{"term": "foreign language", "meaning": "idioma extranjero", "de": "Fremdsprache", "ex": "French is her favourite foreign language.", "pron": "/fó-ren láng-gwich/", "pron_de": "/FREMD-shpra-je/"}'::jsonb,
        '{"term": "religious education", "meaning": "religión / educación religiosa", "de": "Religionsunterricht", "ex": "They discuss world religions in RE.", "pron": "/ri-lí-yous e-dyu-kéi-shon/", "pron_de": "/re-li-gi-OUNS-un-tö-rijt/"}'::jsonb,
        '{"term": "economics", "meaning": "economía", "de": "Wirtschaft / Volkswirtschaft", "ex": "He chose economics as an elective.", "pron": "/ii-ko-nó-miks/", "pron_de": "/VIRT-shaft/"}'::jsonb,
        '{"term": "philosophy", "meaning": "filosofía", "de": "Philosophie", "ex": "She studies ethics in her philosophy class.", "pron": "/fi-ló-so-fi/", "pron_de": "/fi-lo-zo-FII/"}'::jsonb,
        '{"term": "study", "meaning": "estudiar", "de": "lernen / studieren", "ex": "She studies for two hours every evening.", "pron": "/stá-di/", "pron_de": "/LER-nen/"}'::jsonb,
        '{"term": "revise", "meaning": "repasar", "de": "wiederholen", "ex": "Revise your notes before the test.", "pron": "/ri-váiz/", "pron_de": "/vii-dö-HOO-len/"}'::jsonb,
        '{"term": "take notes", "meaning": "tomar apuntes", "de": "Notizen machen", "ex": "Take notes during the lecture.", "pron": "/teik nouts/", "pron_de": "/no-TI-tsen MA-jen/"}'::jsonb,
        '{"term": "research", "meaning": "investigar / investigación", "de": "forschen / Recherche", "ex": "She researched the topic in the library.", "pron": "/ri-séerch/", "pron_de": "/re-SHER-je/"}'::jsonb,
        '{"term": "submit", "meaning": "entregar / presentar", "de": "einreichen / abgeben", "ex": "Submit your essay before midnight.", "pron": "/sab-mít/", "pron_de": "/AIN-rai-jen/"}'::jsonb,
        '{"term": "present", "meaning": "presentar / exponer", "de": "präsentieren", "ex": "She will present her project to the class.", "pron": "/pri-zent/", "pron_de": "/prä-zen-TIR-en/"}'::jsonb,
        '{"term": "discuss", "meaning": "debatir / comentar", "de": "besprechen / diskutieren", "ex": "We discussed the poem in class.", "pron": "/dis-kás/", "pron_de": "/bö-SHPRE-jen/"}'::jsonb,
        '{"term": "memorise", "meaning": "memorizar / aprender de memoria", "de": "auswendig lernen", "ex": "Memorise the vocabulary list for Friday.", "pron": "/mé-mo-raiz/", "pron_de": "/AUS-ven-dij LER-nen/"}'::jsonb,
        '{"term": "concentrate", "meaning": "concentrarse", "de": "sich konzentrieren", "ex": "It is hard to concentrate with noise.", "pron": "/kón-sen-treit/", "pron_de": "/kon-tsen-TREER-en/"}'::jsonb,
        '{"term": "understand", "meaning": "entender / comprender", "de": "verstehen", "ex": "Do you understand the question?", "pron": "/an-der-stánd/", "pron_de": "/fö-SHTEE-en/"}'::jsonb,
        '{"term": "explain", "meaning": "explicar", "de": "erklären", "ex": "Can you explain this again, please?", "pron": "/eks-pléin/", "pron_de": "/ö-KLÄÄR-en/"}'::jsonb,
        '{"term": "read", "meaning": "leer", "de": "lesen", "ex": "Read the passage and answer the questions.", "pron": "/rid/", "pron_de": "/LEE-zen/"}'::jsonb,
        '{"term": "write", "meaning": "escribir", "de": "schreiben", "ex": "Write a paragraph about your holidays.", "pron": "/rait/", "pron_de": "/SHRAI-ben/"}'::jsonb,
        '{"term": "calculate", "meaning": "calcular", "de": "berechnen / rechnen", "ex": "Calculate the area of the rectangle.", "pron": "/kál-kiu-leit/", "pron_de": "/bö-REJ-nen/"}'::jsonb,
        '{"term": "draw", "meaning": "dibujar", "de": "zeichnen", "ex": "Draw a diagram to explain your answer.", "pron": "/dro/", "pron_de": "/TSAIJ-nen/"}'::jsonb,
        '{"term": "raise your hand", "meaning": "levantar la mano", "de": "die Hand heben", "ex": "Raise your hand if you have a question.", "pron": "/reiz yor hand/", "pron_de": "/dee HANT HEE-ben/"}'::jsonb,
        '{"term": "pay attention", "meaning": "prestar atención", "de": "aufpassen", "ex": "Pay attention during the lecture.", "pron": "/pei a-tén-shon/", "pron_de": "/AUF-pa-sen/"}'::jsonb,
        '{"term": "homework", "meaning": "tarea / deberes", "de": "Hausaufgaben", "ex": "Did you finish your homework?", "pron": "/hóum-work/", "pron_de": "/HAUS-auf-gaa-ben/"}'::jsonb,
        '{"term": "exam / test", "meaning": "examen / prueba", "de": "Prüfung / Test", "ex": "We have a maths exam tomorrow.", "pron": "/ig-zám/", "pron_de": "/PRÜÜ-fung/"}'::jsonb,
        '{"term": "oral exam", "meaning": "examen oral", "de": "mündliche Prüfung", "ex": "He is nervous about the oral exam.", "pron": "/ó-ral ig-zám/", "pron_de": "/MÜND-li-je PRÜÜ-fung/"}'::jsonb,
        '{"term": "mock exam", "meaning": "examen de práctica / simulacro", "de": "Probeprüfung", "ex": "We do a mock exam before the real one.", "pron": "/mok ig-zám/", "pron_de": "/PROO-be-prüü-fung/"}'::jsonb,
        '{"term": "quiz", "meaning": "cuestionario / mini-test", "de": "Quiz / kleiner Test", "ex": "There is a vocabulary quiz tomorrow.", "pron": "/kwiz/", "pron_de": "/KVIS/"}'::jsonb,
        '{"term": "multiple choice", "meaning": "opción múltiple", "de": "Multiple-Choice", "ex": "The test has 20 multiple choice questions.", "pron": "/mál-ti-pel chois/", "pron_de": "/MUL-ti-pel-chois/"}'::jsonb,
        '{"term": "assignment", "meaning": "tarea / trabajo", "de": "Aufgabe / Hausarbeit", "ex": "Submit the assignment by Friday.", "pron": "/a-sáin-ment/", "pron_de": "/AUF-gaa-be/"}'::jsonb,
        '{"term": "essay", "meaning": "redacción / ensayo", "de": "Aufsatz / Essay", "ex": "Write a 500-word essay on climate.", "pron": "/é-sei/", "pron_de": "/AUF-zats/"}'::jsonb,
        '{"term": "project", "meaning": "proyecto", "de": "Projekt", "ex": "Her science project won first place.", "pron": "/pró-dyekt/", "pron_de": "/pro-YEKT/"}'::jsonb,
        '{"term": "presentation", "meaning": "presentación", "de": "Präsentation / Vortrag", "ex": "He gave a presentation to the class.", "pron": "/pre-zen-téi-shon/", "pron_de": "/prä-zen-ta-TSIOON/"}'::jsonb,
        '{"term": "report card", "meaning": "boletín de notas", "de": "Zeugnis", "ex": "Parents receive the report card twice a year.", "pron": "/ri-port kard/", "pron_de": "/TSOI-gnis/"}'::jsonb,
        '{"term": "grade / mark", "meaning": "nota / calificación", "de": "Note / Bewertung", "ex": "She got a good grade on her essay.", "pron": "/greid/", "pron_de": "/NOO-te/"}'::jsonb,
        '{"term": "pass", "meaning": "aprobar", "de": "bestehen", "ex": "He passed all his exams.", "pron": "/pas/", "pron_de": "/bö-SHTEE-en/"}'::jsonb,
        '{"term": "fail", "meaning": "suspender / reprobar", "de": "nicht bestehen", "ex": "She failed the driving test twice.", "pron": "/feil/", "pron_de": "/NIJT bö-SHTEE-en/"}'::jsonb,
        '{"term": "resit", "meaning": "recuperación / examen de repetición", "de": "Nachprüfung", "ex": "He has to do a resit in September.", "pron": "/ri-sít/", "pron_de": "/NAAJ-prüü-fung/"}'::jsonb,
        '{"term": "lesson", "meaning": "lección / clase", "de": "Stunde / Unterricht", "ex": "Today is a lesson about fractions.", "pron": "/lé-son/", "pron_de": "/SHTUN-de/"}'::jsonb,
        '{"term": "subject", "meaning": "asignatura / materia", "de": "Schulfach", "ex": "What is your favourite subject?", "pron": "/sáb-dyekt/", "pron_de": "/SHUL-faj/"}'::jsonb,
        '{"term": "timetable", "meaning": "horario escolar", "de": "Stundenplan", "ex": "Check the timetable for your classes.", "pron": "/táim-tei-bel/", "pron_de": "/SHTUN-den-plan/"}'::jsonb,
        '{"term": "semester", "meaning": "semestre", "de": "Semester", "ex": "The new semester starts in September.", "pron": "/se-més-ter/", "pron_de": "/ze-MES-tö/"}'::jsonb,
        '{"term": "term", "meaning": "trimestre / período escolar", "de": "Schulhalbjahr / Trimester", "ex": "The school year has three terms.", "pron": "/term/", "pron_de": "/TRI-mes-tö/"}'::jsonb,
        '{"term": "academic year", "meaning": "año académico / año escolar", "de": "Schuljahr", "ex": "The academic year starts in September.", "pron": "/a-ka-dé-mik yier/", "pron_de": "/SHUL-yaar/"}'::jsonb,
        '{"term": "syllabus", "meaning": "programa / temario", "de": "Lehrplan / Stoffplan", "ex": "The syllabus covers three topics this term.", "pron": "/sí-la-bas/", "pron_de": "/LEE-plan/"}'::jsonb,
        '{"term": "curriculum", "meaning": "plan de estudios / currículo", "de": "Curriculum / Lehrplan", "ex": "The school revised its curriculum this year.", "pron": "/ke-rí-kiu-lom/", "pron_de": "/ku-RI-ku-lum/"}'::jsonb,
        '{"term": "compulsory subject", "meaning": "asignatura obligatoria", "de": "Pflichtfach", "ex": "Maths is a compulsory subject at this school.", "pron": "/kom-pál-so-ri sáb-dyekt/", "pron_de": "/PFLIJ-faj/"}'::jsonb,
        '{"term": "elective / optional subject", "meaning": "asignatura optativa", "de": "Wahlpflichtfach / Wahlfach", "ex": "Drama is an elective at our school.", "pron": "/i-lék-tiv/", "pron_de": "/VAAL-faj/"}'::jsonb,
        '{"term": "break / recess", "meaning": "recreo / descanso", "de": "Pause / Hofpause", "ex": "The children play outside during break.", "pron": "/breik/", "pron_de": "/PAU-ze/"}'::jsonb,
        '{"term": "lecture", "meaning": "conferencia / clase magistral", "de": "Vorlesung", "ex": "The lecture starts at nine and lasts an hour.", "pron": "/lék-cher/", "pron_de": "/FOR-lee-zung/"}'::jsonb,
        '{"term": "deadline", "meaning": "fecha límite / plazo", "de": "Abgabefrist", "ex": "The deadline for the report is Monday.", "pron": "/déd-lain/", "pron_de": "/AP-gaa-be-frist/"}'::jsonb,
        '{"term": "attendance", "meaning": "asistencia", "de": "Anwesenheit", "ex": "Attendance is mandatory at this school.", "pron": "/a-tén-dans/", "pron_de": "/AN-vee-zen-hait/"}'::jsonb,
        '{"term": "revision", "meaning": "repaso", "de": "Wiederholung", "ex": "Start revision a week before the exam.", "pron": "/ri-ví-shon/", "pron_de": "/vii-dö-HOO-lung/"}'::jsonb,
        '{"term": "field trip", "meaning": "excursión escolar", "de": "Schulausflug", "ex": "We went to the museum on a field trip.", "pron": "/fild trip/", "pron_de": "/SHUL-aus-fluk/"}'::jsonb,
        '{"term": "thesis", "meaning": "tesis", "de": "Abschlussarbeit / Dissertation", "ex": "She is writing her thesis on history.", "pron": "/zí-sis/", "pron_de": "/ap-SHLUS-aar-bait/"}'::jsonb,
        '{"term": "degree", "meaning": "título universitario / grado", "de": "Studienabschluss", "ex": "She has a degree in economics.", "pron": "/di-grí/", "pron_de": "/SHTUU-di-en-ap-shlus/"}'::jsonb,
        '{"term": "bachelor degree", "meaning": "grado universitario / licenciatura", "de": "Bachelorabschluss", "ex": "He finished his bachelor degree in three years.", "pron": "/bá-che-lor di-grí/", "pron_de": "/BA-jö-lor-ap-shlus/"}'::jsonb,
        '{"term": "master degree", "meaning": "máster / posgrado", "de": "Masterabschluss", "ex": "She did a master degree in marketing.", "pron": "/más-ter di-grí/", "pron_de": "/MAS-tö-ap-shlus/"}'::jsonb,
        '{"term": "PhD / doctorate", "meaning": "doctorado", "de": "Doktortitel / Promotion", "ex": "He is doing a PhD in chemistry.", "pron": "/pii-eitsh-dii/", "pron_de": "/dok-TOR-ti-tel/"}'::jsonb,
        '{"term": "diploma", "meaning": "diploma", "de": "Diplom", "ex": "She received a diploma in graphic design.", "pron": "/di-plóu-ma/", "pron_de": "/di-PLOOM/"}'::jsonb,
        '{"term": "certificate", "meaning": "certificado", "de": "Zertifikat", "ex": "He got a certificate in first aid.", "pron": "/sör-tí-fi-kit/", "pron_de": "/tsö-ti-fi-KAAT/"}'::jsonb,
        '{"term": "scholarship", "meaning": "beca", "de": "Stipendium", "ex": "He received a scholarship to study abroad.", "pron": "/skó-lar-ship/", "pron_de": "/shti-PEN-di-um/"}'::jsonb,
        '{"term": "graduation", "meaning": "graduación", "de": "Abschlussfeier", "ex": "Her graduation ceremony was very emotional.", "pron": "/gra-dyu-éi-shon/", "pron_de": "/AP-shlus-fai-ö/"}'::jsonb,
        '{"term": "enroll", "meaning": "matricularse / inscribirse", "de": "einschreiben", "ex": "Enroll before the registration deadline.", "pron": "/in-róul/", "pron_de": "/AIN-shrai-ben/"}'::jsonb,
        '{"term": "tuition", "meaning": "matrícula / tasas universitarias", "de": "Studiengebühren", "ex": "University tuition is very expensive.", "pron": "/tyu-í-shon/", "pron_de": "/SHTUU-di-en-gö-büü-ren/"}'::jsonb,
        '{"term": "internship", "meaning": "prácticas / pasantía", "de": "Praktikum", "ex": "She did an internship at a law firm.", "pron": "/ín-tern-ship/", "pron_de": "/PRAK-ti-kum/"}'::jsonb,
        '{"term": "extracurricular activity", "meaning": "actividad extraescolar", "de": "außerschulische Aktivität", "ex": "He joins many extracurricular activities.", "pron": "/eks-tra-ke-rí-kiu-lar/", "pron_de": "/aus-ö-SHUU-li-she/"}'::jsonb,
        '{"term": "study abroad", "meaning": "estudiar en el extranjero", "de": "Auslandsstudium", "ex": "She spent a year on a study abroad programme.", "pron": "/stá-di a-bród/", "pron_de": "/AUS-lands-shtuu-di-um/"}'::jsonb,
        '{"term": "alumni", "meaning": "ex alumnos / egresados", "de": "Alumni / Ehemalige", "ex": "The alumni fund helps current students.", "pron": "/a-lám-nai/", "pron_de": "/a-LUM-ni/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 855 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 855, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'La Escuela y la Universidad');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Schule und Universität');

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
