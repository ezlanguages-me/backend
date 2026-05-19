-- ============================================================
-- Seed: A0 English Path – STEP 8660 – Grammar – Prefixes and Suffixes
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_grammar_id UUID;
    v_rule1_id UUID;
    v_rule2_id UUID;
    v_rule3_id UUID;
    v_rule4_id UUID;
    v_ex_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE grammar_rule_uuid IN (
        SELECT gr.uuid
        FROM grammar_rule gr
        JOIN grammar g ON gr.grammar_uuid = g.uuid
        WHERE g.step_order=8660 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=8660 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,8660,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Prefixes and Suffixes', 'Cómo formar palabras con prefijos y sufijos, interpretar cambios de significado y reconocer familias léxicas.', to_jsonb('# Prefixes and Suffixes

Los **prefijos** van delante de una palabra base. Los **sufijos** van detrás. Ambos cambian forma, significado o categoría gramatical.

## 1. Prefijos comunes
Algunos prefijos muy frecuentes son:
- **un-** unhappy
- **re-** rewrite
- **pre-** precooked
- **over- / under-** overpaid, undertrained

## 2. Sufijos comunes
Los sufijos ayudan a formar nombres, adjetivos o adverbios.
- teach → teach**er**
- help → help**ful**
- kind → kind**ness**
- slow → slow**ly**

## 3. Prefijos que cambian el significado
Muchos prefijos añaden una idea clara.
- **dis-** = contrario
- **mis-** = error
- **non-** = ausencia
- **inter-** = entre varios

## 4. Patrones de formación de palabras
Aprender familias léxicas ayuda a elegir la forma correcta en contexto.
- decide → decision
- music → musician
- danger → dangerous
- improve → improvement

### Consejo
No memorices solo una palabra. Aprende la **base** y varias formas relacionadas.'::text)),
        (v_grammar_id, 'de', 'Präfixe und Suffixe', 'Wie man Wörter mit Präfixen und Suffixen bildet, Bedeutungsänderungen versteht und Wortfamilien erkennt.', to_jsonb('# Präfixe und Suffixe

**Präfixe** stehen vor einem Grundwort. **Suffixe** stehen dahinter. Beide verändern Form, Bedeutung oder Wortart.

## 1. Häufige Präfixe
Einige sehr häufige Präfixe sind:
- **un-** unhappy
- **re-** rewrite
- **pre-** precooked
- **over- / under-** overpaid, undertrained

## 2. Häufige Suffixe
Suffixe helfen, Nomen, Adjektive oder Adverbien zu bilden.
- teach → teach**er**
- help → help**ful**
- kind → kind**ness**
- slow → slow**ly**

## 3. Präfixe mit Bedeutungswechsel
Viele Präfixe tragen eine klare Bedeutung.
- **dis-** = Gegenteil
- **mis-** = Fehler
- **non-** = ohne / nicht
- **inter-** = zwischen mehreren

## 4. Wortbildungsmuster
Wenn du Wortfamilien lernst, wählst du leichter die richtige Form im Kontext.
- decide → decision
- music → musician
- danger → dangerous
- improve → improvement

### Tipp
Lerne nicht nur ein Wort. Lerne das **Grundwort** und mehrere verwandte Formen dazu.'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule1_id, 'es', 'Prefijos comunes', 'Los prefijos comunes como un-, re-, pre-, over- y under- añaden ideas frecuentes delante de la palabra base.'),
        (v_rule1_id, 'de', 'Häufige Präfixe', 'Häufige Präfixe wie un-, re-, pre-, over- und under- fügen vor dem Grundwort häufige Bedeutungen hinzu.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra formada correctamente: Please ___ the email before lunch.', '{"type": "typing", "correct_answers": ["rewrite"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtig gebildeten Wort: Please ___ the email before lunch.', '{"type": "typing", "correct_answers": ["rewrite"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Please ___ the email before lunch.', '{"type": "multiple_choice", "options": ["rewrite", "unwrite", "prewrite"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Please ___ the email before lunch.', '{"type": "multiple_choice", "options": ["rewrite", "unwrite", "prewrite"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: El prefijo re- suele indicar repetición.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Das Präfix re- zeigt oft Wiederholung.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Please", "rewrite", "the", "email", "before", "lunch."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Please", "rewrite", "the", "email", "before", "lunch."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra formada correctamente: He felt ___ after the bad news.', '{"type": "typing", "correct_answers": ["unhappy"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtig gebildeten Wort: He felt ___ after the bad news.', '{"type": "typing", "correct_answers": ["unhappy"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He felt ___ after the bad news.', '{"type": "multiple_choice", "options": ["unhappy", "rehappy", "prehappy"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He felt ___ after the bad news.', '{"type": "multiple_choice", "options": ["unhappy", "rehappy", "prehappy"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Unhappy significa muy feliz.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Unhappy bedeutet sehr glücklich.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "felt", "unhappy", "after", "the", "bad", "news."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "felt", "unhappy", "after", "the", "bad", "news."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra formada correctamente: We bought ___ rice for the trip.', '{"type": "typing", "correct_answers": ["precooked"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtig gebildeten Wort: We bought ___ rice for the trip.', '{"type": "typing", "correct_answers": ["precooked"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We bought ___ rice for the trip.', '{"type": "multiple_choice", "options": ["precooked", "uncooked", "recooked"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We bought ___ rice for the trip.', '{"type": "multiple_choice", "options": ["precooked", "uncooked", "recooked"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: El prefijo pre- suele indicar que algo sucede antes.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Das Präfix pre- zeigt oft, dass etwas vorher passiert.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "bought", "precooked", "rice", "for", "the", "trip."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "bought", "precooked", "rice", "for", "the", "trip."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra formada correctamente: The company ___ the supplier by mistake.', '{"type": "typing", "correct_answers": ["overpaid"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtig gebildeten Wort: The company ___ the supplier by mistake.', '{"type": "typing", "correct_answers": ["overpaid"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The company ___ the supplier by mistake.', '{"type": "multiple_choice", "options": ["overpaid", "underpaid", "prepaid"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The company ___ the supplier by mistake.', '{"type": "multiple_choice", "options": ["overpaid", "underpaid", "prepaid"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Overpaid significa pagado de menos.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Overpaid bedeutet zu wenig bezahlt.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "company", "overpaid", "the", "supplier", "by", "mistake."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "company", "overpaid", "the", "supplier", "by", "mistake."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra formada correctamente: The team is ___ for a mountain race.', '{"type": "typing", "correct_answers": ["undertrained"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtig gebildeten Wort: The team is ___ for a mountain race.', '{"type": "typing", "correct_answers": ["undertrained"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The team is ___ for a mountain race.', '{"type": "multiple_choice", "options": ["undertrained", "overtrained", "pretrained"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The team is ___ for a mountain race.', '{"type": "multiple_choice", "options": ["undertrained", "overtrained", "pretrained"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Under- puede indicar falta o cantidad insuficiente.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Under- kann Mangel oder zu wenig anzeigen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "team", "is", "undertrained", "for", "a", "mountain", "race."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "team", "is", "undertrained", "for", "a", "mountain", "race."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra formada correctamente: You should ___ chapter three tonight.', '{"type": "typing", "correct_answers": ["reread"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtig gebildeten Wort: You should ___ chapter three tonight.', '{"type": "typing", "correct_answers": ["reread"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: You should ___ chapter three tonight.', '{"type": "multiple_choice", "options": ["reread", "unread", "misread"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: You should ___ chapter three tonight.', '{"type": "multiple_choice", "options": ["reread", "unread", "misread"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Reread significa leer otra vez.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Reread bedeutet noch einmal lesen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["You", "should", "reread", "chapter", "three", "tonight."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["You", "should", "reread", "chapter", "three", "tonight."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra formada correctamente: ___ children learn through play.', '{"type": "typing", "correct_answers": ["Preschool"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtig gebildeten Wort: ___ children learn through play.', '{"type": "typing", "correct_answers": ["Preschool"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: ___ children learn through play.', '{"type": "multiple_choice", "options": ["Preschool", "Postschool", "Unschool"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: ___ children learn through play.', '{"type": "multiple_choice", "options": ["Preschool", "Postschool", "Unschool"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Preschool se refiere a una etapa posterior a la universidad.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Preschool bezeichnet eine Phase nach der Universität.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Preschool", "children", "learn", "through", "play."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Preschool", "children", "learn", "through", "play."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule2_id, 'es', 'Sufijos comunes', 'Los sufijos comunes cambian la categoría de la palabra: teacher, helpful, kindness, slowly.'),
        (v_rule2_id, 'de', 'Häufige Suffixe', 'Häufige Suffixe verändern die Wortart: teacher, helpful, kindness, slowly.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra derivada correcta: My sister is a science ___.', '{"type": "typing", "correct_answers": ["teacher"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen abgeleiteten Wort: My sister is a science ___.', '{"type": "typing", "correct_answers": ["teacher"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: My sister is a science ___.', '{"type": "multiple_choice", "options": ["teacher", "teachful", "teachment"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: My sister is a science ___.', '{"type": "multiple_choice", "options": ["teacher", "teachful", "teachment"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: El sufijo -er puede formar nombres de persona a partir de verbos.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Das Suffix -er kann Personenbezeichnungen aus Verben bilden.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["My", "sister", "is", "a", "science", "teacher."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["My", "sister", "is", "a", "science", "teacher."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra derivada correcta: Thanks for your ___ advice.', '{"type": "typing", "correct_answers": ["helpful"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen abgeleiteten Wort: Thanks for your ___ advice.', '{"type": "typing", "correct_answers": ["helpful"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Thanks for your ___ advice.', '{"type": "multiple_choice", "options": ["helpful", "helpless", "helply"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Thanks for your ___ advice.', '{"type": "multiple_choice", "options": ["helpful", "helpless", "helply"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: El sufijo -ful suele aportar la idea de “lleno de”.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Das Suffix -ful trägt oft die Bedeutung „voll von“.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Thanks", "for", "your", "helpful", "advice."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Thanks", "for", "your", "helpful", "advice."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra derivada correcta: The charity supports ___ families.', '{"type": "typing", "correct_answers": ["homeless"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen abgeleiteten Wort: The charity supports ___ families.', '{"type": "typing", "correct_answers": ["homeless"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The charity supports ___ families.', '{"type": "multiple_choice", "options": ["homeless", "homeful", "homely"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The charity supports ___ families.', '{"type": "multiple_choice", "options": ["homeless", "homeful", "homely"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Homeless significa “con hogar”.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Homeless bedeutet „mit Zuhause“.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "charity", "supports", "homeless", "families."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "charity", "supports", "homeless", "families."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra derivada correcta: The app needs one more ___ stage.', '{"type": "typing", "correct_answers": ["development"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen abgeleiteten Wort: The app needs one more ___ stage.', '{"type": "typing", "correct_answers": ["development"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The app needs one more ___ stage.', '{"type": "multiple_choice", "options": ["development", "developful", "developly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The app needs one more ___ stage.', '{"type": "multiple_choice", "options": ["development", "developful", "developly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: El sufijo -ment puede formar nombres.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Das Suffix -ment kann Nomen bilden.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "app", "needs", "one", "more", "development", "stage."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "app", "needs", "one", "more", "development", "stage."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra derivada correcta: Please drive ___ in the rain.', '{"type": "typing", "correct_answers": ["slowly"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen abgeleiteten Wort: Please drive ___ in the rain.', '{"type": "typing", "correct_answers": ["slowly"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Please drive ___ in the rain.', '{"type": "multiple_choice", "options": ["slowly", "slowness", "slowful"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Please drive ___ in the rain.', '{"type": "multiple_choice", "options": ["slowly", "slowness", "slowful"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Slowly es un adjetivo.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Slowly ist ein Adjektiv.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Please", "drive", "slowly", "in", "the", "rain."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Please", "drive", "slowly", "in", "the", "rain."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra derivada correcta: Her ___ impressed everyone.', '{"type": "typing", "correct_answers": ["kindness"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen abgeleiteten Wort: Her ___ impressed everyone.', '{"type": "typing", "correct_answers": ["kindness"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Her ___ impressed everyone.', '{"type": "multiple_choice", "options": ["kindness", "kindly", "kindment"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Her ___ impressed everyone.', '{"type": "multiple_choice", "options": ["kindness", "kindly", "kindment"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: El sufijo -ness suele formar nombres abstractos.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Das Suffix -ness bildet oft abstrakte Nomen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Her", "kindness", "impressed", "everyone."], "correct_order": [0, 1, 2, 3]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Her", "kindness", "impressed", "everyone."], "correct_order": [0, 1, 2, 3]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra derivada correcta: This bag is ___.', '{"type": "typing", "correct_answers": ["washable"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen abgeleiteten Wort: This bag is ___.', '{"type": "typing", "correct_answers": ["washable"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This bag is ___.', '{"type": "multiple_choice", "options": ["washable", "washness", "washer"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This bag is ___.', '{"type": "multiple_choice", "options": ["washable", "washness", "washer"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Washable significa que no se puede lavar.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Washable bedeutet, dass man es nicht waschen kann.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["This", "bag", "is", "washable."], "correct_order": [0, 1, 2, 3]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["This", "bag", "is", "washable."], "correct_order": [0, 1, 2, 3]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule3_id, 'es', 'Prefijos que cambian el significado', 'Prefijos como dis-, mis-, non-, ex-, co- o inter- cambian el sentido básico de la palabra.'),
        (v_rule3_id, 'de', 'Bedeutungsverändernde Präfixe', 'Präfixe wie dis-, mis-, non-, ex-, co- oder inter- verändern die Grundbedeutung des Wortes.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra correcta: I ___ with that conclusion.', '{"type": "typing", "correct_answers": ["disagree"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: I ___ with that conclusion.', '{"type": "typing", "correct_answers": ["disagree"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: I ___ with that conclusion.', '{"type": "multiple_choice", "options": ["disagree", "agree", "misagree"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: I ___ with that conclusion.', '{"type": "multiple_choice", "options": ["disagree", "agree", "misagree"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Disagree significa estar completamente de acuerdo.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Disagree bedeutet völlig zustimmen.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "disagree", "with", "that", "conclusion."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "disagree", "with", "that", "conclusion."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra correcta: Sorry, I ___ the question.', '{"type": "typing", "correct_answers": ["misunderstood"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: Sorry, I ___ the question.', '{"type": "typing", "correct_answers": ["misunderstood"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Sorry, I ___ the question.', '{"type": "multiple_choice", "options": ["misunderstood", "understood", "disunderstood"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Sorry, I ___ the question.', '{"type": "multiple_choice", "options": ["misunderstood", "understood", "disunderstood"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Misunderstand significa entender de forma incorrecta.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Misunderstand bedeutet falsch verstehen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Sorry,", "I", "misunderstood", "the", "question."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Sorry,", "I", "misunderstood", "the", "question."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra correcta: His comment sounded ___.', '{"type": "typing", "correct_answers": ["antisocial"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: His comment sounded ___.', '{"type": "typing", "correct_answers": ["antisocial"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: His comment sounded ___.', '{"type": "multiple_choice", "options": ["antisocial", "social", "presocial"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: His comment sounded ___.', '{"type": "multiple_choice", "options": ["antisocial", "social", "presocial"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Antisocial puede describir un comportamiento contrario a la interacción social normal.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Antisocial kann ein Verhalten gegen normales soziales Miteinander beschreiben.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["His", "comment", "sounded", "antisocial."], "correct_order": [0, 1, 2, 3]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["His", "comment", "sounded", "antisocial."], "correct_order": [0, 1, 2, 3]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra correcta: This area is for ___ only.', '{"type": "typing", "correct_answers": ["nonsmokers"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: This area is for ___ only.', '{"type": "typing", "correct_answers": ["nonsmokers"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This area is for ___ only.', '{"type": "multiple_choice", "options": ["nonsmokers", "smokers", "resmokers"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This area is for ___ only.', '{"type": "multiple_choice", "options": ["nonsmokers", "smokers", "resmokers"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Nonsmoker se refiere a alguien que no fuma.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Nonsmoker bezeichnet jemanden, der nicht raucht.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["This", "area", "is", "for", "nonsmokers", "only."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["This", "area", "is", "for", "nonsmokers", "only."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra correcta: She still talks to her ___ sometimes.', '{"type": "typing", "correct_answers": ["ex-husband"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: She still talks to her ___ sometimes.', '{"type": "typing", "correct_answers": ["ex-husband"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She still talks to her ___ sometimes.', '{"type": "multiple_choice", "options": ["ex-husband", "pre-husband", "co-husband"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She still talks to her ___ sometimes.', '{"type": "multiple_choice", "options": ["ex-husband", "pre-husband", "co-husband"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: El prefijo ex- puede marcar una relación o estado anterior.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Das Präfix ex- kann einen früheren Status oder eine frühere Beziehung markieren.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "still", "talks", "to", "her", "ex-husband", "sometimes."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "still", "talks", "to", "her", "ex-husband", "sometimes."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra correcta: My ___ speaks three languages.', '{"type": "typing", "correct_answers": ["coworker"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: My ___ speaks three languages.', '{"type": "typing", "correct_answers": ["coworker"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: My ___ speaks three languages.', '{"type": "multiple_choice", "options": ["coworker", "reworker", "antiworker"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: My ___ speaks three languages.', '{"type": "multiple_choice", "options": ["coworker", "reworker", "antiworker"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Coworker significa alguien que trabaja contra ti.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Coworker bedeutet jemand, der gegen dich arbeitet.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["My", "coworker", "speaks", "three", "languages."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["My", "coworker", "speaks", "three", "languages."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la palabra correcta: The company sells products in ___ markets.', '{"type": "typing", "correct_answers": ["international"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Wort: The company sells products in ___ markets.', '{"type": "typing", "correct_answers": ["international"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The company sells products in ___ markets.', '{"type": "multiple_choice", "options": ["international", "national", "unnational"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The company sells products in ___ markets.', '{"type": "multiple_choice", "options": ["international", "national", "unnational"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: International se relaciona con más de un país.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: International bezieht sich auf mehr als ein Land.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "company", "sells", "products", "in", "international", "markets."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "company", "sells", "products", "in", "international", "markets."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule4_id, 'es', 'Patrones de formación de palabras', 'Observa la familia léxica para elegir si necesitas nombre, adjetivo o adverbio en la frase.'),
        (v_rule4_id, 'de', 'Wortbildungsmuster', 'Achte auf die Wortfamilie, um zu entscheiden, ob du im Satz ein Nomen, Adjektiv oder Adverb brauchst.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de la familia léxica: Her final ___ surprised the team.', '{"type": "typing", "correct_answers": ["decision"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form aus der Wortfamilie: Her final ___ surprised the team.', '{"type": "typing", "correct_answers": ["decision"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Her final ___ surprised the team.', '{"type": "multiple_choice", "options": ["decision", "decide", "decisive"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Her final ___ surprised the team.', '{"type": "multiple_choice", "options": ["decision", "decide", "decisive"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: La terminación -tion suele formar nombres.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Die Endung -tion bildet oft Nomen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Her", "final", "decision", "surprised", "the", "team."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Her", "final", "decision", "surprised", "the", "team."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de la familia léxica: He is a talented ___.', '{"type": "typing", "correct_answers": ["musician"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form aus der Wortfamilie: He is a talented ___.', '{"type": "typing", "correct_answers": ["musician"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He is a talented ___.', '{"type": "multiple_choice", "options": ["musician", "music", "musical"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He is a talented ___.', '{"type": "multiple_choice", "options": ["musician", "music", "musical"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Musician es un nombre de persona.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Musician ist ein Personenwort.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "is", "a", "talented", "musician."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "is", "a", "talented", "musician."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de la familia léxica: We need a more ___ solution.', '{"type": "typing", "correct_answers": ["creative"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form aus der Wortfamilie: We need a more ___ solution.', '{"type": "typing", "correct_answers": ["creative"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We need a more ___ solution.', '{"type": "multiple_choice", "options": ["creative", "creation", "creatively"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We need a more ___ solution.', '{"type": "multiple_choice", "options": ["creative", "creation", "creatively"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Creative es un adverbio.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Creative ist ein Adverb.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "need", "a", "more", "creative", "solution."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "need", "a", "more", "creative", "solution."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de la familia léxica: The app shows a clear ___.', '{"type": "typing", "correct_answers": ["improvement"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form aus der Wortfamilie: The app shows a clear ___.', '{"type": "typing", "correct_answers": ["improvement"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The app shows a clear ___.', '{"type": "multiple_choice", "options": ["improvement", "improve", "improving"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The app shows a clear ___.', '{"type": "multiple_choice", "options": ["improvement", "improve", "improving"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Improvement es un nombre.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Improvement ist ein Nomen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "app", "shows", "a", "clear", "improvement."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "app", "shows", "a", "clear", "improvement."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de la familia léxica: She gave a ___ answer.', '{"type": "typing", "correct_answers": ["careful"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form aus der Wortfamilie: She gave a ___ answer.', '{"type": "typing", "correct_answers": ["careful"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She gave a ___ answer.', '{"type": "multiple_choice", "options": ["careful", "carefully", "carelessness"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She gave a ___ answer.', '{"type": "multiple_choice", "options": ["careful", "carefully", "carelessness"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Careful describe un nombre, mientras que carefully suele describir un verbo.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Careful beschreibt ein Nomen, während carefully meist ein Verb näher beschreibt.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "gave", "a", "careful", "answer."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "gave", "a", "careful", "answer."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de la familia léxica: This road is ___ in winter.', '{"type": "typing", "correct_answers": ["dangerous"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form aus der Wortfamilie: This road is ___ in winter.', '{"type": "typing", "correct_answers": ["dangerous"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This road is ___ in winter.', '{"type": "multiple_choice", "options": ["dangerous", "danger", "dangerously"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This road is ___ in winter.', '{"type": "multiple_choice", "options": ["dangerous", "danger", "dangerously"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Dangerous significa “lleno de peligro”.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Dangerous bedeutet „voller Gefahr“.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["This", "road", "is", "dangerous", "in", "winter."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["This", "road", "is", "dangerous", "in", "winter."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con la forma correcta de la familia léxica: The chair is surprisingly ___.', '{"type": "typing", "correct_answers": ["comfortable"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit der richtigen Form aus der Wortfamilie: The chair is surprisingly ___.', '{"type": "typing", "correct_answers": ["comfortable"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The chair is surprisingly ___.', '{"type": "multiple_choice", "options": ["comfortable", "comfortably", "comfort"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The chair is surprisingly ___.', '{"type": "multiple_choice", "options": ["comfortable", "comfortably", "comfort"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Comfortable es la forma adverbial.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Comfortable ist die Adverbform.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "chair", "is", "surprisingly", "comfortable."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "chair", "is", "surprisingly", "comfortable."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

END;
$seed$;
