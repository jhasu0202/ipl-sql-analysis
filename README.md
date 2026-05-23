# 🏏 IPL Data Analysis using SQL

A complete SQL project analyzing IPL cricket data using MySQL.  
Built to demonstrate real-world SQL skills relevant to **Data Analyst** roles.

---

## 🎯 Objective

The goal of this project is to analyze IPL match and player performance data using SQL to derive insights such as top-performing players, team performance trends, venue advantages, and season-wise statistics — simulating real-world sports analytics use cases.

---

## 📁 Project Structure

| File | Description |
|------|-------------|
| `schema.sql` | CREATE TABLE statements |
| `data.sql` | INSERT sample data |
| `queries.sql` | All 20 analysis queries |

---

## 🗄️ Database Schema

- **teams** — IPL team details
- **players** — Player info with role and nationality
- **matches** — Match results by season and venue
- **batting_stats** — Runs, balls, fours, sixes per match
- **bowling_stats** — Overs, wickets, economy per match

---

## 🔍 Queries Covered

### Basic
- List players by team
- Filter matches by season
- Find players by role
- Matches won by a team

### Intermediate
- Top 5 run scorers
- Best strike rate (min 50 balls)
- Most sixes in a season
- Most wickets
- Best economy rate

### Advanced
- 🟠 Orange Cap winner per season
- 🟣 Purple Cap winner per season
- Players with 2+ fifties
- Team win % at each venue
- Head-to-head record between teams

### Expert
- Most consistent batsman
- All-rounder index
- Matches won by chasing team
- Season-wise player trend
- Man of the Match (top performer per match)

---

## 📊 Key Insights

- Teams batting second had a higher win percentage at select high-scoring venues
- Power hitters with strike rates above 150 dominated the sixes leaderboard across seasons
- Some bowlers consistently maintained economy rates under 7 despite taking high wicket counts
- Orange Cap and Purple Cap winners showed strong correlation with team playoff qualification

---

## 💡 Concepts Used

✅ SELECT, WHERE, GROUP BY, ORDER BY  
✅ Multi-table JOINs  
✅ Aggregate functions (SUM, AVG, COUNT, MAX, MIN)  
✅ HAVING clause  
✅ CASE WHEN (conditional aggregation)  
✅ Subqueries  
✅ Window functions — RANK(), PARTITION BY  

---

## 🛠️ Tools & Technologies

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=database&logoColor=white)
![DB Fiddle](https://img.shields.io/badge/DB%20Fiddle-Online%20SQL%20Editor-orange?style=for-the-badge)

---

## 🚀 How to Run

1. Clone the repository
   ```bash
   git clone https://github.com/jhasu0202/ipl-sql-analysis.git
   ```
2. Open **MySQL Workbench** or any SQL editor
3. Run `schema.sql` to create the database and tables
4. Run `data.sql` to load the sample data
5. Execute queries from `queries.sql` and explore the insights

---

## 📸 Project Preview

> 📌 *Screenshots of query outputs and ER diagram — coming soon*  
> *(Run the queries locally to see results)*

---

## 🏅 Certifications

- HackerRank SQL — Basic, Intermediate & Advanced ✅

---

## 👤 Author

**Jhasveni Jamisetty** — Passionate about Data Analytics, SQL, and building data-driven solutions.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Jhasveni%20Jamisetty-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/jhasveni-jamisetty-5994b0298)
[![GitHub](https://img.shields.io/badge/GitHub-jhasu0202-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/jhasu0202)
[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-FF5722?style=for-the-badge&logo=google-chrome&logoColor=white)](https://jhasu0202.github.io/jhasu0202.github.io-portfolio/)
