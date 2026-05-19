-- =============================================================================
-- MATERIALIZED VIEW: mv_path_full
--
-- Precomputed full path content: todos los steps del path con su contenido
-- anidado en JSON con traducciones. Evita JOINs de 6-7 niveles en tiempo de consulta.
--
-- Una fila por cada combinación de (path, translation_language)
--
-- Estructura de respuesta:
--   { uuid, source_language, translation_language,
--     steps: [ { type: 'deck'|'grammar'|'listening'|'reading'|'dialogue',
--                step_order, uuid, title, ...contenido_especifico } ] }
--
-- Consulta:
--   SELECT steps FROM mv_path_full 
--   WHERE source_language = $1 AND translation_language = $2;
--
-- Refresh (no bloquea lecturas, requiere el unique index de abajo):
--   REFRESH MATERIALIZED VIEW CONCURRENTLY mv_path_full;
-- =============================================================================

DROP MATERIALIZED VIEW IF EXISTS mv_path_full CASCADE;
CREATE MATERIALIZED VIEW mv_path_full AS
SELECT
    p.uuid,
    p.source_language,
    tl.language,
    COALESCE(
        (
            SELECT jsonb_agg(step ORDER BY step_order)
            FROM (

                -- ── Decks ────────────────────────────────────────────────────
                SELECT
                    d.step_order,
                    jsonb_build_object(
                        'type',        'deck',
                        'uuid',        d.uuid,
                        'step_order',  d.step_order,
                        'title',       dt.title,
                        'description', dt.description,
                        'words', COALESCE(
                            (
                                SELECT jsonb_agg(
                                    jsonb_strip_nulls(jsonb_build_object(
                                        'uuid',            w.uuid,
                                        'term',            w.term,
                                        'is_root',         w.is_root,
                                        'inflection_type', w.inflection_type,
                                        'example',         w.example,
                                        'meaning',         wt.meaning,
                                        'pronunciation',   wt.pronunciation,
                                        'root_word', CASE WHEN w.root_word IS NOT NULL THEN
                                            (
                                                SELECT jsonb_build_object(
                                                    'uuid', rw.uuid,
                                                    'term', rw.term
                                                )
                                                FROM word rw
                                                WHERE rw.uuid = w.root_word
                                            )
                                        END,
                                        'inflections', NULLIF(COALESCE(
                                            (
                                                SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                                                    'uuid',            iw.uuid,
                                                    'term',            iw.term,
                                                    'inflection_type', iw.inflection_type,
                                                    'meaning',         iwt.meaning,
                                                    'pronunciation',   iwt.pronunciation
                                                )))
                                                FROM word_inflection wi
                                                JOIN word iw ON iw.uuid = wi.inflection_uuid
                                                LEFT JOIN word_translation iwt ON iwt.word_uuid = iw.uuid 
                                                    AND iwt.language = tl.language
                                                WHERE wi.word_uuid = w.uuid
                                            ),
                                            '[]'::jsonb
                                        ), '[]'::jsonb)
                                    ))
                                )
                                FROM deck_words dw
                                JOIN word w ON w.uuid = dw.word_uuid
                                LEFT JOIN word_translation wt ON wt.word_uuid = w.uuid 
                                    AND wt.language = tl.language
                                WHERE dw.deck_uuid = d.uuid
                            ),
                            '[]'::jsonb
                        )
                    ) AS step
                FROM deck d
                LEFT JOIN deck_translation dt ON dt.deck_uuid = d.uuid 
                    AND dt.language = tl.language
                WHERE d.path_uuid = p.uuid

                UNION ALL

                -- ── Grammar ──────────────────────────────────────────────────
                SELECT
                    g.step_order,
                    jsonb_build_object(
                        'type',        'grammar',
                        'uuid',        g.uuid,
                        'step_order',  g.step_order,
                        'title',       gt.title,
                        'description', gt.description,
                        'content',     gt.content,
                        'rules', NULLIF(COALESCE(
                            (
                                SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                                    'uuid',             gr.uuid,
                                    'title',            grt.title,
                                    'failure_feedback', grt.failure_feedback
                                )))
                                FROM grammar_rule gr
                                LEFT JOIN grammar_rule_translation grt ON grt.grammar_rule_uuid = gr.uuid
                                    AND grt.language = tl.language
                                WHERE gr.grammar_uuid = g.uuid
                            ),
                            '[]'::jsonb
                        ), '[]'::jsonb),
                        'exercises', NULLIF(COALESCE(
                            (
                                SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                                    'uuid',             e.uuid,
                                    'type',             et.specifics->>'type',
                                    'prompt',           et.prompt,
                                    'grammar_rule_uuid', e.grammar_rule_uuid,
                                    'failure_feedback', grt.failure_feedback,
                                    'specifics',        et.specifics
                                )))
                                FROM exercise e
                                LEFT JOIN exercise_translation et ON et.exercise_uuid = e.uuid
                                    AND et.language = tl.language
                                LEFT JOIN grammar_rule gr ON gr.uuid = e.grammar_rule_uuid
                                LEFT JOIN grammar_rule_translation grt ON grt.grammar_rule_uuid = gr.uuid
                                    AND grt.language = tl.language
                                WHERE e.target_uuid = g.uuid
                            ),
                            '[]'::jsonb
                        ), '[]'::jsonb)
                    ) AS step
                FROM grammar g
                LEFT JOIN grammar_translation gt ON gt.grammar_uuid = g.uuid 
                    AND gt.language = tl.language
                WHERE g.path_uuid = p.uuid

                UNION ALL

                -- ── Listening ────────────────────────────────────────────────
                SELECT
                    l.step_order,
                    jsonb_build_object(
                        'type',        'listening',
                        'uuid',        l.uuid,
                        'step_order',  l.step_order,
                        'title',       lt.title,
                        'description', lt.description,
                        'transcript',  l.transcript,
                        'exercises', NULLIF(COALESCE(
                            (
                                SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                                    'uuid',      e.uuid,
                                    'type',      et.specifics->>'type',
                                    'prompt',    et.prompt,
                                    'specifics', et.specifics
                                )))
                                FROM exercise e
                                LEFT JOIN exercise_translation et ON et.exercise_uuid = e.uuid
                                    AND et.language = tl.language
                                WHERE e.target_uuid = l.uuid
                            ),
                            '[]'::jsonb
                        ), '[]'::jsonb)
                    ) AS step
                FROM listening l
                LEFT JOIN listening_translation lt ON lt.listening_uuid = l.uuid 
                    AND lt.language = tl.language
                WHERE l.path_uuid = p.uuid

                UNION ALL

                -- ── Reading ─────────────────────────────────────────────────
                SELECT
                    r.step_order,
                    jsonb_build_object(
                        'type',        'reading',
                        'uuid',        r.uuid,
                        'step_order',  r.step_order,
                        'title',       rt.title,
                        'description', rt.description,
                        'content',     r.content,
                        'exercises', NULLIF(COALESCE(
                            (
                                SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                                    'uuid',      e.uuid,
                                    'type',      et.specifics->>'type',
                                    'prompt',    et.prompt,
                                    'specifics', et.specifics
                                )))
                                FROM exercise e
                                LEFT JOIN exercise_translation et ON et.exercise_uuid = e.uuid
                                    AND et.language = tl.language
                                WHERE e.target_uuid = r.uuid
                            ),
                            '[]'::jsonb
                        ), '[]'::jsonb)
                    ) AS step
                FROM reading r
                LEFT JOIN reading_translation rt ON rt.reading_uuid = r.uuid
                    AND rt.language = tl.language
                WHERE r.path_uuid = p.uuid

                UNION ALL

                -- ── Speaking ─────────────────────────────────────────────────
                SELECT
                    s.step_order,
                    jsonb_build_object(
                        'type',        'speaking',
                        'uuid',        s.uuid,
                        'step_order',  s.step_order,
                        'title',       st.title,
                        'description', st.description,
                        'prompt',      st.prompt,
                        'exercises', NULLIF(COALESCE(
                            (
                                SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                                    'uuid',      e.uuid,
                                    'type',      et.specifics->>'type',
                                    'prompt',    et.prompt,
                                    'specifics', et.specifics
                                )))
                                FROM exercise e
                                LEFT JOIN exercise_translation et ON et.exercise_uuid = e.uuid
                                    AND et.language = tl.language
                                WHERE e.target_uuid = s.uuid
                            ),
                            '[]'::jsonb
                        ), '[]'::jsonb)
                    ) AS step
                FROM speaking s
                LEFT JOIN speaking_translation st ON st.speaking_uuid = s.uuid
                    AND st.language = tl.language
                WHERE s.path_uuid = p.uuid

                UNION ALL

                -- ── Writing ──────────────────────────────────────────────────
                SELECT
                    w.step_order,
                    jsonb_build_object(
                        'type',        'writing',
                        'uuid',        w.uuid,
                        'step_order',  w.step_order,
                        'title',       wt.title,
                        'description', wt.description,
                        'prompt',      wt.prompt,
                        'exercises', NULLIF(COALESCE(
                            (
                                SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                                    'uuid',      e.uuid,
                                    'type',      et.specifics->>'type',
                                    'prompt',    et.prompt,
                                    'specifics', et.specifics
                                )))
                                FROM exercise e
                                LEFT JOIN exercise_translation et ON et.exercise_uuid = e.uuid
                                    AND et.language = tl.language
                                WHERE e.target_uuid = w.uuid
                            ),
                            '[]'::jsonb
                        ), '[]'::jsonb)
                    ) AS step
                FROM writing w
                LEFT JOIN writing_translation wt ON wt.writing_uuid = w.uuid
                    AND wt.language = tl.language
                WHERE w.path_uuid = p.uuid

                UNION ALL

                -- ── Dialogue ─────────────────────────────────────────────────
                SELECT
                    dl.step_order,
                    jsonb_build_object(
                        'type',        'dialogue',
                        'uuid',        dl.uuid,
                        'step_order',  dl.step_order,
                        'category',    dl.category,
                        'title',       dlt.title,
                        'description', dlt.description,
                        'characters',  dl.characters,
                        'lines', NULLIF(COALESCE(
                            (
                                SELECT jsonb_agg(
                                    jsonb_strip_nulls(jsonb_build_object(
                                        'uuid',           dll.uuid,
                                        'text',           dll.text,
                                        'meaning',        dllt.meaning->>'translation',
                                        'line_order',     dll.line_order,
                                        'pronunciation',  dllt.meaning->>'pronunciation',
                                        'character_name', dll.character_name
                                    )) ORDER BY dll.line_order
                                )
                                FROM dialogue_lines dll
                                LEFT JOIN dialogue_lines_translation dllt ON dllt.dialogue_line_uuid = dll.uuid
                                    AND dllt.language = tl.language
                                WHERE dll.dialogue_uuid = dl.uuid
                            ),
                            '[]'::jsonb
                        ), '[]'::jsonb)
                    ) AS step
                FROM dialogue dl
                LEFT JOIN dialogue_translation dlt ON dlt.dialogue_uuid = dl.uuid 
                    AND dlt.language = tl.language
                WHERE dl.path_uuid = p.uuid

            ) all_steps
        ),
        '[]'::jsonb
    ) AS steps
FROM path p
CROSS JOIN (
    SELECT DISTINCT language FROM deck_translation
    UNION
    SELECT DISTINCT language FROM grammar_translation
    UNION
    SELECT DISTINCT language FROM listening_translation
    UNION
    SELECT DISTINCT language FROM reading_translation
    UNION
    SELECT DISTINCT language FROM speaking_translation
    UNION
    SELECT DISTINCT language FROM writing_translation
    UNION
    SELECT DISTINCT language FROM dialogue_translation
) tl;

-- Índice único requerido para REFRESH CONCURRENTLY (no bloquea lecturas)
CREATE UNIQUE INDEX IF NOT EXISTS idx_mv_path_full_uuid_lang ON mv_path_full(uuid, language);
CREATE INDEX IF NOT EXISTS idx_mv_path_full_source_language ON mv_path_full(source_language);
CREATE INDEX IF NOT EXISTS idx_mv_path_full_language ON mv_path_full(language);


-- =============================================================================
-- REFRESCO: llamada explícita desde la capa de aplicación (Go)
--
-- El contenido de los paths cambia muy raramente (inserts ~semanal,
-- edits ~mensual). Los triggers añadirían overhead constante sin beneficio.
-- La estrategia correcta es llamar el refresh desde el admin handler
-- justo después de confirmar la escritura.
--
-- Desde Go (ejemplo):
--   _, err = db.Exec("REFRESH MATERIALIZED VIEW CONCURRENTLY mv_path_full")
--
-- CONCURRENTLY no bloquea las lecturas en curso: los usuarios siguen
-- recibiendo la versión anterior mientras se construye la nueva.
-- Requiere que idx_mv_path_full_uuid exista (ya creado arriba).
-- =============================================================================

-- Función auxiliar para llamar desde Go o desde psql manualmente
CREATE OR REPLACE FUNCTION fn_refresh_mv_path_full()
RETURNS void LANGUAGE sql SECURITY DEFINER AS $$
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_path_full;
$$;

-- Uso desde psql tras una carga de datos manual:
--   SELECT fn_refresh_mv_path_full();


-- =============================================================================
-- MATERIALIZED VIEW: v_grammar
--
-- Obtiene gramática con sus traducciones, reglas y ejercicios
-- Filtrada por source_language y language (idioma de traducción)
--
-- Consulta:
--   SELECT * FROM v_grammar 
--   WHERE source_language = $1 AND translation_language = $2;
--
-- Refresh:
--   REFRESH MATERIALIZED VIEW CONCURRENTLY v_grammar;
-- =============================================================================
 

DROP MATERIALIZED VIEW IF EXISTS v_grammar CASCADE;
CREATE MATERIALIZED VIEW v_grammar AS
SELECT
    g.uuid,
    g.path_uuid,
    g.source_language,
    g.step_order,
    g.type,
    gt.language,
    gt.title,
    gt.description,
    gt.content
FROM grammar g
LEFT JOIN grammar_translation gt ON gt.grammar_uuid = g.uuid;

-- Índices para v_grammar
CREATE UNIQUE INDEX idx_v_grammar_uuid_lang ON v_grammar(uuid, language);
CREATE INDEX idx_v_grammar_source_language ON v_grammar(source_language);
CREATE INDEX idx_v_grammar_language ON v_grammar(language);


-- =============================================================================
-- MATERIALIZED VIEW: v_dialogue
--
-- Obtiene diálogos con sus traducciones y líneas
-- Filtrada por source_language y language (idioma de traducción)
--
-- Consulta:
--   SELECT * FROM v_dialogue 
--   WHERE source_language = $1 AND translation_language = $2;
-- =============================================================================

DROP MATERIALIZED VIEW IF EXISTS v_dialogue CASCADE;
CREATE MATERIALIZED VIEW v_dialogue AS
SELECT
    dl.uuid,
    dl.path_uuid,
    dl.source_language,
    dl.step_order,
    dl.category,
    dl.characters,
    dlt.language,
    dlt.title,
    dlt.description
FROM dialogue dl
LEFT JOIN dialogue_translation dlt ON dlt.dialogue_uuid = dl.uuid;


-- =============================================================================
-- MATERIALIZED VIEW: v_listening
--
-- Obtiene ejercicios de listening con sus traducciones
-- Filtrada por source_language y language (idioma de traducción)
--
-- Consulta:
--   SELECT * FROM v_listening 
--   WHERE source_language = $1 AND translation_language = $2;
-- =============================================================================

DROP MATERIALIZED VIEW IF EXISTS v_listening CASCADE;
CREATE MATERIALIZED VIEW v_listening AS
SELECT
    l.uuid,
    l.path_uuid,
    l.source_language,
    l.step_order,
    l.transcript,
    lt.language,
    lt.title,
    lt.description
FROM listening l
LEFT JOIN listening_translation lt ON lt.listening_uuid = l.uuid;



-- =============================================================================
-- MATERIALIZED VIEW: v_reading
--
-- Obtiene lecturas con sus traducciones
-- Filtrada por source_language y language (idioma de traducción)
--
-- Consulta:
--   SELECT * FROM v_reading
--   WHERE source_language = $1 AND translation_language = $2;
-- =============================================================================

DROP MATERIALIZED VIEW IF EXISTS v_reading CASCADE;
CREATE MATERIALIZED VIEW v_reading AS
SELECT
    r.uuid,
    r.path_uuid,
    r.source_language,
    r.step_order,
    r.content,
    rt.language,
    rt.title,
    rt.description
FROM reading r
LEFT JOIN reading_translation rt ON rt.reading_uuid = r.uuid;



-- =============================================================================
-- MATERIALIZED VIEW: v_exercise
--
-- Obtiene ejercicios con sus traducciones y gramática relacionada
-- Filtrada por grammar source_language y language (idioma de traducción)
--
-- Consulta:
--   SELECT * FROM v_exercise 
--   WHERE source_language = $1 AND translation_language = $2;
-- =============================================================================

DROP MATERIALIZED VIEW IF EXISTS v_exercise;
CREATE MATERIALIZED VIEW v_exercise AS
SELECT
    e.uuid,
    e.target_uuid,
    et.specifics->> 'type' AS type,
    g.source_language,
    et.language,
    et.prompt,
    grt.failure_feedback,
    et.specifics
FROM exercise e
JOIN grammar g ON g.uuid = e.target_uuid
LEFT JOIN exercise_translation et ON et.exercise_uuid = e.uuid
LEFT JOIN grammar_translation gt ON gt.grammar_uuid = g.uuid AND gt.language = et.language
LEFT JOIN grammar_rule gr ON gr.uuid = e.grammar_rule_uuid
LEFT JOIN grammar_rule_translation grt ON grt.grammar_rule_uuid = gr.uuid
    AND grt.language = et.language;


-- Crear índices para todas las vistas materializadas
CREATE UNIQUE INDEX idx_v_dialogue_uuid_lang ON v_dialogue(uuid, language);
CREATE INDEX idx_v_dialogue_source_language ON v_dialogue(source_language);
CREATE INDEX idx_v_dialogue_language ON v_dialogue(language);

CREATE UNIQUE INDEX idx_v_listening_uuid_lang ON v_listening(uuid, language);
CREATE INDEX idx_v_listening_source_language ON v_listening(source_language);
CREATE INDEX idx_v_listening_language ON v_listening(language);

CREATE UNIQUE INDEX idx_v_reading_uuid_lang ON v_reading(uuid, language);
CREATE INDEX idx_v_reading_source_language ON v_reading(source_language);
CREATE INDEX idx_v_reading_language ON v_reading(language);

CREATE UNIQUE INDEX idx_v_exercise_uuid_lang ON v_exercise(uuid, language);
CREATE INDEX idx_v_exercise_source_language ON v_exercise(source_language);
CREATE INDEX idx_v_exercise_language ON v_exercise(language);


-- =============================================================================
-- VIEW: v_user_rule_proficiency
--
-- Una fila por cada (user, grammar_rule) que tenga registros en rule_stat.
-- Muestra la proficiency acumulada, los conteos y la regla gramatical asociada.
-- =============================================================================

CREATE OR REPLACE VIEW v_user_rule_proficiency AS
SELECT
    rs.uuid,
    rs.user_uuid,
    rs.grammar_rule_uuid,
    rs.correct_count,
    rs.incorrect_count,
    rs.proficiency,
    rs.last_mistake,
    rs.created_at,
    rs.updated_at
FROM rule_stat rs
JOIN users u ON u.uuid = rs.user_uuid;


-- =============================================================================
-- VIEW: v_hourly_stats
--
-- Todas las filas de hourly_stat con datos del usuario para consumo directo.
-- =============================================================================

CREATE OR REPLACE VIEW v_hourly_stats AS
SELECT
    hs.uuid,
    hs.user_uuid,
    hs.hour,
    hs.average_score,
    hs.average_response_time,
    hs.average_energy_level,
    hs.total_sessions,
    hs.last_updated
FROM hourly_stat hs
JOIN users u ON u.uuid = hs.user_uuid;


-- =============================================================================
-- VIEW: v_user_learning_summary
--
-- Una fila por usuario con sus study_records, hourly_stats y rule_stats
-- agregados en JSON. Útil para obtener el estado completo de aprendizaje
-- de un usuario en una sola consulta.
--
-- Consulta:
--   SELECT * FROM v_user_learning_summary WHERE user_uuid = $1;
-- =============================================================================

CREATE OR REPLACE VIEW v_user_learning_summary AS
SELECT
    u.uuid                          AS user_uuid,

    COALESCE(
        (
            SELECT jsonb_agg(jsonb_build_object(
                'uuid',         sr.uuid,
                'user_uuid',    sr.user_uuid,
                'target_uuid',  sr.target_uuid,
                'target_type',  sr.target_type,
                'last_review',  sr.last_review,
                'next_review',  sr.next_review,
                'stability',    sr.stability,
                'difficulty',   sr.difficulty,
                'repetitions',  sr.repetitions,
                'status',       sr.status,
                'last_score',   sr.last_score,
                'mastery',      sr.mastery,
                'created_at',   sr.created_at,
                'updated_at',   sr.updated_at
            ))
            FROM study_records sr
            WHERE sr.user_uuid = u.uuid
        ),
        '[]'::jsonb
    )                               AS study_records,

    COALESCE(
        (
            SELECT jsonb_agg(jsonb_build_object(
                'uuid',                  hs.uuid,
                'hour',                  hs.hour,
                'average_score',         hs.average_score,
                'average_response_time', hs.average_response_time,
                'average_energy_level',  hs.average_energy_level,
                'total_sessions',        hs.total_sessions,
                'last_updated',          hs.last_updated
            ) ORDER BY hs.hour)
            FROM hourly_stat hs
            WHERE hs.user_uuid = u.uuid
        ),
        '[]'::jsonb
    )                               AS hourly_stats,

    COALESCE(
        (
            SELECT jsonb_agg(jsonb_build_object(
                'uuid',             rs.uuid,
                'grammar_rule_uuid',  rs.grammar_rule_uuid,
                'correct_count',    rs.correct_count,
                'incorrect_count',  rs.incorrect_count,
                'proficiency',      rs.proficiency,
                'last_mistake',     rs.last_mistake,
                'updated_at',       rs.updated_at
            ))
            FROM rule_stat rs
            WHERE rs.user_uuid = u.uuid
        ),
        '[]'::jsonb
    )                               AS rule_stats,

    jsonb_build_object(
        'current_streak',      COALESCE(us.current_streak, 0),
        'longest_streak',      COALESCE(us.longest_streak, 0),
        'total_hours_studied', COALESCE(us.total_hours_studied, 0),
        'total_sessions',      COALESCE(us.total_sessions, 0),
        'last_study_date',     us.last_study_date,
        'updated_at',          us.updated_at
    )                               AS stats,

    GREATEST(
        (SELECT MAX(sr2.updated_at) FROM study_records sr2 WHERE sr2.user_uuid = u.uuid),
        us.updated_at,
        (SELECT MAX(hs2.last_updated) FROM hourly_stat hs2 WHERE hs2.user_uuid = u.uuid),
        (SELECT MAX(rs2.updated_at) FROM rule_stat rs2 WHERE rs2.user_uuid = u.uuid)
    )                               AS updated_at

FROM users u
LEFT JOIN user_stats us ON us.user_uuid = u.uuid;


-- =============================================================================
-- FUNCIÓN: Refrescar todas las vistas materializadas
-- =============================================================================

CREATE OR REPLACE FUNCTION fn_refresh_all_materialized_views()
RETURNS void LANGUAGE plpgsql AS $$
BEGIN
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_path_full;
    REFRESH MATERIALIZED VIEW CONCURRENTLY v_grammar;
    REFRESH MATERIALIZED VIEW CONCURRENTLY v_dialogue;
    REFRESH MATERIALIZED VIEW CONCURRENTLY v_listening;
    REFRESH MATERIALIZED VIEW CONCURRENTLY v_exercise;
END;
$$;

-- Uso:
--   SELECT fn_refresh_all_materialized_views();
