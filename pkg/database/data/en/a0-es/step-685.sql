-- ============================================================
-- Seed: A0 English Path – STEP 685 – Deck – Teléfono, Correo y Comunicaciones
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "phone", "meaning": "teléfono", "de": "Telefon", "ex": "She picked up the phone and called her mother.", "pron": "/foun/", "pron_de": "/te-le-FOON/"}'::jsonb,
        '{"term": "cell phone / mobile phone", "meaning": "teléfono celular / móvil", "de": "Handy / Mobiltelefon", "ex": "I left my cell phone at home.", "pron": "/sel foun/", "pron_de": "/HEN-di/"}'::jsonb,
        '{"term": "smartphone", "meaning": "teléfono inteligente", "de": "Smartphone", "ex": "He uses his smartphone for everything.", "pron": "/smárt-foun/", "pron_de": "/SMART-foun/"}'::jsonb,
        '{"term": "landline", "meaning": "teléfono fijo", "de": "Festnetztelefon", "ex": "They still have a landline at their home.", "pron": "/lánd-lain/", "pron_de": "/FEST-nets-te-le-foon/"}'::jsonb,
        '{"term": "tablet", "meaning": "tableta", "de": "Tablet", "ex": "She reads books on her tablet.", "pron": "/táb-let/", "pron_de": "/TAB-löt/"}'::jsonb,
        '{"term": "laptop", "meaning": "portátil / laptop", "de": "Laptop", "ex": "He does all his work on a laptop.", "pron": "/láp-top/", "pron_de": "/LAP-top/"}'::jsonb,
        '{"term": "computer", "meaning": "ordenador / computadora", "de": "Computer", "ex": "The school provides computers for students.", "pron": "/kom-piú-ter/", "pron_de": "/kom-PJUU-tö/"}'::jsonb,
        '{"term": "desktop computer", "meaning": "ordenador de sobremesa", "de": "Desktop-Computer", "ex": "The office uses desktop computers.", "pron": "/dék-stop kom-piú-ter/", "pron_de": "/DES-ktop-kom-pjuu-tö/"}'::jsonb,
        '{"term": "smartwatch", "meaning": "reloj inteligente", "de": "Smartwatch", "ex": "She checks her messages on her smartwatch.", "pron": "/smárt-uoch/", "pron_de": "/SMART-woch/"}'::jsonb,
        '{"term": "smart TV", "meaning": "televisión inteligente", "de": "Smart-TV", "ex": "Connect the smart TV to the internet.", "pron": "/smárt tii-vii/", "pron_de": "/SMART-tee-fau/"}'::jsonb,
        '{"term": "e-reader", "meaning": "lector de libros electrónicos", "de": "E-Reader / E-Book-Reader", "ex": "She has hundreds of books on her e-reader.", "pron": "/ii-rí-der/", "pron_de": "/EE-ree-dö/"}'::jsonb,
        '{"term": "keyboard", "meaning": "teclado", "de": "Tastatur", "ex": "She types quickly on her keyboard.", "pron": "/kí-bord/", "pron_de": "/tas-ta-TUUR/"}'::jsonb,
        '{"term": "mouse", "meaning": "ratón (de ordenador)", "de": "Maus", "ex": "Click the icon with the mouse.", "pron": "/máus/", "pron_de": "/MAUS/"}'::jsonb,
        '{"term": "monitor / screen", "meaning": "monitor / pantalla", "de": "Bildschirm / Monitor", "ex": "The monitor has a very sharp image.", "pron": "/mó-ni-tor/", "pron_de": "/BILD-shirm/"}'::jsonb,
        '{"term": "touchscreen", "meaning": "pantalla táctil", "de": "Touchscreen", "ex": "This phone has a large touchscreen.", "pron": "/tách-skrin/", "pron_de": "/TACH-skreen/"}'::jsonb,
        '{"term": "printer", "meaning": "impresora", "de": "Drucker", "ex": "Print the document with the office printer.", "pron": "/prín-ter/", "pron_de": "/DRU-kö/"}'::jsonb,
        '{"term": "scanner", "meaning": "escáner", "de": "Scanner", "ex": "Scan the document and send it by email.", "pron": "/ská-ner/", "pron_de": "/SKÄ-nö/"}'::jsonb,
        '{"term": "projector", "meaning": "proyector", "de": "Projektor / Beamer", "ex": "Connect the projector for the presentation.", "pron": "/pro-dyék-ter/", "pron_de": "/bii-MÖ/"}'::jsonb,
        '{"term": "webcam", "meaning": "cámara web", "de": "Webcam", "ex": "Turn on the webcam for the video call.", "pron": "/uéb-kam/", "pron_de": "/VEB-käm/"}'::jsonb,
        '{"term": "headphones", "meaning": "auriculares", "de": "Kopfhörer", "ex": "She listens to music with headphones.", "pron": "/héd-founz/", "pron_de": "/KOPF-hö-rö/"}'::jsonb,
        '{"term": "earbuds", "meaning": "auriculares intraurales / earbuds", "de": "Ohrstöpsel / In-Ear-Kopfhörer", "ex": "He uses wireless earbuds when running.", "pron": "/ír-bads/", "pron_de": "/OOR-shtöp-sel/"}'::jsonb,
        '{"term": "microphone", "meaning": "micrófono", "de": "Mikrofon", "ex": "Speak into the microphone clearly.", "pron": "/mái-kro-foun/", "pron_de": "/MI-kro-foon/"}'::jsonb,
        '{"term": "speaker", "meaning": "altavoz", "de": "Lautsprecher", "ex": "Turn up the speaker, I can not hear.", "pron": "/spí-ker/", "pron_de": "/LAUT-shpre-jö/"}'::jsonb,
        '{"term": "charger", "meaning": "cargador", "de": "Ladekabel / Ladegerät", "ex": "I forgot my charger at the hotel.", "pron": "/chár-yer/", "pron_de": "/LAA-de-gö-rät/"}'::jsonb,
        '{"term": "cable", "meaning": "cable", "de": "Kabel", "ex": "Connect the cable to the printer.", "pron": "/kéi-bel/", "pron_de": "/KAA-bel/"}'::jsonb,
        '{"term": "power bank", "meaning": "batería externa / power bank", "de": "Powerbank", "ex": "Charge your phone with a power bank on the go.", "pron": "/páu-er bank/", "pron_de": "/PAU-ö-bank/"}'::jsonb,
        '{"term": "battery", "meaning": "batería", "de": "Akku / Batterie", "ex": "My phone battery is almost dead.", "pron": "/bá-te-ri/", "pron_de": "/ÄK-ku/"}'::jsonb,
        '{"term": "adapter", "meaning": "adaptador", "de": "Adapter", "ex": "You need a travel adapter in the UK.", "pron": "/a-dáp-ter/", "pron_de": "/a-DAP-tö/"}'::jsonb,
        '{"term": "port", "meaning": "puerto (de conexión)", "de": "Anschluss / Port", "ex": "Plug the USB cable into the port.", "pron": "/port/", "pron_de": "/AN-shlus/"}'::jsonb,
        '{"term": "USB drive / flash drive", "meaning": "memoria USB / pendrive", "de": "USB-Stick", "ex": "Copy the file to the USB drive.", "pron": "/iú-es-bii draiv/", "pron_de": "/UU-ES-BEE-shtik/"}'::jsonb,
        '{"term": "memory card", "meaning": "tarjeta de memoria", "de": "Speicherkarte", "ex": "Put the memory card in the camera.", "pron": "/mé-mo-ri kard/", "pron_de": "/SHPAI-jö-kar-te/"}'::jsonb,
        '{"term": "SIM card", "meaning": "tarjeta SIM", "de": "SIM-Karte", "ex": "Insert the SIM card to activate the phone.", "pron": "/sim kard/", "pron_de": "/ZIM-kar-te/"}'::jsonb,
        '{"term": "hard drive", "meaning": "disco duro", "de": "Festplatte", "ex": "Back up your files to the hard drive.", "pron": "/hárd dráiv/", "pron_de": "/FEST-pla-te/"}'::jsonb,
        '{"term": "phone case", "meaning": "funda de teléfono", "de": "Handyhülle", "ex": "Buy a protective phone case.", "pron": "/foun keis/", "pron_de": "/HEN-di-hüü-le/"}'::jsonb,
        '{"term": "router", "meaning": "router / enrutador", "de": "Router", "ex": "Restart the router to fix the connection.", "pron": "/rú-ter/", "pron_de": "/RUU-tö/"}'::jsonb,
        '{"term": "Wi-Fi", "meaning": "wifi", "de": "WLAN / Wi-Fi", "ex": "What is the Wi-Fi password?", "pron": "/uái-fai/", "pron_de": "/WAI-fai/"}'::jsonb,
        '{"term": "internet", "meaning": "internet", "de": "Internet", "ex": "Do you have internet access here?", "pron": "/ín-ter-net/", "pron_de": "/IN-tö-net/"}'::jsonb,
        '{"term": "signal", "meaning": "señal", "de": "Signal / Empfang", "ex": "There is no signal in the mountains.", "pron": "/síg-nal/", "pron_de": "/ZIG-naal/"}'::jsonb,
        '{"term": "data", "meaning": "datos (móviles)", "de": "Daten / Mobilfunkdaten", "ex": "I used all my mobile data this month.", "pron": "/déi-ta/", "pron_de": "/DAA-ten/"}'::jsonb,
        '{"term": "roaming", "meaning": "itinerancia / roaming", "de": "Roaming", "ex": "Check roaming charges before travelling abroad.", "pron": "/róu-ming/", "pron_de": "/ROO-ming/"}'::jsonb,
        '{"term": "VPN", "meaning": "VPN / red privada virtual", "de": "VPN", "ex": "Use a VPN for a secure connection.", "pron": "/vii-pii-en/", "pron_de": "/VAU-PEE-EN/"}'::jsonb,
        '{"term": "firewall", "meaning": "cortafuegos / firewall", "de": "Firewall", "ex": "The firewall blocks dangerous websites.", "pron": "/fái-er-uol/", "pron_de": "/FAI-ö-wol/"}'::jsonb,
        '{"term": "Bluetooth", "meaning": "Bluetooth", "de": "Bluetooth", "ex": "Connect the keyboard via Bluetooth.", "pron": "/blú-tuz/", "pron_de": "/BLUU-tuus/"}'::jsonb,
        '{"term": "click", "meaning": "hacer clic / clicar", "de": "klicken", "ex": "Click on the icon to open the programme.", "pron": "/klik/", "pron_de": "/KLI-ken/"}'::jsonb,
        '{"term": "scroll", "meaning": "desplazarse / hacer scroll", "de": "scrollen", "ex": "Scroll down to see more results.", "pron": "/skroul/", "pron_de": "/SKRO-len/"}'::jsonb,
        '{"term": "swipe", "meaning": "deslizar (pantalla táctil)", "ex": "Swipe left to go back.", "de": "wischen / swipen", "pron": "/suaip/", "pron_de": "/SVAI-pen/"}'::jsonb,
        '{"term": "zoom in / zoom out", "meaning": "acercar / alejar", "de": "heranzoomen / herauszoomen", "ex": "Zoom in to read the small text.", "pron": "/zum in / zum aut/", "pron_de": "/HE-ran-tsuu-men/"}'::jsonb,
        '{"term": "copy", "meaning": "copiar", "de": "kopieren", "ex": "Copy the text and paste it here.", "pron": "/kó-pi/", "pron_de": "/ko-PIR-en/"}'::jsonb,
        '{"term": "paste", "meaning": "pegar (texto/archivo)", "de": "einfügen", "ex": "Paste the link into the browser.", "pron": "/peist/", "pron_de": "/AIN-füü-gen/"}'::jsonb,
        '{"term": "save", "meaning": "guardar (un archivo)", "de": "speichern", "ex": "Save the document before closing it.", "pron": "/seiv/", "pron_de": "/SHPAI-jörn/"}'::jsonb,
        '{"term": "delete", "meaning": "eliminar / borrar", "de": "löschen", "ex": "Delete the old files to free up space.", "pron": "/di-lít/", "pron_de": "/LÖ-shen/"}'::jsonb,
        '{"term": "install", "meaning": "instalar", "de": "installieren", "ex": "Install the update to fix the bugs.", "pron": "/in-stól/", "pron_de": "/in-shta-LIR-en/"}'::jsonb,
        '{"term": "uninstall", "meaning": "desinstalar", "de": "deinstallieren", "ex": "Uninstall the app if you do not use it.", "pron": "/an-in-stól/", "pron_de": "/de-in-shta-LIR-en/"}'::jsonb,
        '{"term": "update", "meaning": "actualizar", "de": "aktualisieren", "ex": "Update your phone for the latest features.", "pron": "/ap-déit/", "pron_de": "/ak-tua-li-ZIR-en/"}'::jsonb,
        '{"term": "restart", "meaning": "reiniciar / reiniciar el sistema", "de": "neu starten", "ex": "Restart the computer after the update.", "pron": "/ri-stárt/", "pron_de": "/NOI SHTAR-ten/"}'::jsonb,
        '{"term": "backup", "meaning": "copia de seguridad", "de": "Sicherung / Backup", "ex": "Make a backup of all your photos.", "pron": "/bák-ap/", "pron_de": "/SI-jö-rung/"}'::jsonb,
        '{"term": "cloud", "meaning": "nube (almacenamiento)", "de": "Cloud / Datenwolke", "ex": "Save your photos to the cloud.", "pron": "/klaud/", "pron_de": "/KLAUD/"}'::jsonb,
        '{"term": "storage", "meaning": "almacenamiento", "de": "Speicher", "ex": "My phone is out of storage space.", "pron": "/stó-rach/", "pron_de": "/SHPAI-jö/"}'::jsonb,
        '{"term": "browser", "meaning": "navegador", "de": "Browser", "ex": "Open the browser and search for it.", "pron": "/bráu-ser/", "pron_de": "/BRAU-zö/"}'::jsonb,
        '{"term": "website", "meaning": "sitio web / página web", "de": "Webseite", "ex": "Visit our website for more information.", "pron": "/uéb-sait/", "pron_de": "/VEB-zai-te/"}'::jsonb,
        '{"term": "URL / web address", "meaning": "URL / dirección web", "de": "URL / Webadresse", "ex": "Type the URL into the address bar.", "pron": "/iú-ar-el/", "pron_de": "/UU-ER-EL/"}'::jsonb,
        '{"term": "link / hyperlink", "meaning": "enlace / hipervínculo", "de": "Link / Hyperlink", "ex": "Click the link to visit the page.", "pron": "/link/", "pron_de": "/LINK/"}'::jsonb,
        '{"term": "bookmark", "meaning": "marcador / favorito", "de": "Lesezeichen", "ex": "Bookmark this page so you can find it later.", "pron": "/búk-mark/", "pron_de": "/LEE-ze-tsai-jen/"}'::jsonb,
        '{"term": "search engine", "meaning": "motor de búsqueda", "de": "Suchmaschine", "ex": "Use a search engine to find the answer.", "pron": "/serch én-dyin/", "pron_de": "/ZUUJ-ma-shii-ne/"}'::jsonb,
        '{"term": "search", "meaning": "buscar", "de": "suchen", "ex": "Search for the nearest restaurant online.", "pron": "/serch/", "pron_de": "/ZUU-jen/"}'::jsonb,
        '{"term": "homepage", "meaning": "página de inicio", "de": "Startseite / Homepage", "ex": "Set your favourite site as your homepage.", "pron": "/hóum-peidyi/", "pron_de": "/SHTAR-tzai-te/"}'::jsonb,
        '{"term": "tab", "meaning": "pestaña (del navegador)", "de": "Tab / Registerkarte", "ex": "Open a new tab for each search.", "pron": "/tab/", "pron_de": "/TAP/"}'::jsonb,
        '{"term": "password", "meaning": "contraseña", "de": "Passwort", "ex": "Do not share your password with anyone.", "pron": "/pás-uord/", "pron_de": "/PASS-wort/"}'::jsonb,
        '{"term": "username", "meaning": "nombre de usuario", "de": "Benutzername", "ex": "Enter your username and password.", "pron": "/iú-zer-neim/", "pron_de": "/bö-NUU-tsö-naa-me/"}'::jsonb,
        '{"term": "log in", "meaning": "iniciar sesión", "de": "einloggen / anmelden", "ex": "Log in with your email and password.", "pron": "/log ín/", "pron_de": "/AIN-lo-gen/"}'::jsonb,
        '{"term": "log out", "meaning": "cerrar sesión", "de": "ausloggen / abmelden", "ex": "Always log out on shared computers.", "pron": "/log áut/", "pron_de": "/AUS-lo-gen/"}'::jsonb,
        '{"term": "privacy settings", "meaning": "configuración de privacidad", "de": "Datenschutzeinstellungen", "ex": "Review your privacy settings regularly.", "pron": "/práiv-a-si sé-tings/", "pron_de": "/DAA-ten-shuts-ain-shte-lung-en/"}'::jsonb,
        '{"term": "email", "meaning": "correo electrónico / email", "de": "E-Mail", "ex": "Send me the document by email.", "pron": "/í-meil/", "pron_de": "/EE-mejl/"}'::jsonb,
        '{"term": "inbox", "meaning": "bandeja de entrada", "de": "Posteingang", "ex": "I have 50 unread messages in my inbox.", "pron": "/ín-boks/", "pron_de": "/POST-ain-gang/"}'::jsonb,
        '{"term": "outbox", "meaning": "bandeja de salida", "de": "Postausgang", "ex": "Check the outbox if the email did not send.", "pron": "/áut-boks/", "pron_de": "/POST-aus-gang/"}'::jsonb,
        '{"term": "attachment", "meaning": "archivo adjunto", "de": "Anhang", "ex": "Please open the attachment I sent.", "pron": "/a-tách-ment/", "pron_de": "/AN-hang/"}'::jsonb,
        '{"term": "reply", "meaning": "responder (un mensaje)", "de": "antworten / antworten auf", "ex": "Reply to the email as soon as possible.", "pron": "/ri-plái/", "pron_de": "/ANT-wor-ten/"}'::jsonb,
        '{"term": "reply all", "meaning": "responder a todos", "de": "allen antworten", "ex": "Use reply all so everyone sees the answer.", "pron": "/ri-plái ol/", "pron_de": "/A-len ANT-wor-ten/"}'::jsonb,
        '{"term": "forward", "meaning": "reenviar (un mensaje)", "de": "weiterleiten", "ex": "Forward the email to the whole team.", "pron": "/fór-uord/", "pron_de": "/VAI-tö-lai-ten/"}'::jsonb,
        '{"term": "cc", "meaning": "con copia (CC)", "de": "CC (Kopie)", "ex": "Add her to the CC field.", "pron": "/sii-sii/", "pron_de": "/TSEE-TSEE/"}'::jsonb,
        '{"term": "subject line", "meaning": "asunto (del correo)", "de": "Betreffzeile", "ex": "Write a clear subject line for every email.", "pron": "/sáb-dyekt lain/", "pron_de": "/bö-TREF-tsai-le/"}'::jsonb,
        '{"term": "spam", "meaning": "correo basura / spam", "de": "Spam", "ex": "This email looks like spam.", "pron": "/spam/", "pron_de": "/SHPAM/"}'::jsonb,
        '{"term": "subscribe", "meaning": "suscribirse", "de": "abonnieren", "ex": "Subscribe to the newsletter for updates.", "pron": "/sab-skráib/", "pron_de": "/a-bo-NIR-en/"}'::jsonb,
        '{"term": "unsubscribe", "meaning": "darse de baja / desuscribirse", "de": "abbestellen", "ex": "Click here to unsubscribe from this list.", "pron": "/an-sab-skráib/", "pron_de": "/AP-bö-shte-len/"}'::jsonb,
        '{"term": "call", "meaning": "llamada / llamar", "de": "Anruf / anrufen", "ex": "I will give you a call tonight.", "pron": "/kol/", "pron_de": "/AN-ruf/"}'::jsonb,
        '{"term": "dial", "meaning": "marcar (un número)", "de": "wählen", "ex": "Dial the number and press call.", "pron": "/dáil/", "pron_de": "/VÄÄ-len/"}'::jsonb,
        '{"term": "ring", "meaning": "sonar / llamar", "de": "klingeln", "ex": "The phone rings every morning at seven.", "pron": "/ring/", "pron_de": "/KLING-eln/"}'::jsonb,
        '{"term": "pick up", "meaning": "contestar (el teléfono)", "de": "abnehmen", "ex": "Please pick up when I call.", "pron": "/pik áp/", "pron_de": "/AP-nee-men/"}'::jsonb,
        '{"term": "hang up", "meaning": "colgar (el teléfono)", "de": "auflegen", "ex": "She hung up before I could explain.", "pron": "/hang áp/", "pron_de": "/AUF-lee-gen/"}'::jsonb,
        '{"term": "call back", "meaning": "devolver la llamada", "de": "zurückrufen", "ex": "I will call you back in five minutes.", "pron": "/kol bak/", "pron_de": "/tsu-RÜK-ruu-fen/"}'::jsonb,
        '{"term": "missed call", "meaning": "llamada perdida", "de": "verpasster Anruf", "ex": "I had three missed calls from my boss.", "pron": "/mist kol/", "pron_de": "/fö-PAS-tö AN-ruf/"}'::jsonb,
        '{"term": "voicemail", "meaning": "buzón de voz / mensaje de voz", "de": "Voicemail", "ex": "Please leave a voicemail after the beep.", "pron": "/vóis-meil/", "pron_de": "/WOISS-mejl/"}'::jsonb,
        '{"term": "put on hold", "meaning": "poner en espera", "de": "in die Warteschleife legen", "ex": "The operator put me on hold for ten minutes.", "pron": "/put on hould/", "pron_de": "/WAR-te-shlai-fe/"}'::jsonb,
        '{"term": "video call", "meaning": "videollamada", "de": "Videoanruf", "ex": "We had a video call with the whole team.", "pron": "/ví-di-ou kol/", "pron_de": "/VI-de-o-an-ruf/"}'::jsonb,
        '{"term": "conference call", "meaning": "llamada de conferencia", "de": "Telefonkonferenz", "ex": "We have a conference call at two o clock.", "pron": "/kón-fe-rens kol/", "pron_de": "/te-le-FOON-kon-fe-rens/"}'::jsonb,
        '{"term": "hands-free", "meaning": "manos libres", "de": "Freisprechen", "ex": "Use hands-free while driving.", "pron": "/hándz-fríi/", "pron_de": "/FRAI-shpre-jen/"}'::jsonb,
        '{"term": "speakerphone", "meaning": "altavoz del teléfono", "de": "Lautsprecher (Telefon)", "ex": "She put the call on speakerphone.", "pron": "/spí-ker-foun/", "pron_de": "/LAUT-shpre-jö/"}'::jsonb,
        '{"term": "mute", "meaning": "silenciar / mutear", "de": "stummschalten", "ex": "Mute your microphone during the meeting.", "pron": "/miut/", "pron_de": "/SHTUM-shal-ten/"}'::jsonb,
        '{"term": "ringtone", "meaning": "tono de llamada", "de": "Klingelton", "ex": "She set a funny ringtone for her mum.", "pron": "/ríng-toun/", "pron_de": "/KLING-el-toon/"}'::jsonb,
        '{"term": "area code", "meaning": "prefijo / código de área", "de": "Vorwahl", "ex": "The area code for London is 020.", "pron": "/é-ria koud/", "pron_de": "/FOR-vaal/"}'::jsonb,
        '{"term": "phone number", "meaning": "número de teléfono", "de": "Telefonnummer", "ex": "Can I have your phone number?", "pron": "/foun nám-ber/", "pron_de": "/te-le-FOON-nu-mö/"}'::jsonb,
        '{"term": "phonebook / contacts", "meaning": "agenda / contactos", "de": "Telefonbuch / Kontakte", "ex": "Save her number in your contacts.", "pron": "/fóun-buk/", "pron_de": "/te-le-FOON-buj/"}'::jsonb,
        '{"term": "operator", "meaning": "operador / telefonista", "de": "Vermittlung / Anbieter", "ex": "Press 1 to speak with an operator.", "pron": "/ó-pe-rei-tor/", "pron_de": "/fö-MIT-lung/"}'::jsonb,
        '{"term": "text message / SMS", "meaning": "mensaje de texto / SMS", "de": "SMS / Textnachricht", "ex": "Send me a text message when you arrive.", "pron": "/tekst mé-sich/", "pron_de": "/ES-EM-ES/"}'::jsonb,
        '{"term": "instant message", "meaning": "mensaje instantáneo", "de": "Sofortnachricht", "ex": "She sent an instant message on the app.", "pron": "/ín-stant mé-sich/", "pron_de": "/ZO-fort-naj-rijt/"}'::jsonb,
        '{"term": "group chat", "meaning": "chat grupal", "de": "Gruppenchat", "ex": "Add everyone to the group chat.", "pron": "/grup chat/", "pron_de": "/GRU-pen-chet/"}'::jsonb,
        '{"term": "voice message", "meaning": "mensaje de voz", "de": "Sprachnachricht", "ex": "She sent a voice message instead of typing.", "pron": "/vóis mé-sich/", "pron_de": "/SHPRAJ-naj-rijt/"}'::jsonb,
        '{"term": "emoji", "meaning": "emoji / emoticono", "de": "Emoji", "ex": "She ended the message with a happy emoji.", "pron": "/i-mó-dyi/", "pron_de": "/e-MO-dyi/"}'::jsonb,
        '{"term": "sticker", "meaning": "sticker / pegatina digital", "de": "Sticker", "ex": "He uses stickers instead of words.", "pron": "/stí-ker/", "pron_de": "/SHTI-kö/"}'::jsonb,
        '{"term": "GIF", "meaning": "GIF / imagen animada", "de": "GIF", "ex": "She replied with a funny GIF.", "pron": "/dyif/", "pron_de": "/DIF/"}'::jsonb,
        '{"term": "notification", "meaning": "notificación", "de": "Benachrichtigung", "ex": "I turned off notifications to focus on work.", "pron": "/no-ti-fi-kéi-shon/", "pron_de": "/bö-NACH-rij-ti-gung/"}'::jsonb,
        '{"term": "social media", "meaning": "redes sociales", "de": "soziale Medien", "ex": "She spends too much time on social media.", "pron": "/sóu-shal mí-dia/", "pron_de": "/ZO-tsia-le ME-di-en/"}'::jsonb,
        '{"term": "post", "meaning": "publicar / publicación", "de": "posten / Beitrag", "ex": "She posted a photo on her feed.", "pron": "/poust/", "pron_de": "/POS-ten/"}'::jsonb,
        '{"term": "share", "meaning": "compartir", "de": "teilen", "ex": "Share the article with your friends.", "pron": "/sher/", "pron_de": "/TAI-len/"}'::jsonb,
        '{"term": "like", "meaning": "dar me gusta / like", "de": "liken / gefällt mir", "ex": "The photo got two hundred likes.", "pron": "/laik/", "pron_de": "/LAI-ken/"}'::jsonb,
        '{"term": "comment", "meaning": "comentar / comentario", "de": "kommentieren / Kommentar", "ex": "Leave a comment below the video.", "pron": "/kó-ment/", "pron_de": "/ko-men-TIR-en/"}'::jsonb,
        '{"term": "follow", "meaning": "seguir (en redes)", "de": "folgen", "ex": "Follow the account for daily updates.", "pron": "/fó-lou/", "pron_de": "/FOL-gen/"}'::jsonb,
        '{"term": "block", "meaning": "bloquear (a alguien)", "de": "blockieren / sperren", "ex": "Block the account if it is spam.", "pron": "/blok/", "pron_de": "/blo-KIR-en/"}'::jsonb,
        '{"term": "hashtag", "meaning": "hashtag / etiqueta", "de": "Hashtag", "ex": "Add a hashtag to reach more people.", "pron": "/hásh-tag/", "pron_de": "/HASH-tek/"}'::jsonb,
        '{"term": "mention", "meaning": "mencionar / mención", "de": "erwähnen / Erwähnung", "ex": "She mentioned me in the post.", "pron": "/mén-shon/", "pron_de": "/ö-VÄÄ-nen/"}'::jsonb,
        '{"term": "story", "meaning": "historia (en redes sociales)", "de": "Story", "ex": "She posts a story every day.", "pron": "/stó-ri/", "pron_de": "/SHTO-ri/"}'::jsonb,
        '{"term": "reel / short video", "meaning": "reel / vídeo corto", "de": "Reel / Kurzclip", "ex": "He made a funny reel of his cat.", "pron": "/ril/", "pron_de": "/RIIL/"}'::jsonb,
        '{"term": "live stream", "meaning": "transmisión en directo", "de": "Livestream", "ex": "She did a live stream of the concert.", "pron": "/laiv strim/", "pron_de": "/LAIV-streem/"}'::jsonb,
        '{"term": "podcast", "meaning": "podcast", "de": "Podcast", "ex": "I listen to a podcast on the way to work.", "pron": "/pód-kast/", "pron_de": "/POT-kaast/"}'::jsonb,
        '{"term": "streaming", "meaning": "streaming / reproducción en línea", "de": "Streaming", "ex": "We watch films by streaming at home.", "pron": "/strí-ming/", "pron_de": "/STRII-ming/"}'::jsonb,
        '{"term": "download", "meaning": "descargar", "de": "herunterladen", "ex": "Download the app from the app store.", "pron": "/daun-lóud/", "pron_de": "/hö-RUN-tö-laa-den/"}'::jsonb,
        '{"term": "upload", "meaning": "subir / cargar (un archivo)", "de": "hochladen", "ex": "Upload the photo to the website.", "pron": "/ap-lóud/", "pron_de": "/HOJ-laa-den/"}'::jsonb,
        '{"term": "app", "meaning": "aplicación / app", "de": "App", "ex": "There is an app for that.", "pron": "/ap/", "pron_de": "/ÄP/"}'::jsonb,
        '{"term": "app store", "meaning": "tienda de aplicaciones", "de": "App-Store", "ex": "Download it for free from the app store.", "pron": "/ap stor/", "pron_de": "/ÄP-stor/"}'::jsonb,
        '{"term": "letter", "meaning": "carta", "de": "Brief", "ex": "She wrote a letter to her grandmother.", "pron": "/lé-ter/", "pron_de": "/BRIEF/"}'::jsonb,
        '{"term": "envelope", "meaning": "sobre", "de": "Umschlag", "ex": "Put the letter in the envelope and seal it.", "pron": "/én-ve-loup/", "pron_de": "/UM-shlaak/"}'::jsonb,
        '{"term": "stamp", "meaning": "sello / estampilla", "de": "Briefmarke", "ex": "You need a stamp to send a letter abroad.", "pron": "/stamp/", "pron_de": "/BRIEF-maar-ke/"}'::jsonb,
        '{"term": "postcard", "meaning": "postal / tarjeta postal", "de": "Postkarte", "ex": "He sent me a postcard from Paris.", "pron": "/póust-kard/", "pron_de": "/POST-kaar-te/"}'::jsonb,
        '{"term": "package / parcel", "meaning": "paquete", "de": "Paket", "ex": "There is a package for you at the reception.", "pron": "/pá-kach/", "pron_de": "/pa-KET/"}'::jsonb,
        '{"term": "mailbox", "meaning": "buzón", "de": "Briefkasten", "ex": "Check the mailbox for any mail.", "pron": "/méil-boks/", "pron_de": "/BRIEF-kas-ten/"}'::jsonb,
        '{"term": "postman / mail carrier", "meaning": "cartero", "de": "Briefträger / Postbote", "ex": "The postman delivers mail every morning.", "pron": "/póust-man/", "pron_de": "/BRIEF-trä-gö/"}'::jsonb,
        '{"term": "post office", "meaning": "oficina de correos", "de": "Postamt", "ex": "I need to go to the post office to send this package.", "pron": "/poust ó-fis/", "pron_de": "/POST-amt/"}'::jsonb,
        '{"term": "delivery", "meaning": "entrega", "de": "Lieferung / Zustellung", "ex": "The delivery is scheduled for tomorrow.", "pron": "/di-lí-ve-ri/", "pron_de": "/LII-fö-rung/"}'::jsonb,
        '{"term": "sender", "meaning": "remitente", "de": "Absender", "ex": "Write the sender address on the back.", "pron": "/sén-der/", "pron_de": "/AP-zen-dö/"}'::jsonb,
        '{"term": "recipient", "meaning": "destinatario", "de": "Empfänger", "ex": "Make sure the recipient address is correct.", "pron": "/ri-sí-pi-ent/", "pron_de": "/emp-FÄNG-ö/"}'::jsonb,
        '{"term": "address", "meaning": "dirección (postal)", "de": "Adresse", "ex": "Write the full address on the envelope.", "pron": "/a-drés/", "pron_de": "/a-DRE-se/"}'::jsonb,
        '{"term": "postcode / zip code", "meaning": "código postal", "de": "Postleitzahl", "ex": "Do not forget to include the postcode.", "pron": "/póust-koud/", "pron_de": "/POST-laits-tsaal/"}'::jsonb,
        '{"term": "tracking number", "meaning": "número de seguimiento", "de": "Sendungsnummer", "ex": "Use the tracking number to follow your package.", "pron": "/trá-king nám-ber/", "pron_de": "/ZEN-dungs-num-mer/"}'::jsonb,
        '{"term": "registered mail", "meaning": "correo certificado", "de": "Einschreiben", "ex": "Send it by registered mail to be safe.", "pron": "/ré-yis-terd meil/", "pron_de": "/AIN-shrai-ben/"}'::jsonb,
        '{"term": "express delivery", "meaning": "entrega urgente / exprés", "de": "Expresslieferung", "ex": "Pay extra for express delivery.", "pron": "/eks-prés di-lí-ve-ri/", "pron_de": "/eks-PRES-lii-fö-rung/"}'::jsonb,
        '{"term": "courier", "meaning": "mensajero / servicio de mensajería", "de": "Kurierdienst", "ex": "Send it by courier for next-day delivery.", "pron": "/kú-ri-er/", "pron_de": "/ku-REER-dinst/"}'::jsonb,
        '{"term": "fragile", "meaning": "frágil", "de": "zerbrechlich", "ex": "Mark the box as fragile.", "pron": "/frá-dyail/", "pron_de": "/tsö-BREJ-lij/"}'::jsonb,
        '{"term": "customs", "meaning": "aduana", "de": "Zoll", "ex": "The package was held at customs.", "pron": "/kás-toms/", "pron_de": "/TSOL/"}'::jsonb,
        '{"term": "airmail", "meaning": "correo aéreo", "de": "Luftpost", "ex": "Send the letter by airmail to arrive faster.", "pron": "/ér-meil/", "pron_de": "/LUFT-post/"}'::jsonb,
        '{"term": "PO box", "meaning": "apartado de correos", "de": "Postfach", "ex": "Some businesses use a PO box for mail.", "pron": "/pii-ou boks/", "pron_de": "/POST-faj/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 685 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 685, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'Teléfono, Correo y Comunicaciones');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Telefon, Post und Kommunikation');

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
