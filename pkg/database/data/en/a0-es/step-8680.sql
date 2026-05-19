-- ============================================================
-- Seed: A0 English Path – STEP 8680 – Grammar – Intensificadores y mitigadores
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
        WHERE g.step_order=8680 AND g.path_uuid=v_path_id
    );
    DELETE FROM grammar WHERE step_order=8680 AND path_uuid=v_path_id;

    INSERT INTO grammar (path_uuid,step_order,source_language,type) VALUES (v_path_id,8680,'en','grammar') RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
    VALUES
        (v_grammar_id, 'es', 'Intensificadores y mitigadores', 'Cómo reforzar o suavizar adjetivos y adverbios, y cómo combinar intensificadores con adjetivos gradables y no gradables.', to_jsonb('# Intensificadores y mitigadores

Los **intensificadores** suben el grado de una idea. Los **mitigadores** la suavizan.

## 1. Intensificadores fuertes
Van muy bien con adjetivos fuertes o casi absolutos.
- absolutely exhausted
- completely full
- utterly ridiculous
- deeply sorry

## 2. Intensificadores moderados
Dan un grado medio o bastante natural.
- pretty tired
- fairly easy
- quite busy
- rather cold

## 3. Mitigadores
Sirven para sonar menos directo o menos extremo.
- a bit tired
- a little late
- slightly different
- not very hungry

## 4. Adjetivos gradables y no gradables
Algunos adjetivos aceptan grados claros (**cold, dirty, hungry**). Otros ya son muy extremos (**exhausted, perfect, enormous**).
- very cold
- very hungry
- absolutely exhausted
- absolutely perfect

### Consejo
Aprende la combinación completa, no solo el adjetivo. En inglés muchas combinaciones suenan naturales y otras no.'::text)),
        (v_grammar_id, 'de', 'Verstärker und Abschwächer', 'Wie man Adjektive und Adverbien verstärkt oder abschwächt und welche Intensivierer zu gradierbaren oder nicht gradierbaren Adjektiven passen.', to_jsonb('# Verstärker und Abschwächer

**Verstärker** erhöhen den Grad einer Aussage. **Abschwächer** machen sie weicher.

## 1. Starke Verstärker
Sie passen gut zu starken oder fast absoluten Adjektiven.
- absolutely exhausted
- completely full
- utterly ridiculous
- deeply sorry

## 2. Mittlere Verstärker
Sie geben ein mittleres oder natürliches Maß an.
- pretty tired
- fairly easy
- quite busy
- rather cold

## 3. Abschwächer
Sie helfen, weniger direkt oder weniger extrem zu klingen.
- a bit tired
- a little late
- slightly different
- not very hungry

## 4. Gradierbare und nicht gradierbare Adjektive
Manche Adjektive lassen klare Abstufungen zu (**cold, dirty, hungry**). Andere sind schon sehr stark (**exhausted, perfect, enormous**).
- very cold
- very hungry
- absolutely exhausted
- absolutely perfect

### Tipp
Lerne die ganze Kombination, nicht nur das Adjektiv. Im Englischen klingen manche Kombinationen sehr natürlich und andere nicht.'::text));

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule1_id, 'es', 'Intensificadores fuertes', 'Usa intensificadores fuertes como absolutely, completely, utterly o deeply con adjetivos muy intensos.'),
        (v_rule1_id, 'de', 'Starke Verstärker', 'Benutze starke Verstärker wie absolutely, completely, utterly oder deeply mit sehr starken Adjektiven.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador fuerte correcto: After the marathon, we were ___ exhausted.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen starken Verstärker: After the marathon, we were ___ exhausted.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: After the marathon, we were ___ exhausted.', '{"type": "multiple_choice", "options": ["absolutely", "fairly", "a bit"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: After the marathon, we were ___ exhausted.', '{"type": "multiple_choice", "options": ["absolutely", "fairly", "a bit"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Absolutely suele funcionar bien con adjetivos extremos como exhausted.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Absolutely passt oft gut zu extremen Adjektiven wie exhausted.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["After", "the", "marathon,", "we", "were", "absolutely", "exhausted."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["After", "the", "marathon,", "we", "were", "absolutely", "exhausted."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador fuerte correcto: The glass is ___ full.', '{"type": "typing", "correct_answers": ["completely"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen starken Verstärker: The glass is ___ full.', '{"type": "typing", "correct_answers": ["completely"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The glass is ___ full.', '{"type": "multiple_choice", "options": ["completely", "slightly", "pretty"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The glass is ___ full.', '{"type": "multiple_choice", "options": ["completely", "slightly", "pretty"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Completely full suena natural porque full está cerca de un límite.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Completely full klingt natürlich, weil full an einer Grenze liegt.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "glass", "is", "completely", "full."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "glass", "is", "completely", "full."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador fuerte correcto: This plan is ___ impossible.', '{"type": "typing", "correct_answers": ["totally"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen starken Verstärker: This plan is ___ impossible.', '{"type": "typing", "correct_answers": ["totally"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This plan is ___ impossible.', '{"type": "multiple_choice", "options": ["totally", "fairly", "a little"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This plan is ___ impossible.', '{"type": "multiple_choice", "options": ["totally", "fairly", "a little"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Totally impossible es una combinación fuerte y natural.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Totally impossible ist eine starke und natürliche Kombination.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["This", "plan", "is", "totally", "impossible."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["This", "plan", "is", "totally", "impossible."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador fuerte correcto: His excuse sounded ___ ridiculous.', '{"type": "typing", "correct_answers": ["utterly"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen starken Verstärker: His excuse sounded ___ ridiculous.', '{"type": "typing", "correct_answers": ["utterly"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: His excuse sounded ___ ridiculous.', '{"type": "multiple_choice", "options": ["utterly", "kind of", "slightly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: His excuse sounded ___ ridiculous.', '{"type": "multiple_choice", "options": ["utterly", "kind of", "slightly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Utterly suele intensificar adjetivos muy fuertes.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Utterly verstärkt oft sehr starke Adjektive.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["His", "excuse", "sounded", "utterly", "ridiculous."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["His", "excuse", "sounded", "utterly", "ridiculous."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador fuerte correcto: The instructions are ___ clear.', '{"type": "typing", "correct_answers": ["perfectly"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen starken Verstärker: The instructions are ___ clear.', '{"type": "typing", "correct_answers": ["perfectly"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The instructions are ___ clear.', '{"type": "multiple_choice", "options": ["perfectly", "a bit", "rather"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The instructions are ___ clear.', '{"type": "multiple_choice", "options": ["perfectly", "a bit", "rather"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Perfectly clear significa que el mensaje no está claro en absoluto.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Perfectly clear bedeutet, dass die Botschaft überhaupt nicht klar ist.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "instructions", "are", "perfectly", "clear."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "instructions", "are", "perfectly", "clear."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador fuerte correcto: I am ___ sorry for the delay.', '{"type": "typing", "correct_answers": ["deeply"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen starken Verstärker: I am ___ sorry for the delay.', '{"type": "typing", "correct_answers": ["deeply"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: I am ___ sorry for the delay.', '{"type": "multiple_choice", "options": ["deeply", "pretty", "fairly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: I am ___ sorry for the delay.', '{"type": "multiple_choice", "options": ["deeply", "pretty", "fairly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Deeply sorry es una colocación fuerte y frecuente.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Deeply sorry ist eine häufige starke Kollokation.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I", "am", "deeply", "sorry", "for", "the", "delay."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I", "am", "deeply", "sorry", "for", "the", "delay."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador fuerte correcto: The water was ___ freezing.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen starken Verstärker: The water was ___ freezing.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The water was ___ freezing.', '{"type": "multiple_choice", "options": ["absolutely", "somewhat", "a little"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The water was ___ freezing.', '{"type": "multiple_choice", "options": ["absolutely", "somewhat", "a little"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Freezing suele tratarse aquí como un adjetivo no gradable.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Freezing wird hier meist wie ein nicht gradierbares Adjektiv behandelt.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "water", "was", "absolutely", "freezing."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "water", "was", "absolutely", "freezing."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule2_id, 'es', 'Intensificadores moderados', 'Pretty, fairly, quite, rather y reasonably suelen dar un grado medio o moderado.'),
        (v_rule2_id, 'de', 'Mittlere Verstärker', 'Pretty, fairly, quite, rather und reasonably geben oft einen mittleren oder moderaten Grad an.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador moderado correcto: I''m ___ tired today.', '{"type": "typing", "correct_answers": ["pretty"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen mittleren Verstärker: I''m ___ tired today.', '{"type": "typing", "correct_answers": ["pretty"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: I''m ___ tired today.', '{"type": "multiple_choice", "options": ["pretty", "absolutely", "utterly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: I''m ___ tired today.', '{"type": "multiple_choice", "options": ["pretty", "absolutely", "utterly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Pretty suele dar un nivel moderado e informal.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Pretty gibt oft einen moderaten, informellen Grad an.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I''m", "pretty", "tired", "today."], "correct_order": [0, 1, 2, 3]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I''m", "pretty", "tired", "today."], "correct_order": [0, 1, 2, 3]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador moderado correcto: The test was ___ easy.', '{"type": "typing", "correct_answers": ["fairly"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen mittleren Verstärker: The test was ___ easy.', '{"type": "typing", "correct_answers": ["fairly"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The test was ___ easy.', '{"type": "multiple_choice", "options": ["fairly", "utterly", "absolutely"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The test was ___ easy.', '{"type": "multiple_choice", "options": ["fairly", "utterly", "absolutely"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Fairly hace el adjetivo más fuerte que absolutely.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Fairly macht das Adjektiv stärker als absolutely.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "test", "was", "fairly", "easy."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "test", "was", "fairly", "easy."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador moderado correcto: She is ___ busy this week.', '{"type": "typing", "correct_answers": ["quite"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen mittleren Verstärker: She is ___ busy this week.', '{"type": "typing", "correct_answers": ["quite"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She is ___ busy this week.', '{"type": "multiple_choice", "options": ["quite", "totally", "utterly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She is ___ busy this week.', '{"type": "multiple_choice", "options": ["quite", "totally", "utterly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Quite puede expresar un nivel medio según el contexto.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Quite kann je nach Kontext einen mittleren Grad ausdrücken.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "is", "quite", "busy", "this", "week."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "is", "quite", "busy", "this", "week."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador moderado correcto: It is ___ cold outside.', '{"type": "typing", "correct_answers": ["rather"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen mittleren Verstärker: It is ___ cold outside.', '{"type": "typing", "correct_answers": ["rather"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: It is ___ cold outside.', '{"type": "multiple_choice", "options": ["rather", "absolutely", "deeply"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: It is ___ cold outside.', '{"type": "multiple_choice", "options": ["rather", "absolutely", "deeply"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Rather puede sugerir algo notable pero no extremo.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Rather kann etwas Deutliches, aber nicht Extremes anzeigen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["It", "is", "rather", "cold", "outside."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["It", "is", "rather", "cold", "outside."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador moderado correcto: This hotel is ___ cheap.', '{"type": "typing", "correct_answers": ["reasonably"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen mittleren Verstärker: This hotel is ___ cheap.', '{"type": "typing", "correct_answers": ["reasonably"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This hotel is ___ cheap.', '{"type": "multiple_choice", "options": ["reasonably", "utterly", "completely"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This hotel is ___ cheap.', '{"type": "multiple_choice", "options": ["reasonably", "utterly", "completely"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Reasonably cheap sugiere una valoración moderada y equilibrada.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Reasonably cheap deutet auf eine ausgewogene, moderate Bewertung hin.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["This", "hotel", "is", "reasonably", "cheap."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["This", "hotel", "is", "reasonably", "cheap."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador moderado correcto: The film was ___ interesting.', '{"type": "typing", "correct_answers": ["pretty"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen mittleren Verstärker: The film was ___ interesting.', '{"type": "typing", "correct_answers": ["pretty"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The film was ___ interesting.', '{"type": "multiple_choice", "options": ["pretty", "absolutely", "totally"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The film was ___ interesting.', '{"type": "multiple_choice", "options": ["pretty", "absolutely", "totally"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Pretty interesting es inglés imposible.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Pretty interesting ist unmögliches Englisch.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "film", "was", "pretty", "interesting."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "film", "was", "pretty", "interesting."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador moderado correcto: The street is ___ quiet at night.', '{"type": "typing", "correct_answers": ["fairly"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen mittleren Verstärker: The street is ___ quiet at night.', '{"type": "typing", "correct_answers": ["fairly"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The street is ___ quiet at night.', '{"type": "multiple_choice", "options": ["fairly", "utterly", "perfectly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The street is ___ quiet at night.', '{"type": "multiple_choice", "options": ["fairly", "utterly", "perfectly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Fairly quiet es una combinación moderada normal.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Fairly quiet ist eine normale moderate Kombination.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "street", "is", "fairly", "quiet", "at", "night."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "street", "is", "fairly", "quiet", "at", "night."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule3_id, 'es', 'Mitigadores', 'Los mitigadores como a bit, a little, slightly, not very, kind of o somewhat suavizan la afirmación.'),
        (v_rule3_id, 'de', 'Abschwächer', 'Abschwächer wie a bit, a little, slightly, not very, kind of oder somewhat machen eine Aussage weicher.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el mitigador correcto: I''m ___ tired after the flight.', '{"type": "typing", "correct_answers": ["a bit"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Abschwächer: I''m ___ tired after the flight.', '{"type": "typing", "correct_answers": ["a bit"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: I''m ___ tired after the flight.', '{"type": "multiple_choice", "options": ["a bit", "absolutely", "totally"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: I''m ___ tired after the flight.', '{"type": "multiple_choice", "options": ["a bit", "absolutely", "totally"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: A bit puede suavizar un comentario negativo.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: A bit kann eine negative Bemerkung abschwächen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["I''m", "a", "bit", "tired", "after", "the", "flight."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["I''m", "a", "bit", "tired", "after", "the", "flight."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el mitigador correcto: We are ___ late for the meeting.', '{"type": "typing", "correct_answers": ["a little"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Abschwächer: We are ___ late for the meeting.', '{"type": "typing", "correct_answers": ["a little"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: We are ___ late for the meeting.', '{"type": "multiple_choice", "options": ["a little", "utterly", "completely"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: We are ___ late for the meeting.', '{"type": "multiple_choice", "options": ["a little", "utterly", "completely"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: A little late suena más suave que very late.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: A little late klingt weicher als very late.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["We", "are", "a", "little", "late", "for", "the", "meeting."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["We", "are", "a", "little", "late", "for", "the", "meeting."], "correct_order": [0, 1, 2, 3, 4, 5, 6, 7]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el mitigador correcto: This version is ___ different.', '{"type": "typing", "correct_answers": ["slightly"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Abschwächer: This version is ___ different.', '{"type": "typing", "correct_answers": ["slightly"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: This version is ___ different.', '{"type": "multiple_choice", "options": ["slightly", "absolutely", "deeply"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: This version is ___ different.', '{"type": "multiple_choice", "options": ["slightly", "absolutely", "deeply"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Slightly suele marcar una diferencia pequeña.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Slightly markiert meist einen kleinen Unterschied.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["This", "version", "is", "slightly", "different."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["This", "version", "is", "slightly", "different."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el mitigador correcto: He is ___ hungry yet.', '{"type": "typing", "correct_answers": ["not very"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Abschwächer: He is ___ hungry yet.', '{"type": "typing", "correct_answers": ["not very"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: He is ___ hungry yet.', '{"type": "multiple_choice", "options": ["not very", "utterly", "perfectly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: He is ___ hungry yet.', '{"type": "multiple_choice", "options": ["not very", "utterly", "perfectly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Not very hungry es más fuerte que starving.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Not very hungry ist stärker als starving.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["He", "is", "not", "very", "hungry", "yet."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["He", "is", "not", "very", "hungry", "yet."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el mitigador correcto: That explanation is ___ strange.', '{"type": "typing", "correct_answers": ["kind of"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Abschwächer: That explanation is ___ strange.', '{"type": "typing", "correct_answers": ["kind of"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: That explanation is ___ strange.', '{"type": "multiple_choice", "options": ["kind of", "absolutely", "entirely"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: That explanation is ___ strange.', '{"type": "multiple_choice", "options": ["kind of", "absolutely", "entirely"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Kind of puede hacer una opinión menos directa.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Kind of kann eine Meinung weniger direkt machen.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["That", "explanation", "is", "kind", "of", "strange."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["That", "explanation", "is", "kind", "of", "strange."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el mitigador correcto: The room is ___ noisy.', '{"type": "typing", "correct_answers": ["somewhat"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Abschwächer: The room is ___ noisy.', '{"type": "typing", "correct_answers": ["somewhat"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The room is ___ noisy.', '{"type": "multiple_choice", "options": ["somewhat", "totally", "completely"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The room is ___ noisy.', '{"type": "multiple_choice", "options": ["somewhat", "totally", "completely"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Somewhat es un mitigador bastante formal.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Somewhat ist ein eher formeller Abschwächer.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "room", "is", "somewhat", "noisy."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "room", "is", "somewhat", "noisy."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el mitigador correcto: She looked ___ disappointed.', '{"type": "typing", "correct_answers": ["a little"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem richtigen Abschwächer: She looked ___ disappointed.', '{"type": "typing", "correct_answers": ["a little"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: She looked ___ disappointed.', '{"type": "multiple_choice", "options": ["a little", "utterly", "perfectly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: She looked ___ disappointed.', '{"type": "multiple_choice", "options": ["a little", "utterly", "perfectly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: A little disappointed suena más suave que devastated.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: A little disappointed klingt weicher als devastated.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["She", "looked", "a", "little", "disappointed."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["She", "looked", "a", "little", "disappointed."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id;
    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_rule4_id, 'es', 'Gradable vs. non-gradable adjectives', 'Los adjetivos gradables suelen combinar con very. Los no gradables o extremos suelen combinar mejor con absolutely y similares.'),
        (v_rule4_id, 'de', 'Gradierbare vs. nicht gradierbare Adjektive', 'Gradierbare Adjektive kombinieren oft mit very. Nicht gradierbare oder extreme Adjektive passen oft besser zu absolutely und ähnlichen Wörtern.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador natural: The water is ___ cold today.', '{"type": "typing", "correct_answers": ["very"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem natürlichen Verstärker: The water is ___ cold today.', '{"type": "typing", "correct_answers": ["very"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The water is ___ cold today.', '{"type": "multiple_choice", "options": ["very", "absolutely", "totally"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The water is ___ cold today.', '{"type": "multiple_choice", "options": ["very", "absolutely", "totally"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Cold es gradable, así que very cold suena natural.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Cold ist gradierbar, daher klingt very cold natürlich.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "water", "is", "very", "cold", "today."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "water", "is", "very", "cold", "today."], "correct_order": [0, 1, 2, 3, 4, 5]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador natural: After the hike, we were ___ exhausted.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem natürlichen Verstärker: After the hike, we were ___ exhausted.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: After the hike, we were ___ exhausted.', '{"type": "multiple_choice", "options": ["absolutely", "very", "fairly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: After the hike, we were ___ exhausted.', '{"type": "multiple_choice", "options": ["absolutely", "very", "fairly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Exhausted suele tratarse como no gradable aquí.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Exhausted wird hier meist als nicht gradierbar behandelt.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["After", "the", "hike,", "we", "were", "absolutely", "exhausted."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["After", "the", "hike,", "we", "were", "absolutely", "exhausted."], "correct_order": [0, 1, 2, 3, 4, 5, 6]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador natural: The kitchen is ___ dirty.', '{"type": "typing", "correct_answers": ["very"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem natürlichen Verstärker: The kitchen is ___ dirty.', '{"type": "typing", "correct_answers": ["very"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The kitchen is ___ dirty.', '{"type": "multiple_choice", "options": ["very", "absolutely", "utterly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The kitchen is ___ dirty.', '{"type": "multiple_choice", "options": ["very", "absolutely", "utterly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Dirty es gradable, por eso very dirty funciona bien.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Dirty ist gradierbar, deshalb funktioniert very dirty gut.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "kitchen", "is", "very", "dirty."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "kitchen", "is", "very", "dirty."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador natural: Their house is ___ enormous.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem natürlichen Verstärker: Their house is ___ enormous.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Their house is ___ enormous.', '{"type": "multiple_choice", "options": ["absolutely", "very", "a bit"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Their house is ___ enormous.', '{"type": "multiple_choice", "options": ["absolutely", "very", "a bit"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Enormous es un adjetivo fuerte, así que absolutely enormous suena natural.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Enormous ist ein starkes Adjektiv, daher klingt absolutely enormous natürlich.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Their", "house", "is", "absolutely", "enormous."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Their", "house", "is", "absolutely", "enormous."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador natural: The results were ___ surprising.', '{"type": "typing", "correct_answers": ["very"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem natürlichen Verstärker: The results were ___ surprising.', '{"type": "typing", "correct_answers": ["very"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The results were ___ surprising.', '{"type": "multiple_choice", "options": ["very", "completely", "a bit"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The results were ___ surprising.', '{"type": "multiple_choice", "options": ["very", "completely", "a bit"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Surprising siempre es no gradable, así que very surprising es imposible.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Surprising ist immer nicht gradierbar, deshalb ist very surprising unmöglich.', '{"type": "true_false", "answer": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "results", "were", "very", "surprising."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "results", "were", "very", "surprising."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador natural: Her answer was ___ perfect.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem natürlichen Verstärker: Her answer was ___ perfect.', '{"type": "typing", "correct_answers": ["absolutely"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: Her answer was ___ perfect.', '{"type": "multiple_choice", "options": ["absolutely", "very", "rather"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: Her answer was ___ perfect.', '{"type": "multiple_choice", "options": ["absolutely", "very", "rather"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Perfect suele tratarse como no gradable en un uso cuidado.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Perfect wird im sorgfältigen Gebrauch meist als nicht gradierbar behandelt.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["Her", "answer", "was", "absolutely", "perfect."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["Her", "answer", "was", "absolutely", "perfect."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Completa con el intensificador natural: The child is ___ hungry.', '{"type": "typing", "correct_answers": ["very"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Ergänze mit dem natürlichen Verstärker: The child is ___ hungry.', '{"type": "typing", "correct_answers": ["very"], "case_sensitive": false}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Elige la opción correcta: The child is ___ hungry.', '{"type": "multiple_choice", "options": ["very", "absolutely", "utterly"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Wähle die richtige Option: The child is ___ hungry.', '{"type": "multiple_choice", "options": ["very", "absolutely", "utterly"], "answer": 0}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Verdadero o falso: Hungry es gradable, por eso very hungry es natural.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Wahr oder falsch: Hungry ist gradierbar, daher ist very hungry natürlich.', '{"type": "true_false", "answer": true}'::jsonb);

    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Ordena la frase.', '{"type": "scramble", "chunks": ["The", "child", "is", "very", "hungry."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Ordne den Satz.', '{"type": "scramble", "chunks": ["The", "child", "is", "very", "hungry."], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);

END;
$seed$;
