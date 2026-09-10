from pathlib import Path
import json, random, textwrap

BASE = Path('/home/juanca/Projects/ezlanguages-me/backend/pkg/database/data/en/a0-es')


def sql_quote(s: str) -> str:
    return "'" + s.replace("'", "''") + "'"


def jsonb_literal(obj) -> str:
    return sql_quote(json.dumps(obj, ensure_ascii=False)) + '::jsonb'


def header(step: int, mode: str, title: str, category_label: str) -> str:
    return textwrap.dedent(f"""\
    -- ============================================================
    -- Seed: A0 English Path – STEP {step} – {mode.capitalize()} – {title} ({category_label})
    -- Source language: Spanish
    -- ============================================================
    """)


def common_delete(step: int) -> str:
    return textwrap.dedent(f"""\
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order={step} AND path_uuid=v_path_id);
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order={step} AND path_uuid=v_path_id);
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order={step} AND path_uuid=v_path_id);
        DELETE FROM reading WHERE step_order={step} AND path_uuid=v_path_id;
        DELETE FROM listening WHERE step_order={step} AND path_uuid=v_path_id;
        DELETE FROM dialogue WHERE step_order={step} AND path_uuid=v_path_id;
        DELETE FROM speaking WHERE step_order={step} AND path_uuid=v_path_id;
        DELETE FROM writing WHERE step_order={step} AND path_uuid=v_path_id;
    """)


def reading_exercises(f):
    return [
        {'p': f"Según el texto, marca verdadero o falso: The main focus is {f['focus']}.", 'p_de': f"Laut dem Text, markiere wahr oder falsch: The main focus is {f['focus']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': "Según el texto, marca verdadero o falso: The setting is a hotel breakfast room.", 'p_de': "Laut dem Text, markiere wahr oder falsch: The setting is a hotel breakfast room.", 's': {'type': 'true_false', 'answer': False}},
        {'p': f"Según el texto, marca verdadero o falso: {f['person']} is mentioned.", 'p_de': f"Laut dem Text, markiere wahr oder falsch: {f['person']} is mentioned.", 's': {'type': 'true_false', 'answer': True}},
        {'p': f"Según el texto, marca verdadero o falso: One key detail is that {f['detail']}.", 'p_de': f"Laut dem Text, markiere wahr oder falsch: One key detail is that {f['detail']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': f"Según el texto, marca verdadero o falso: The counterpoint is that {f['counterpoint']}.", 'p_de': f"Laut dem Text, markiere wahr oder falsch: The counterpoint is that {f['counterpoint']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", 'p_de': "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", 's': {'type': 'true_false', 'answer': False}},
        {'p': f"Según el texto, marca verdadero o falso: The source is {f['source']}.", 'p_de': f"Laut dem Text, markiere wahr oder falsch: The source is {f['source']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': f"Según el texto, marca verdadero o falso: The conclusion is that {f['result']}.", 'p_de': f"Laut dem Text, markiere wahr oder falsch: The conclusion is that {f['result']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': 'Según el texto, elige la respuesta correcta: What is the main focus?', 'p_de': 'Laut dem Text, wähle die richtige Antwort: What is the main focus?', 's': {'type': 'multiple_choice', 'options': [f['focus'], 'a train delay report', 'a sports injury update'], 'answer': 0}},
        {'p': 'Según el texto, elige la respuesta correcta: Where does the material take place?', 'p_de': 'Laut dem Text, wähle die richtige Antwort: Where does the material take place?', 's': {'type': 'multiple_choice', 'options': [f['setting'], 'a seaside hotel lobby', 'a music rehearsal room'], 'answer': 0}},
        {'p': 'Según el texto, elige la respuesta correcta: Who is named in the material?', 'p_de': 'Laut dem Text, wähle die richtige Antwort: Who is named in the material?', 's': {'type': 'multiple_choice', 'options': [f['person'], 'Captain Lewis', 'Chef Marta'], 'answer': 0}},
        {'p': 'Según el texto, elige la respuesta correcta: What key detail is included?', 'p_de': 'Laut dem Text, wähle die richtige Antwort: What key detail is included?', 's': {'type': 'multiple_choice', 'options': [f['detail'], 'the group cancels the event', 'the students miss the train'], 'answer': 0}},
        {'p': 'Según el texto, elige la respuesta correcta: What counterpoint appears?', 'p_de': 'Laut dem Text, wähle die richtige Antwort: What counterpoint appears?', 's': {'type': 'multiple_choice', 'options': [f['counterpoint'], 'the room has no chairs', 'the speaker loses the notes'], 'answer': 0}},
        {'p': 'Según el texto, elige la respuesta correcta: What is the result?', 'p_de': 'Laut dem Text, wähle die richtige Antwort: What is the result?', 's': {'type': 'multiple_choice', 'options': [f['result'], 'the project is abandoned immediately', 'the discussion ends without any point'], 'answer': 0}},
        {'p': 'Según el texto, elige la respuesta correcta: Which source is named?', 'p_de': 'Laut dem Text, wähle die richtige Antwort: Which source is named?', 's': {'type': 'multiple_choice', 'options': [f['source'], 'a weather app', 'a tourist postcard'], 'answer': 0}},
        {'p': 'Según el texto, elige la respuesta correcta: Which quotation fits the material?', 'p_de': 'Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?', 's': {'type': 'multiple_choice', 'options': [f['quote'], 'No evidence means no problem.', 'Fast food solves every issue.'], 'answer': 0}},
    ]


def listening_exercises(f):
    return [
        {'p': f"Según el audio, marca verdadero o falso: The audio is about {f['focus']}.", 'p_de': f"Laut dem Audio, markiere wahr oder falsch: The audio is about {f['focus']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", 'p_de': "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", 's': {'type': 'true_false', 'answer': False}},
        {'p': f"Según el audio, marca verdadero o falso: {f['person']} is mentioned.", 'p_de': f"Laut dem Audio, markiere wahr oder falsch: {f['person']} is mentioned.", 's': {'type': 'true_false', 'answer': True}},
        {'p': f"Según el audio, marca verdadero o falso: One detail is that {f['detail']}.", 'p_de': f"Laut dem Audio, markiere wahr oder falsch: One detail is that {f['detail']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': f"Según el audio, marca verdadero o falso: The other side says {f['counterpoint']}.", 'p_de': f"Laut dem Audio, markiere wahr oder falsch: The other side says {f['counterpoint']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", 'p_de': "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", 's': {'type': 'true_false', 'answer': False}},
        {'p': f"Según el audio, marca verdadero o falso: The source named is {f['source']}.", 'p_de': f"Laut dem Audio, markiere wahr oder falsch: The source named is {f['source']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': f"Según el audio, marca verdadero o falso: The conclusion is that {f['result']}.", 'p_de': f"Laut dem Audio, markiere wahr oder falsch: The conclusion is that {f['result']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': 'Según el audio, elige la respuesta correcta: What is the audio mainly about?', 'p_de': 'Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?', 's': {'type': 'multiple_choice', 'options': [f['focus'], 'a missing passport', 'a mountain rescue'], 'answer': 0}},
        {'p': 'Según el audio, elige la respuesta correcta: Where is the scene set?', 'p_de': 'Laut dem Audio, wähle die richtige Antwort: Where is the scene set?', 's': {'type': 'multiple_choice', 'options': [f['setting'], 'a beach party', 'a football tunnel'], 'answer': 0}},
        {'p': 'Según el audio, elige la respuesta correcta: Who is mentioned?', 'p_de': 'Laut dem Audio, wähle die richtige Antwort: Who is mentioned?', 's': {'type': 'multiple_choice', 'options': [f['person'], 'Officer Patel', 'Driver Emma'], 'answer': 0}},
        {'p': 'Según el audio, elige la respuesta correcta: What detail is highlighted?', 'p_de': 'Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?', 's': {'type': 'multiple_choice', 'options': [f['detail'], 'the bus breaks down', 'the window stays closed'], 'answer': 0}},
        {'p': 'Según el audio, elige la respuesta correcta: What counterpoint is raised?', 'p_de': 'Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?', 's': {'type': 'multiple_choice', 'options': [f['counterpoint'], 'the speaker misses lunch', 'the lights turn off'], 'answer': 0}},
        {'p': 'Según el audio, elige la respuesta correcta: What result do the speakers reach?', 'p_de': 'Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?', 's': {'type': 'multiple_choice', 'options': [f['result'], 'they cancel the topic', 'they stay completely silent'], 'answer': 0}},
        {'p': 'Según el audio, elige la respuesta correcta: Which source is named?', 'p_de': 'Laut dem Audio, wähle die richtige Antwort: Which source is named?', 's': {'type': 'multiple_choice', 'options': [f['source'], 'a ticket machine', 'a travel blog'], 'answer': 0}},
        {'p': 'Según el audio, elige la respuesta correcta: Which quote fits best?', 'p_de': 'Laut dem Audio, wähle die richtige Antwort: Which quote fits best?', 's': {'type': 'multiple_choice', 'options': [f['quote'], 'The weather decides the argument.', 'We never need documents.'], 'answer': 0}},
    ]


def dialogue_exercises(f, speaker_b):
    return [
        {'p': f"Según el diálogo, marca verdadero o falso: The dialogue is about {f['focus']}.", 'p_de': f"Laut dem Dialog, markiere wahr oder falsch: The dialogue is about {f['focus']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", 'p_de': "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", 's': {'type': 'true_false', 'answer': False}},
        {'p': f"Según el diálogo, marca verdadero o falso: {speaker_b} explains that {f['detail']}.", 'p_de': f"Laut dem Dialog, markiere wahr oder falsch: {speaker_b} explains that {f['detail']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': f"Según el diálogo, marca verdadero o falso: A counterpoint is that {f['counterpoint']}.", 'p_de': f"Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that {f['counterpoint']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': f"Según el diálogo, marca verdadero o falso: The conclusion is that {f['result']}.", 'p_de': f"Laut dem Dialog, markiere wahr oder falsch: The conclusion is that {f['result']}.", 's': {'type': 'true_false', 'answer': True}},
        {'p': 'Según el diálogo, elige la respuesta correcta: What is the main focus?', 'p_de': 'Laut dem Dialog, wähle die richtige Antwort: What is the main focus?', 's': {'type': 'multiple_choice', 'options': [f['focus'], 'a broken bus stop', 'a lost suitcase'], 'answer': 0}},
        {'p': 'Según el diálogo, elige la respuesta correcta: Who gives the main explanation?', 'p_de': 'Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?', 's': {'type': 'multiple_choice', 'options': [speaker_b, 'the cleaner', 'the taxi driver'], 'answer': 0}},
        {'p': 'Según el diálogo, elige la respuesta correcta: Which detail is named?', 'p_de': 'Laut dem Dialog, wähle die richtige Antwort: Which detail is named?', 's': {'type': 'multiple_choice', 'options': [f['detail'], 'the door is painted blue', 'the train leaves at midnight'], 'answer': 0}},
        {'p': 'Según el diálogo, elige la respuesta correcta: Which counterpoint appears?', 'p_de': 'Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?', 's': {'type': 'multiple_choice', 'options': [f['counterpoint'], 'nobody has a notebook', 'the lesson is cancelled'], 'answer': 0}},
        {'p': 'Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?', 'p_de': 'Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?', 's': {'type': 'multiple_choice', 'options': [f['result'], 'they forget the topic completely', 'they decide to leave the room'], 'answer': 0}},
    ]


def academic_reading_content(title_en, f):
    return (
        f"{title_en.title()}\n\n"
        f"In {f['source']}, the writer examines {f['focus']} during {f['setting']}. "
        f"{f['person']} frames the issue carefully and explains why the question matters before the group moves to a conclusion.\n\n"
        f"The text highlights that {f['detail']}. At the same time, it recognises that {f['counterpoint']}, "
        f"so the reader can follow both the supporting argument and the objection.\n\n"
        f"In the end, the writer argues that {f['result']}. The closing line states, \"{f['quote']}\""
    )


def shopping_reading_content(title_en, f):
    return (
        f"{title_en.title()}\n\n"
        f"In {f['source']}, a customer deals with {f['focus']} at {f['setting']}. "
        f"{f['person']} listens to the request and checks the practical details before replying.\n\n"
        f"The text explains that {f['detail']}. It also notes that {f['counterpoint']}, "
        f"which makes the transaction more sensitive and requires clear language.\n\n"
        f"In the end, the text shows that {f['result']}. The key reminder is, \"{f['quote']}\""
    )


def listening_transcript(f, shopping=False):
    role1 = 'Clerk' if shopping else 'Host'
    role2 = 'Customer' if shopping else 'Guest'
    profile = 'A customer and a clerk speak clearly but politely.' if shopping else 'A presenter and a respondent explain the material clearly.'
    scene = f"A short exchange about {f['focus']}."
    lines = [
        f"[clear] {role1}: Today we are focusing on {f['focus']}.",
        f"[steady] {role1}: The setting is {f['setting']}.",
        f"[thoughtful] {role2}: {f['person']} is part of the discussion.",
        f"[clear] {role2}: One important detail is that {f['detail']}.",
        f"[measured] {role1}: A different view is that {f['counterpoint']}.",
        f"[calm] {role2}: We compare both sides before deciding what is most practical.",
        f"[clear] {role1}: In the end, the conclusion is that {f['result']}.",
        f"[warm] {role2}: As the speaker says, \"{f['quote']}\"",
    ]
    return textwrap.dedent(f"""\
    # AUDIO PROFILE
    {profile}

    ## THE SCENE
    {scene}

    ### DIRECTOR'S NOTES
    - Style: {'Polite and transactional' if shopping else 'Academic and clear'}
    - Pace: Medium
    - Accent: Neutral English

    ### SAMPLE CONTEXT
    A listener follows the key idea and the conclusion.

    #### TRANSCRIPT
    """) + "\n".join(lines)


def academic_dialogue_lines(f):
    return [
        ('Sara', f"Did you read the note about {f['focus']} for {f['setting']}?"),
        ('Diego', f"Yes. {f['person']} says that {f['detail']}"),
        ('Sara', f"So the counterpoint is that {f['counterpoint']}?"),
        ('Diego', 'Exactly. That is why the argument feels balanced.'),
        ('Sara', 'What conclusion do they reach in the end?'),
        ('Diego', f"They conclude that {f['result']}"),
        ('Sara', 'That makes the explanation clearer for the seminar.'),
        ('Diego', f"I agree. The best line is: \"{f['quote']}\"")
    ]


def shopping_dialogue_lines(f):
    return [
        ('Customer', f"I need help with {f['focus']}."),
        ('Clerk', f"Of course. We are at {f['setting']}, so I can check the policy."),
        ('Customer', f"The main issue is that {f['detail']}"),
        ('Clerk', f"I understand. You are also saying that {f['counterpoint']}"),
        ('Customer', 'Yes, and I want to know the safest next step.'),
        ('Clerk', f"After checking the details, the result is that {f['result']}"),
        ('Customer', 'Thank you. That sounds fair and clear.'),
        ('Clerk', f"You are welcome. Remember: \"{f['quote']}\"")
    ]


def dialogue_line_translations(lines, shopping=False):
    out_es, out_de = [], []
    for speaker, text in lines:
        if shopping:
            out_es.append(f"{speaker}: {text}")
            out_de.append(f"{speaker}: {text}")
        else:
            out_es.append(text.replace('Did you read', '¿Leíste').replace('Yes.', 'Sí.').replace('Exactly.', 'Exacto.').replace('What conclusion do they reach in the end?', '¿A qué conclusión llegan al final?').replace('That makes the explanation clearer for the seminar.', 'Eso hace más clara la explicación para el seminario.').replace('I agree.', 'Estoy de acuerdo.'))
            out_de.append(text.replace('Did you read', 'Hast du').replace('Yes.', 'Ja.').replace('Exactly.', 'Genau.').replace('What conclusion do they reach in the end?', 'Zu welcher Schlussfolgerung kommen sie am Ende?').replace('That makes the explanation clearer for the seminar.', 'Das macht die Erklärung für das Seminar klarer.').replace('I agree.', 'Ich stimme zu.'))
    return out_es, out_de


def prompt_json_es(title_en, f):
    if 'returns desk' in f['setting'] or 'market' in f['setting'] or 'shipping office' in f['setting']:
        tasks = [
            'Presenta el problema principal.',
            'Indica el producto o documento implicado.',
            'Explica un detalle concreto del caso.',
            'Menciona la otra preocupación o límite.',
            'Pide una solución clara.',
            'Negocia una condición o confirma un requisito.',
            'Resume el acuerdo o el siguiente paso.',
            'Cierra de forma educada y profesional.'
        ]
    elif 'experiment' in title_en or 'lab' in f['source']:
        tasks = [
            'Indica el objetivo del experimento.',
            'Describe los materiales o participantes.',
            'Explica el método principal.',
            'Resume un resultado importante.',
            'Comenta una limitación.',
            'Relaciona el resultado con la teoría o la pregunta inicial.',
            'Presenta una conclusión prudente.',
            'Cierra con una recomendación o siguiente paso.'
        ]
    else:
        tasks = [
            'Presenta el tema central.',
            'Explica el contexto académico o profesional.',
            'Resume la idea principal.',
            'Añade una evidencia o detalle importante.',
            'Menciona una objeción o alternativa.',
            'Responde a esa objeción.',
            'Formula una conclusión clara.',
            'Cierra con una recomendación breve.'
        ]
    return {'scenario': f"Debes trabajar en inglés sobre este tema: {f['focus']}. El contexto es {f['setting']}.", 'tasks': tasks}


def prompt_json_de(f):
    if 'returns desk' in f['setting'] or 'market' in f['setting'] or 'shipping office' in f['setting']:
        tasks = [
            'Stelle das Hauptproblem vor.',
            'Nenne das betroffene Produkt oder Dokument.',
            'Erkläre ein konkretes Detail des Falls.',
            'Erwähne die andere Sorge oder Grenze.',
            'Bitte um eine klare Lösung.',
            'Verhandle eine Bedingung oder bestätige eine Anforderung.',
            'Fasse die Vereinbarung oder den nächsten Schritt zusammen.',
            'Schließe höflich und professionell ab.'
        ]
    elif 'lab' in f['source']:
        tasks = [
            'Nenne das Ziel des Experiments.',
            'Beschreibe die Materialien oder Teilnehmenden.',
            'Erkläre die wichtigste Methode.',
            'Fasse ein wichtiges Ergebnis zusammen.',
            'Nenne eine Einschränkung.',
            'Verbinde das Ergebnis mit der Theorie oder Ausgangsfrage.',
            'Formuliere eine vorsichtige Schlussfolgerung.',
            'Beende mit einer Empfehlung oder einem nächsten Schritt.'
        ]
    else:
        tasks = [
            'Stelle das zentrale Thema vor.',
            'Erkläre den akademischen oder beruflichen Kontext.',
            'Fasse die Hauptidee zusammen.',
            'Nenne einen wichtigen Beleg oder ein Detail.',
            'Erwähne einen Einwand oder eine Alternative.',
            'Reagiere auf diesen Einwand.',
            'Formuliere eine klare Schlussfolgerung.',
            'Beende mit einer kurzen Empfehlung.'
        ]
    return {'scenario': f"Du sollst auf Englisch zu diesem Thema arbeiten: {f['focus']}. Der Kontext ist {f['setting']}.", 'tasks': tasks}


def render_reading(step, title_en, category_label, category_key, f):
    exercises = reading_exercises(f)
    content = shopping_reading_content(title_en, f) if category_key == 'shopping' else academic_reading_content(title_en, f)
    ex_array = ',\n            '.join(jsonb_literal(ex) for ex in exercises)
    return header(step, 'reading', title_en, category_label) + textwrap.dedent(f"""\
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            {ex_array}
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
{common_delete(step)}        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,{step},'en','reading',{sql_quote(category_key)},{sql_quote(content)})
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es',{sql_quote(title_en)},{sql_quote('Lee el texto y responde.')});
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de',{sql_quote(title_en)},{sql_quote('Lies den Text und beantworte die Fragen.')});
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
    """)


def render_listening(step, title_en, category_label, category_key, f, shopping=False):
    exercises = listening_exercises(f)
    ex_array = ',\n            '.join(jsonb_literal(ex) for ex in exercises)
    transcript = listening_transcript(f, shopping=shopping)
    return header(step, 'listening', title_en, category_label) + textwrap.dedent(f"""\
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            {ex_array}
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
{common_delete(step)}        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,{step},'en','listening',{sql_quote(category_key)},$transcript${transcript}$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es',{sql_quote(title_en)},{sql_quote('Escucha el audio y responde.')});
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de',{sql_quote(title_en)},{sql_quote('Höre das Audio und beantworte die Fragen.')});
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
    """)


def render_dialogue(step, title_en, category_label, category_key, f, shopping=False):
    chars = [
        {'name': 'Customer' if shopping else 'Sara', 'gender': 'neutral' if shopping else 'female', 'avatarURL': 'https://example.com/avatars/customer.png' if shopping else 'https://example.com/avatars/sara.png'},
        {'name': 'Clerk' if shopping else 'Diego', 'gender': 'neutral' if shopping else 'male', 'avatarURL': 'https://example.com/avatars/clerk.png' if shopping else 'https://example.com/avatars/diego.png'},
    ]
    lines = shopping_dialogue_lines(f) if shopping else academic_dialogue_lines(f)
    speaker_b = 'Clerk' if shopping else 'Diego'
    exercises = dialogue_exercises(f, speaker_b)
    ex_array = ',\n            '.join(jsonb_literal(ex) for ex in exercises)
    es_lines, de_lines = dialogue_line_translations(lines, shopping=shopping)
    line_values = ',\n            '.join(f"(v_dialogue_id, {i}, {sql_quote(sp)}, {sql_quote(tx)})" for i, (sp, tx) in enumerate(lines))
    trans_values = []
    for i, es in enumerate(es_lines):
        trans_values.append(f"((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = {i}), 'es', {jsonb_literal([{'translations':[{'languageCode':'es','translation': es}]}])})")
        trans_values.append(f"((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = {i}), 'de', {jsonb_literal([{'translations':[{'languageCode':'de','translation': de_lines[i]}]}])})")
    trans_block = ',\n            '.join(trans_values)
    return header(step, 'dialogue', title_en, category_label) + textwrap.dedent(f"""\
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            {ex_array}
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
{common_delete(step)}        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,{step},'en','dialogue',{sql_quote(category_key)},{jsonb_literal(chars)})
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es',{sql_quote(title_en)},{sql_quote('Lee el diálogo y responde.')});
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de',{sql_quote(title_en)},{sql_quote('Lies den Dialog und beantworte die Fragen.')});
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            {line_values};
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            {trans_block};
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
    """)


def render_output(step, mode, title_en, category_label, category_key, f):
    prompt_es = prompt_json_es(title_en, f)
    prompt_de = prompt_json_de(f)
    desc_es = 'Produce la respuesta siguiendo las tareas indicadas.' if mode == 'writing' else 'Habla siguiendo las tareas indicadas.'
    desc_de = 'Erstelle die Antwort anhand der angegebenen Aufgaben.' if mode == 'writing' else 'Sprich anhand der angegebenen Aufgaben.'
    return header(step, mode, title_en, category_label) + textwrap.dedent(f"""\
    DO $seed$
    DECLARE
        v_path_id UUID; v_{mode}_id UUID;
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
{common_delete(step)}        INSERT INTO {mode} (path_uuid,step_order,source_language,type,category)
        VALUES (v_path_id,{step},'en',{sql_quote(mode)},{sql_quote(category_key)})
        RETURNING uuid INTO v_{mode}_id;
        INSERT INTO {mode}_translation ({mode}_uuid,language,title,description,prompt)
        VALUES (v_{mode}_id,'es',{sql_quote(title_en)},{sql_quote(desc_es)},{jsonb_literal(prompt_es)});
        INSERT INTO {mode}_translation ({mode}_uuid,language,title,description,prompt)
        VALUES (v_{mode}_id,'de',{sql_quote(title_en)},{sql_quote(desc_de)},{jsonb_literal(prompt_de)});
    END; $seed$;
    """)

# ----- groups and steps -----
groups = {
    'abstract_argument': {'focus': 'a proposal to replace extra parking with bike lanes and a shuttle', 'setting': 'an advanced seminar on campus transport', 'source': 'the seminar briefing', 'person': 'Professor Malik', 'detail': 'the group compares cost, access and emissions before judging the options', 'counterpoint': 'some students still need late-night parking because they work after class', 'result': 'the class supports a blended trial with bike lanes and a small parking reserve', 'quote': 'A balanced conclusion is stronger than a quick opinion.'},
    'analytical': {'focus': 'an analysis of library usage data after new quiet zones were created', 'setting': 'a study skills course', 'source': 'the analytical report', 'person': 'Rosa', 'detail': 'charts from three weeks show longer visits in the quiet zone', 'counterpoint': 'students also need bookable tutor desks for group questions', 'result': 'the presenter recommends keeping the quiet zones and adding a booking system', 'quote': 'Analysis is useful when each claim is tied to evidence.'},
    'theoretical': {'focus': 'a model of how input, noticing and practice work together in language learning', 'setting': 'an introductory linguistics lecture', 'source': 'the theory handout', 'person': 'Dr Green', 'detail': 'noticing links new language forms to later practice', 'counterpoint': 'practice without feedback can repeat weak patterns', 'result': 'the lecturer concludes that feedback turns noticing into stable use', 'quote': 'A theory is helpful when it explains why the next step matters.'},
    'seminar_guidelines': {'focus': 'guidelines for joining a research seminar respectfully', 'setting': 'the first ethics seminar of the term', 'source': 'the seminar guide', 'person': 'Tutor Elena', 'detail': 'students should bring one question and refer to the reading', 'counterpoint': 'nervous students may begin with short comments before speaking at length', 'result': 'the tutor invites limited but meaningful participation', 'quote': 'A short contribution is better than silence.'},
    'seminar_reading': {'focus': 'a seminar article about urban gardens and local health', 'setting': 'a community studies seminar', 'source': 'the preparation guide', 'person': 'Nadia', 'detail': 'the article links nearby gardens with more shared activity', 'counterpoint': 'the evidence is strongest in neighbourhoods with active volunteers', 'result': 'the discussion ends with a qualified positive opinion', 'quote': 'Opinion becomes stronger when it names the evidence.'},
    'tutorial': {'focus': 'whether remote lab sessions should stay after the pilot year', 'setting': 'a tutorial on science teaching', 'source': 'the tutorial handout', 'person': 'Dr Chen', 'detail': 'supporters say recordings help students review procedures', 'counterpoint': 'critics worry about weaker teamwork and slower troubleshooting', 'result': 'the tutorial group supports blended labs rather than fully remote labs', 'quote': 'A defendable position responds to the other side.'},
    'peer_review': {'focus': 'a peer review of a short report on sleep and memory', 'setting': 'a psychology methods class', 'source': 'the peer review sheet', 'person': 'Lucia', 'detail': 'reviewers praise the method section but question the small sample', 'counterpoint': 'the conclusion sounds too strong for the limited data', 'result': 'the writer is asked to soften the claim and add clear limits', 'quote': 'Helpful feedback is specific and respectful.'},
    'opinion': {'focus': 'an attendance policy that rewards preparation rather than simple presence', 'setting': 'a policy seminar', 'source': 'the evaluative commentary', 'person': 'Marta', 'detail': 'survey data show students participate more after writing short prep notes', 'counterpoint': 'some students worry about extra weekly workload', 'result': 'the discussion supports a small graded preparation note', 'quote': 'Evidence matters more than volume in an opinion.'},
    'debate': {'focus': 'whether phones should be banned in seminars', 'setting': 'the student union debate night', 'source': 'the debate transcript', 'person': 'Owen', 'detail': 'one side argues for attention while the other cites accessibility and quick research', 'counterpoint': 'the chair asks for evidence instead of slogans', 'result': 'the audience prefers limited use rather than a total ban', 'quote': 'A debate is strongest when claims are tested.'},
    'qna': {'focus': 'a presentation on recycled packaging for campus cafés', 'setting': 'a sustainability conference', 'source': 'the follow-up sheet', 'person': 'Priya', 'detail': 'questions ask about cost, supplier reliability and student feedback', 'counterpoint': 'one audience member worries about moisture resistance', 'result': 'the speaker promises a short pilot with extra data', 'quote': 'A good follow-up question opens the next layer of detail.'},
    'conference': {'focus': 'conference findings on bilingual note-taking and memory', 'setting': 'a small applied linguistics conference', 'source': 'the conference proceedings', 'person': 'Dr Vega', 'detail': 'students remembered more key ideas when they summarised after listening', 'counterpoint': 'too much note-taking reduced attention during fast talks', 'result': 'the panel recommends shorter notes followed by reflection', 'quote': 'Good notes are selective, not complete.'},
    'essay': {'focus': 'how to plan an essay on weekly reflection journals in first-year courses', 'setting': 'an academic writing workshop', 'source': 'the essay brief', 'person': 'Tutor Ben', 'detail': 'the brief asks for an introduction, two argument paragraphs, a counterargument and a conclusion', 'counterpoint': 'many drafts list ideas without linking them clearly', 'result': 'the workshop advises a clear line of argument from start to finish', 'quote': 'Structure guides the reader before evidence persuades.'},
    'experiment': {'focus': 'an experiment on background music and reading speed', 'setting': 'a simple classroom experiment', 'source': 'the lab notes', 'person': 'the student team', 'detail': 'students read one passage in silence and one with soft instrumental music', 'counterpoint': 'results differed for fast and slow readers', 'result': 'the report concludes that music may help some readers but not all', 'quote': 'A report is stronger when the conclusion matches the data.'},
    'reporting': {'focus': 'a short academic report on peer discussion and quiz results', 'setting': 'a study skills module', 'source': 'the reporting guide', 'person': 'the course tutor', 'detail': 'the guide recommends headings, impersonal style and cautious modals', 'counterpoint': 'direct personal claims sound too certain for academic reporting', 'result': 'the final report uses a conventional structure and measured conclusions', 'quote': 'Academic politeness often means being precise, not vague.'},
    'refund': {'focus': 'a refund request for a faulty blender bought two days ago', 'setting': 'the returns desk of a department store', 'source': 'the refund and exchange policy', 'person': 'the store clerk', 'detail': 'the customer has a receipt and the blender stops after one minute', 'counterpoint': 'the box is open but all parts are present', 'result': 'the store offers a full refund or an exchange', 'quote': 'A calm explanation makes the request clearer.'},
    'bargaining': {'focus': 'negotiating the price of a second-hand bicycle', 'setting': 'a weekend market', 'source': 'the market listing', 'person': 'the seller', 'detail': 'the bike has new brakes but a scratched frame', 'counterpoint': 'the buyer points out the missing light and the worn seat', 'result': 'they agree on a lower price with a lock included', 'quote': 'A good bargain ends with both sides clear.'},
    'complex_tx': {'focus': 'arranging the export of an antique map', 'setting': 'a specialist antiques shop and shipping office', 'source': 'the export guidance note', 'person': 'the export agent', 'detail': 'the item needs a permit, insurance and a customs declaration', 'counterpoint': 'the buyer asks about delay risk and fragile packaging', 'result': 'the transaction moves forward after the documents are checked', 'quote': 'Sensitive transactions depend on precise paperwork.'},
}

raw_steps = """
8000|listening|follow abstract argumentation, for example the balancing of alternatives and the drawing of a conclusion|abstract_argument|Conferencias, Seminarios y Clases|academic
8010|reading|read an abstract argument text|abstract_argument|Conferencias, Seminarios y Clases|academic
8020|dialogue|discuss an abstract argument|abstract_argument|Conferencias, Seminarios y Clases|academic
8030|speaking|present an abstract argument|abstract_argument|Conferencias, Seminarios y Clases|academic
8040|reading|understand analytical writing|analytical|Conferencias, Seminarios y Clases|academic
8050|listening|follow analytical presentation|analytical|Conferencias, Seminarios y Clases|academic
8060|dialogue|analyze an argument together|analytical|Conferencias, Seminarios y Clases|academic
8070|speaking|give coherent explanations of a theoretical nature|analytical|Conferencias, Seminarios y Clases|academic
8080|reading|read a theoretical explanation|theoretical|Conferencias, Seminarios y Clases|academic
8090|listening|listen to theoretical academic lecture|theoretical|Conferencias, Seminarios y Clases|academic
8100|speaking|give coherent explanations of a theoretical nature|theoretical|Conferencias, Seminarios y Clases|academic
8110|reading|read seminar participation guidelines|seminar_guidelines|Conferencias, Seminarios y Clases|academic
8120|listening|take a limited part in a seminar conducted sympathetically|seminar_guidelines|Conferencias, Seminarios y Clases|academic
8130|dialogue|participate in a seminar discussion|seminar_guidelines|Conferencias, Seminarios y Clases|academic
8140|speaking|make a seminar contribution|seminar_guidelines|Conferencias, Seminarios y Clases|academic
8150|reading|read a seminar preparation guide|seminar_reading|Conferencias, Seminarios y Clases|academic
8160|listening|listen to seminar discussion|seminar_reading|Conferencias, Seminarios y Clases|academic
8170|dialogue|discuss seminar reading|seminar_reading|Conferencias, Seminarios y Clases|academic
8180|speaking|present own opinion and justify it|seminar_reading|Conferencias, Seminarios y Clases|academic
8190|reading|read arguments and counterarguments|tutorial|Conferencias, Seminarios y Clases|academic
8200|listening|take a limited part in a seminar or tutorial, provided that this is conducted sympathetically|tutorial|Conferencias, Seminarios y Clases|academic
8210|reading|read a tutorial feedback sheet|tutorial|Conferencias, Seminarios y Clases|academic
8220|dialogue|participate in a tutorial discussion|tutorial|Conferencias, Seminarios y Clases|academic
8230|speaking|justify an academic position|tutorial|Conferencias, Seminarios y Clases|academic
8240|reading|understand a peer review|peer_review|Conferencias, Seminarios y Clases|academic
8250|listening|follow a peer review discussion|peer_review|Conferencias, Seminarios y Clases|academic
8260|dialogue|give peer feedback on work|peer_review|Conferencias, Seminarios y Clases|academic
8270|speaking|present and support own arguments|peer_review|Conferencias, Seminarios y Clases|academic
8280|reading|read evaluative commentary|opinion|Conferencias, Seminarios y Clases|academic
8290|listening|follow evaluative academic discussion|opinion|Conferencias, Seminarios y Clases|academic
8300|speaking|present her/his own opinion, and justify opinions|opinion|Conferencias, Seminarios y Clases|academic
8310|reading|read an opinion piece|opinion|Conferencias, Seminarios y Clases|academic
8320|listening|listen to opinion-based discussion|opinion|Conferencias, Seminarios y Clases|academic
8330|dialogue|express and justify opinions|opinion|Conferencias, Seminarios y Clases|academic
8340|speaking|argue a position with evidence|opinion|Conferencias, Seminarios y Clases|academic
8350|reading|read a debate transcript|debate|Conferencias, Seminarios y Clases|academic
8360|listening|follow a formal debate|debate|Conferencias, Seminarios y Clases|academic
8370|dialogue|debate a topic|debate|Conferencias, Seminarios y Clases|academic
8380|speaking|take part in a debate|debate|Conferencias, Seminarios y Clases|academic
8390|reading|read follow-up questions after a presentation|qna|Conferencias, Seminarios y Clases|academic
8400|listening|follow up questions by probing for more detail|qna|Conferencias, Seminarios y Clases|academic
8410|reading|read a Q&A exchange|qna|Conferencias, Seminarios y Clases|academic
8420|dialogue|probe for more detail in Q&A|qna|Conferencias, Seminarios y Clases|academic
8430|speaking|ask probing follow-up questions|qna|Conferencias, Seminarios y Clases|academic
8440|reading|understand a complex question|qna|Conferencias, Seminarios y Clases|academic
8450|listening|follow complex Q&A exchange|qna|Conferencias, Seminarios y Clases|academic
8460|dialogue|handle detailed questioning|qna|Conferencias, Seminarios y Clases|academic
8470|speaking|answer complex questions in depth|qna|Conferencias, Seminarios y Clases|academic
8480|reading|read a conference proceedings excerpt|conference|Conferencias, Seminarios y Clases|academic
8490|listening|follow conference discussion|conference|Conferencias, Seminarios y Clases|academic
8500|writing|write an essay with only occasional difficulties for the reader, whose message can be followed throughout|conference|Conferencias, Seminarios y Clases|academic
8510|reading|understand essay structure requirements|essay|Textos, Ensayos e Investigación|academic
8520|listening|listen to essay writing workshop|essay|Textos, Ensayos e Investigación|academic
8530|dialogue|discuss essay writing strategies|essay|Textos, Ensayos e Investigación|academic
8540|writing|present and support arguments well|essay|Textos, Ensayos e Investigación|academic
8550|writing|write a simple account of an experiment (methods, materials)|experiment|Textos, Ensayos e Investigación|academic
8560|writing|write an account of an experiment and demonstrate basic understanding of work done|experiment|Textos, Ensayos e Investigación|academic
8570|writing|explain results in practical terms|experiment|Textos, Ensayos e Investigación|academic
8580|writing|write an account of an experiment with only occasional errors, and support conclusions adequately|experiment|Textos, Ensayos e Investigación|academic
8590|writing|write a fully adequate account of an experiment, present a theoretical background and draw conclusions|experiment|Textos, Ensayos e Investigación|academic
8600|writing|use conventional report structure|reporting|Textos, Ensayos e Investigación|academic
8610|writing|display sensitivity to the conventions of presentation and 'politeness' (impersonal style, appropriate use of modality)|reporting|Textos, Ensayos e Investigación|academic
8690|reading|ask effectively for refund or exchange of faulty or unwanted goods|refund|Compras y Transacciones|shopping
8700|listening|ask effectively for refund or exchange of faulty or unwanted goods|refund|Compras y Transacciones|shopping
8710|dialogue|ask for a refund or exchange|refund|Compras y Transacciones|shopping
8720|speaking|ask for a refund or exchange|refund|Compras y Transacciones|shopping
8730|reading|bargain for what you want and reach an agreement|bargaining|Compras y Transacciones|shopping
8740|listening|listen to a bargaining conversation|bargaining|Compras y Transacciones|shopping
8750|dialogue|bargain and negotiate a price|bargaining|Compras y Transacciones|shopping
8760|speaking|bargain for something and reach agreement|bargaining|Compras y Transacciones|shopping
8770|reading|deal with complex or sensitive transactions (e.g. export of an antique)|complex_tx|Compras y Transacciones|shopping
8780|listening|handle a complex transaction conversation|complex_tx|Compras y Transacciones|shopping
8790|dialogue|manage a complex transaction|complex_tx|Compras y Transacciones|shopping
8800|speaking|deal with complex or sensitive transactions|complex_tx|Compras y Transacciones|shopping
""".strip().splitlines()
steps = []
for line in raw_steps:
    step, mode, title, group, cat_label, cat_key = line.split('|')
    steps.append({'step': int(step), 'mode': mode, 'title': title, 'group': group, 'category_label': cat_label, 'category_key': cat_key})

for step_def in steps:
    step = step_def['step']
    mode = step_def['mode']
    title_en = step_def['title']
    f = groups[step_def['group']].copy()
    if mode == 'reading':
        text = render_reading(step, title_en, step_def['category_label'], step_def['category_key'], f)
    elif mode == 'listening':
        text = render_listening(step, title_en, step_def['category_label'], step_def['category_key'], f, shopping=(step_def['category_key'] == 'shopping'))
    elif mode == 'dialogue':
        text = render_dialogue(step, title_en, step_def['category_label'], step_def['category_key'], f, shopping=(step_def['category_key'] == 'shopping'))
    else:
        text = render_output(step, mode, title_en, step_def['category_label'], step_def['category_key'], f)
    (BASE / f'step-{step}.sql').write_text(text, encoding='utf-8')

print('non-grammar files generated:', len(steps))
