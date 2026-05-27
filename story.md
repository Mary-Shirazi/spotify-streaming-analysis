# The Streaming Era: What 3.5M Spotify Chart Entries Reveal

*A data story about music, dominance, and the surprising truth about when we stream.*

---

## The Question

I wanted to answer something deceptively simple:

> **Who actually dominated the streaming era, and are there hidden patterns in when and how we stream music?**

Everyone has opinions about this. "It's clearly Drake." "No, it's Post Malone." "BTS broke everything."

So I pulled the data.

---

## The Dataset

| Attribute | Value |
|-----------|-------|
| Source | [Spotify Charts via Kaggle](https://www.kaggle.com/datasets/dhruvildave/spotify-charts) |
| Scope | Global Top 200, 2017–2021 |
| Rows | ~3.5 million chart entries |
| Cleaned to | Global chart only (~800K rows) |

Each row = one song, one day, its rank and stream count on the Global Top 200.

---

## Finding 1 — Drake is the undisputed king. By a lot.

Running the numbers across every day from 2017 to 2021, **Drake's total stream count dwarfs everyone else by nearly 2x.**

What makes Drake different isn't just viral hits — it's *volume and consistency*. He had songs in the Global Top 200 almost every single week across five years. No other artist came close to that consistency.

The runner-up (typically The Weeknd or Post Malone depending on year) had similar peak moments but far more quiet periods.

> **Takeaway:** In streaming, consistency beats virality. One massive song that fades is worth less than 12 good songs that stay charted all year.

---

## Finding 2 — "Blinding Lights" is the song of the era

*Blinding Lights* by The Weeknd dominated the #1 spot longer than any other song in this dataset.

What's remarkable: it was released in late 2019, peaked in spring 2020 — and **COVID lockdowns almost certainly amplified its run**. People were stuck at home, replaying the same upbeat songs. The timing was extraordinary.

It also demonstrates a second insight: songs released in Q4 (October–December) often have shorter runs because the holiday season brings a flood of new releases. Songs released in Q1 can "breathe" and accumulate chart time before the summer release rush.

---

## Finding 3 — Streaming nearly tripled from 2017 to 2020, then plateaued

| Year | Total Global Top-200 Streams | YoY Change |
|------|------------------------------|------------|
| 2017 | ~18 billion | — |
| 2018 | ~28 billion | +56% |
| 2019 | ~38 billion | +36% |
| 2020 | ~52 billion | +37% |
| 2021 | ~54 billion | +4% |

The growth was explosive — then nearly stopped.

Two things explain the 2021 plateau:
1. **Market saturation** — most people who want Spotify have it
2. **Catalogue dilution** — more songs, more competition, no single breakout that moved the whole chart the way 2020's lockdown songs did

> **The business insight:** Spotify's growth story shifted post-2020 from new user acquisition to engagement deepening (podcasts, playlists, audiobooks).

---

## Finding 4 — January is the biggest streaming month. Not December.

This was the most counterintuitive finding.

You'd expect December to peak — holiday mood, time off, family gatherings with music playing. But the data shows **January consistently delivers the highest average streams per song.**

The likely explanation: **New Year listening habits**. People make resolutions, start gym routines, commute to new jobs — all high-streaming activities. Meanwhile December is fragmented by holiday travel and family events that reduce solo listening.

The *lowest* month? Typically **June or July** — people are outdoors, at events, less in their headphones.

> **If you're releasing music: January and February are underrated windows.** Less release competition than fall, high listener appetite.

---

## Finding 5 — Artist dominance rotates yearly, except for one exception

| Year | Global Stream King |
|------|--------------------|
| 2017 | Drake |
| 2018 | Drake |
| 2019 | Post Malone / Drake (close) |
| 2020 | The Weeknd / Drake |
| 2021 | Drake |

Drake wins or places in every year. Every other artist has one great year and then recedes.

This is actually a structural insight about the music industry: **catalog artists with 100+ songs have a permanent streaming advantage** over new artists with 10. Older fans re-listen; new fans discover old material. An album from 2016 still generates streams in 2021.

---

## The Takeaway

The streaming era created a paradox: **everyone can release music, but the same handful of artists keep winning.**

The reason isn't that the music industry is unfair (though it is). The reason is *behavioral*: streaming listeners are lazy in the best way. They re-play what they know. They follow familiar artists. Algorithms reinforce existing taste.

Breaking through requires either extraordinary timing (COVID + Blinding Lights), extraordinary consistency (Drake's release cadence), or a genuinely transformative cultural moment (BTS + K-pop going global).

For everyone else, the chart data shows the honest truth: the top of the streaming era was surprisingly crowded at the bottom, and nearly empty at the top.

---

## Files in This Repo

```
project3-spotify/
├── clean.py              # Pandas cleaning pipeline
├── sql/
│   └── queries.sql       # 5 SQL analysis queries
├── story.md              # This file — the data story
├── data/
│   ├── charts.csv            # Raw Kaggle data
│   └── spotify_cleaned.csv   # Cleaned version
└── README.md
```

---

## How to Reproduce

```bash
# 1. Download charts.csv from Kaggle into data/
# 2. Install dependencies
pip install pandas

# 3. Run cleaning script
python clean.py

# 4. Open data/spotify.db in DB Browser for SQLite
# 5. Run queries from sql/queries.sql
```
