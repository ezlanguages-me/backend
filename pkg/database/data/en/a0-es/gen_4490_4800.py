#!/usr/bin/env python3
import json
import textwrap
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
CORRESPONDENCE = "Correspondencia e Informes Profesionales"
PHONE = "Teléfono Profesional"


def esc(s):
    return "" if s is None else s.replace("'", "''")


def dump_json(obj, *, indent=None):
    return esc(json.dumps(obj, ensure_ascii=False, indent=indent))


def format_jsonb_array(items, indent=8):
    pad = " " * indent
    return ",\n".join(f"{pad}'{dump_json(item)}'::jsonb" for item in items)


def make_tf_pair(es_prompt, de_prompt, answer):
    return {
        "p": es_prompt,
        "p_de": de_prompt,
        "s_es": {"type": "true_false", "answer": answer},
        "s_de": {"type": "true_false", "answer": answer},
    }


def make_mc_pair(es_prompt, de_prompt, es_options, de_options, answer=0):
    return {
        "p": es_prompt,
        "p_de": de_prompt,
        "s_es": {"type": "multiple_choice", "options": es_options, "answer": answer},
        "s_de": {"type": "multiple_choice", "options": de_options, "answer": answer},
    }


def build_reading_exercises(tf_items, mc_items):
    exercises = [make_tf_pair(es, de, answer) for es, de, answer in tf_items]
    exercises.extend(
        make_mc_pair(es, de, es_options, de_options, answer)
        for es, de, es_options, de_options, answer in mc_items
    )
    return exercises


def make_dialogue_tf(es_prompt, de_prompt, answer):
    return {"p": es_prompt, "p_de": de_prompt, "s": {"type": "true_false", "answer": answer}}


def make_dialogue_mc(es_prompt, de_prompt, options, answer=0):
    return {"p": es_prompt, "p_de": de_prompt, "s": {"type": "multiple_choice", "options": options, "answer": answer}}


def build_dialogue_exercises(tf_items, mc_items):
    exercises = [make_dialogue_tf(es, de, answer) for es, de, answer in tf_items]
    exercises.extend(make_dialogue_mc(es, de, options, answer) for es, de, options, answer in mc_items)
    return exercises


def reading_sql(step, description, category_label, title_es, title_de, desc_es, desc_de, content, exercises):
    return f"""-- ============================================================
-- Seed: A0 English Path – STEP {step} – Reading – {description} ({category_label})
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
{format_jsonb_array(exercises, indent=12)}
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = {step}
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = {step}
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, {step}, 'en', 'reading', 'professional', $content${textwrap.dedent(content).strip()}$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', '{esc(title_es)}', '{esc(desc_es)}'),
            (v_reading_id, 'de', '{esc(title_de)}', '{esc(desc_de)}');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_reading_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
"""


def writing_sql(step, description, category_label, title_es, title_de, scenario_es, tasks_es, scenario_de, tasks_de):
    prompt_es = dump_json({"scenario": scenario_es, "tasks": tasks_es}, indent=4)
    prompt_de = dump_json({"scenario": scenario_de, "tasks": tasks_de}, indent=4)
    return f"""-- ============================================================
-- Seed: A0 English Path – STEP {step} – Writing – {description} ({category_label})
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing
            WHERE step_order = {step}
              AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, {step}, 'en', 'writing', 'professional')
            RETURNING uuid INTO v_writing_id;

            INSERT INTO writing_translation (
                writing_uuid,
                language,
                title,
                description,
                prompt
            )
            VALUES (
                v_writing_id,
                'es',
                '{esc(title_es)}',
                '',
                '{prompt_es}'::jsonb
            );

            INSERT INTO writing_translation (
                writing_uuid,
                language,
                title,
                description,
                prompt
            )
            VALUES (
                v_writing_id,
                'de',
                '{esc(title_de)}',
                '',
                '{prompt_de}'::jsonb
            );
        END;
        $seed$;
"""


def listening_sql(step, description, category_label, title_es, title_de, desc_es, desc_de, transcript, exercises):
    return f"""-- ============================================================
-- Seed: A0 English Path – STEP {step} – Listening – {description} ({category_label})
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
{format_jsonb_array(exercises, indent=12)}
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM listening
            WHERE step_order = {step}
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'listening'
        );
        DELETE FROM listening
        WHERE step_order = {step}
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'listening';

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, {step}, 'en', 'listening', 'professional', $transcript$
{textwrap.dedent(transcript).strip()}
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', '{esc(title_es)}', '{esc(desc_es)}'),
            (v_listening_id, 'de', '{esc(title_de)}', '{esc(desc_de)}');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_listening_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
"""


def dialogue_sql(step, description, category_label, title_es, title_de, desc_es, desc_de, characters, lines, exercises):
    return f"""-- ============================================================
-- Seed: A0 English Path – STEP {step} – Dialogue – {description} ({category_label})
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
{format_jsonb_array(lines, indent=8)}
    ];
    v_exercises JSONB[] := ARRAY[
{format_jsonb_array(exercises, indent=8)}
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid
        FROM dialogue
        WHERE step_order = {step}
          AND path_uuid = v_path_id
    );
    DELETE FROM dialogue
    WHERE step_order = {step}
      AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, {step}, 'en', 'dialogue', 'professional', '{dump_json(characters)}'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', '{esc(title_es)}', '{esc(desc_es)}');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', '{esc(title_de)}', '{esc(desc_de)}');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (
            v_line_id,
            'es',
            jsonb_build_array(
                jsonb_build_object(
                    'translations',
                    jsonb_build_array(
                        jsonb_build_object('languageCode', 'es', 'translation', line->>'es')
                    )
                )
            )
        );
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (
            v_line_id,
            'de',
            jsonb_build_array(
                jsonb_build_object(
                    'translations',
                    jsonb_build_array(
                        jsonb_build_object('languageCode', 'de', 'translation', line->>'de')
                    )
                )
            )
        );

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
"""


def speaking_sql(step, description, category_label, title_es, title_de, desc_es, desc_de, scenario_es, tasks_es, scenario_de, tasks_de):
    prompt_es = dump_json({"scenario": scenario_es, "tasks": tasks_es}, indent=4)
    prompt_de = dump_json({"scenario": scenario_de, "tasks": tasks_de}, indent=4)
    return f"""-- ============================================================
-- Seed: A0 English Path – STEP {step} – Speaking – {description} ({category_label})
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM speaking
    WHERE step_order = {step}
      AND path_uuid = v_path_id
      AND source_language = 'en'
      AND type = 'speaking';

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, {step}, 'en', 'speaking', 'professional')
    RETURNING uuid INTO v_item_id;

    INSERT INTO speaking_translation (
        speaking_uuid,
        language,
        title,
        description,
        prompt
    )
    VALUES (
        v_item_id,
        'es',
        '{esc(title_es)}',
        '{esc(desc_es)}',
        '{prompt_es}'::jsonb
    );

    INSERT INTO speaking_translation (
        speaking_uuid,
        language,
        title,
        description,
        prompt
    )
    VALUES (
        v_item_id,
        'de',
        '{esc(title_de)}',
        '{esc(desc_de)}',
        '{prompt_de}'::jsonb
    );
END;
$seed$;
"""


def write_file(step, content):
    filepath = BASE_DIR / f"step-{step}.sql"
    with open(filepath, "w", encoding="utf-8") as handle:
        handle.write(content)


def main():
    files = {}

    files[4490] = reading_sql(
        4490,
        "deal with routine letters",
        CORRESPONDENCE,
        "Lee una carta de negocios rutinaria",
        "Lies einen routinemäßigen Geschäftsbrief",
        "Lee una carta comercial sobre un pedido, la entrega y las condiciones de pago.",
        "Lies einen Geschäftsbrief über eine Bestellung, die Lieferung und die Zahlungsbedingungen.",
        """
        Dear Ms Alvarez,

        Thank you for your order #4490. We are pleased to confirm your purchase of 20 office desks from Green Valley Suppliers. The desks are packed and ready for dispatch from our warehouse. Delivery has been booked for Tuesday 14 November, and our driver is expected to arrive between 9am and 12 noon.

        Please make sure that someone is available to receive the goods and sign the delivery note. If there are any access instructions for the building, please send them in advance. If you need to contact our team before delivery, you can write to orders@greenvalley.co.uk and we will reply as soon as possible.

        As agreed, payment is due within 30 days from the invoice date. We appreciate your business and look forward to serving you again.

        Kind regards,
        Sales Administration
        Green Valley Suppliers
        """,
        build_reading_exercises(
            [
                ("La carta es de Green Valley Suppliers.", "Der Brief ist von Green Valley Suppliers.", True),
                ("El pedido es de 20 sillas de oficina.", "Die Bestellung gilt für 20 Bürostühle.", False),
                ("La entrega es el martes 14 de noviembre.", "Die Lieferung ist am Dienstag, dem 14. November.", True),
                ("La entrega es por la tarde.", "Die Lieferung ist am Nachmittag.", False),
                ("El correo de contacto es orders@greenvalley.co.uk.", "Die Kontakt-E-Mail ist orders@greenvalley.co.uk.", True),
                ("El pago vence en 14 días.", "Die Zahlung ist innerhalb von 14 Tagen fällig.", False),
                ("El número de pedido es 4490.", "Die Bestellnummer ist 4490.", True),
                ("La carta pide confirmar por teléfono.", "Der Brief bittet um eine telefonische Bestätigung.", False),
            ],
            [
                ("¿Cuál es el número de pedido?", "Wie lautet die Bestellnummer?", ["#4490", "#4940", "#4049"], ["#4490", "#4940", "#4049"], 0),
                ("¿Cuántos escritorios hay en el pedido?", "Wie viele Schreibtische sind in der Bestellung?", ["20", "10", "30"], ["20", "10", "30"], 0),
                ("¿Qué día es la entrega?", "An welchem Tag ist die Lieferung?", ["Martes", "Miércoles", "Lunes"], ["Dienstag", "Mittwoch", "Montag"], 0),
                ("¿Entre qué horas es la entrega?", "Zwischen welchen Uhrzeiten erfolgt die Lieferung?", ["Entre las 9:00 y las 12:00", "Entre la 1:00 y las 5:00", "Entre las 8:00 y las 10:00"], ["Zwischen 9 Uhr und 12 Uhr", "Zwischen 13 Uhr und 17 Uhr", "Zwischen 8 Uhr und 10 Uhr"], 0),
                ("¿Cuál es el correo de contacto?", "Wie lautet die Kontakt-E-Mail?", ["orders@greenvalley.co.uk", "sales@greenvalley.co.uk", "info@greenvalley.co.uk"], ["orders@greenvalley.co.uk", "sales@greenvalley.co.uk", "info@greenvalley.co.uk"], 0),
                ("¿Cuántos días hay para pagar?", "Wie viele Tage hat man für die Zahlung?", ["30", "14", "7"], ["30", "14", "7"], 0),
                ("¿Qué se entrega?", "Was wird geliefert?", ["Escritorios de oficina", "Sillas de oficina", "Pantallas de ordenador"], ["Büroschreibtische", "Bürostühle", "Computerbildschirme"], 0),
                ("¿Qué tipo de carta es esta?", "Was für ein Brief ist das?", ["Una confirmación de entrega", "Una reclamación", "Una lista de precios"], ["Eine Lieferbestätigung", "Eine Beschwerde", "Eine Preisliste"], 0),
            ],
        ),
    )

    files[4500] = reading_sql(
        4500,
        "understand general meaning of non-routine letters",
        CORRESPONDENCE,
        "Lee una carta de reclamación",
        "Lies einen Beschwerdebrief",
        "Lee una reclamación sobre una factura incorrecta y la solicitud de una corrección.",
        "Lies eine Beschwerde über eine falsche Rechnung und die Bitte um eine Korrektur.",
        """
        Dear Accounts Team,

        I am writing on behalf of Harper & Sons regarding invoice 1187, which was sent to us on 5 October. The invoice total shown is £3,200, but the agreed price for the work completed was £2,800. We reviewed the quotation that your sales department sent before the order was confirmed, and the lower amount is clearly stated there.

        To avoid delays in payment, we would be grateful if you could issue a corrected invoice as soon as possible. For your convenience, we have attached a copy of the original quote to this message so that your team can check the agreed figure.

        If you need any further information, please contact us at accounts@harpersons.co.uk. We would appreciate your prompt attention to this matter.

        Yours sincerely,
        Daniel Harper
        Harper & Sons
        """,
        build_reading_exercises(
            [
                ("La carta es de Harper & Sons.", "Der Brief ist von Harper & Sons.", True),
                ("La factura se envió el 5 de noviembre.", "Die Rechnung wurde am 5. November gesendet.", False),
                ("El importe de la factura era de 3.200 £.", "Der Rechnungsbetrag betrug 3.200 £.", True),
                ("El precio acordado era de 3.200 £.", "Der vereinbarte Preis betrug 3.200 £.", False),
                ("El cliente quiere una factura corregida.", "Der Kunde möchte eine korrigierte Rechnung.", True),
                ("El presupuesto original va adjunto a la carta.", "Das ursprüngliche Angebot ist dem Brief beigefügt.", True),
                ("El correo del cliente es accounts@harpersons.co.uk.", "Die E-Mail des Kunden ist accounts@harpersons.co.uk.", True),
                ("La diferencia es de 600 £.", "Die Differenz beträgt 600 £.", False),
            ],
            [
                ("¿Qué empresa envió la reclamación?", "Welche Firma hat die Beschwerde geschickt?", ["Harper & Sons", "Green Valley", "North Clinic"], ["Harper & Sons", "Green Valley", "North Clinic"], 0),
                ("¿Cuándo se envió la factura?", "Wann wurde die Rechnung gesendet?", ["El 5 de octubre", "El 5 de noviembre", "El 15 de octubre"], ["Am 5. Oktober", "Am 5. November", "Am 15. Oktober"], 0),
                ("¿Cuál era el importe de la factura?", "Wie hoch war der Rechnungsbetrag?", ["3.200 £", "2.800 £", "3.800 £"], ["3.200 £", "2.800 £", "3.800 £"], 0),
                ("¿Cuál era el precio acordado?", "Wie hoch war der vereinbarte Preis?", ["2.800 £", "3.200 £", "2.400 £"], ["2.800 £", "3.200 £", "2.400 £"], 0),
                ("¿Qué quiere el cliente?", "Was möchte der Kunde?", ["Una factura corregida", "Un reembolso", "Una reunión"], ["Eine korrigierte Rechnung", "Eine Rückerstattung", "Ein Treffen"], 0),
                ("¿Qué se adjunta a la carta?", "Was ist dem Brief beigefügt?", ["El presupuesto original", "Una factura nueva", "Un albarán"], ["Das ursprüngliche Angebot", "Eine neue Rechnung", "Ein Lieferschein"], 0),
                ("¿Cuál es la diferencia?", "Wie groß ist die Differenz?", ["400 £", "600 £", "200 £"], ["400 £", "600 £", "200 £"], 0),
                ("¿Cuál es el correo de contacto?", "Wie lautet die Kontakt-E-Mail?", ["accounts@harpersons.co.uk", "sales@harpersons.co.uk", "info@harpersons.co.uk"], ["accounts@harpersons.co.uk", "sales@harpersons.co.uk", "info@harpersons.co.uk"], 0),
            ],
        ),
    )

    files[4510] = reading_sql(
        4510,
        "understand correspondence expressed in non-standard language",
        CORRESPONDENCE,
        "Comprende un memorando informal",
        "Verstehe ein informelles Memo",
        "Lee un memorando interno informal sobre reparaciones y servicios disponibles en la oficina.",
        "Lies ein informelles internes Memo über Reparaturen und verfügbare Dienste im Büro.",
        """
        Hi everyone,

        Quick note from Dave in Facilities. The air conditioning on floor 3 will be off all day on Thursday while the repair team works on the system. The problem should only affect that floor, but it may feel cooler than usual in the morning, so please bring something warm if you are based there.

        The good news is that the kitchen on floor 2 will stay open, so you can still make tea or heat lunch as normal. The vending machines are also working fine, so drinks and snacks are available. We expect everything to be back to normal on Friday once the repairs are finished and tested.

        Thanks for your patience,
        Dave
        Facilities
        """,
        build_reading_exercises(
            [
                ("El memorando es de Dave de Facilities.", "Das Memo ist von Dave aus der Haustechnik.", True),
                ("La calefacción estará apagada el jueves.", "Die Heizung wird am Donnerstag ausgeschaltet sein.", False),
                ("Las reparaciones son en la planta 3.", "Die Reparaturen sind auf Etage 3.", True),
                ("La cocina de la planta 2 está cerrada.", "Die Küche auf Etage 2 ist geschlossen.", False),
                ("El personal debe llevar algo de abrigo.", "Die Mitarbeitenden sollen etwas Warmes mitbringen.", True),
                ("Las máquinas expendedoras no funcionan.", "Die Verkaufsautomaten funktionieren nicht.", False),
                ("Todo volverá a la normalidad el viernes.", "Am Freitag wird alles wieder normal sein.", True),
                ("El memorando trata sobre una prueba de alarma de incendios.", "In dem Memo geht es um einen Feueralarmtest.", False),
            ],
            [
                ("¿Quién envió el memorando?", "Wer hat das Memo geschickt?", ["Dave de Facilities", "Sarah de RR. HH.", "El gerente"], ["Dave aus der Haustechnik", "Sarah aus der Personalabteilung", "Der Manager"], 0),
                ("¿Qué sistema estará apagado el jueves?", "Welches System wird am Donnerstag ausgeschaltet sein?", ["El aire acondicionado", "La calefacción", "Internet"], ["Die Klimaanlage", "Die Heizung", "Das Internet"], 0),
                ("¿Qué planta tiene la reparación?", "Welche Etage ist von der Reparatur betroffen?", ["La planta 3", "La planta 2", "La planta 1"], ["Etage 3", "Etage 2", "Etage 1"], 0),
                ("¿Qué debe llevar el personal?", "Was sollen die Mitarbeitenden mitbringen?", ["Algo de abrigo", "Una linterna", "Un casco"], ["Etwas Warmes", "Eine Taschenlampe", "Einen Helm"], 0),
                ("¿Qué está abierto en la planta 2?", "Was ist auf Etage 2 geöffnet?", ["La cocina", "El gimnasio", "El aparcamiento"], ["Die Küche", "Das Fitnessstudio", "Der Parkplatz"], 0),
                ("¿Cuándo volverá todo a la normalidad?", "Wann wird alles wieder normal sein?", ["El viernes", "El sábado", "La próxima semana"], ["Am Freitag", "Am Samstag", "Nächste Woche"], 0),
                ("¿Qué funciona bien?", "Was funktioniert einwandfrei?", ["Las máquinas expendedoras", "Los ascensores", "Las impresoras"], ["Die Verkaufsautomaten", "Die Aufzüge", "Die Drucker"], 0),
                ("¿Qué tipo de texto es este?", "Was für eine Art Text ist das?", ["Un memorando informal para el personal", "Un aviso legal formal", "Una confirmación de entrega"], ["Ein informelles Mitarbeitermemo", "Eine formelle rechtliche Mitteilung", "Eine Lieferbestätigung"], 0),
            ],
        ),
    )

    files[4520] = reading_sql(
        4520,
        "understand specialist/legal correspondence",
        CORRESPONDENCE,
        "Lee una notificación legal de arrendamiento",
        "Lies eine rechtliche Mietmitteilung",
        "Lee una notificación de renovación de arrendamiento con condiciones, plazo y consecuencias.",
        "Lies eine Mitteilung zur Mietvertragsverlängerung mit Bedingungen, Frist und Folgen.",
        """
        Dear Tenant,

        Citywide Properties writes to inform you that the current lease for Unit 12, 44 Brook Street, will expire on 31 March. We are pleased to offer a renewal on revised terms. Under the new agreement, the annual rent will be £18,000, representing an increase of 5% on the current amount. The renewed lease will run for a period of 3 years from the commencement date.

        Please review the enclosed documents carefully. If you wish to accept the renewal, you must sign and return the lease within 14 days of the date of this notice. If we do not receive the signed documents within that period, the landlord reserves the right to offer the unit to other interested parties.

        If you require clarification, please contact our legal team at legal@citywideproperties.co.uk.

        Yours faithfully,
        Lease Administration
        Citywide Properties
        """,
        build_reading_exercises(
            [
                ("La notificación es de Citywide Properties.", "Die Mitteilung ist von Citywide Properties.", True),
                ("La unidad es la número 14.", "Die Einheit ist Nummer 14.", False),
                ("El arrendamiento actual termina el 31 de marzo.", "Der aktuelle Mietvertrag endet am 31. März.", True),
                ("La nueva renta es de 18.000 £ al año.", "Die neue Jahresmiete beträgt 18.000 £.", True),
                ("Se trata de una bajada del alquiler.", "Es handelt sich um eine Mietsenkung.", False),
                ("El nuevo contrato durará 2 años.", "Der neue Vertrag läuft 2 Jahre.", False),
                ("El inquilino debe responder en 14 días.", "Der Mieter muss innerhalb von 14 Tagen antworten.", True),
                ("El correo de contacto es legal@citywideproperties.co.uk.", "Die Kontakt-E-Mail lautet legal@citywideproperties.co.uk.", True),
            ],
            [
                ("¿Cuál es el número de la unidad?", "Wie lautet die Nummer der Einheit?", ["Unidad 12", "Unidad 14", "Unidad 22"], ["Einheit 12", "Einheit 14", "Einheit 22"], 0),
                ("¿Dónde está la propiedad?", "Wo befindet sich die Immobilie?", ["44 Brook Street", "44 Park Lane", "22 Brook Street"], ["44 Brook Street", "44 Park Lane", "22 Brook Street"], 0),
                ("¿Cuándo termina el contrato actual?", "Wann endet der aktuelle Vertrag?", ["El 31 de marzo", "El 30 de abril", "El 28 de febrero"], ["Am 31. März", "Am 30. April", "Am 28. Februar"], 0),
                ("¿Cuál es la nueva renta anual?", "Wie hoch ist die neue Jahresmiete?", ["18.000 £", "17.000 £", "19.000 £"], ["18.000 £", "17.000 £", "19.000 £"], 0),
                ("¿En cuánto aumenta la renta?", "Um wie viel steigt die Miete?", ["5 %", "10 %", "3 %"], ["5 %", "10 %", "3 %"], 0),
                ("¿Cuánto dura el nuevo contrato?", "Wie lange läuft der neue Vertrag?", ["3 años", "2 años", "5 años"], ["3 Jahre", "2 Jahre", "5 Jahre"], 0),
                ("¿Cuántos días tiene el inquilino para responder?", "Wie viele Tage hat der Mieter zur Antwort?", ["14 días", "30 días", "7 días"], ["14 Tage", "30 Tage", "7 Tage"], 0),
                ("¿Qué pasa si el inquilino no responde?", "Was passiert, wenn der Mieter nicht antwortet?", ["El propietario puede ofrecer la unidad a otros", "La renta sigue igual", "El contrato continúa automáticamente"], ["Der Vermieter kann die Einheit anderen anbieten", "Die Miete bleibt gleich", "Der Vertrag läuft automatisch weiter"], 0),
            ],
        ),
    )

    files[4530] = writing_sql(
        4530,
        "write straightforward, routine letters of a factual nature (enquiry letter)",
        CORRESPONDENCE,
        "Escribe una carta de consulta rutinaria",
        "Schreibe einen einfachen Anfragebriefs",
        "Trabaja en una empresa de oficinas y necesita solicitar información sobre un proveedor de material de oficina. Escribe una carta formal de consulta donde preguntes por productos, precios y condiciones de entrega.",
        [
            "Encabeza la carta con tu nombre, empresa y fecha.",
            "Empieza con un saludo formal.",
            "Explica quién eres y a qué empresa representas.",
            "Di por qué escribes: necesitas información sobre material de oficina.",
            "Pregunta por los productos disponibles y los precios actuales.",
            "Pregunta por las condiciones de entrega y el plazo de envío.",
            "Pide un catálogo o lista de precios si está disponible.",
            "Termina con una despedida formal y tus datos de contacto.",
        ],
        "Sie arbeiten in einem Büro und möchten Informationen bei einem Büromateriallieferanten anfragen. Schreiben Sie einen formellen Anfragebriefs mit Fragen zu Produkten, Preisen und Lieferbedingungen.",
        [
            "Fügen Sie Ihren Namen, die Firma und das Datum als Kopfzeile ein.",
            "Beginnen Sie mit einer formellen Begrüßung.",
            "Erklären Sie, wer Sie sind und welche Firma Sie vertreten.",
            "Erklären Sie, warum Sie schreiben: Sie benötigen Informationen zu Büromaterial.",
            "Fragen Sie nach verfügbaren Produkten und aktuellen Preisen.",
            "Fragen Sie nach den Lieferbedingungen und der Lieferzeit.",
            "Bitten Sie um einen Katalog oder eine Preisliste, falls vorhanden.",
            "Beenden Sie mit einer formellen Verabschiedung und Ihren Kontaktdaten.",
        ],
    )

    files[4540] = writing_sql(
        4540,
        "write a non-routine letter restricted to matters of fact",
        CORRESPONDENCE,
        "Escribe una carta de queja sobre un pedido",
        "Schreibe einen Beschwerdebrief über eine Bestellung",
        "Ha recibido un pedido de material de oficina con artículos incorrectos y algunos dañados. Escribe una carta de queja formal al proveedor explicando el problema con datos concretos.",
        [
            "Abre la carta con un saludo formal al proveedor.",
            "Indica el número de pedido y la fecha de entrega.",
            "Describe qué artículos llegaron incorrectos o dañados.",
            "Menciona el número de unidades afectadas.",
            "Explica el impacto que esto tiene en tu trabajo.",
            "Pide la reposición de los artículos correctos.",
            "Especifica cuándo necesitas la reposición.",
            "Termina con una petición de confirmación por escrito.",
        ],
        "Sie haben eine Bestellung mit falschen und beschädigten Artikeln erhalten. Schreiben Sie einen formellen Beschwerdebrief mit konkreten Informationen.",
        [
            "Beginnen Sie mit einer formellen Begrüßung.",
            "Nennen Sie die Bestellnummer und das Lieferdatum.",
            "Beschreiben Sie, welche Artikel falsch oder beschädigt waren.",
            "Nennen Sie die Anzahl der betroffenen Einheiten.",
            "Erklären Sie, wie sich das auf Ihre Arbeit auswirkt.",
            "Fordern Sie den Ersatz der richtigen Artikel an.",
            "Geben Sie an, wann Sie den Ersatz benötigen.",
            "Bitten Sie am Ende um eine schriftliche Bestätigung.",
        ],
    )

    files[4550] = writing_sql(
        4550,
        "write most letters (s)he is likely to be asked to do",
        CORRESPONDENCE,
        "Escribe una carta de seguimiento",
        "Schreibe ein Nachfassschreiben",
        "Escribiste una carta de consulta hace dos semanas pero no has recibido respuesta. Escribe una carta de seguimiento amable pero directa para preguntar si recibieron tu mensaje anterior y pedir una respuesta.",
        [
            "Abre con un saludo formal.",
            "Menciona que escribiste hace dos semanas sobre material de oficina.",
            "Di que no has recibido respuesta todavía.",
            "Adjunta o resume brevemente tu petición original.",
            "Pregunta si pueden responder esta semana.",
            "Indica que estás interesado en hacer un pedido pronto.",
            "Ofrece tu teléfono o correo para una respuesta rápida.",
            "Cierra con una despedida amable y profesional.",
        ],
        "Sie haben vor zwei Wochen einen Anfragebriefs geschickt, aber keine Antwort erhalten. Schreiben Sie ein freundliches, aber direktes Nachfassschreiben.",
        [
            "Beginnen Sie mit einer formellen Begrüßung.",
            "Erwähnen Sie Ihr Schreiben von vor zwei Wochen über Büromaterial.",
            "Teilen Sie mit, dass Sie noch keine Antwort erhalten haben.",
            "Legen Sie Ihre ursprüngliche Anfrage kurz zusammen oder fügen Sie sie bei.",
            "Fragen Sie, ob diese Woche eine Antwort möglich ist.",
            "Weisen Sie darauf hin, dass Sie bald eine Bestellung aufgeben möchten.",
            "Geben Sie Ihre Telefonnummer oder E-Mail für eine schnelle Antwort an.",
            "Beenden Sie freundlich und professionell.",
        ],
    )

    files[4560] = writing_sql(
        4560,
        "write any type of letter necessary in the course of his/her work",
        CORRESPONDENCE,
        "Escribe una carta formal de solicitud",
        "Schreibe einen formellen Antragsbrief",
        "Eres gerente de compras y necesitas solicitar formalmente una reunión con un proveedor clave para negociar un contrato anual. La carta debe ser formal, clara y convincente.",
        [
            "Indica el asunto de la carta en el encabezado.",
            "Abre con un saludo formal y el nombre del destinatario.",
            "Preséntate y explica tu cargo.",
            "Explica el propósito: solicitar una reunión para negociar el contrato anual.",
            "Propón dos fechas y horarios posibles para la reunión.",
            "Menciona los temas que deseas tratar: precios, plazos y condiciones.",
            "Proporciona tus datos de contacto.",
            "Cierra formalmente y expresa tu esperanza de recibir una respuesta pronto.",
        ],
        "Sie sind Einkaufsleiter und möchten offiziell ein Treffen mit einem wichtigen Lieferanten vereinbaren, um einen Jahresvertrag zu verhandeln.",
        [
            "Geben Sie den Betreff des Briefes in der Kopfzeile an.",
            "Beginnen Sie mit einer formellen Begrüßung und dem Namen des Empfängers.",
            "Stellen Sie sich vor und nennen Sie Ihre Position.",
            "Erklären Sie den Zweck: ein Treffen für Jahresvertragsverhandlungen anfragen.",
            "Schlagen Sie zwei mögliche Termine und Uhrzeiten vor.",
            "Erwähnen Sie die Themen: Preise, Fristen und Konditionen.",
            "Geben Sie Ihre Kontaktdaten an.",
            "Beenden Sie formell und drücken Sie die Hoffnung auf eine baldige Antwort aus.",
        ],
    )

    files[4570] = reading_sql(
        4570,
        "understand a short report on a familiar matter",
        CORRESPONDENCE,
        "Lee un resumen de ventas mensual",
        "Lies einen monatlichen Verkaufsbericht",
        "Lee un resumen mensual de ventas con cifras, clientes y objetivos.",
        "Lies eine monatliche Verkaufsübersicht mit Zahlen, Kunden und Zielen.",
        """
        Monthly Sales Summary – October

        October was a positive month for the sales team. Total sales reached £45,000, supported by strong regional performance and steady online demand. Our best-selling product was the ergonomic chair range, with 120 units sold during the month. The North region generated £20,000 in sales, while the South region performed even better with £25,000.

        Online orders increased by 15% compared with September, which suggests that the recent website campaign is working well. The team also signed up three new corporate clients, creating promising opportunities for repeat business in the coming quarter. One existing client cancelled a subscription worth £2,000, which slightly reduced the final result.

        The sales target for November has been set at £50,000. Managers will review progress weekly to keep the team on track.
        """,
        build_reading_exercises(
            [
                ("Las ventas totales de octubre fueron 45.000 £.", "Der Gesamtumsatz im Oktober betrug 45.000 £.", True),
                ("El producto más vendido fue el escritorio ergonómico.", "Das meistverkaufte Produkt war der ergonomische Schreibtisch.", False),
                ("Se vendieron 120 sillas ergonómicas.", "Es wurden 120 ergonomische Stühle verkauft.", True),
                ("La región norte vendió más que la región sur.", "Die Nordregion verkaufte mehr als die Südregion.", False),
                ("Los pedidos online aumentaron un 15 %.", "Die Online-Bestellungen stiegen um 15 %.", True),
                ("Se apuntaron dos nuevos clientes corporativos.", "Zwei neue Firmenkunden wurden gewonnen.", False),
                ("Un cliente canceló una suscripción.", "Ein Kunde kündigte ein Abonnement.", True),
                ("El objetivo de noviembre es 55.000 £.", "Das Ziel für November beträgt 55.000 £.", False),
            ],
            [
                ("¿Cuáles fueron las ventas totales de octubre?", "Wie hoch war der Gesamtumsatz im Oktober?", ["45.000 £", "50.000 £", "40.000 £"], ["45.000 £", "50.000 £", "40.000 £"], 0),
                ("¿Cuál fue el producto más vendido?", "Was war das meistverkaufte Produkt?", ["Sillas ergonómicas", "Escritorios de oficina", "Pantallas de ordenador"], ["Ergonomische Stühle", "Büroschreibtische", "Computerbildschirme"], 0),
                ("¿Cuántas sillas ergonómicas se vendieron?", "Wie viele ergonomische Stühle wurden verkauft?", ["120", "100", "150"], ["120", "100", "150"], 0),
                ("¿Qué región tuvo más ventas?", "Welche Region hatte höhere Umsätze?", ["La región sur", "La región norte", "La región este"], ["Die Südregion", "Die Nordregion", "Die Ostregion"], 0),
                ("¿Cuánto aumentaron los pedidos online?", "Um wie viel stiegen die Online-Bestellungen?", ["15 %", "10 %", "20 %"], ["15 %", "10 %", "20 %"], 0),
                ("¿Cuántos nuevos clientes corporativos hubo?", "Wie viele neue Firmenkunden gab es?", ["Tres", "Dos", "Cuatro"], ["Drei", "Zwei", "Vier"], 0),
                ("¿Qué pasó con un cliente?", "Was geschah mit einem Kunden?", ["Canceló una suscripción", "Se mudó a otra dirección", "Envió una reclamación"], ["Er kündigte ein Abonnement", "Er zog an eine neue Adresse", "Er schickte eine Beschwerde"], 0),
                ("¿Cuál es el objetivo de noviembre?", "Wie lautet das Ziel für November?", ["50.000 £", "45.000 £", "55.000 £"], ["50.000 £", "45.000 £", "55.000 £"], 0),
            ],
        ),
    )

    files[4580] = reading_sql(
        4580,
        "understand most short reports of a predictable nature",
        CORRESPONDENCE,
        "Lee un informe trimestral de rendimiento",
        "Lies einen vierteljährlichen Leistungsbericht",
        "Lee un informe trimestral con ingresos, gastos, plantilla y retos.",
        "Lies einen Quartalsbericht mit Umsatz, Kosten, Personal und Herausforderungen.",
        """
        Quarterly Performance Report – Q3

        The company delivered stable growth during Q3. Revenue reached £130,000, which is 8% higher than in Q2. Expenses for the quarter totalled £95,000, leaving a net profit of £35,000. These figures show improved control over operating costs despite pressure from suppliers.

        At the end of the quarter, the business employed 24 full-time staff and 3 part-time staff. Customer satisfaction remained strong at 87%, reflecting positive feedback on delivery speed and service quality. During Q3, the product team launched two new products and discontinued one older product with weak demand.

        The main operational challenge was supply chain delays from one of our main suppliers. Management is now reviewing alternative suppliers to reduce the risk of future disruption.
        """,
        build_reading_exercises(
            [
                ("El informe corresponde al tercer trimestre.", "Der Bericht bezieht sich auf das dritte Quartal.", True),
                ("Los ingresos fueron 130.000 £.", "Der Umsatz betrug 130.000 £.", True),
                ("Los ingresos aumentaron un 8 % respecto al segundo trimestre.", "Der Umsatz stieg gegenüber Q2 um 8 %.", True),
                ("Los gastos fueron 100.000 £.", "Die Ausgaben betrugen 100.000 £.", False),
                ("El beneficio neto fue 35.000 £.", "Der Nettogewinn betrug 35.000 £.", True),
                ("Hay 3 empleados a tiempo completo y 24 a tiempo parcial.", "Es gibt 3 Vollzeitkräfte und 24 Teilzeitkräfte.", False),
                ("La satisfacción del cliente fue del 87 %.", "Die Kundenzufriedenheit lag bei 87 %.", True),
                ("Se lanzaron tres productos nuevos.", "Es wurden drei neue Produkte eingeführt.", False),
            ],
            [
                ("¿Cuáles fueron los ingresos del tercer trimestre?", "Wie hoch war der Umsatz im dritten Quartal?", ["130.000 £", "120.000 £", "140.000 £"], ["130.000 £", "120.000 £", "140.000 £"], 0),
                ("¿Cuánto aumentaron los ingresos?", "Um wie viel stieg der Umsatz?", ["8 %", "5 %", "12 %"], ["8 %", "5 %", "12 %"], 0),
                ("¿Cuáles fueron los gastos totales?", "Wie hoch waren die Gesamtausgaben?", ["95.000 £", "100.000 £", "85.000 £"], ["95.000 £", "100.000 £", "85.000 £"], 0),
                ("¿Cuál fue el beneficio neto?", "Wie hoch war der Nettogewinn?", ["35.000 £", "25.000 £", "45.000 £"], ["35.000 £", "25.000 £", "45.000 £"], 0),
                ("¿Cuántos empleados a tiempo completo hay?", "Wie viele Vollzeitkräfte gibt es?", ["24", "3", "27"], ["24", "3", "27"], 0),
                ("¿Cuál fue la satisfacción del cliente?", "Wie hoch war die Kundenzufriedenheit?", ["87 %", "75 %", "90 %"], ["87 %", "75 %", "90 %"], 0),
                ("¿Cuántos productos nuevos se lanzaron?", "Wie viele neue Produkte wurden eingeführt?", ["Dos", "Tres", "Uno"], ["Zwei", "Drei", "Eins"], 0),
                ("¿Cuál fue el principal desafío?", "Was war die größte Herausforderung?", ["Retrasos en la cadena de suministro", "Falta de personal", "Problemas informáticos"], ["Lieferkettenverzögerungen", "Personalmangel", "IT-Probleme"], 0),
            ],
        ),
    )

    files[4590] = reading_sql(
        4590,
        "understand the general meaning of a report even if the topic is not entirely predictable",
        CORRESPONDENCE,
        "Lee un informe de auditoría interna",
        "Lies einen internen Prüfungsbericht",
        "Lee las conclusiones de una auditoría interna con incidencias y recomendaciones.",
        "Lies die Ergebnisse einer internen Prüfung mit Feststellungen und Empfehlungen.",
        """
        Internal Audit Report – Accounts Payable

        This internal audit reviewed the Accounts Payable department for the period July to September. The audit found that 3 invoices, with a combined value of £7,400, were processed without the correct level of authorisation. Although the number of cases was limited, the finding shows a weakness in current approval controls.

        The audit also noted that 12% of supplier contracts are overdue for formal review. In addition, the electronic filing system remains incomplete for records from 2022, which makes it harder to confirm whether supporting documents are available for all transactions.

        The report recommends introducing dual authorisation for every invoice above £1,000. It also recommends that all overdue contract reviews be completed by the end of Q4. Management has been asked to provide an action plan within two weeks.
        """,
        build_reading_exercises(
            [
                ("La auditoría es del departamento de Cuentas por Pagar.", "Die Prüfung betrifft die Abteilung Kreditorenbuchhaltung.", True),
                ("La auditoría cubre de octubre a diciembre.", "Die Prüfung umfasst Oktober bis Dezember.", False),
                ("Se tramitaron tres facturas sin la autorización adecuada.", "Drei Rechnungen wurden ohne ordnungsgemäße Genehmigung bearbeitet.", True),
                ("El valor total de esas facturas fue 7.400 £.", "Der Gesamtwert dieser Rechnungen betrug 7.400 £.", True),
                ("Todos los contratos de proveedores están al día.", "Alle Lieferantenverträge sind auf dem neuesten Stand.", False),
                ("El archivo electrónico está incompleto para los registros de 2023.", "Die elektronische Ablage ist für die Unterlagen von 2023 unvollständig.", False),
                ("El informe recomienda doble autorización para facturas superiores a 1.000 £.", "Der Bericht empfiehlt eine doppelte Genehmigung für Rechnungen über 1.000 £.", True),
                ("Las revisiones de contratos deben completarse al final del primer trimestre.", "Die Vertragsprüfungen müssen bis Ende Q1 abgeschlossen sein.", False),
            ],
            [
                ("¿Qué departamento fue auditado?", "Welche Abteilung wurde geprüft?", ["Cuentas por Pagar", "Recursos Humanos", "Ventas"], ["Kreditorenbuchhaltung", "Personalabteilung", "Vertrieb"], 0),
                ("¿Qué periodo cubrió la auditoría?", "Welchen Zeitraum umfasste die Prüfung?", ["De julio a septiembre", "De enero a marzo", "De octubre a diciembre"], ["Von Juli bis September", "Von Januar bis März", "Von Oktober bis Dezember"], 0),
                ("¿Cuántas facturas no autorizadas se encontraron?", "Wie viele nicht genehmigte Rechnungen wurden gefunden?", ["3", "5", "12"], ["3", "5", "12"], 0),
                ("¿Cuál fue el valor total de esas facturas?", "Wie hoch war der Gesamtwert dieser Rechnungen?", ["7.400 £", "1.000 £", "14.000 £"], ["7.400 £", "1.000 £", "14.000 £"], 0),
                ("¿Qué porcentaje de contratos está pendiente de revisión?", "Welcher Prozentsatz der Verträge ist überfällig?", ["12 %", "5 %", "20 %"], ["12 %", "5 %", "20 %"], 0),
                ("¿De qué año falta archivo electrónico?", "Für welches Jahr ist die elektronische Ablage unvollständig?", ["2022", "2023", "2021"], ["2022", "2023", "2021"], 0),
                ("¿Qué importe activa la doble autorización?", "Ab welchem Betrag gilt die doppelte Genehmigung?", ["1.000 £", "500 £", "2.000 £"], ["1.000 £", "500 £", "2.000 £"], 0),
                ("¿Para cuándo deben completarse las revisiones de contratos?", "Bis wann müssen die Vertragsprüfungen abgeschlossen sein?", ["Final del cuarto trimestre", "Final del primer trimestre", "Final del segundo trimestre"], ["Bis Ende Q4", "Bis Ende Q1", "Bis Ende Q2"], 0),
            ],
        ),
    )

    files[4600] = reading_sql(
        4600,
        "CAN, within a reasonably short time, understand most reports that (s)he is likely to come across",
        CORRESPONDENCE,
        "Lee el resumen del informe anual",
        "Lies die Zusammenfassung des Jahresberichts",
        "Lee un resumen anual con resultados, aperturas y metas de crecimiento.",
        "Lies eine Jahresübersicht mit Ergebnissen, Neueröffnungen und Wachstumszielen.",
        """
        Annual Company Summary – FY2023

        The company closed FY2023 with total revenue of £2.4 million, representing a 12% increase compared with the previous year. Operating costs reached £1.9 million, which resulted in an operating profit of £500,000. The leadership team described the year as one of controlled expansion and stronger commercial performance.

        During the year, the business opened three new offices in Manchester, Bristol and Leeds. Staff numbers grew from 45 to 62, reflecting both the regional expansion and growing client demand. The sales team also signed new contracts with 8 major clients, strengthening the company’s position in key sectors.

        Another important achievement was the completion of the digital transformation project, which modernised internal systems. The target for FY2024 is to reach £3 million in revenue and recruit 15 additional staff members.
        """,
        build_reading_exercises(
            [
                ("Los ingresos totales fueron 2,4 millones de libras.", "Der Gesamtumsatz betrug 2,4 Millionen Pfund.", True),
                ("Los ingresos aumentaron un 10 % respecto al año anterior.", "Der Umsatz stieg gegenüber dem Vorjahr um 10 %.", False),
                ("Los costes operativos fueron 1,9 millones de libras.", "Die Betriebskosten betrugen 1,9 Millionen Pfund.", True),
                ("El beneficio operativo fue 500.000 £.", "Der Betriebsgewinn betrug 500.000 £.", True),
                ("Se abrieron dos oficinas nuevas.", "Es wurden zwei neue Büros eröffnet.", False),
                ("La plantilla creció de 45 a 62 personas.", "Die Belegschaft wuchs von 45 auf 62 Mitarbeitende.", True),
                ("Se firmaron contratos con ocho grandes clientes nuevos.", "Es wurden Verträge mit acht großen Neukunden abgeschlossen.", True),
                ("El objetivo de ingresos para 2024 es 3,5 millones de libras.", "Das Umsatzziel für 2024 beträgt 3,5 Millionen Pfund.", False),
            ],
            [
                ("¿Cuál fue el ingreso total del ejercicio 2023?", "Wie hoch war der Gesamtumsatz im Geschäftsjahr 2023?", ["2,4 millones de libras", "1,9 millones de libras", "3 millones de libras"], ["2,4 Millionen Pfund", "1,9 Millionen Pfund", "3 Millionen Pfund"], 0),
                ("¿Cuánto aumentaron los ingresos?", "Um wie viel stieg der Umsatz?", ["12 %", "8 %", "15 %"], ["12 %", "8 %", "15 %"], 0),
                ("¿Cuál fue el beneficio operativo?", "Wie hoch war der Betriebsgewinn?", ["500.000 £", "300.000 £", "700.000 £"], ["500.000 £", "300.000 £", "700.000 £"], 0),
                ("¿Qué ciudad NO fue una de las nuevas oficinas?", "Welche Stadt gehörte NICHT zu den neuen Standorten?", ["Birmingham", "Manchester", "Bristol"], ["Birmingham", "Manchester", "Bristol"], 0),
                ("¿Cuántos empleados tenía la empresa al final de 2023?", "Wie viele Mitarbeitende hatte das Unternehmen Ende 2023?", ["62", "45", "77"], ["62", "45", "77"], 0),
                ("¿Cuántos grandes clientes nuevos firmaron contrato?", "Mit wie vielen großen Neukunden wurden Verträge abgeschlossen?", ["8", "5", "12"], ["8", "5", "12"], 0),
                ("¿Qué proyecto se completó?", "Welches Projekt wurde abgeschlossen?", ["La transformación digital", "La renovación de oficinas", "El lanzamiento de producto"], ["Die digitale Transformation", "Die Bürosanierung", "Die Produkteinführung"], 0),
                ("¿Cuál es el objetivo de ingresos para 2024?", "Wie lautet das Umsatzziel für 2024?", ["3 millones de libras", "2,4 millones de libras", "3,5 millones de libras"], ["3 Millionen Pfund", "2,4 Millionen Pfund", "3,5 Millionen Pfund"], 0),
            ],
        ),
    )

    files[4610] = reading_sql(
        4610,
        "understand the reports that (s)he is likely to come across, including the finer points, implications etc. of a complex report",
        CORRESPONDENCE,
        "Lee un informe detallado de proyecto",
        "Lies einen detaillierten Projektbericht",
        "Lee un informe de cierre de proyecto con desviaciones, incidencias y lecciones aprendidas.",
        "Lies einen Projektabschlussbericht mit Abweichungen, Problemen und gewonnenen Erkenntnissen.",
        """
        Project Completion Report – CRM System Implementation

        Project CRM-2023 has now been completed after a total duration of 14 months. The original estimate was 12 months, so delivery was 2 months later than planned. Final project cost reached £184,000 against an approved budget of £160,000. The main reason for the overspend was the need for additional consultancy fees during the integration phase.

        In terms of deliverables, data migration was completed on time, and system integration also finished as planned. Staff training, however, ended 3 weeks behind schedule because several business teams were unavailable during the original training window. After implementation, the client reported 2 minor bugs, both of which were resolved within 30 days.

        Overall client satisfaction was 91%. The main lesson learned is to allow a 20% time buffer for future training phases.
        """,
        build_reading_exercises(
            [
                ("El código del proyecto es CRM-2023.", "Der Projektcode lautet CRM-2023.", True),
                ("El proyecto duró 12 meses como estaba previsto.", "Das Projekt dauerte wie geplant 12 Monate.", False),
                ("El coste total se mantuvo dentro del presupuesto.", "Die Gesamtkosten blieben im Budget.", False),
                ("La formación del personal se retrasó 3 semanas.", "Die Schulung der Mitarbeitenden lag 3 Wochen hinter dem Plan.", True),
                ("La migración de datos se completó a tiempo.", "Die Datenmigration wurde termingerecht abgeschlossen.", True),
                ("Hubo 5 errores menores después de la implantación.", "Nach der Einführung gab es 5 kleinere Fehler.", False),
                ("La satisfacción del cliente fue del 91 %.", "Die Kundenzufriedenheit lag bei 91 %.", True),
                ("Se recomienda añadir un margen de tiempo del 20 % para la formación.", "Es wird empfohlen, für Schulungen einen Zeitpuffer von 20 % einzuplanen.", True),
            ],
            [
                ("¿Cuál fue el código del proyecto?", "Wie lautete der Projektcode?", ["CRM-2023", "CRM-2022", "CRM-2024"], ["CRM-2023", "CRM-2022", "CRM-2024"], 0),
                ("¿Cuántos meses más duró el proyecto de lo previsto?", "Wie viele Monate länger dauerte das Projekt als geplant?", ["2 meses", "1 mes", "3 meses"], ["2 Monate", "1 Monat", "3 Monate"], 0),
                ("¿Cuál era el presupuesto del proyecto?", "Wie hoch war das Projektbudget?", ["160.000 £", "184.000 £", "200.000 £"], ["160.000 £", "184.000 £", "200.000 £"], 0),
                ("¿Por qué se pasó del presupuesto?", "Warum wurde das Budget überschritten?", ["Por honorarios extra de consultoría", "Por horas extra del personal", "Por costes de equipamiento"], ["Wegen zusätzlicher Beratungskosten", "Wegen Überstunden des Personals", "Wegen Gerätekosten"], 0),
                ("¿Qué tarea se retrasó?", "Welche Aufgabe war verspätet?", ["La formación del personal", "La migración de datos", "La integración del sistema"], ["Die Schulung des Personals", "Die Datenmigration", "Die Systemintegration"], 0),
                ("¿Cuántos fallos hubo tras la implantación?", "Wie viele Fehler traten nach der Einführung auf?", ["2", "5", "10"], ["2", "5", "10"], 0),
                ("¿Cuál fue la satisfacción del cliente?", "Wie hoch war die Kundenzufriedenheit?", ["91 %", "85 %", "78 %"], ["91 %", "85 %", "78 %"], 0),
                ("¿Qué porcentaje de margen se recomienda para futuras formaciones?", "Welcher Puffer wird für zukünftige Schulungsphasen empfohlen?", ["20 %", "10 %", "30 %"], ["20 %", "10 %", "30 %"], 0),
            ],
        ),
    )

    files[4620] = reading_sql(
        4620,
        "understand a short product description within own work area",
        CORRESPONDENCE,
        "Lee una descripción de producto de mobiliario",
        "Lies eine Produktbeschreibung für Möbel",
        "Lee una descripción breve de una silla ergonómica con medidas, garantía y descuento.",
        "Lies eine kurze Produktbeschreibung eines ergonomischen Stuhls mit Maßen, Garantie und Rabatt.",
        """
        Product Description – ErgoDesk Pro Chair

        The ErgoDesk Pro Chair is designed for daily office use and long working sessions. It features a breathable mesh back and a padded seat for improved comfort during the day. Users can adjust the seat height between 40 and 55 cm, as well as the armrest height, armrest width and lumbar support position to match individual needs.

        The maximum recommended weight is 120 kg. The chair is available in black, grey and navy, which makes it suitable for most office interiors. Assembly is required, but the process takes only around 15 minutes and all tools are included in the box.

        The frame is covered by a 5-year warranty, while the padding has a 2-year warranty. The standard price is £189 per unit, and orders of 20 or more qualify for a 10% volume discount.
        """,
        build_reading_exercises(
            [
                ("El respaldo de la silla es de malla transpirable.", "Die Rückenlehne des Stuhls besteht aus atmungsaktivem Netzgewebe.", True),
                ("El peso máximo es de 100 kg.", "Das Maximalgewicht beträgt 100 kg.", False),
                ("La altura del asiento se ajusta entre 40 y 55 cm.", "Die Sitzhöhe ist zwischen 40 und 55 cm verstellbar.", True),
                ("La silla viene totalmente montada.", "Der Stuhl wird vollständig montiert geliefert.", False),
                ("El montaje tarda 15 minutos.", "Der Aufbau dauert 15 Minuten.", True),
                ("La garantía del armazón es de 2 años.", "Die Garantie auf den Rahmen beträgt 2 Jahre.", False),
                ("La silla cuesta 189 £ por unidad.", "Der Stuhl kostet 189 £ pro Stück.", True),
                ("Hay un descuento del 10 % para 20 sillas o más.", "Für 20 oder mehr Stühle gibt es 10 % Rabatt.", True),
            ],
            [
                ("¿Cuál es la capacidad máxima de peso?", "Wie hoch ist die maximale Traglast?", ["120 kg", "100 kg", "150 kg"], ["120 kg", "100 kg", "150 kg"], 0),
                ("¿Cuál es el rango de altura del asiento?", "Wie groß ist der Bereich der Sitzhöhe?", ["40–55 cm", "35–50 cm", "45–60 cm"], ["40–55 cm", "35–50 cm", "45–60 cm"], 0),
                ("¿Qué color NO está disponible?", "Welche Farbe ist NICHT verfügbar?", ["Rojo", "Negro", "Gris"], ["Rot", "Schwarz", "Grau"], 0),
                ("¿Cuánto tarda el montaje?", "Wie lange dauert der Aufbau?", ["15 minutos", "30 minutos", "1 hora"], ["15 Minuten", "30 Minuten", "1 Stunde"], 0),
                ("¿Cuál es la garantía del armazón?", "Wie lang ist die Garantie auf den Rahmen?", ["5 años", "2 años", "3 años"], ["5 Jahre", "2 Jahre", "3 Jahre"], 0),
                ("¿Cuál es la garantía del acolchado?", "Wie lang ist die Garantie auf die Polsterung?", ["2 años", "5 años", "1 año"], ["2 Jahre", "5 Jahre", "1 Jahr"], 0),
                ("¿Cuál es el precio por unidad?", "Wie hoch ist der Preis pro Stück?", ["189 £", "199 £", "179 £"], ["189 £", "199 £", "179 £"], 0),
                ("¿Qué descuento hay para 20 sillas o más?", "Welcher Rabatt gilt für 20 oder mehr Stühle?", ["10 %", "5 %", "15 %"], ["10 %", "5 %", "15 %"], 0),
            ],
        ),
    )

    files[4630] = reading_sql(
        4630,
        "understand basic, factual information within own work area, for example from plans and diagrams",
        CORRESPONDENCE,
        "Lee un plano de planta de oficina",
        "Lies einen Bürogrundriss",
        "Lee un plano de oficinas con salas, equipamiento y salidas.",
        "Lies einen Bürogrundriss mit Räumen, Ausstattung und Ausgängen.",
        """
        Office Floor Plan – Floor 2, Building A

        Floor 2 of Building A is organised into six main spaces. Room 1 is Reception and has capacity for 4 desks. Room 2 is the open plan office, which is the largest area on the floor and holds 18 desks for general staff. Room 3 is Meeting Room A. It has space for 8 people and is equipped with both a projector and a whiteboard. Room 4 is Meeting Room B, a smaller room for 4 people with a TV screen.

        Room 5 is the kitchen and includes a microwave, fridge and kettle for staff use. Room 6 is the manager’s private office and contains 1 desk. The fire exit is located at the end of the main corridor. The lift is near reception, while the stairs are positioned close to the kitchen.
        """,
        build_reading_exercises(
            [
                ("El plano es de la planta 2 del edificio A.", "Der Plan zeigt Etage 2 von Gebäude A.", True),
                ("La recepción tiene capacidad para 8 escritorios.", "Der Empfang hat Platz für 8 Schreibtische.", False),
                ("La oficina diáfana tiene 18 escritorios.", "Das Großraumbüro hat 18 Schreibtische.", True),
                ("La sala de reuniones A tiene proyector y pizarra.", "Besprechungsraum A hat einen Projektor und ein Whiteboard.", True),
                ("La sala de reuniones B tiene proyector.", "Besprechungsraum B hat einen Projektor.", False),
                ("En la cocina hay una nevera.", "In der Küche gibt es einen Kühlschrank.", True),
                ("La salida de incendios está cerca de recepción.", "Der Notausgang ist in der Nähe des Empfangs.", False),
                ("El ascensor está cerca de recepción.", "Der Aufzug ist in der Nähe des Empfangs.", True),
            ],
            [
                ("¿Cuántos escritorios hay en la oficina diáfana?", "Wie viele Schreibtische gibt es im Großraumbüro?", ["18", "12", "24"], ["18", "12", "24"], 0),
                ("¿Cuántas personas caben en la sala A?", "Wie viele Personen passen in Raum A?", ["8", "4", "12"], ["8", "4", "12"], 0),
                ("¿Qué tiene la sala de reuniones B?", "Was gibt es in Besprechungsraum B?", ["Una pantalla de televisión", "Un proyector", "Una pizarra"], ["Einen Fernsehbildschirm", "Einen Projektor", "Ein Whiteboard"], 0),
                ("¿Qué hay en la cocina?", "Was gibt es in der Küche?", ["Microondas, nevera y hervidor", "Impresora, escáner y copiadora", "Solo una cafetera"], ["Mikrowelle, Kühlschrank und Wasserkocher", "Drucker, Scanner und Kopierer", "Nur eine Kaffeemaschine"], 0),
                ("¿Dónde está la salida de incendios?", "Wo befindet sich der Notausgang?", ["Al final del pasillo principal", "Cerca de recepción", "Cerca de la cocina"], ["Am Ende des Hauptflurs", "In der Nähe des Empfangs", "In der Nähe der Küche"], 0),
                ("¿Dónde están las escaleras?", "Wo sind die Treppen?", ["Cerca de la cocina", "Cerca de recepción", "Cerca de la sala A"], ["In der Nähe der Küche", "In der Nähe des Empfangs", "In der Nähe von Raum A"], 0),
                ("¿Qué tipo de sala es la habitación 2?", "Was für ein Raum ist Zimmer 2?", ["Oficina diáfana", "Despacho del gerente", "Sala de reuniones"], ["Großraumbüro", "Büro des Managers", "Besprechungsraum"], 0),
                ("¿Quién usa la habitación 6?", "Wer nutzt Zimmer 6?", ["El gerente", "La recepcionista", "Los visitantes"], ["Der Manager", "Die Empfangskraft", "Die Besucher"], 0),
            ],
        ),
    )

    files[4640] = reading_sql(
        4640,
        "understand the general meaning of a theoretical article within own work area",
        CORRESPONDENCE,
        "Lee un artículo sobre ergonomía laboral",
        "Lies einen Artikel über Arbeitsergonomie",
        "Lee un texto teórico sobre ergonomía y salud en el trabajo.",
        "Lies einen theoretischen Text über Ergonomie und Gesundheit am Arbeitsplatz.",
        """
        Ergonomics in the Workplace

        Ergonomics is the science of designing the work environment to fit the worker rather than forcing the worker to adapt to poor conditions. In office settings, bad ergonomic design can contribute to musculoskeletal problems such as back pain, neck strain and repetitive strain injuries. These issues often develop slowly, but they can lead to discomfort, absence and lower productivity.

        Good ergonomic practice includes maintaining a neutral body position, keeping computer screens at eye level and taking short breaks every 45 to 60 minutes. Research published by the Health and Safety Executive shows that musculoskeletal disorders account for 30% of all work-related ill-health cases in the UK.

        Employers that invest in ergonomic furniture and staff training can reduce absence by up to 25%. As a result, ergonomics is not only a health issue but also a practical business decision.
        """,
        build_reading_exercises(
            [
                ("La ergonomía es la ciencia de diseñar el entorno para que se adapte al trabajador.", "Ergonomie ist die Wissenschaft, die Arbeitsumgebung an den Menschen anzupassen.", True),
                ("La mala ergonomía solo provoca dolores de cabeza.", "Schlechte Ergonomie verursacht nur Kopfschmerzen.", False),
                ("Las pantallas deben mantenerse a la altura de los ojos.", "Bildschirme sollten auf Augenhöhe sein.", True),
                ("Los trabajadores deben hacer pausas cada 30 minutos.", "Mitarbeitende sollten alle 30 Minuten Pausen machen.", False),
                ("Los trastornos musculoesqueléticos representan el 30 % de los problemas de salud laboral.", "Muskel-Skelett-Erkrankungen machen 30 % der arbeitsbedingten Gesundheitsprobleme aus.", True),
                ("La inversión ergonómica puede reducir las ausencias hasta un 25 %.", "Ergonomische Investitionen können Fehlzeiten um bis zu 25 % senken.", True),
                ("El dolor de espalda se menciona como un problema musculoesquelético.", "Rückenschmerzen werden als Muskel-Skelett-Problem genannt.", True),
                ("El artículo dice que la ergonomía no es importante para la productividad.", "Der Artikel sagt, Ergonomie sei nicht wichtig für die Produktivität.", False),
            ],
            [
                ("¿Qué es la ergonomía?", "Was ist Ergonomie?", ["La ciencia de diseñar el entorno para adaptarlo al trabajador", "El estudio del mobiliario de oficina", "Un tipo de ejercicio"], ["Die Wissenschaft, die Umgebung an den Menschen anzupassen", "Die Lehre von Büromöbeln", "Eine Art von Gymnastik"], 0),
                ("¿Qué lesión NO se menciona?", "Welche Verletzung wird NICHT erwähnt?", ["Fractura de muñeca", "Dolor de espalda", "Tensión en el cuello"], ["Handgelenksbruch", "Rückenschmerzen", "Nackenverspannung"], 0),
                ("¿Cada cuánto tiempo deben hacerse pausas cortas?", "Wie oft sollten kurze Pausen gemacht werden?", ["Cada 45–60 minutos", "Cada 2 horas", "Cada 20 minutos"], ["Alle 45–60 Minuten", "Alle 2 Stunden", "Alle 20 Minuten"], 0),
                ("¿Qué porcentaje de la mala salud laboral es musculoesquelética?", "Welcher Prozentsatz der arbeitsbedingten Gesundheitsprobleme ist muskel-skelettbedingt?", ["30 %", "20 %", "40 %"], ["30 %", "20 %", "40 %"], 0),
                ("¿Qué organización se menciona?", "Welche Organisation wird erwähnt?", ["La Health and Safety Executive", "El NHS", "El Departamento de Educación"], ["Die Health and Safety Executive", "Der NHS", "Das Bildungsministerium"], 0),
                ("¿Qué postura debe mantenerse?", "Welche Haltung sollte beibehalten werden?", ["Una posición corporal neutra", "Inclinarse hacia delante", "Una postura reclinada"], ["Eine neutrale Körperhaltung", "Nach vorn gebeugt", "Eine zurückgelehnte Haltung"], 0),
                ("¿Cuánto pueden reducirse las ausencias?", "Um wie viel können Fehlzeiten reduziert werden?", ["Hasta un 25 %", "Hasta un 10 %", "Hasta un 50 %"], ["Um bis zu 25 %", "Um bis zu 10 %", "Um bis zu 50 %"], 0),
                ("¿Qué dos cosas recomienda el artículo?", "Welche zwei Dinge empfiehlt der Artikel?", ["Mobiliario ergonómico y formación", "Meditación y yoga", "Reuniones periódicas"], ["Ergonomische Möbel und Schulungen", "Meditation und Yoga", "Regelmäßige Besprechungen"], 0),
            ],
        ),
    )

    files[4650] = reading_sql(
        4650,
        "understand most factual product literature within own work area",
        CORRESPONDENCE,
        "Lee la guía de inicio rápido de una impresora",
        "Lies den Schnellstartleitfaden eines Druckers",
        "Lee instrucciones de inicio rápido para instalar y probar una impresora.",
        "Lies eine Schnellstartanleitung zur Installation und Prüfung eines Druckers.",
        """
        Quick-Start Guide – ProPrint 400

        To set up the ProPrint 400, first remove all packaging materials and place the printer on a flat, stable surface. Next, connect the power cable to the printer and then to a wall socket. Press the power button and wait until the ready light turns green before continuing.

        Open the paper tray and load up to 250 sheets of A4 paper. The printer driver is supplied on the USB drive included in the box. Install the driver before connecting the machine to your computer. You can choose either a USB connection or WiFi, depending on your workspace.

        To confirm that installation is complete, print a test page from the printer menu. If the page does not print, check all cable connections and restart the printer before requesting support.
        """,
        build_reading_exercises(
            [
                ("El producto es la ProPrint 400.", "Das Produkt ist der ProPrint 400.", True),
                ("El primer paso es conectar el cable de alimentación.", "Der erste Schritt ist, das Stromkabel anzuschließen.", False),
                ("Hay que esperar a que la luz de listo se ponga verde.", "Man soll warten, bis die Betriebsleuchte grün wird.", True),
                ("La bandeja de papel admite hasta 250 hojas.", "Das Papierfach fasst bis zu 250 Blatt.", True),
                ("El controlador viene en un CD dentro de la caja.", "Der Treiber liegt auf einer CD in der Verpackung.", False),
                ("Se puede conectar por USB o WiFi.", "Man kann per USB oder WLAN verbinden.", True),
                ("El último paso es imprimir una página de prueba.", "Der letzte Schritt ist das Drucken einer Testseite.", True),
                ("Si la página de prueba falla, hay que llamar al soporte inmediatamente.", "Wenn die Testseite fehlschlägt, soll man sofort den Support anrufen.", False),
            ],
            [
                ("¿Cuál es el primer paso?", "Was ist der erste Schritt?", ["Retirar todo el embalaje", "Conectar el cable de alimentación", "Pulsar el botón de encendido"], ["Alle Verpackungen entfernen", "Das Stromkabel anschließen", "Den Einschaltknopf drücken"], 0),
                ("¿De qué color debe estar la luz de listo?", "Welche Farbe soll die Betriebsleuchte haben?", ["Verde", "Rojo", "Azul"], ["Grün", "Rot", "Blau"], 0),
                ("¿Cuántas hojas de A4 caben en la bandeja?", "Wie viele A4-Blätter passen in das Fach?", ["250", "100", "500"], ["250", "100", "500"], 0),
                ("¿Dónde está el controlador de la impresora?", "Wo befindet sich der Druckertreiber?", ["En la memoria USB de la caja", "En un CD", "Solo en línea"], ["Auf dem USB-Stick in der Verpackung", "Auf einer CD", "Nur online"], 0),
                ("¿Qué métodos de conexión hay?", "Welche Verbindungsmöglichkeiten gibt es?", ["USB o WiFi", "Solo Bluetooth", "Solo Ethernet"], ["USB oder WLAN", "Nur Bluetooth", "Nur Ethernet"], 0),
                ("¿Cómo se confirma la instalación?", "Wie bestätigt man die Installation?", ["Imprimiendo una página de prueba", "Llamando al proveedor", "Comprobando la pantalla"], ["Durch das Drucken einer Testseite", "Durch einen Anruf beim Lieferanten", "Durch Blick auf den Bildschirm"], 0),
                ("¿Qué debe hacerse si falla la página de prueba?", "Was sollte man tun, wenn die Testseite nicht gedruckt wird?", ["Comprobar conexiones y reiniciar", "Llamar al soporte", "Devolver la impresora"], ["Verbindungen prüfen und neu starten", "Den Support anrufen", "Den Drucker zurückgeben"], 0),
                ("¿Qué paso va antes de cargar el papel?", "Welcher Schritt kommt vor dem Einlegen des Papiers?", ["Pulsar el botón de encendido", "Instalar el controlador", "Conectarse al WiFi"], ["Den Einschaltknopf drücken", "Den Treiber installieren", "Mit dem WLAN verbinden"], 0),
            ],
        ),
    )

    files[4660] = reading_sql(
        4660,
        "understand at least the general meaning of more complex articles without serious misunderstanding",
        CORRESPONDENCE,
        "Lee un artículo sobre protección de datos",
        "Lies einen Artikel über Datenschutz",
        "Lee un artículo informativo sobre el RGPD, sus principios y sanciones.",
        "Lies einen Fachtext über die DSGVO, ihre Grundsätze und Sanktionen.",
        """
        Data Protection and GDPR

        The General Data Protection Regulation, usually called GDPR, came into force in the UK in 2018. It sets legal rules for how organisations collect, store and use personal data. The regulation is built around several principles, including lawfulness, fairness and transparency, purpose limitation, data minimisation, accuracy, storage limitation, and integrity and confidentiality.

        Organisations that fail to comply with GDPR can face significant penalties. The maximum fine is £17.5 million or 4% of global annual turnover, whichever amount is higher. This means that data protection is a major legal and financial risk for businesses that handle personal information.

        Not every organisation must appoint a Data Protection Officer. However, a DPO is required when an organisation processes large amounts of sensitive personal data or systematically monitors individuals as part of its operations.
        """,
        build_reading_exercises(
            [
                ("El RGPD entró en vigor en el Reino Unido en 2018.", "Die DSGVO trat im Vereinigten Königreich 2018 in Kraft.", True),
                ("El RGPD solo se aplica a empresas fuera del Reino Unido.", "Die DSGVO gilt nur für Unternehmen außerhalb des Vereinigten Königreichs.", False),
                ("Uno de los principios es la minimización de datos.", "Einer der Grundsätze ist die Datenminimierung.", True),
                ("Las multas pueden llegar a 17,5 millones de libras o al 4 % de la facturación global.", "Geldstrafen können bis zu 17,5 Millionen Pfund oder 4 % des weltweiten Umsatzes betragen.", True),
                ("Todas las organizaciones deben nombrar un DPO.", "Alle Organisationen müssen einen DSB benennen.", False),
                ("La limitación del almacenamiento es uno de los principios del RGPD.", "Speicherbegrenzung ist einer der Grundsätze der DSGVO.", True),
                ("El artículo menciona la integridad y la confidencialidad como principio.", "Der Artikel nennt Integrität und Vertraulichkeit als Grundsatz.", True),
                ("El incumplimiento no tiene consecuencias económicas.", "Nichteinhaltung hat keine finanziellen Folgen.", False),
            ],
            [
                ("¿Cuándo entró en vigor el RGPD en el Reino Unido?", "Wann trat die DSGVO im Vereinigten Königreich in Kraft?", ["2018", "2016", "2020"], ["2018", "2016", "2020"], 0),
                ("¿Cuál es la multa máxima según el RGPD?", "Wie hoch ist die maximale Strafe nach der DSGVO?", ["17,5 millones de libras o el 4 % de la facturación global", "5 millones de libras o el 2 %", "10 millones de libras o el 3 %"], ["17,5 Millionen Pfund oder 4 % des weltweiten Umsatzes", "5 Millionen Pfund oder 2 %", "10 Millionen Pfund oder 3 %"], 0),
                ("¿Qué significa DPO?", "Wofür steht DPO?", ["Delegado de Protección de Datos", "Organización de Procesamiento de Datos", "Oficial de Privacidad Digital"], ["Data Protection Officer", "Data Processing Organisation", "Digital Privacy Officer"], 0),
                ("¿Quién DEBE nombrar un DPO?", "Wer MUSS einen DPO benennen?", ["Las organizaciones que procesan grandes cantidades de datos sensibles", "Todas las empresas", "Solo los organismos públicos"], ["Organisationen, die große Mengen sensibler Daten verarbeiten", "Alle Unternehmen", "Nur staatliche Stellen"], 0),
                ("¿Qué principio trata de mantener los datos correctos?", "Welcher Grundsatz betrifft die Richtigkeit der Daten?", ["Exactitud", "Transparencia", "Limitación de la finalidad"], ["Richtigkeit", "Transparenz", "Zweckbindung"], 0),
                ("¿Qué significa minimización de datos?", "Was bedeutet Datenminimierung?", ["Recoger solo lo necesario", "Borrar todos los datos", "Cifrar todos los datos"], ["Nur das Nötige erheben", "Alle Daten löschen", "Alle Daten verschlüsseln"], 0),
                ("¿Qué principio dice que los datos solo se usen para su fin original?", "Welcher Grundsatz besagt, dass Daten nur für den ursprünglichen Zweck genutzt werden?", ["Limitación de la finalidad", "Integridad", "Limitación del almacenamiento"], ["Zweckbindung", "Integrität", "Speicherbegrenzung"], 0),
                ("¿Cuál NO aparece como principio del RGPD?", "Was gehört NICHT zu den Grundsätzen der DSGVO?", ["Optimización financiera", "Legalidad", "Equidad"], ["Finanzoptimierung", "Rechtmäßigkeit", "Fairness"], 0),
            ],
        ),
    )

    files[4670] = reading_sql(
        4670,
        "understand most articles likely to be encountered during the course of her/his work, including complex ideas expressed in complex language",
        CORRESPONDENCE,
        "Lee un artículo sobre almacenamiento en la nube",
        "Lies einen Artikel über Cloud-Speicher",
        "Lee un artículo profesional sobre almacenamiento en la nube, seguridad y continuidad.",
        "Lies einen Fachtext über Cloud-Speicher, Sicherheit und Ausfallschutz.",
        """
        Cloud Storage for Businesses

        Cloud storage allows businesses to store, manage and access data remotely through the internet instead of relying only on on-premises servers. One major advantage is scalability: storage capacity can increase as business needs grow, without requiring the company to install more physical hardware. Well-known providers include Microsoft Azure, Amazon Web Services and Google Cloud.

        Security remains a major concern, so data should be encrypted both in transit and at rest. Access should also be protected through multi-factor authentication, often shortened to MFA. In addition, providers usually offer a Service Level Agreement, or SLA, that promises around 99.9% uptime.

        Even with cloud services, businesses still need a clear data recovery plan in case of cyberattack or system outage. Costs are commonly subscription-based, which helps companies predict monthly spending more easily.
        """,
        build_reading_exercises(
            [
                ("El almacenamiento en la nube permite acceder a los datos por internet.", "Cloud-Speicher ermöglicht den Zugriff auf Daten über das Internet.", True),
                ("El almacenamiento en la nube siempre es más caro que los servidores locales.", "Cloud-Speicher ist immer teurer als lokale Server.", False),
                ("Microsoft Azure se menciona como proveedor importante.", "Microsoft Azure wird als wichtiger Anbieter genannt.", True),
                ("Los datos solo deben cifrarse cuando se transfieren.", "Daten sollten nur während der Übertragung verschlüsselt werden.", False),
                ("MFA significa autenticación multifactor.", "MFA steht für Multi-Faktor-Authentifizierung.", True),
                ("Un SLA suele garantizar un 100 % de disponibilidad.", "Ein SLA garantiert in der Regel 100 % Verfügbarkeit.", False),
                ("Los modelos de coste en la nube suelen ser por suscripción.", "Cloud-Kostenmodelle sind meist abonnementbasiert.", True),
                ("Las empresas no necesitan un plan de recuperación si usan la nube.", "Unternehmen brauchen keinen Wiederherstellungsplan, wenn sie die Cloud nutzen.", False),
            ],
            [
                ("¿Qué es el almacenamiento en la nube?", "Was ist Cloud-Speicher?", ["Almacenamiento remoto de datos por internet", "Almacenamiento físico en la oficina", "Un tipo de memoria USB"], ["Remote Datenspeicherung über das Internet", "Physischer Speicher im Büro", "Eine Art USB-Stick"], 0),
                ("¿Qué empresa NO se menciona como proveedor?", "Welches Unternehmen wird NICHT als Anbieter erwähnt?", ["Apple", "Microsoft Azure", "Amazon Web Services"], ["Apple", "Microsoft Azure", "Amazon Web Services"], 0),
                ("¿Qué debe controlar el acceso a los datos?", "Was sollte den Zugang zu den Daten kontrollieren?", ["La autenticación multifactor", "Solo una contraseña", "La aprobación del gerente"], ["Multi-Faktor-Authentifizierung", "Nur ein Passwort", "Die Freigabe durch den Manager"], 0),
                ("¿Qué suele garantizar un SLA?", "Was garantiert ein SLA normalerweise?", ["Un 99,9 % de disponibilidad", "Un 100 % de disponibilidad", "Un 95 % de disponibilidad"], ["99,9 % Verfügbarkeit", "100 % Verfügbarkeit", "95 % Verfügbarkeit"], 0),
                ("¿Qué significa escalable en este contexto?", "Was bedeutet skalierbar in diesem Zusammenhang?", ["Que el almacenamiento crece con las necesidades", "Que los datos se borran automáticamente", "Que los archivos se comparten públicamente"], ["Dass der Speicher mit dem Bedarf wächst", "Dass Daten automatisch gelöscht werden", "Dass Dateien öffentlich geteilt werden"], 0),
                ("¿Qué modelo de coste es típico?", "Welches Kostenmodell ist typisch?", ["Basado en suscripción", "Solo pago por uso", "Gratis para todos"], ["Abonnementbasiert", "Nur nutzungsabhängig", "Kostenlos für alle"], 0),
                ("¿Qué deben tener las empresas en caso de interrupción?", "Was sollten Unternehmen für den Fall eines Ausfalls haben?", ["Un plan de recuperación de datos", "Una nueva sala de servidores", "Una oficina de reserva"], ["Einen Datenwiederherstellungsplan", "Einen neuen Serverraum", "Ein Ersatzbüro"], 0),
                ("¿Qué es el cifrado en reposo?", "Was bedeutet Verschlüsselung im Ruhezustand?", ["Los datos se cifran cuando están almacenados", "Los datos solo se cifran durante la transferencia", "Los datos se eliminan del almacenamiento"], ["Daten werden verschlüsselt, wenn sie gespeichert sind", "Daten werden nur während der Übertragung verschlüsselt", "Daten werden aus dem Speicher entfernt"], 0),
            ],
        ),
    )

    files[4680] = reading_sql(
        4680,
        "understand instructions, given some means of checking understanding, as long as they are simple, brief and illustrated in some way",
        CORRESPONDENCE,
        "Lee un procedimiento de evacuación de incendios",
        "Lies eine Brandschutzevakuierungsanweisung",
        "Lee instrucciones sencillas de evacuación contra incendios con acciones y responsables.",
        "Lies einfache Brandschutzanweisungen mit Schritten und Verantwortlichen.",
        """
        FIRE EVACUATION PROCEDURE – FLOOR 3

        When the fire alarm sounds, all work must stop immediately. Staff and visitors on Floor 3 must not use the lift during evacuation. Use the stairs only and move calmly to the nearest fire exit, following the posted diagram if necessary. Personal belongings may be taken only if it is safe to do so and there is no delay.

        Once outside the building, everyone on Floor 3 must assemble at Assembly Point B in the car park. Do not re-enter the building until a fire marshal gives clear permission. All employees must report to their line manager so that names can be checked against the attendance list.

        This procedure applies to all staff and visitors. The fire marshal for Floor 3 is David Chen. Questions can be sent to safety@building.co.uk.
        """,
        build_reading_exercises(
            [
                ("El procedimiento es para la planta 3.", "Das Verfahren gilt für Etage 3.", True),
                ("El personal debe usar el ascensor durante la evacuación.", "Während der Evakuierung soll das Personal den Aufzug benutzen.", False),
                ("El personal debe ir a la salida de incendios más cercana.", "Das Personal soll zum nächstgelegenen Notausgang gehen.", True),
                ("El punto de reunión es el punto A.", "Der Sammelpunkt ist Punkt A.", False),
                ("No se debe volver a entrar hasta que lo diga un responsable de incendios.", "Man darf das Gebäude erst wieder betreten, wenn ein Brandschutzhelfer es erlaubt.", True),
                ("El personal debe informar a RR. HH. cuando esté fuera.", "Das Personal soll sich draußen bei der Personalabteilung melden.", False),
                ("El responsable de incendios de la planta 3 es David Chen.", "Der Brandschutzhelfer auf Etage 3 ist David Chen.", True),
                ("El correo de contacto es safety@building.co.uk.", "Die Kontakt-E-Mail lautet safety@building.co.uk.", True),
            ],
            [
                ("¿Qué debe hacer el personal primero cuando suena la alarma?", "Was sollen die Mitarbeitenden als Erstes tun, wenn der Alarm ertönt?", ["Parar todo el trabajo inmediatamente", "Llamar a los bomberos", "Ir a la cocina"], ["Sofort die Arbeit einstellen", "Die Feuerwehr anrufen", "In die Küche gehen"], 0),
                ("¿Por qué debe evitarse el ascensor?", "Warum soll der Aufzug vermieden werden?", ["Porque solo deben usarse las escaleras", "Porque es demasiado lento", "Porque está averiado"], ["Weil nur die Treppe benutzt werden darf", "Weil er zu langsam ist", "Weil er kaputt ist"], 0),
                ("¿Dónde está el punto de reunión B?", "Wo befindet sich Sammelpunkt B?", ["En el aparcamiento", "En la entrada principal", "En la planta 1"], ["Auf dem Parkplatz", "Am Haupteingang", "Auf Etage 1"], 0),
                ("¿Quién debe seguir este procedimiento?", "Wer muss dieses Verfahren befolgen?", ["Todo el personal y los visitantes", "Solo los gerentes", "Solo los visitantes"], ["Alle Mitarbeitenden und Besucher", "Nur Manager", "Nur Besucher"], 0),
                ("¿Quién es el responsable de incendios de la planta 3?", "Wer ist der Brandschutzhelfer auf Etage 3?", ["David Chen", "Laura Smith", "Ben Carter"], ["David Chen", "Laura Smith", "Ben Carter"], 0),
                ("¿Qué debe comunicarse al jefe directo?", "Was soll der direkten Führungskraft gemeldet werden?", ["La presencia para pasar lista", "Los daños observados", "La hora de salida"], ["Die Anwesenheit zur Kontrolle", "Beobachtete Schäden", "Die Uhrzeit des Verlassens"], 0),
                ("¿Qué debe hacerse con las pertenencias?", "Was soll mit persönlichen Gegenständen geschehen?", ["Llevarlas si es seguro hacerlo", "Dejarlas siempre en el escritorio", "Guardarlas en una taquilla"], ["Sie nur mitnehmen, wenn es sicher ist", "Sie immer am Schreibtisch lassen", "Sie in ein Schließfach legen"], 0),
                ("¿Cuál es el correo de seguridad?", "Wie lautet die Sicherheits-E-Mail?", ["safety@building.co.uk", "hr@building.co.uk", "manager@building.co.uk"], ["safety@building.co.uk", "hr@building.co.uk", "manager@building.co.uk"], 0),
            ],
        ),
    )

    files[4690] = reading_sql(
        4690,
        "understand standard notices at work, for example safety instructions, where these are expressed in the form of a command",
        CORRESPONDENCE,
        "Lee un aviso de seguridad en el trabajo",
        "Lies einen Arbeitssicherheitshinweis",
        "Lee un aviso breve con órdenes de seguridad sobre equipos eléctricos.",
        "Lies einen kurzen Sicherheitshinweis mit Anweisungen zu elektrischen Geräten.",
        """
        WORKPLACE SAFETY NOTICE – ELECTRICAL EQUIPMENT

        ALWAYS switch off electrical equipment when it is not in use. Report any damaged cables or plugs to Facilities immediately so that they can be checked and replaced if necessary. Use only equipment that has been approved by the Health and Safety team.

        NEVER overload plug sockets. Do not use electrical equipment near water, and do not try to repair any item yourself. If you are unsure whether a piece of equipment is safe, stop using it and contact Facilities for advice.

        If in doubt, call Facilities on extension 2100 or send an email to facilities@office.co.uk. These rules apply to all employees and contractors. Any breach of the notice may lead to disciplinary action.
        """,
        build_reading_exercises(
            [
                ("Este aviso trata sobre la seguridad de los equipos eléctricos.", "Dieser Hinweis betrifft die Sicherheit elektrischer Geräte.", True),
                ("Los empleados deben encender todos los equipos al llegar.", "Mitarbeitende müssen bei Ankunft alle Geräte einschalten.", False),
                ("Los cables dañados deben comunicarse a Facilities de inmediato.", "Beschädigte Kabel müssen sofort der Haustechnik gemeldet werden.", True),
                ("Los empleados pueden reparar los equipos eléctricos por su cuenta.", "Mitarbeitende dürfen elektrische Geräte selbst reparieren.", False),
                ("No se deben sobrecargar los enchufes.", "Steckdosen dürfen nicht überlastet werden.", True),
                ("Se puede usar equipo eléctrico cerca del agua con cuidado.", "Elektrische Geräte dürfen mit Vorsicht in Wassernähe benutzt werden.", False),
                ("La extensión de Facilities es la 2100.", "Die Durchwahl der Haustechnik ist 2100.", True),
                ("Las infracciones pueden dar lugar a medidas disciplinarias.", "Verstöße können disziplinarische Maßnahmen nach sich ziehen.", True),
            ],
            [
                ("¿Qué debe hacerse con el equipo cuando no se usa?", "Was muss mit Geräten geschehen, wenn sie nicht benutzt werden?", ["Apagarlos", "Desenchufarlos y guardarlos", "Cubrirlos con un paño"], ["Sie ausschalten", "Sie ausstecken und wegstellen", "Sie mit einem Tuch abdecken"], 0),
                ("¿A quién deben comunicarse los cables dañados?", "Wem sollen beschädigte Kabel gemeldet werden?", ["A Facilities", "Al gerente", "A RR. HH."], ["Der Haustechnik", "Dem Manager", "Der Personalabteilung"], 0),
                ("¿Qué tipo de equipo puede usarse?", "Welche Art von Geräten darf benutzt werden?", ["Solo equipo aprobado", "Cualquier equipo disponible", "Equipo personal"], ["Nur zugelassene Geräte", "Beliebige verfügbare Geräte", "Private Geräte"], 0),
                ("¿Qué no debe pasar con los enchufes?", "Was darf mit Steckdosen niemals passieren?", ["No deben sobrecargarse", "No deben limpiarse", "No deben quedar encendidas"], ["Sie dürfen nicht überlastet werden", "Sie dürfen nicht gereinigt werden", "Sie dürfen nicht eingeschaltet bleiben"], 0),
                ("¿Cuál es la extensión de Facilities?", "Wie lautet die Durchwahl der Haustechnik?", ["2100", "1200", "2010"], ["2100", "1200", "2010"], 0),
                ("¿Cuál es el correo de Facilities?", "Wie lautet die E-Mail der Haustechnik?", ["facilities@office.co.uk", "safety@office.co.uk", "help@office.co.uk"], ["facilities@office.co.uk", "safety@office.co.uk", "help@office.co.uk"], 0),
                ("¿A quién se aplica este aviso?", "Für wen gilt dieser Hinweis?", ["A todos los empleados y contratistas", "Solo a los empleados", "Solo a los contratistas"], ["Für alle Mitarbeitenden und Auftragnehmer", "Nur für Mitarbeitende", "Nur für Auftragnehmer"], 0),
                ("¿Qué puede pasar si se incumple?", "Was kann bei Verstößen passieren?", ["Medidas disciplinarias", "Una multa de 100 £", "Nada formal"], ["Disziplinarmaßnahmen", "Eine Strafe von 100 £", "Nichts Formelles"], 0),
            ],
        ),
    )

    files[4700] = reading_sql(
        4700,
        "understand instructions, for example in a manual, in the form of a continuous text, provided that (s)he is familiar with the type of product, equipment etc. being explained",
        CORRESPONDENCE,
        "Lee la sección de un manual de fotocopiadora",
        "Lies den Abschnitt eines Fotokopiererhandbuchs",
        "Lee una sección de manual con pasos de uso y solución de atascos.",
        "Lies einen Handbuchabschnitt mit Bedienungsschritten und Stauhinweisen.",
        """
        OPERATING MANUAL – ProCopy 600

        Section 3 explains how to copy documents on the ProCopy 600. First, place the original document face-down on the glass and align it with the top-left corner. Then close the document cover. On the control panel, press the Copy button to open the standard copying menu.

        Use the plus and minus buttons to choose the number of copies between 1 and 99. Select either A4 or A3 paper size with the Size button. When the settings are correct, press the green Start button and collect the finished copies from the output tray.

        If a paper jam occurs, open the front panel door and remove the jammed paper carefully. Do not pull it by force. If jams continue to happen, call the service number 0800-123-456 for assistance.
        """,
        build_reading_exercises(
            [
                ("El manual es para la ProCopy 600.", "Das Handbuch ist für den ProCopy 600.", True),
                ("Los documentos se colocan boca arriba sobre el cristal.", "Dokumente werden mit der Vorderseite nach oben auf das Glas gelegt.", False),
                ("El documento debe alinearse con la esquina superior izquierda.", "Das Dokument soll an der linken oberen Ecke ausgerichtet werden.", True),
                ("Se pueden hacer hasta 100 copias a la vez.", "Man kann bis zu 100 Kopien auf einmal machen.", False),
                ("El botón de inicio es verde.", "Die Starttaste ist grün.", True),
                ("Las copias se recogen de la bandeja de entrada.", "Die Kopien werden aus dem Eingabefach entnommen.", False),
                ("Si hay un atasco, hay que tirar del papel con fuerza.", "Bei einem Papierstau soll man das Papier mit Gewalt herausziehen.", False),
                ("Para atascos repetidos, el teléfono de servicio es 0800-123-456.", "Bei wiederholten Staus lautet die Servicenummer 0800-123-456.", True),
            ],
            [
                ("¿De qué trata este manual?", "Worum geht es in diesem Handbuch?", ["De copiar documentos", "De instalar la impresora", "De cambiar la tinta"], ["Um das Kopieren von Dokumenten", "Um die Installation des Druckers", "Um den Tintenwechsel"], 0),
                ("¿Cómo debe colocarse el documento?", "Wie soll das Dokument platziert werden?", ["Boca abajo, en la esquina superior izquierda", "Boca arriba, en la esquina superior derecha", "En cualquier posición"], ["Mit der Vorderseite nach unten links oben", "Mit der Vorderseite nach oben rechts oben", "In beliebiger Position"], 0),
                ("¿Cuántas copias pueden hacerse a la vez?", "Wie viele Kopien kann man auf einmal machen?", ["Hasta 99", "Hasta 50", "Hasta 100"], ["Bis zu 99", "Bis zu 50", "Bis zu 100"], 0),
                ("¿Qué tamaños están disponibles?", "Welche Formate sind verfügbar?", ["A4 o A3", "Solo A4", "A5 o A4"], ["A4 oder A3", "Nur A4", "A5 oder A4"], 0),
                ("¿Dónde se recogen las copias?", "Wo werden die Kopien entnommen?", ["En la bandeja de salida", "En la bandeja de entrada", "Encima de la máquina"], ["Aus dem Ausgabefach", "Aus dem Eingabefach", "Von oben auf dem Gerät"], 0),
                ("¿Qué debe hacerse si se atasca el papel?", "Was sollte man bei einem Papierstau tun?", ["Abrir el panel frontal y retirarlo con cuidado", "Llamar al servicio inmediatamente", "Tirar del papel rápidamente"], ["Die Frontklappe öffnen und das Papier vorsichtig entfernen", "Sofort den Service anrufen", "Das Papier schnell herausziehen"], 0),
                ("¿Cuál es el número de servicio?", "Wie lautet die Servicenummer?", ["0800-123-456", "0800-456-123", "0800-321-654"], ["0800-123-456", "0800-456-123", "0800-321-654"], 0),
                ("¿Qué paso va antes de pulsar Start?", "Welcher Schritt kommt vor dem Drücken von Start?", ["Seleccionar el tamaño del papel", "Cerrar la tapa del documento", "Pulsar el botón Copy"], ["Das Papierformat wählen", "Die Dokumentenabdeckung schließen", "Die Taste Copy drücken"], 0),
            ],
        ),
    )

    files[4710] = reading_sql(
        4710,
        "understand instructions, procedures etc. within own job area",
        CORRESPONDENCE,
        "Lee el procedimiento del servicio de asistencia de TI",
        "Lies die IT-Helpdesk-Verfahrensanweisung",
        "Lee un procedimiento del help desk con tiempos de respuesta y cierre de tickets.",
        "Lies ein Helpdesk-Verfahren mit Reaktionszeiten und Ticketabschluss.",
        """
        IT HELP DESK – INCIDENT RESPONSE PROCEDURE

        When a user reports an IT problem, the first step is to log the incident in the ServiceDesk system. The record must include the user name, date and time, a description of the issue and the urgency level: Low, Medium or High. The help desk must acknowledge the incident by email within 1 hour.

        Staff should attempt remote diagnosis before arranging any visit. If remote diagnosis fails, an on-site visit must be scheduled within 24 hours for Medium and High priority incidents. After resolving the issue, the technician updates the log and confirms the solution with the user.

        A ticket can only be closed after the user confirms that the problem has been resolved. SLA targets are 5 working days for Low, 2 working days for Medium and 4 hours for High priority issues.
        """,
        build_reading_exercises(
            [
                ("El primer paso es registrar la incidencia en ServiceDesk.", "Der erste Schritt ist, den Vorfall im ServiceDesk zu erfassen.", True),
                ("Hay que responder al usuario por teléfono en una hora.", "Der Nutzer muss innerhalb einer Stunde telefonisch informiert werden.", False),
                ("Se intenta el diagnóstico remoto antes de una visita presencial.", "Vor einem Vor-Ort-Termin wird eine Ferndiagnose versucht.", True),
                ("Las visitas presenciales se programan en 48 horas para incidencias urgentes.", "Vor-Ort-Termine werden bei dringenden Vorfällen innerhalb von 48 Stunden geplant.", False),
                ("Un ticket puede cerrarse sin confirmación del usuario.", "Ein Ticket kann ohne Bestätigung des Nutzers geschlossen werden.", False),
                ("Las incidencias de prioridad baja deben resolverse en 5 días laborables.", "Vorfälle mit niedriger Priorität müssen innerhalb von 5 Arbeitstagen gelöst werden.", True),
                ("Las incidencias de prioridad alta deben resolverse en 4 horas.", "Vorfälle mit hoher Priorität müssen innerhalb von 4 Stunden gelöst werden.", True),
                ("Los niveles de urgencia son baja, media y alta.", "Die Dringlichkeitsstufen sind niedrig, mittel und hoch.", True),
            ],
            [
                ("¿Dónde se registran las incidencias?", "Wo werden Vorfälle erfasst?", ["En el sistema ServiceDesk", "En una hoja de Excel", "En un formulario en papel"], ["Im ServiceDesk-System", "In einer Excel-Tabelle", "Auf einem Papierformular"], 0),
                ("¿En cuánto tiempo debe confirmarse la recepción al usuario?", "Wie schnell muss dem Nutzer der Eingang bestätigt werden?", ["En 1 hora", "En 30 minutos", "En 24 horas"], ["Innerhalb von 1 Stunde", "Innerhalb von 30 Minuten", "Innerhalb von 24 Stunden"], 0),
                ("¿Qué información se registra?", "Welche Informationen werden erfasst?", ["Usuario, fecha y hora, descripción y urgencia", "Solo el nombre y la fecha", "Solo la descripción del problema"], ["Nutzer, Datum und Uhrzeit, Beschreibung und Dringlichkeit", "Nur Name und Datum", "Nur die Problembeschreibung"], 0),
                ("¿Cuándo se programa una visita presencial?", "Wann wird ein Vor-Ort-Termin geplant?", ["Cuando falla el diagnóstico remoto", "Siempre", "Solo para prioridad alta"], ["Wenn die Ferndiagnose scheitert", "Immer", "Nur bei hoher Priorität"], 0),
                ("¿Qué debe pasar antes de cerrar un ticket?", "Was muss geschehen, bevor ein Ticket geschlossen wird?", ["El usuario confirma que se resolvió", "Lo aprueba un gerente", "Pasan 5 días"], ["Der Nutzer bestätigt die Lösung", "Ein Manager genehmigt es", "5 Tage vergehen"], 0),
                ("¿En cuántos días laborables debe resolverse una incidencia media?", "Innerhalb wie vieler Arbeitstage muss ein mittlerer Vorfall gelöst werden?", ["2", "5", "1"], ["2", "5", "1"], 0),
                ("¿Cuál es el SLA para prioridad alta?", "Wie lautet das SLA für hohe Priorität?", ["4 horas", "2 horas", "8 horas"], ["4 Stunden", "2 Stunden", "8 Stunden"], 0),
                ("¿Cuál es el último paso del procedimiento?", "Was ist der letzte Schritt des Verfahrens?", ["Cerrar el ticket tras la confirmación del usuario", "Registrar la incidencia", "Programar una visita"], ["Das Ticket nach Nutzerbestätigung schließen", "Den Vorfall erfassen", "Einen Termin planen"], 0),
            ],
        ),
    )

    files[4720] = reading_sql(
        4720,
        "understand the intention of instructions etc. outside own immediate job area",
        CORRESPONDENCE,
        "Lee una lista de verificación de incorporación de RRHH",
        "Lies eine HR-Onboarding-Checkliste",
        "Lee una lista de incorporación con tareas antes del inicio, el primer día y la primera semana.",
        "Lies eine Onboarding-Checkliste mit Aufgaben vor dem Start, am ersten Tag und in der ersten Woche.",
        """
        NEW EMPLOYEE ONBOARDING CHECKLIST – HR Department

        Before the employee’s start date, HR must send a welcome email with the start time and office location. IT equipment must be prepared in advance, the user account must be created and the building access pass must be ready. These steps ensure that the employee can begin work without delay.

        On Day 1, HR and the line manager introduce the new employee to the team, carry out a health and safety induction, set up payroll and pension details, issue IT equipment and login credentials, and provide the employee handbook. During Week 1, a one-to-one meeting with the line manager must be arranged, mandatory GDPR and Health and Safety training must be completed, and 3-month probation objectives must be agreed.

        At the end of probation, performance is reviewed and the company either confirms permanent employment or extends probation if necessary.
        """,
        build_reading_exercises(
            [
                ("El correo de bienvenida se envía antes de la fecha de inicio.", "Die Willkommens-E-Mail wird vor dem Startdatum gesendet.", True),
                ("El equipo informático se prepara el primer día.", "Die IT-Ausstattung wird am ersten Tag vorbereitet.", False),
                ("La inducción de salud y seguridad es el primer día.", "Die Sicherheitsunterweisung findet am ersten Tag statt.", True),
                ("La nómina se configura en la primera semana.", "Die Gehaltsdaten werden in der ersten Woche eingerichtet.", False),
                ("El manual del empleado se entrega el primer día.", "Das Mitarbeiterhandbuch wird am ersten Tag ausgehändigt.", True),
                ("La formación obligatoria debe completarse en la primera semana.", "Die Pflichtschulungen müssen in der ersten Woche abgeschlossen werden.", True),
                ("El periodo de prueba dura 6 meses.", "Die Probezeit dauert 6 Monate.", False),
                ("La lista es del departamento de TI.", "Die Checkliste stammt von der IT-Abteilung.", False),
            ],
            [
                ("¿Cuándo se envía el correo de bienvenida?", "Wann wird die Willkommens-E-Mail verschickt?", ["Antes de la fecha de inicio", "El primer día", "En la primera semana"], ["Vor dem Startdatum", "Am ersten Tag", "In der ersten Woche"], 0),
                ("¿Qué más se prepara antes del inicio además del equipo de TI?", "Was wird vor dem Start zusätzlich zur IT-Ausstattung vorbereitet?", ["La tarjeta de acceso al edificio", "La nómina", "La pensión"], ["Der Gebäudeausweis", "Die Gehaltsabrechnung", "Die Rentendaten"], 0),
                ("¿Qué pasa con el equipo de TI el primer día?", "Was geschieht am ersten Tag mit der IT-Ausstattung?", ["Se entrega al empleado", "Se encarga", "TI la prueba"], ["Sie wird dem Mitarbeitenden ausgehändigt", "Sie wird bestellt", "Die IT testet sie"], 0),
                ("¿Qué formación obligatoria se completa en la primera semana?", "Welche Pflichtschulungen werden in der ersten Woche absolviert?", ["RGPD y Salud y Seguridad", "Finanzas y RR. HH.", "Nómina y pensión"], ["DSGVO und Arbeitssicherheit", "Finanzen und Personal", "Gehalts- und Rentenwesen"], 0),
                ("¿Cuándo se fijan los objetivos del periodo de prueba de 3 meses?", "Wann werden die Ziele für die dreimonatige Probezeit festgelegt?", ["En la primera semana", "El primer día", "Antes de empezar"], ["In der ersten Woche", "Am ersten Tag", "Vor dem Start"], 0),
                ("¿Qué ocurre al final del periodo de prueba?", "Was passiert am Ende der Probezeit?", ["Una revisión del rendimiento", "Una subida salarial", "Un contrato nuevo"], ["Eine Leistungsbeurteilung", "Eine Gehaltserhöhung", "Ein neuer Vertrag"], 0),
                ("¿Quién hace la reunión individual de la primera semana?", "Wer führt das Einzelgespräch in der ersten Woche?", ["El jefe directo", "El director de RR. HH.", "El director general"], ["Die direkte Führungskraft", "Der Personalleiter", "Der Geschäftsführer"], 0),
                ("¿Qué significa ampliar el periodo de prueba?", "Was bedeutet es, die Probezeit zu verlängern?", ["Que la prueba dura más tiempo", "Que despiden al empleado", "Que empieza un puesto nuevo"], ["Dass die Probezeit länger andauert", "Dass die Person entlassen wird", "Dass eine neue Stelle beginnt"], 0),
            ],
        ),
    )

    files[4730] = reading_sql(
        4730,
        "understand instructions giving detailed warnings, advice, conditions etc.",
        CORRESPONDENCE,
        "Lee las instrucciones de seguridad para carretillas elevadoras",
        "Lies die Gabelstaplersicherheitsanweisungen",
        "Lee instrucciones detalladas con advertencias, límites y condiciones para conducir una carretilla.",
        "Lies detaillierte Anweisungen mit Warnungen, Grenzen und Bedingungen für das Fahren eines Gabelstaplers.",
        """
        FORKLIFT SAFETY INSTRUCTIONS – WAREHOUSE STAFF

        Only authorised and trained operators may drive the forklift. Before use, operators must wear a high-visibility vest and safety boots, and they must check the brakes, horn, lights and tyres. Loads must stay below the maximum capacity of 2,000 kg. Speed must be reduced on wet or uneven surfaces, and the vehicle must never exceed 8 km/h in pedestrian areas.

        Forklifts must never carry passengers. Operators must also avoid using a forklift near open loading bays unless a banksman is present. If the forklift has any fault, it must not be used under any circumstances. The driver must park it in the designated bay and report the issue to the site supervisor immediately.

        Failure to follow these instructions may result in serious injury or dismissal.
        """,
        build_reading_exercises(
            [
                ("Solo los operadores formados pueden conducir la carretilla.", "Nur geschulte Bediener dürfen den Gabelstapler fahren.", True),
                ("Los operadores no necesitan ropa especial.", "Die Bediener brauchen keine besondere Kleidung.", False),
                ("La carretilla debe revisarse antes de cada uso.", "Der Gabelstapler muss vor jedem Einsatz geprüft werden.", True),
                ("La carga máxima es de 2.000 kg.", "Die maximale Traglast beträgt 2.000 kg.", True),
                ("Se pueden llevar pasajeros en la carretilla.", "Man darf Passagiere mit dem Gabelstapler befördern.", False),
                ("El límite de velocidad en zonas peatonales es de 8 km/h.", "In Fußgängerbereichen gilt ein Tempolimit von 8 km/h.", True),
                ("Una carretilla averiada puede usarse si la carga es ligera.", "Ein defekter Gabelstapler darf benutzt werden, wenn die Last leicht ist.", False),
                ("No seguir las instrucciones puede causar despido.", "Das Nichtbefolgen der Anweisungen kann zur Entlassung führen.", True),
            ],
            [
                ("¿Quién puede manejar la carretilla?", "Wer darf den Gabelstapler bedienen?", ["Solo operadores autorizados y formados", "Cualquier trabajador del almacén", "Solo los gerentes"], ["Nur autorisierte und geschulte Bediener", "Beliebiges Lagerpersonal", "Nur Manager"], 0),
                ("¿Qué ropa es obligatoria?", "Welche Kleidung ist vorgeschrieben?", ["Chaleco reflectante y botas de seguridad", "Solo casco", "Ropa de trabajo normal"], ["Warnweste und Sicherheitsschuhe", "Nur ein Helm", "Normale Arbeitskleidung"], 0),
                ("¿Cuál es la carga máxima?", "Wie hoch ist die maximale Traglast?", ["2.000 kg", "1.000 kg", "3.000 kg"], ["2.000 kg", "1.000 kg", "3.000 kg"], 0),
                ("¿Qué NO debe hacerse cerca de muelles abiertos sin señalista?", "Was darf in der Nähe offener Laderampen ohne Einweiser NICHT passieren?", ["Usar la carretilla", "Aparcar la carretilla", "Revisar la carretilla"], ["Den Gabelstapler benutzen", "Den Gabelstapler parken", "Den Gabelstapler prüfen"], 0),
                ("¿Cuál es el límite de velocidad en zonas peatonales?", "Wie hoch ist das Tempolimit in Fußgängerbereichen?", ["8 km/h", "15 km/h", "5 km/h"], ["8 km/h", "15 km/h", "5 km/h"], 0),
                ("¿Qué debe hacerse con una carretilla averiada?", "Was soll mit einem defekten Gabelstapler geschehen?", ["Aparcarla y avisar al supervisor", "Intentar repararla uno mismo", "Seguir usándola con cuidado"], ["Abstellen und dem Vorgesetzten melden", "Selbst reparieren", "Vorsichtig weiterbenutzen"], 0),
                ("¿Qué se revisa antes de usarla?", "Was wird vor der Benutzung überprüft?", ["Frenos, bocina, luces y neumáticos", "Solo los frenos", "Solo el motor"], ["Bremsen, Hupe, Lichter und Reifen", "Nur die Bremsen", "Nur der Motor"], 0),
                ("¿A quién se informa una avería?", "Wem wird ein Defekt gemeldet?", ["Al supervisor del centro", "A RR. HH.", "A un compañero"], ["Dem Standortleiter", "Der Personalabteilung", "Einem Kollegen"], 0),
            ],
        ),
    )

    files[4740] = writing_sql(
        4740,
        "write a continuous set of instructions, for example a section of an operating manual, provided that they are simple and of limited length",
        CORRESPONDENCE,
        "Escribe una sección de manual de operaciones",
        "Schreibe einen Abschnitt eines Betriebshandbuchs",
        "Eres responsable técnico y debes escribir una sección del manual de operaciones para el sistema de impresión de la oficina. El texto debe ser claro, numerado y fácil de seguir para cualquier empleado.",
        [
            "Añade un título de sección claro, por ejemplo, 'Cómo imprimir un documento'.",
            "Escribe una breve introducción de una o dos frases.",
            "Lista los pasos numerados para completar la tarea.",
            "Incluye al menos seis pasos claros y específicos.",
            "Añade una nota de advertencia si hay algo que puede salir mal.",
            "Escribe qué hacer si ocurre un error común.",
            "Usa verbos en forma de comando (imperativo) para cada paso.",
            "Termina con una nota sobre dónde obtener más ayuda.",
        ],
        "Sie sind technisch Verantwortlicher und schreiben einen Abschnitt des Betriebshandbuchs für das Drucksystem. Der Text soll klar, nummeriert und für alle Mitarbeiter leicht verständlich sein.",
        [
            "Fügen Sie einen klaren Abschnittstitel ein, z.B. 'Wie man ein Dokument druckt'.",
            "Schreiben Sie eine kurze Einleitung von ein bis zwei Sätzen.",
            "Listen Sie die nummerierten Schritte auf.",
            "Fügen Sie mindestens sechs klare und spezifische Schritte ein.",
            "Fügen Sie eine Warnungsnotiz hinzu, falls etwas schiefgehen kann.",
            "Beschreiben Sie, was bei einem häufigen Fehler zu tun ist.",
            "Verwenden Sie Imperativformen für jeden Schritt.",
            "Enden Sie mit einem Hinweis, wo weitere Hilfe erhältlich ist.",
        ],
    )

    files[4750] = writing_sql(
        4750,
        "write a set of instructions with clarity and precision, addressing the reader effectively",
        CORRESPONDENCE,
        "Escribe instrucciones técnicas con precisión",
        "Schreibe präzise technische Anweisungen",
        "Un nuevo empleado necesita conectar su ordenador portátil a la red de la empresa y acceder al sistema interno. Escribe instrucciones claras y precisas que guíen al empleado paso a paso.",
        [
            "Comienza con un título y el propósito de las instrucciones.",
            "Lista los requisitos previos: qué equipos y contraseñas necesita el empleado.",
            "Escribe el primer paso: conectar el portátil al WiFi de la empresa.",
            "Explica cómo acceder al portal interno con usuario y contraseña.",
            "Describe cómo verificar que la conexión es correcta.",
            "Incluye una advertencia sobre no compartir contraseñas.",
            "Explica qué hacer si la conexión falla: llamar a IT.",
            "Indica dónde encontrar más ayuda o documentación adicional.",
        ],
        "Ein neuer Mitarbeiter muss seinen Laptop mit dem Unternehmensnetzwerk verbinden und auf das interne System zugreifen. Schreiben Sie klare und präzise Anweisungen.",
        [
            "Beginnen Sie mit einem Titel und dem Zweck der Anleitung.",
            "Listen Sie die Voraussetzungen auf: Geräte und Passwörter.",
            "Schreiben Sie den ersten Schritt: Laptop mit dem Firmen-WLAN verbinden.",
            "Erklären Sie, wie man mit Benutzername und Passwort auf das interne Portal zugreift.",
            "Beschreiben Sie, wie man überprüft, ob die Verbindung korrekt ist.",
            "Fügen Sie eine Warnung ein: Passwörter nicht weitergeben.",
            "Erklären Sie, was bei einem Verbindungsfehler zu tun ist: IT anrufen.",
            "Geben Sie an, wo weitere Hilfe oder Dokumentation zu finden ist.",
        ],
    )

    files[4760] = reading_sql(
        4760,
        "take more complex messages, provided that the caller dictates these clearly and sympathetically",
        PHONE,
        "Lee un recado de teléfono complejo",
        "Lies eine komplexe Telefonnotiz",
        "Lee una nota telefónica detallada sobre cambios de reunión y documentos urgentes.",
        "Lies eine detaillierte Telefonnotiz über eine Terminänderung und dringende Unterlagen.",
        """
        Telephone Message Note

        Message taken at 9:45 am on Monday 6 November.
        For: Mr. James Wright, Finance Director.
        From: Ms. Anita Kowalski, Blue Horizon Consulting.
        Phone: 020-7843-9201.
        Email: akowalski@bluehorizon.com.

        Message:
        Ms. Kowalski called about the financial review arranged for Thursday 9 November at 2pm. She needs to move the meeting to Friday 10 November at 10am because she has an urgent client visit on Thursday. She also asked for the Q3 financial figures to be sent to her by Wednesday evening at the latest. She said she will send the revised agenda by the end of today. Please call her back to confirm the new time.
        """,
        build_reading_exercises(
            [
                ("El mensaje es para el señor James Wright.", "Die Nachricht ist für Herrn James Wright.", True),
                ("El mensaje es de Blue Horizon Consulting.", "Die Nachricht stammt von Blue Horizon Consulting.", True),
                ("La reunión original era el jueves 9 de noviembre a las 14:00.", "Der ursprüngliche Termin war am Donnerstag, dem 9. November, um 14 Uhr.", True),
                ("La señora Kowalski quiere mover la reunión al viernes a las 14:00.", "Frau Kowalski möchte das Treffen auf Freitag um 14 Uhr verlegen.", False),
                ("El motivo del cambio es una visita urgente a un cliente.", "Der Grund für die Änderung ist ein dringender Kundenbesuch.", True),
                ("Necesita las cifras del tercer trimestre para el jueves por la mañana.", "Sie braucht die Zahlen des dritten Quartals bis Donnerstagmorgen.", False),
                ("La señora Kowalski enviará el orden del día revisado antes de que termine hoy.", "Frau Kowalski sendet die überarbeitete Tagesordnung bis heute Abend.", True),
                ("El mensaje se tomó a las 10:15.", "Die Nachricht wurde um 10:15 Uhr aufgenommen.", False),
            ],
            [
                ("¿Para quién es el mensaje?", "Für wen ist die Nachricht?", ["Para el señor James Wright", "Para la señora Anita Kowalski", "Para la recepcionista"], ["Für Herrn James Wright", "Für Frau Anita Kowalski", "Für die Empfangskraft"], 0),
                ("¿A qué hora se tomó el mensaje?", "Um wie viel Uhr wurde die Nachricht aufgenommen?", ["A las 9:45", "A las 10:15", "A las 9:00"], ["Um 9:45 Uhr", "Um 10:15 Uhr", "Um 9:00 Uhr"], 0),
                ("¿Qué día era la reunión original?", "An welchem Tag war der ursprüngliche Termin?", ["Jueves 9 de noviembre", "Viernes 10 de noviembre", "Miércoles 8 de noviembre"], ["Donnerstag, 9. November", "Freitag, 10. November", "Mittwoch, 8. November"], 0),
                ("¿Qué hora quiere para la nueva reunión?", "Welche Uhrzeit wünscht sie für das neue Treffen?", ["Las 10:00", "Las 14:00", "Las 11:00"], ["10 Uhr", "14 Uhr", "11 Uhr"], 0),
                ("¿Por qué quiere cambiar la hora?", "Warum möchte sie die Uhrzeit ändern?", ["Por una visita urgente a un cliente", "Por enfermedad", "Por retrasos en el viaje"], ["Wegen eines dringenden Kundenbesuchs", "Wegen Krankheit", "Wegen Reiseverzögerungen"], 0),
                ("¿Cuándo necesita las cifras del tercer trimestre?", "Bis wann braucht sie die Zahlen für das dritte Quartal?", ["Antes del miércoles por la tarde", "Antes del jueves por la mañana", "Antes del viernes"], ["Bis Mittwochabend", "Bis Donnerstagmorgen", "Bis Freitag"], 0),
                ("¿Qué enviará hoy la señora Kowalski?", "Was wird Frau Kowalski heute senden?", ["El orden del día revisado", "Las cifras del tercer trimestre", "Un contrato"], ["Die überarbeitete Tagesordnung", "Die Zahlen für das dritte Quartal", "Einen Vertrag"], 0),
                ("¿Qué debe hacer el señor Wright?", "Was soll Herr Wright tun?", ["Llamarla para confirmar", "Enviar las cifras ahora mismo", "Cancelar la reunión"], ["Sie zur Bestätigung anrufen", "Die Zahlen sofort schicken", "Das Treffen absagen"], 0),
            ],
        ),
    )

    files[4770] = listening_sql(
        4770,
        "take more complex messages, provided that the caller dictates these clearly and sympathetically",
        PHONE,
        "Escucha un recado de teléfono complejo",
        "Höre eine komplexe Telefonnachricht",
        "Escucha una llamada en la que se deja un recado detallado sobre una entrega y una confirmación.",
        "Höre einen Anruf, in dem eine detaillierte Nachricht zu einer Lieferung und Bestätigung hinterlassen wird.",
        """
        Tom: Good morning, Reed Consulting. How can I help you?
        Sandra: Good morning. My name is Sandra Petrov from South Bridge Engineering. I need to speak to Carlos Rivera.
        Tom: I'm afraid Mr. Rivera is in a meeting until noon. Can I take a message?
        Sandra: Yes, please. Could you tell him that the delivery of equipment for the Northgate project is now scheduled for Wednesday the 15th instead of Monday the 13th.
        Tom: So the delivery moves to Wednesday the 15th. Is there anything else?
        Sandra: Yes. He also needs to arrange on-site access for the delivery team. They will arrive at 7am and need a supervisor present.
        Tom: Delivery team at 7am on Wednesday the 15th, supervisor required. Got it.
        Sandra: Also, could he confirm by email to sande.petrov@southbridge.co.uk? I'll be in meetings all afternoon.
        Tom: Of course. I'll pass on the message as soon as he is out of the meeting.
        """,
        build_reading_exercises(
            [
                ("Tom trabaja en Reed Consulting.", "Tom arbeitet bei Reed Consulting.", True),
                ("Sandra llama de South Bridge Engineering.", "Sandra ruft von South Bridge Engineering an.", True),
                ("Carlos Rivera está disponible de inmediato.", "Carlos Rivera ist sofort verfügbar.", False),
                ("La entrega pasa del lunes 13 al miércoles 15.", "Die Lieferung wird von Montag, dem 13., auf Mittwoch, den 15., verschoben.", True),
                ("El equipo de entrega llegará a las 9:00.", "Das Lieferteam kommt um 9 Uhr an.", False),
                ("Debe haber un supervisor presente en la entrega.", "Bei der Lieferung muss ein Vorgesetzter anwesend sein.", True),
                ("Sandra quiere la confirmación por teléfono.", "Sandra möchte die Bestätigung telefonisch.", False),
                ("Sandra estará disponible toda la tarde.", "Sandra wird den ganzen Nachmittag verfügbar sein.", False),
            ],
            [
                ("¿Dónde trabaja Tom?", "Wo arbeitet Tom?", ["En Reed Consulting", "En South Bridge Engineering", "En North Clinic"], ["Bei Reed Consulting", "Bei South Bridge Engineering", "Bei North Clinic"], 0),
                ("¿Cuándo estará disponible Carlos?", "Wann wird Carlos verfügbar sein?", ["Después del mediodía", "Después de las 14:00", "Mañana"], ["Nach Mittag", "Nach 14 Uhr", "Morgen"], 0),
                ("¿Qué se va a entregar?", "Was wird geliefert?", ["Equipos para el proyecto Northgate", "Mobiliario de oficina", "Sistemas informáticos"], ["Ausrüstung für das Northgate-Projekt", "Büromöbel", "Computersysteme"], 0),
                ("¿Cuál es el nuevo día de entrega?", "Was ist der neue Liefertag?", ["Miércoles 15", "Lunes 13", "Viernes 17"], ["Mittwoch, der 15.", "Montag, der 13.", "Freitag, der 17."], 0),
                ("¿A qué hora llegará el equipo de entrega?", "Um wie viel Uhr kommt das Lieferteam an?", ["A las 7:00", "A las 9:00", "A las 8:00"], ["Um 7 Uhr", "Um 9 Uhr", "Um 8 Uhr"], 0),
                ("¿Quién debe estar presente durante la entrega?", "Wer muss bei der Lieferung anwesend sein?", ["Un supervisor", "Carlos Rivera", "Sandra"], ["Ein Vorgesetzter", "Carlos Rivera", "Sandra"], 0),
                ("¿Cuál es el correo de Sandra?", "Wie lautet Sandras E-Mail-Adresse?", ["sande.petrov@southbridge.co.uk", "spetrov@southbridge.co.uk", "s.petrov@south.co.uk"], ["sande.petrov@southbridge.co.uk", "spetrov@southbridge.co.uk", "s.petrov@south.co.uk"], 0),
                ("¿Por qué no se puede contactar con Sandra por la tarde?", "Warum kann Sandra am Nachmittag nicht erreicht werden?", ["Porque estará en reuniones", "Porque viajará", "Porque tiene una cita médica"], ["Weil sie in Besprechungen sein wird", "Weil sie reisen wird", "Weil sie einen Arzttermin hat"], 0),
            ],
        ),
    )

    files[4780] = dialogue_sql(
        4780,
        "take more complex messages, provided that the caller dictates these clearly and sympathetically",
        PHONE,
        "Dialoga para tomar un recado telefónico complejo",
        "Führe einen Dialog zum Aufnehmen einer komplexen Telefonnachricht",
        "Sigue un diálogo en el que recepción anota un cambio de firma, lugar y datos de contacto.",
        "Verfolge einen Dialog, in dem der Empfang eine Terminänderung, einen Ort und Kontaktdaten notiert.",
        [
            {"name": "Caller", "gender": "female", "avatarURL": "https://example.com/avatars/caller.png"},
            {"name": "Receptionist", "gender": "male", "avatarURL": "https://example.com/avatars/receptionist.png"},
        ],
        [
            {"character": "Caller", "text": "Hello, this is Patricia Walsh from West End Holdings. I need to leave a message for Paul Hartley.", "es": "Hola, soy Patricia Walsh de West End Holdings. Necesito dejar un recado para Paul Hartley.", "de": "Hallo, hier ist Patricia Walsh von West End Holdings. Ich möchte eine Nachricht für Paul Hartley hinterlassen."},
            {"character": "Receptionist", "text": "Of course. Mr. Hartley is away until tomorrow afternoon. I will take the message for you.", "es": "Por supuesto. El señor Hartley estará fuera hasta mañana por la tarde. Tomaré el recado.", "de": "Natürlich. Herr Hartley ist bis morgen Nachmittag außer Haus. Ich nehme gerne die Nachricht auf."},
            {"character": "Caller", "text": "Please tell him that the contract signing is moved from Thursday to Tuesday at 10am.", "es": "Dígale que la firma del contrato se traslada del jueves al martes a las 10 de la mañana.", "de": "Bitte sagen Sie ihm, dass die Vertragsunterzeichnung vom Donnerstag auf Dienstag um 10 Uhr verlegt wird."},
            {"character": "Receptionist", "text": "Tuesday at 10am. Got it. Is there anything else?", "es": "Martes a las 10 de la mañana. Anotado. ¿Hay algo más?", "de": "Dienstag um 10 Uhr. Notiert. Gibt es noch etwas?"},
            {"character": "Caller", "text": "Yes. He must bring the signed version of the budget proposal.", "es": "Sí. Debe traer la versión firmada de la propuesta de presupuesto.", "de": "Ja. Er muss die unterzeichnete Version des Budgetvorschlags mitbringen."},
            {"character": "Receptionist", "text": "Bring the signed budget proposal. I have that.", "es": "Traer la propuesta de presupuesto firmada. Lo anoto.", "de": "Die unterzeichnete Budgetvorlage mitbringen. Das habe ich notiert."},
            {"character": "Caller", "text": "Also, the location is now our office at 12 Fleet Street, not the hotel.", "es": "Además, el lugar es ahora nuestra oficina en el 12 de Fleet Street, no el hotel.", "de": "Außerdem ist der Ort jetzt unser Büro in der Fleet Street 12, nicht das Hotel."},
            {"character": "Receptionist", "text": "12 Fleet Street, not the hotel. Understood.", "es": "12 de Fleet Street, no el hotel. Entendido.", "de": "Fleet Street 12, nicht das Hotel. Verstanden."},
            {"character": "Caller", "text": "Could he call me on 07700-909-432 before 5pm today to confirm?", "es": "¿Podría llamarme al 07700-909-432 antes de las 5 de la tarde para confirmar?", "de": "Könnte er mich heute vor 17 Uhr unter 07700-909-432 anrufen, um zu bestätigen?"},
            {"character": "Receptionist", "text": "I will give him the full message as soon as he returns.", "es": "Le daré el recado completo en cuanto regrese.", "de": "Ich werde ihm die vollständige Nachricht übermitteln, sobald er zurückkommt."},
        ],
        build_dialogue_exercises(
            [
                ("Patricia Walsh llama de West End Holdings.", "Patricia Walsh ruft von West End Holdings an.", True),
                ("Paul Hartley está disponible ahora mismo.", "Paul Hartley ist sofort verfügbar.", False),
                ("La firma del contrato pasa del jueves al martes.", "Die Vertragsunterzeichnung wird von Donnerstag auf Dienstag verlegt.", True),
                ("La nueva hora de la firma es las 14:00.", "Die neue Uhrzeit für die Unterzeichnung ist 14 Uhr.", False),
                ("El lugar cambia a 12 Fleet Street.", "Der Ort ändert sich zu 12 Fleet Street.", True),
            ],
            [
                ("¿Cuándo volverá Paul Hartley?", "Wann wird Paul Hartley zurück sein?", ["Tomorrow afternoon", "Today at noon", "Next week"], 0),
                ("¿A qué hora es la nueva firma del contrato?", "Um wie viel Uhr ist die neue Vertragsunterzeichnung?", ["10am", "2pm", "11am"], 0),
                ("¿Qué debe llevar Paul?", "Was muss Paul mitbringen?", ["The signed budget proposal", "His passport", "A new contract"], 0),
                ("¿Cuál es el nuevo lugar?", "Wo ist der neue Ort?", ["12 Fleet Street", "The hotel", "West End Holdings office"], 0),
                ("¿Cuál es el número de teléfono de Patricia?", "Wie lautet Patricias Telefonnummer?", ["07700-909-432", "07700-432-909", "07700-909-234"], 0),
            ],
        ),
    )

    files[4790] = speaking_sql(
        4790,
        "take more complex messages, provided that the caller dictates these clearly and sympathetically",
        PHONE,
        "Practica tomar recados telefónicos complejos",
        "Übe das Aufnehmen komplexer Telefonnachrichten",
        "Practica cómo tomar y transmitir recados telefónicos detallados de forma profesional.",
        "Übe, wie man detaillierte Telefonnachrichten professionell aufnimmt und weitergibt.",
        "Una persona llama para dejar un recado complejo para un compañero que no está disponible. Practica cómo tomar el recado con todos los detalles, repetir la información para confirmar y transmitirla correctamente.",
        [
            "Contesta el teléfono de forma profesional con el nombre de la empresa.",
            "Explica que la persona no está disponible y ofrece tomar un recado.",
            "Pide el nombre y empresa de quien llama.",
            "Anota el mensaje principal: qué ha cambiado, cuándo y dónde.",
            "Repite cada dato importante para confirmar.",
            "Pregunta si hay que traer documentos o hacer preparativos.",
            "Pide un número de teléfono o correo para devolver la llamada si es necesario.",
            "Confirma que darás el recado en cuanto la persona esté disponible.",
        ],
        "Eine Person ruft an, um eine komplexe Nachricht für einen nicht verfügbaren Kollegen zu hinterlassen. Üben Sie, die Nachricht mit allen Details aufzunehmen, die Informationen zu bestätigen und weiterzugeben.",
        [
            "Nehmen Sie das Telefon professionell mit dem Firmennamen ab.",
            "Erklären Sie, dass die Person nicht verfügbar ist, und bieten Sie an, eine Nachricht aufzunehmen.",
            "Fragen Sie nach Namen und Firma des Anrufers.",
            "Notieren Sie die Hauptnachricht: was sich geändert hat, wann und wo.",
            "Wiederholen Sie jeden wichtigen Punkt zur Bestätigung.",
            "Fragen Sie, ob Dokumente mitgebracht oder Vorbereitungen getroffen werden müssen.",
            "Bitten Sie um eine Telefonnummer oder E-Mail für einen Rückruf.",
            "Bestätigen Sie, dass Sie die Nachricht weitergeben, sobald die Person verfügbar ist.",
        ],
    )

    files[4800] = reading_sql(
        4800,
        "take or leave routine messages, ask for clarification",
        PHONE,
        "Lee una nota de recado telefónico rutinario",
        "Lies eine routinemäßige Telefonnotiz",
        "Lee un recado telefónico sobre una entrega y una devolución de llamada.",
        "Lies eine Telefonnotiz über eine Lieferung und einen Rückruf.",
        """
        Phone Message Note

        To: Ms. Rachel Green, Sales Manager.
        Date: Tuesday 12 September.
        Time: 11:30 am.
        From: Mr. Oliver Park, Park & Webb Ltd.
        Phone: 01223-456-789.

        Message:
        Mr. Park called about order number 7720. He wants to confirm that the delivery address is still Warehouse B, 23 Canal Road. He also asked whether the delivery can be made before 3pm on Friday. If he does not hear from you today, he will call back tomorrow morning. Please return his call before 4pm today.
        """,
        build_reading_exercises(
            [
                ("El mensaje es para la señora Rachel Green.", "Die Nachricht ist für Frau Rachel Green.", True),
                ("El mensaje se tomó un miércoles.", "Die Nachricht wurde an einem Mittwoch aufgenommen.", False),
                ("Quien llama es el señor Oliver Park de Park & Webb Ltd.", "Der Anrufer ist Herr Oliver Park von Park & Webb Ltd.", True),
                ("El número de pedido es 7720.", "Die Bestellnummer lautet 7720.", True),
                ("El señor Park quiere cambiar la dirección de entrega.", "Herr Park möchte die Lieferadresse ändern.", False),
                ("La dirección de entrega es Warehouse B, 23 Canal Road.", "Die Lieferadresse ist Warehouse B, 23 Canal Road.", True),
                ("El señor Park quiere la entrega antes de las 15:00 del viernes.", "Herr Park möchte die Lieferung vor 15 Uhr am Freitag.", True),
                ("El señor Park volverá a llamar mañana por la tarde si no recibe respuesta.", "Herr Park wird morgen Nachmittag erneut anrufen, falls er keine Antwort erhält.", False),
            ],
            [
                ("¿Para quién es el mensaje?", "Für wen ist die Nachricht?", ["Para la señora Rachel Green", "Para el señor Oliver Park", "Para la recepcionista"], ["Für Frau Rachel Green", "Für Herrn Oliver Park", "Für die Empfangskraft"], 0),
                ("¿A qué hora se tomó el mensaje?", "Um wie viel Uhr wurde die Nachricht aufgenommen?", ["A las 11:30", "A las 9:45", "A las 14:00"], ["Um 11:30 Uhr", "Um 9:45 Uhr", "Um 14 Uhr"], 0),
                ("¿Cuál es el número de pedido?", "Wie lautet die Bestellnummer?", ["7720", "7200", "7270"], ["7720", "7200", "7270"], 0),
                ("¿Qué quiere confirmar el señor Park?", "Was möchte Herr Park bestätigen?", ["La dirección de entrega", "El precio", "La fecha de entrega"], ["Die Lieferadresse", "Den Preis", "Das Lieferdatum"], 0),
                ("¿Cuál es la dirección de entrega?", "Wie lautet die Lieferadresse?", ["Warehouse B, 23 Canal Road", "Warehouse A, 32 Canal Road", "Warehouse B, 32 Canal Road"], ["Warehouse B, 23 Canal Road", "Warehouse A, 32 Canal Road", "Warehouse B, 32 Canal Road"], 0),
                ("¿Cuándo quiere la entrega?", "Bis wann möchte er die Lieferung?", ["Antes de las 15:00 del viernes", "Antes de las 17:00 del viernes", "Antes del mediodía del viernes"], ["Vor 15 Uhr am Freitag", "Vor 17 Uhr am Freitag", "Vor Freitagmittag"], 0),
                ("¿Cuándo volverá a llamar si no recibe respuesta?", "Wann ruft er erneut an, wenn er keine Antwort erhält?", ["Mañana por la mañana", "Mañana por la tarde", "El próximo lunes"], ["Morgen früh", "Morgen Nachmittag", "Am nächsten Montag"], 0),
                ("¿Antes de cuándo debe devolver la llamada la señora Green?", "Bis wann soll Frau Green zurückrufen?", ["Antes de las 16:00 de hoy", "Antes de las 17:00 de hoy", "Antes del mediodía de hoy"], ["Vor 16 Uhr heute", "Vor 17 Uhr heute", "Vor heute Mittag"], 0),
            ],
        ),
    )

    for step in sorted(files):
        write_file(step, files[step])
        print(f"Wrote step-{step}.sql")


if __name__ == "__main__":
    main()
