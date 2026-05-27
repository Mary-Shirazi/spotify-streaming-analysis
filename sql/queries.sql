-- ═══════════════════════════════════════════════════════════════════════════
-- Project 3: Spotify Global Charts — SQL Analysis
-- Database: data/spotify.db  |  Table: charts
-- Run in: DB Browser for SQLite
-- ═══════════════════════════════════════════════════════════════════════════


-- ─────────────────────────────────────────────────────────────────────────────
-- Q1: Who are the most-streamed artists of the entire dataset?
-- Story angle: Who ACTUALLY dominated the streaming era?
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    artist,
    SUM(streams)              AS total_streams,
    COUNT(DISTINCT song_key)  AS unique_charting_songs,
    COUNT(*)                  AS total_chart_days,
    ROUND(AVG(rank), 1)       AS avg_chart_rank
FROM charts
GROUP BY artist
ORDER BY total_streams DESC
LIMIT 15;


-- ─────────────────────────────────────────────────────────────────────────────
-- Q2: Which songs spent the most days at #1 globally?
-- Story angle: What was the biggest song of the streaming era?
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    title,
    artist,
    COUNT(*)      AS days_at_number_one,
    MIN(date)     AS first_at_one,
    MAX(date)     AS last_at_one,
    MAX(streams)  AS peak_streams_in_a_day
FROM charts
WHERE rank = 1
GROUP BY title, artist
ORDER BY days_at_number_one DESC
LIMIT 20;


-- ─────────────────────────────────────────────────────────────────────────────
-- Q3: How did global streaming volume grow year over year?
-- Story angle: Is streaming still growing or has it plateaued?
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    year,
    SUM(streams)              AS total_streams,
    COUNT(DISTINCT date)      AS active_days,
    COUNT(DISTINCT song_key)  AS unique_songs_charted,
    ROUND(SUM(streams) * 1.0 / COUNT(DISTINCT date), 0)  AS avg_daily_streams,
    -- Year-over-year growth % (requires CTEs in SQLite 3.35+)
    SUM(streams) - LAG(SUM(streams)) OVER (ORDER BY year)  AS yoy_stream_delta
FROM charts
GROUP BY year
ORDER BY year;


-- ─────────────────────────────────────────────────────────────────────────────
-- Q4: Which months see the highest streaming activity?
-- Story angle: Are there seasonal patterns in how people stream music?
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    month,
    month_name,
    SUM(streams)                                AS total_streams,
    ROUND(AVG(streams), 0)                      AS avg_streams_per_song_day,
    COUNT(DISTINCT date)                        AS num_days,
    ROUND(SUM(streams) * 1.0 / COUNT(DISTINCT date), 0)  AS avg_daily_total
FROM charts
GROUP BY month, month_name
ORDER BY month;


-- ─────────────────────────────────────────────────────────────────────────────
-- Q5: Which artist dominated each year? (The "Artist of the Year" query)
-- Story angle: Has any single artist maintained dominance, or does it rotate?
-- ─────────────────────────────────────────────────────────────────────────────
WITH yearly_artist AS (
    SELECT
        year,
        artist,
        SUM(streams)  AS streams,
        ROW_NUMBER() OVER (PARTITION BY year ORDER BY SUM(streams) DESC) AS rnk
    FROM charts
    GROUP BY year, artist
)
SELECT year, artist, streams
FROM yearly_artist
WHERE rnk = 1
ORDER BY year;


-- ─────────────────────────────────────────────────────────────────────────────
-- BONUS Q: What is the "stickiest" song — highest total streams despite
--          not always being #1? (Consistent performer vs viral hit)
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    title,
    artist,
    SUM(streams)     AS total_streams,
    COUNT(*)         AS days_in_top200,
    MIN(rank)        AS best_rank,
    ROUND(AVG(rank)) AS avg_rank,
    SUM(CASE WHEN rank = 1 THEN 1 ELSE 0 END) AS days_at_one
FROM charts
GROUP BY title, artist
HAVING days_in_top200 > 60   -- must chart for at least 60 days
ORDER BY total_streams DESC
LIMIT 15;
