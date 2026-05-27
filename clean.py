"""
Project 3: Spotify Global Charts — End-to-End Analysis
Dataset: https://www.kaggle.com/datasets/dhruvildave/spotify-charts
Story: What does 3.5M+ chart entries reveal about the streaming era?
"""

import pandas as pd
import sqlite3
import os

# ─── Load ────────────────────────────────────────────────────────────────────
print("Loading Spotify charts data...")
df = pd.read_csv("data/charts.csv")
print(f"Raw shape: {df.shape}")
print(f"\nColumns: {list(df.columns)}")
print(f"\nSample rows:")
print(df.head(3).to_string())
print(f"\nMissing values:\n{df.isnull().sum()}")
print(f"\nUnique charts: {df['chart'].unique()}")
print(f"Unique regions (sample): {df['region'].nunique()} total")

# ─── Filter to Global Top 200 ──────────────────────────────────────────────
print("\n--- Filtering to Global Top 200 ---")
df = df[(df['chart'] == 'top200') & (df['region'] == 'Global')]
print(f"After filter: {df.shape}")

# ─── Clean ───────────────────────────────────────────────────────────────────
print("\n--- Cleaning ---")

# 1. Parse date
df['date'] = pd.to_datetime(df['date'], errors='coerce')
df['year']  = df['date'].dt.year
df['month'] = df['date'].dt.month
df['month_name'] = df['date'].dt.strftime('%b')
print("✓ Parsed date, extracted year + month")

# 2. Drop rows with null streams or rank
before = len(df)
df = df.dropna(subset=['streams', 'rank'])
print(f"✓ Dropped {before - len(df)} rows with null streams/rank")

# 3. Ensure streams is integer
df['streams'] = df['streams'].astype(int)
df['rank']    = df['rank'].astype(int)

# 4. Clean text fields
df['artist'] = df['artist'].str.strip()
df['title']  = df['title'].str.strip()

# 5. Create a unique song key (handle same title by different artists)
df['song_key'] = df['title'].str.lower().str.strip() + ' || ' + df['artist'].str.lower().str.strip()

print(f"\nCleaned shape: {df.shape}")
print(f"Date range: {df['date'].min().date()} to {df['date'].max().date()}")
print(f"Unique songs: {df['song_key'].nunique():,}")
print(f"Unique artists: {df['artist'].nunique():,}")
print(f"Total streams indexed: {df['streams'].sum():,.0f}")

# ─── Save ────────────────────────────────────────────────────────────────────
os.makedirs("data", exist_ok=True)
conn = sqlite3.connect("data/spotify.db")
df.to_sql("charts", conn, if_exists="replace", index=False)
conn.close()
df.to_csv("data/spotify_cleaned.csv", index=False)
print("\n✓ Saved to data/spotify.db  (table: charts)")
print("✓ Saved to data/spotify_cleaned.csv")
