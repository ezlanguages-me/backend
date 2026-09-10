-- ============================================================
-- Seed: A0 English Path – STEP 710 – Dialogue – understand simple phone messages (Comunicación Telefónica)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_order SMALLINT := 1;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"c":"Receptionist","t":"Hello, Emma. This is the front desk at Green Residence.","es":"Hola, Emma. Habla la recepción de Green Residence.","pron":"/jé-lo, é-ma. dis is de front desk at grin ré-si-dens./","de":"Hallo, Emma. Hier ist die Rezeption von Green Residence.","pron_de":"/HÁ-lo, É-ma. hiö ist di re-TSEP-tsi-on fon GRIEN RE-si-dens./"}'::jsonb,
        '{"c":"Emma","t":"Hello. Is everything okay?","es":"Hola. ¿Está todo bien?","pron":"/jé-lo. is év-ri-zing o-kéi?/","de":"Hallo. Ist alles in Ordnung?","pron_de":"/HÁ-lo. ist Á-les in ÓORD-nung?/"}'::jsonb,
        '{"c":"Receptionist","t":"Yes. There is a parcel for you at reception from your aunt.","es":"Sí. Hay un paquete para ti en recepción de parte de tu tía.","pron":"/yes. der is a PÁR-sel for iu at ri-SÉP-shon from ior ant./","de":"Ja. Es gibt ein Paket für dich an der Rezeption von deiner Tante.","pron_de":"/ya. es GIPT ain pa-KET füö diç an deö re-TSEP-tsi-on fon DÁI-neö TAN-te./"}'::jsonb,
        '{"c":"Emma","t":"Great. When can I collect it?","es":"Genial. ¿Cuándo puedo recogerlo?","pron":"/gréit. uen kan ai ko-LÉKT it?/","de":"Super. Wann kann ich es abholen?","pron_de":"/SU-peö. WÁN kan iç es ÁP-ho-len?/"}'::jsonb,
        '{"c":"Receptionist","t":"You can collect it after six this evening. Please bring your ID card.","es":"Puedes recogerlo después de las seis de esta tarde. Por favor, trae tu documento de identidad.","pron":"/iu kan ko-LÉKT it ÁF-ter siks dis ÍV-ning. plis bring ior áid kard./","de":"Du kannst es heute Abend nach sechs Uhr abholen. Bitte bring deinen Ausweis mit.","pron_de":"/du KANST es HÓI-te Á-bent nax SECHS Ur ÁP-ho-len. BÍ-te bring DÁI-nen AUS-vais mit./"}'::jsonb,
        '{"c":"Emma","t":"That is fine. I finish class at seven fifteen.","es":"Está bien. Termino clase a las siete y cuarto.","pron":"/dat is fain. ai FÍ-nish klas at SÉ-ven fíf-tiin./","de":"Das ist gut. Ich bin um Viertel nach sieben mit dem Unterricht fertig.","pron_de":"/das ist GUT. iç bin um FIÖ-tel nax ZÍ-ben mit dem ÚN-teö-riçt FÉR-tiç./"}'::jsonb,
        '{"c":"Receptionist","t":"No problem. Reception is open until eleven, and you need to sign one form.","es":"No hay problema. La recepción está abierta hasta las once y tienes que firmar un formulario.","pron":"/nou PROb-lem. ri-SÉP-shon is OU-pen un-TÍL i-LÉ-ven, and iu niid tu sain uan form./","de":"Kein Problem. Die Rezeption ist bis elf Uhr geöffnet, und du musst ein Formular unterschreiben.","pron_de":"/kain pro-BLEM. di re-TSEP-tsi-on ist bis ELF Ur ge-ÖF-net, und du MUST ain for-mu-LÁR ún-teö-SRÁI-ben./"}'::jsonb,
        '{"c":"Emma","t":"Perfect. And if I am late?","es":"Perfecto. ¿Y si llego tarde?","pron":"/pér-fekt. and if ai am léit?/","de":"Perfekt. Und wenn ich zu spät komme?","pron_de":"/pér-fekt. und VEN iç tsu SPEET KÓ-me?/"}'::jsonb,
        '{"c":"Receptionist","t":"We keep the parcel for you until tomorrow morning.","es":"Guardamos el paquete para ti hasta mañana por la mañana.","pron":"/ui kiip de PÁR-sel for iu un-TÍL tu-MÓ-ro MÓR-ning./","de":"Wir bewahren das Paket bis morgen früh für dich auf.","pron_de":"/viö be-VÁ-ren das pa-KET bis MÓR-gen FRÜH füö diç auf./"}'::jsonb,
        '{"c":"Emma","t":"Thank you. I will come after class then.","es":"Gracias. Vendré después de clase entonces.","pron":"/zenk iu. ai uil kam ÁF-ter klas den./","de":"Danke. Ich komme dann nach dem Unterricht.","pron_de":"/DAN-ke. iç KÓ-me dan nax dem ÚN-teö-riçt./"}'::jsonb,
        '{"c":"Receptionist","t":"You are welcome. See you later, Emma.","es":"De nada. Hasta luego, Emma.","pron":"/iu ar WÉL-kom. sii iu LÉI-ter, é-ma./","de":"Gern geschehen. Bis später, Emma.","pron_de":"/GERN ge-ZÉ-en. bis SPÉE-teö, É-ma./"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM dialogue WHERE step_order = 710 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 710 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id,
        710,
        'en',
        'dialogue',
        'communication',
        '[{"name":"Receptionist","gender":"female","avatarURL":"https://example.com/avatars/receptionist.png"},{"name":"Emma","gender":"female","avatarURL":"https://example.com/avatars/emma.png"}]'::jsonb
    ) RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'es', 'Llamada sobre un paquete');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES (v_dialogue_id, 'de', 'Paket an der Rezeption');

    FOREACH ex IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_order, ex->>'c', ex->>'t')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_object('translation', ex->>'es', 'pronunciation', ex->>'pron'));

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_object('translation', ex->>'de', 'pronunciation', ex->>'pron_de'));

        v_order := v_order + 1;
    END LOOP;
END;
$seed$;
