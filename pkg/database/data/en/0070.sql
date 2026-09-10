-- ============================================================
-- Seed: English Path – Step 0070 – Deck
-- Title:       Informacion Personal y Demografia
-- Description: Nacionalidades, adjetivos de origen, estado civil e informacion de contacto.
-- Source language: en  |  Translation: es
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_deck_uuid UUID;
  v_en_uuid UUID;
  v_es_uuid UUID;
  item JSONB;

  v_terms JSONB[] := ARRAY[
    -- Identidad y datos personales
    '{"en": "personal information", "es": "informacion personal", "pron": "/pér-si-nal in-fer-méi-shan/"}'::jsonb,
    '{"en": "demographic information", "es": "informacion demografica", "pron": "/de-mag-rá-fik in-fer-méi-shan/"}'::jsonb,
    '{"en": "profile", "es": "perfil", "pron": "/próu-fail/"}'::jsonb,
    '{"en": "identity", "es": "identidad", "pron": "/ai-dén-ti-ti/"}'::jsonb,
    '{"en": "identity document", "es": "documento de identidad", "pron": "/ai-dén-ti-ti dák-ia-ment/"}'::jsonb,
    '{"en": "person", "es": "persona", "pron": "/pér-san/"}'::jsonb,
    '{"en": "people", "es": "personas", "pron": "/pí-pal/"}'::jsonb,
    '{"en": "full name", "es": "nombre completo", "pron": "/fúl néim/"}'::jsonb,
    '{"en": "first name", "es": "nombre", "pron": "/férst néim/"}'::jsonb,
    '{"en": "middle name", "es": "segundo nombre", "pron": "/mí-dal néim/"}'::jsonb,
    '{"en": "last name", "es": "apellido", "pron": "/lást néim/"}'::jsonb,
    '{"en": "family name", "es": "apellido familiar", "pron": "/fá-ma-li néim/"}'::jsonb,
    '{"en": "surname", "es": "apellido", "pron": "/sér-neim/"}'::jsonb,
    '{"en": "legal name", "es": "nombre legal", "pron": "/lí-gal néim/"}'::jsonb,
    '{"en": "preferred name", "es": "nombre preferido", "pron": "/pra-férd néim/"}'::jsonb,
    '{"en": "nickname", "es": "apodo", "pron": "/ník-neim/"}'::jsonb,
    '{"en": "maiden name", "es": "apellido de soltera", "pron": "/méi-dan néim/"}'::jsonb,
    '{"en": "date of birth", "es": "fecha de nacimiento", "pron": "/déit áv bérz/"}'::jsonb,
    '{"en": "place of birth", "es": "lugar de nacimiento", "pron": "/pléis áv bérz/"}'::jsonb,
    '{"en": "city of birth", "es": "ciudad de nacimiento", "pron": "/sí-ti áv bérz/"}'::jsonb,
    '{"en": "country of birth", "es": "pais de nacimiento", "pron": "/kánt-ri áv bérz/"}'::jsonb,
    '{"en": "age", "es": "edad", "pron": "/éiy/"}'::jsonb,
    '{"en": "years old", "es": "anos", "pron": "/iírz óuld/"}'::jsonb,
    '{"en": "birth year", "es": "ano de nacimiento", "pron": "/bérz iír/"}'::jsonb,
    '{"en": "gender", "es": "genero", "pron": "/yén-der/"}'::jsonb,
    '{"en": "sex", "es": "sexo", "pron": "/séks/"}'::jsonb,
    '{"en": "male", "es": "masculino", "pron": "/méil/"}'::jsonb,
    '{"en": "female", "es": "femenino", "pron": "/fí-meil/"}'::jsonb,
    '{"en": "non-binary", "es": "no binario", "pron": "/nán-bái-ner-i/"}'::jsonb,
    '{"en": "marital status", "es": "estado civil", "pron": "/mé-ra-tal stá-tas/"}'::jsonb,
    '{"en": "single", "es": "soltero/a", "pron": "/síng-gal/"}'::jsonb,
    '{"en": "married", "es": "casado/a", "pron": "/mé-rid/"}'::jsonb,
    '{"en": "separated", "es": "separado/a", "pron": "/sé-per-ei-tid/"}'::jsonb,
    '{"en": "divorced", "es": "divorciado/a", "pron": "/di-vórst/"}'::jsonb,
    '{"en": "widowed", "es": "viudo/a", "pron": "/uí-doud/"}'::jsonb,
    '{"en": "engaged", "es": "comprometido/a", "pron": "/en-géiyd/"}'::jsonb,
    '{"en": "spouse", "es": "conyuge", "pron": "/spáus/"}'::jsonb,
    '{"en": "husband", "es": "esposo", "pron": "/ház-band/"}'::jsonb,
    '{"en": "wife", "es": "esposa", "pron": "/uáif/"}'::jsonb,
    '{"en": "partner", "es": "pareja", "pron": "/párt-ner/"}'::jsonb,
    '{"en": "civil union", "es": "union civil", "pron": "/sí-val iún-ian/"}'::jsonb,
    '{"en": "common-law partner", "es": "pareja de hecho", "pron": "/ká-man-ló párt-ner/"}'::jsonb,
    '{"en": "household", "es": "hogar", "pron": "/háus-hould/"}'::jsonb,
    '{"en": "household size", "es": "tamano del hogar", "pron": "/háus-hould sáiz/"}'::jsonb,
    '{"en": "dependent", "es": "dependiente", "pron": "/di-pén-dant/"}'::jsonb,
    '{"en": "child", "es": "hijo/a", "pron": "/cháild/"}'::jsonb,
    '{"en": "parent", "es": "padre o madre", "pron": "/pé-rant/"}'::jsonb,
    '{"en": "mother", "es": "madre", "pron": "/má-zer/"}'::jsonb,
    '{"en": "father", "es": "padre", "pron": "/fá-zer/"}'::jsonb,
    '{"en": "guardian", "es": "tutor/a", "pron": "/gár-di-an/"}'::jsonb,
    '{"en": "emergency contact", "es": "contacto de emergencia", "pron": "/i-mér-yan-si kán-takt/"}'::jsonb,
    '{"en": "relationship", "es": "relacion", "pron": "/ri-léi-shan-ship/"}'::jsonb,
    '{"en": "occupation", "es": "ocupacion", "pron": "/ak-ia-péi-shan/"}'::jsonb,
    '{"en": "profession", "es": "profesion", "pron": "/pra-fé-shan/"}'::jsonb,
    '{"en": "job title", "es": "puesto de trabajo", "pron": "/yáb tái-tal/"}'::jsonb,
    '{"en": "employer", "es": "empleador", "pron": "/emp-lói-er/"}'::jsonb,
    '{"en": "employee", "es": "empleado/a", "pron": "/emp-lói-i/"}'::jsonb,
    '{"en": "self-employed", "es": "autonomo/a", "pron": "/sélf-emp-lóid/"}'::jsonb,
    '{"en": "unemployed", "es": "desempleado/a", "pron": "/a-nemp-lóid/"}'::jsonb,
    '{"en": "retired", "es": "jubilado/a", "pron": "/ri-táird/"}'::jsonb,
    '{"en": "student", "es": "estudiante", "pron": "/stú-dant/"}'::jsonb,
    '{"en": "education level", "es": "nivel educativo", "pron": "/e-ya-kéi-shan lé-val/"}'::jsonb,
    '{"en": "native language", "es": "lengua materna", "pron": "/néi-tiv lángg-uay/"}'::jsonb,
    '{"en": "second language", "es": "segunda lengua", "pron": "/sé-kand lángg-uay/"}'::jsonb,
    '{"en": "fluent", "es": "fluido/a", "pron": "/flú-ant/"}'::jsonb,
    '{"en": "beginner", "es": "principiante", "pron": "/bi-gí-ner/"}'::jsonb,
    '{"en": "citizenship", "es": "ciudadania", "pron": "/sí-ti-zan-ship/"}'::jsonb,
    '{"en": "dual citizenship", "es": "doble nacionalidad", "pron": "/dú-al sí-ti-zan-ship/"}'::jsonb,
    '{"en": "resident", "es": "residente", "pron": "/ré-zi-dant/"}'::jsonb,
    '{"en": "foreign resident", "es": "residente extranjero/a", "pron": "/fó-ran ré-zi-dant/"}'::jsonb,
    '{"en": "immigration status", "es": "estatus migratorio", "pron": "/i-mag-réi-shan stá-tas/"}'::jsonb,
    '{"en": "nationality", "es": "nacionalidad", "pron": "/na-sha-ná-la-ti/"}'::jsonb,
    '{"en": "origin", "es": "origen", "pron": "/ó-ra-yan/"}'::jsonb,
    '{"en": "national origin", "es": "origen nacional", "pron": "/ná-sha-nal ó-ra-yan/"}'::jsonb,
    '{"en": "country of origin", "es": "pais de origen", "pron": "/kánt-ri áv ó-ra-yan/"}'::jsonb,

    -- Informacion de contacto
    '{"en": "contact information", "es": "informacion de contacto", "pron": "/kán-takt in-fer-méi-shan/"}'::jsonb,
    '{"en": "phone number", "es": "numero de telefono", "pron": "/fóun nám-ber/"}'::jsonb,
    '{"en": "mobile phone", "es": "telefono movil", "pron": "/móu-bal fóun/"}'::jsonb,
    '{"en": "landline", "es": "telefono fijo", "pron": "/lánd-lain/"}'::jsonb,
    '{"en": "work phone", "es": "telefono del trabajo", "pron": "/uérk fóun/"}'::jsonb,
    '{"en": "home phone", "es": "telefono de casa", "pron": "/hóum fóun/"}'::jsonb,
    '{"en": "phone extension", "es": "extension telefonica", "pron": "/fóun iks-tén-shan/"}'::jsonb,
    '{"en": "email", "es": "correo electronico", "pron": "/i-méil/"}'::jsonb,
    '{"en": "email address", "es": "direccion de correo electronico", "pron": "/i-méil ád-res/"}'::jsonb,
    '{"en": "alternate email", "es": "correo alternativo", "pron": "/ól-ter-nat i-méil/"}'::jsonb,
    '{"en": "contact preference", "es": "preferencia de contacto", "pron": "/kán-takt pré-fer-ans/"}'::jsonb,
    '{"en": "preferred contact method", "es": "metodo de contacto preferido", "pron": "/pra-férd kán-takt mé-zad/"}'::jsonb,
    '{"en": "address", "es": "direccion", "pron": "/ád-res/"}'::jsonb,
    '{"en": "street address", "es": "direccion de calle", "pron": "/strít ád-res/"}'::jsonb,
    '{"en": "building number", "es": "numero de edificio", "pron": "/bíl-ding nám-ber/"}'::jsonb,
    '{"en": "apartment", "es": "apartamento", "pron": "/a-párt-mant/"}'::jsonb,
    '{"en": "floor", "es": "piso", "pron": "/flór/"}'::jsonb,
    '{"en": "neighborhood", "es": "barrio", "pron": "/néi-ber-hud/"}'::jsonb,
    '{"en": "district", "es": "distrito", "pron": "/díst-rikt/"}'::jsonb,
    '{"en": "city", "es": "ciudad", "pron": "/sí-ti/"}'::jsonb,
    '{"en": "state", "es": "estado", "pron": "/stéit/"}'::jsonb,
    '{"en": "province", "es": "provincia", "pron": "/prá-vans/"}'::jsonb,
    '{"en": "region", "es": "region", "pron": "/rí-yan/"}'::jsonb,
    '{"en": "county", "es": "condado", "pron": "/káun-ti/"}'::jsonb,
    '{"en": "postal code", "es": "codigo postal", "pron": "/póus-tal kóud/"}'::jsonb,
    '{"en": "zip code", "es": "codigo zip", "pron": "/zíp kóud/"}'::jsonb,
    '{"en": "area code", "es": "codigo de area", "pron": "/é-ri-a kóud/"}'::jsonb,
    '{"en": "country code", "es": "codigo de pais", "pron": "/kánt-ri kóud/"}'::jsonb,
    '{"en": "international code", "es": "codigo internacional", "pron": "/in-ter-ná-sha-nal kóud/"}'::jsonb,
    '{"en": "mailing address", "es": "direccion postal", "pron": "/méi-ling ád-res/"}'::jsonb,
    '{"en": "permanent address", "es": "direccion permanente", "pron": "/pér-ma-nant ád-res/"}'::jsonb,
    '{"en": "temporary address", "es": "direccion temporal", "pron": "/tém-per-e-ri ád-res/"}'::jsonb,
    '{"en": "billing address", "es": "direccion de facturacion", "pron": "/bí-ling ád-res/"}'::jsonb,
    '{"en": "office address", "es": "direccion de oficina", "pron": "/ó-fis ád-res/"}'::jsonb,
    '{"en": "address line 1", "es": "linea de direccion 1", "pron": "/ád-res láin 1/"}'::jsonb,
    '{"en": "address line 2", "es": "linea de direccion 2", "pron": "/ád-res láin 2/"}'::jsonb,
    '{"en": "po box", "es": "apartado postal", "pron": "/póu báks/"}'::jsonb,
    '{"en": "landmark", "es": "punto de referencia", "pron": "/lánd-mark/"}'::jsonb,
    '{"en": "social media", "es": "redes sociales", "pron": "/sóu-shal mí-di-a/"}'::jsonb,
    '{"en": "username", "es": "nombre de usuario", "pron": "/iú-zer-neim/"}'::jsonb,
    '{"en": "handle", "es": "usuario", "pron": "/hán-dal/"}'::jsonb,
    '{"en": "website", "es": "sitio web", "pron": "/uéb-sait/"}'::jsonb,
    '{"en": "messaging app", "es": "aplicacion de mensajeria", "pron": "/mé-si-ying áp/"}'::jsonb,
    '{"en": "whatsapp number", "es": "numero de whatsapp", "pron": "/uat-sáp nám-ber/"}'::jsonb,
    '{"en": "telegram username", "es": "usuario de telegram", "pron": "/té-lag-ram iú-zer-neim/"}'::jsonb,
    '{"en": "linkedin profile", "es": "perfil de linkedin", "pron": "/língk-tin próu-fail/"}'::jsonb,
    '{"en": "available hours", "es": "horario disponible", "pron": "/a-véi-la-bal áu-erz/"}'::jsonb,
    '{"en": "call me", "es": "llamame", "pron": "/kól mí/"}'::jsonb,
    '{"en": "text me", "es": "escribeme", "pron": "/tékst mí/"}'::jsonb,

    -- Documentacion
    '{"en": "id card", "es": "documento de identidad", "pron": "/íd kárd/"}'::jsonb,
    '{"en": "passport", "es": "pasaporte", "pron": "/pás-port/"}'::jsonb,
    '{"en": "passport number", "es": "numero de pasaporte", "pron": "/pás-port nám-ber/"}'::jsonb,
    '{"en": "national id number", "es": "numero de identidad nacional", "pron": "/ná-sha-nal íd nám-ber/"}'::jsonb,
    '{"en": "tax id", "es": "identificacion fiscal", "pron": "/táks íd/"}'::jsonb,
    '{"en": "social security number", "es": "numero de seguridad social", "pron": "/sóu-shal sik-iú-ra-ti nám-ber/"}'::jsonb,
    '{"en": "driving license", "es": "licencia de conducir", "pron": "/drái-ving lái-sans/"}'::jsonb,
    '{"en": "visa", "es": "visa", "pron": "/ví-za/"}'::jsonb,
    '{"en": "residence permit", "es": "permiso de residencia", "pron": "/ré-zi-dans per-mít/"}'::jsonb,
    '{"en": "work permit", "es": "permiso de trabajo", "pron": "/uérk per-mít/"}'::jsonb,
    '{"en": "issue date", "es": "fecha de emision", "pron": "/í-shu déit/"}'::jsonb,
    '{"en": "expiry date", "es": "fecha de vencimiento", "pron": "/eks-pái-ri déit/"}'::jsonb,
    '{"en": "signature", "es": "firma", "pron": "/síg-na-cher/"}'::jsonb,
    '{"en": "digital signature", "es": "firma digital", "pron": "/dí-ya-tal síg-na-cher/"}'::jsonb,
    '{"en": "document number", "es": "numero de documento", "pron": "/dák-ia-ment nám-ber/"}'::jsonb,

    -- Paises y adjetivos de origen (maximo vocabulario)
    '{"en": "Spain", "es": "espana", "pron": "/spéin/"}'::jsonb,
    '{"en": "Spanish", "es": "espanol/a", "pron": "/spá-nish/"}'::jsonb,
    '{"en": "Mexico", "es": "mexico", "pron": "/mék-sa-kou/"}'::jsonb,
    '{"en": "Mexican", "es": "mexicano/a", "pron": "/mék-sa-kan/"}'::jsonb,
    '{"en": "Argentina", "es": "argentina", "pron": "/ar-yan-tí-na/"}'::jsonb,
    '{"en": "Argentinian", "es": "argentino/a", "pron": "/ar-yan-tí-ni-an/"}'::jsonb,
    '{"en": "Chile", "es": "chile", "pron": "/chí-li/"}'::jsonb,
    '{"en": "Chilean", "es": "chileno/a", "pron": "/chí-li-an/"}'::jsonb,
    '{"en": "Peru", "es": "peru", "pron": "/per-ú/"}'::jsonb,
    '{"en": "Peruvian", "es": "peruano/a", "pron": "/per-ú-vi-an/"}'::jsonb,
    '{"en": "Colombia", "es": "colombia", "pron": "/ka-lám-bi-a/"}'::jsonb,
    '{"en": "Colombian", "es": "colombiano/a", "pron": "/ka-lám-bi-an/"}'::jsonb,
    '{"en": "Venezuela", "es": "venezuela", "pron": "/ve-niz-uéi-la/"}'::jsonb,
    '{"en": "Venezuelan", "es": "venezolano/a", "pron": "/ve-niz-uéi-lan/"}'::jsonb,
    '{"en": "Ecuador", "es": "ecuador", "pron": "/ék-ua-dor/"}'::jsonb,
    '{"en": "Ecuadorian", "es": "ecuatoriano/a", "pron": "/ek-ua-dó-ri-an/"}'::jsonb,
    '{"en": "Bolivia", "es": "bolivia", "pron": "/ba-lí-vi-a/"}'::jsonb,
    '{"en": "Bolivian", "es": "boliviano/a", "pron": "/bou-lí-vi-an/"}'::jsonb,
    '{"en": "Uruguay", "es": "uruguay", "pron": "/iér-ag-uei/"}'::jsonb,
    '{"en": "Uruguayan", "es": "uruguayo/a", "pron": "/ier-ag-uéi-an/"}'::jsonb,
    '{"en": "Paraguay", "es": "paraguay", "pron": "/pé-rag-uei/"}'::jsonb,
    '{"en": "Paraguayan", "es": "paraguayo/a", "pron": "/pe-rag-uái-an/"}'::jsonb,
    '{"en": "Brazil", "es": "brasil", "pron": "/bra-zíl/"}'::jsonb,
    '{"en": "Brazilian", "es": "brasileno/a", "pron": "/bra-zíl-ian/"}'::jsonb,
    '{"en": "Portugal", "es": "portugal", "pron": "/pór-cha-gal/"}'::jsonb,
    '{"en": "Portuguese", "es": "portugues/a", "pron": "/pór-cha-giz/"}'::jsonb,
    '{"en": "France", "es": "francia", "pron": "/fráns/"}'::jsonb,
    '{"en": "French", "es": "frances/a", "pron": "/frénch/"}'::jsonb,
    '{"en": "Italy", "es": "italia", "pron": "/í-ta-li/"}'::jsonb,
    '{"en": "Italian", "es": "italiano/a", "pron": "/i-tál-ian/"}'::jsonb,
    '{"en": "Germany", "es": "alemania", "pron": "/yér-ma-ni/"}'::jsonb,
    '{"en": "German", "es": "aleman/a", "pron": "/yér-man/"}'::jsonb,
    '{"en": "Netherlands", "es": "paises bajos", "pron": "/né-zer-landz/"}'::jsonb,
    '{"en": "Dutch", "es": "neerlandes/a", "pron": "/dách/"}'::jsonb,
    '{"en": "Belgium", "es": "belgica", "pron": "/bél-yam/"}'::jsonb,
    '{"en": "Belgian", "es": "belga", "pron": "/bél-yan/"}'::jsonb,
    '{"en": "Switzerland", "es": "suiza", "pron": "/suít-ser-land/"}'::jsonb,
    '{"en": "Swiss", "es": "suizo/a", "pron": "/suís/"}'::jsonb,
    '{"en": "Austria", "es": "austria", "pron": "/óst-ri-a/"}'::jsonb,
    '{"en": "Austrian", "es": "austriaco/a", "pron": "/óst-ri-an/"}'::jsonb,
    '{"en": "Ireland", "es": "irlanda", "pron": "/ái-er-land/"}'::jsonb,
    '{"en": "Irish", "es": "irlandes/a", "pron": "/ái-rish/"}'::jsonb,
    '{"en": "United Kingdom", "es": "reino unido", "pron": "/iu-nái-tid kíng-dam/"}'::jsonb,
    '{"en": "British", "es": "britanico/a", "pron": "/brí-tish/"}'::jsonb,
    '{"en": "United States", "es": "estados unidos", "pron": "/iu-nái-tid stéits/"}'::jsonb,
    '{"en": "American", "es": "estadounidense", "pron": "/a-mé-ra-kan/"}'::jsonb,
    '{"en": "Canada", "es": "canada", "pron": "/ká-na-da/"}'::jsonb,
    '{"en": "Canadian", "es": "canadiense", "pron": "/ka-néi-di-an/"}'::jsonb,
    '{"en": "Australia", "es": "australia", "pron": "/ost-réil-ia/"}'::jsonb,
    '{"en": "Australian", "es": "australiano/a", "pron": "/ost-réil-ian/"}'::jsonb,
    '{"en": "New Zealand", "es": "nueva zelanda", "pron": "/nú zí-land/"}'::jsonb,
    '{"en": "New Zealander", "es": "neozelandes/a", "pron": "/nú zí-lan-der/"}'::jsonb,
    '{"en": "South Africa", "es": "sudafrica", "pron": "/sáuz áf-ra-ka/"}'::jsonb,
    '{"en": "South African", "es": "sudafricano/a", "pron": "/sáuz áf-ra-kan/"}'::jsonb,
    '{"en": "Nigeria", "es": "nigeria", "pron": "/nai-yí-ri-a/"}'::jsonb,
    '{"en": "Nigerian", "es": "nigeriano/a", "pron": "/nai-yí-ri-an/"}'::jsonb,
    '{"en": "Egypt", "es": "egipto", "pron": "/í-yapt/"}'::jsonb,
    '{"en": "Egyptian", "es": "egipcio/a", "pron": "/i-yíp-shan/"}'::jsonb,
    '{"en": "Morocco", "es": "marruecos", "pron": "/mer-á-kou/"}'::jsonb,
    '{"en": "Moroccan", "es": "marroqui", "pron": "/mer-á-kan/"}'::jsonb,
    '{"en": "Turkey", "es": "turquia", "pron": "/tér-ki/"}'::jsonb,
    '{"en": "Turkish", "es": "turco/a", "pron": "/tér-kish/"}'::jsonb,
    '{"en": "Greece", "es": "grecia", "pron": "/grís/"}'::jsonb,
    '{"en": "Greek", "es": "griego/a", "pron": "/grík/"}'::jsonb,
    '{"en": "Poland", "es": "polonia", "pron": "/póu-land/"}'::jsonb,
    '{"en": "Polish", "es": "polaco/a", "pron": "/pá-lish/"}'::jsonb,
    '{"en": "Romania", "es": "rumania", "pron": "/rou-méi-ni-a/"}'::jsonb,
    '{"en": "Romanian", "es": "rumano/a", "pron": "/rou-méi-ni-an/"}'::jsonb,
    '{"en": "Russia", "es": "rusia", "pron": "/rá-sha/"}'::jsonb,
    '{"en": "Russian", "es": "ruso/a", "pron": "/rá-shan/"}'::jsonb,
    '{"en": "Ukraine", "es": "ucrania", "pron": "/iuk-réin/"}'::jsonb,
    '{"en": "Ukrainian", "es": "ucraniano/a", "pron": "/iuk-réi-ni-an/"}'::jsonb,
    '{"en": "Sweden", "es": "suecia", "pron": "/suí-dan/"}'::jsonb,
    '{"en": "Swedish", "es": "sueco/a", "pron": "/suí-dish/"}'::jsonb,
    '{"en": "Norway", "es": "noruega", "pron": "/nór-uei/"}'::jsonb,
    '{"en": "Norwegian", "es": "noruego/a", "pron": "/nor-uí-yan/"}'::jsonb,
    '{"en": "Denmark", "es": "dinamarca", "pron": "/dén-mark/"}'::jsonb,
    '{"en": "Danish", "es": "danes/a", "pron": "/déi-nish/"}'::jsonb,
    '{"en": "Finland", "es": "finlandia", "pron": "/fín-land/"}'::jsonb,
    '{"en": "Finnish", "es": "finlandes/a", "pron": "/fí-nish/"}'::jsonb,
    '{"en": "China", "es": "china", "pron": "/chái-na/"}'::jsonb,
    '{"en": "Chinese", "es": "chino/a", "pron": "/chai-níz/"}'::jsonb,
    '{"en": "Japan", "es": "japon", "pron": "/ya-pán/"}'::jsonb,
    '{"en": "Japanese", "es": "japones/a", "pron": "/ya-pa-níz/"}'::jsonb,
    '{"en": "South Korea", "es": "corea del sur", "pron": "/sáuz ko-rí-a/"}'::jsonb,
    '{"en": "Korean", "es": "coreano/a", "pron": "/ko-rí-an/"}'::jsonb,
    '{"en": "India", "es": "india", "pron": "/ín-di-a/"}'::jsonb,
    '{"en": "Indian", "es": "indio/a", "pron": "/ín-di-an/"}'::jsonb,
    '{"en": "Pakistan", "es": "pakistan", "pron": "/pá-kis-tan/"}'::jsonb,
    '{"en": "Pakistani", "es": "paquistani", "pron": "/pa-kis-tá-ni/"}'::jsonb,
    '{"en": "Thailand", "es": "tailandia", "pron": "/tái-land/"}'::jsonb,
    '{"en": "Thai", "es": "tailandes/a", "pron": "/tái/"}'::jsonb,
    '{"en": "Vietnam", "es": "vietnam", "pron": "/vi-et-nám/"}'::jsonb,
    '{"en": "Vietnamese", "es": "vietnamita", "pron": "/vi-et-na-mís/"}'::jsonb,
    '{"en": "Indonesia", "es": "indonesia", "pron": "/in-dou-ní-sha/"}'::jsonb,
    '{"en": "Indonesian", "es": "indonesio/a", "pron": "/in-dou-ní-shan/"}'::jsonb,
    '{"en": "Philippines", "es": "filipinas", "pron": "/fí-la-pinz/"}'::jsonb,
    '{"en": "Filipino", "es": "filipino/a", "pron": "/fi-la-pí-nou/"}'::jsonb,
    '{"en": "Malaysia", "es": "malasia", "pron": "/ma-léi-sha/"}'::jsonb,
    '{"en": "Malaysian", "es": "malasio/a", "pron": "/ma-léi-shan/"}'::jsonb
  ];
BEGIN
  -- Path
  SELECT uuid INTO v_path_uuid
  FROM path
  WHERE source_language = 'en'
  LIMIT 1;

  IF v_path_uuid IS NULL THEN
    INSERT INTO path (source_language)
    VALUES ('en')
    RETURNING uuid INTO v_path_uuid;
  END IF;

  -- Deck idempotente por step 70
  DELETE FROM deck
  WHERE path_uuid = v_path_uuid
    AND step_order = 70
    AND source_language = 'en';

  INSERT INTO deck (path_uuid, step_order, source_language, type)
  VALUES (v_path_uuid, 70, 'en', 'deck')
  RETURNING uuid INTO v_deck_uuid;

  INSERT INTO deck_translation (deck_uuid, language, title, description)
  VALUES (
    v_deck_uuid,
    'es',
    'Informacion Personal y Demografia',
    'Nacionalidades, adjetivos de origen, estado civil e informacion de contacto.'
  )
  ON CONFLICT (deck_uuid, language) DO UPDATE
  SET title = EXCLUDED.title,
      description = EXCLUDED.description;

  FOREACH item IN ARRAY v_terms LOOP
    v_en_uuid := get_or_create_word(item->>'en', 'en', item->>'ex');
    v_es_uuid := get_or_create_word(item->>'es', 'es');

    INSERT INTO deck_words (deck_uuid, word_uuid)
    VALUES (v_deck_uuid, v_en_uuid)
    ON CONFLICT DO NOTHING;

    INSERT INTO word_translation (source_word_uuid, target_word_uuid, pronunciation)
    VALUES (v_en_uuid, v_es_uuid, item->>'pron')
    ON CONFLICT (source_word_uuid, target_word_uuid) DO NOTHING;
  END LOOP;
END;
$seed$;
