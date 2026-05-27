# 🎵 The Streaming Era — Spotify Global Charts Analysis

> End-to-end analysis of 3.5M+ Spotify chart entries (2017–2021). Cleaned with Python, analyzed with SQL, visualized in Tableau. Presented as a data story.

---

## 📖 The Story

**[Read the full data story →](story.md)**

Short version: I analyzed every entry in the Spotify Global Top 200 chart from 2017 to 2021 to answer who *actually* dominated the streaming era — and found some surprising patterns about when, how, and why people stream music.

---

## 📊 Key Findings

| # | Finding | Detail |
|---|---------|--------|
| 1 | Drake is the undisputed king | Led global streams in 4 of 5 years — by nearly 2× the #2 artist |
| 2 | "Blinding Lights" = song of the era | Most days at #1 globally; COVID timing was a factor |
| 3 | Streaming tripled 2017→2020, then plateaued | +37% YoY until 2020; only +4% in 2021 |
| 4 | January beats December for streams | Counter-intuitive seasonal pattern |
| 5 | Catalog artists have structural streaming advantage | Artists with 100+ songs keep winning |

---

## 🔗 Live Tableau Dashboard

**➡️ [View on Tableau Public](ADD_YOUR_TABLEAU_URL_HERE)**

Charts include:
- Total streams by year (area chart with trend line)
- Top 10 artists by cumulative streams (bar chart)
- Monthly streaming heatmap (year × month)
- Days-at-#1 leaderboard (horizontal bar)

---

## 🗂 Project Structure

```
├── clean.py              ← Pandas cleaning pipeline
├── sql/
│   └── queries.sql       ← 5 SQL business questions + bonus
├── story.md              ← Full data narrative
├── data/
│   ├── charts.csv            ← Raw Kaggle data
│   └── spotify_cleaned.csv   ← Cleaned output
└── README.md
```

---

## 🛠 Tech Stack

![Python](https://img.shields.io/badge/Python-3.10+-blue?logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-2.x-150458?logo=pandas&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-3-003B57?logo=sqlite&logoColor=white)
![Tableau Public](https://img.shields.io/badge/Tableau-Public-E97627?logo=tableau&logoColor=white)

---

## 🚀 How to Run

```bash
# Clone
git clone https://github.com/YOURUSERNAME/spotify-streaming-analysis.git
cd spotify-streaming-analysis

# Install dependencies
pip install pandas

# Download the dataset
# → https://www.kaggle.com/datasets/dhruvildave/spotify-charts
# → Save as data/charts.csv

# Run cleaning
python clean.py

# Open data/spotify.db in DB Browser for SQLite
# Run queries from sql/queries.sql
```

---

## 📁 Data Source

- **Dataset:** [Spotify Charts](https://www.kaggle.com/datasets/dhruvildave/spotify-charts) via Kaggle
- **Scope:** Global Top 200 chart, daily entries, 2017–2021
- **Raw rows:** ~3.5 million

---

## 📝 Resume Bullets (Feel Free to Copy)

```
Spotify Streaming Era Analysis | Python · SQL · Tableau
• Cleaned and analyzed 3.5M+ Spotify chart entries to uncover streaming growth
  patterns, seasonal trends, and artist dominance across a 5-year period
• Wrote 5 SQL window-function queries (LAG, ROW_NUMBER, CTEs) for YoY analysis
• Published Tableau dashboard with 4 interactive charts — [live link]
• Wrote findings as a narrative data story linking statistical results to
  real-world music industry dynamics
```

---

*Part of a 3-project data analytics portfolio. See also:*
- *[Netflix Content Strategy Analysis](https://github.com/YOURUSERNAME/netflix-sql-analysis)*
- *[Netflix Tableau Dashboard](https://github.com/YOURUSERNAME/netflix-tableau-dashboard)*
