-- Q1 — List all players in Mumbai Indians
SELECT p.player_name, p.role, p.nationality
FROM players p
JOIN teams t ON p.team_id = t.team_id
WHERE t.team_name = 'Mumbai Indians';

-- Q2 — Find all matches played in 2023
SELECT m.match_id, t1.team_name AS team1, t2.team_name AS team2,
       m.venue, m.match_date
FROM matches m
JOIN teams t1 ON m.team1_id = t1.team_id
JOIN teams t2 ON m.team2_id = t2.team_id
WHERE m.season = 2023;

-- Q3 — Get all bowlers in the tournament
SELECT p.player_name, t.team_name, p.nationality
FROM players p
JOIN teams t ON p.team_id = t.team_id
WHERE p.role = 'Bowler';

-- Q4 — Matches won by Chennai Super Kings
SELECT m.match_id, m.season, m.match_date,
       t1.team_name AS opponent, m.venue
FROM matches m
JOIN teams t1 ON 
     CASE WHEN m.match_winner_id = m.team1_id 
          THEN m.team2_id ELSE m.team1_id END = t1.team_id
WHERE m.match_winner_id = (
    SELECT team_id FROM teams WHERE team_name = 'Chennai Super Kings'
);
-- Q5 — Count total matches played by each team
SELECT t.team_name,
       COUNT(*) AS total_matches
FROM teams t
JOIN matches m ON t.team_id = m.team1_id OR t.team_id = m.team2_id
GROUP BY t.team_name
ORDER BY total_matches DESC;
-- Q6 — Top 5 Run Scorers Overall
SELECT p.player_name, t.team_name,
       SUM(b.runs) AS total_runs
FROM batting_stats b
JOIN players p ON b.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
GROUP BY p.player_name, t.team_name
ORDER BY total_runs DESC
LIMIT 5;
-- Q7 — Best Strike Rate (minimum 50 balls faced)
SELECT p.player_name, t.team_name,
       SUM(b.runs) AS total_runs,
       SUM(b.balls_faced) AS total_balls,
       ROUND((SUM(b.runs) / SUM(b.balls_faced)) * 100, 2) AS strike_rate
FROM batting_stats b
JOIN players p ON b.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
GROUP BY p.player_name, t.team_name
HAVING total_balls >= 50
ORDER BY strike_rate DESC;
-- Q8 — Most Sixes in 2023 Season
SELECT p.player_name, t.team_name,
       SUM(b.sixes) AS total_sixes
FROM batting_stats b
JOIN players p ON b.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
JOIN matches m ON b.match_id = m.match_id
WHERE m.season = 2023
GROUP BY p.player_name, t.team_name
ORDER BY total_sixes DESC;
-- Q9 — Bowlers with Most Wickets
SELECT p.player_name, t.team_name,
       SUM(bw.wickets) AS total_wickets,
       SUM(bw.overs) AS total_overs
FROM bowling_stats bw
JOIN players p ON bw.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
GROUP BY p.player_name, t.team_name
ORDER BY total_wickets DESC;
-- Q10 — Best Economy Rate (minimum 2 overs bowled)
SELECT p.player_name, t.team_name,
       SUM(bw.overs) AS total_overs,
       SUM(bw.runs_given) AS total_runs_given,
       ROUND(SUM(bw.runs_given) / SUM(bw.overs), 2) AS economy_rate
FROM bowling_stats bw
JOIN players p ON bw.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
GROUP BY p.player_name, t.team_name
HAVING total_overs >= 2
ORDER BY economy_rate ASC;

-- Q11 — Orange Cap Winner per Season (Most Runs)
SELECT season, player_name, team_name, total_runs
FROM (
    SELECT m.season, p.player_name, t.team_name,
           SUM(b.runs) AS total_runs,
           RANK() OVER (PARTITION BY m.season 
                        ORDER BY SUM(b.runs) DESC) AS rnk
    FROM batting_stats b
    JOIN players p ON b.player_id = p.player_id
    JOIN teams t ON p.team_id = t.team_id
    JOIN matches m ON b.match_id = m.match_id
    GROUP BY m.season, p.player_name, t.team_name
) ranked
WHERE rnk = 1;

-- Q12 — Purple Cap Winner per Season (Most Wickets)
SELECT season, player_name, team_name, total_wickets
FROM (
    SELECT m.season, p.player_name, t.team_name,
           SUM(bw.wickets) AS total_wickets,
           RANK() OVER (PARTITION BY m.season 
                        ORDER BY SUM(bw.wickets) DESC) AS rnk
    FROM bowling_stats bw
    JOIN players p ON bw.player_id = p.player_id
    JOIN teams t ON p.team_id = t.team_id
    JOIN matches m ON bw.match_id = m.match_id
    GROUP BY m.season, p.player_name, t.team_name
) ranked
WHERE rnk = 1;

-- Q13 — Players Who Scored 2+ Fifties (50+ runs in a match)
SELECT p.player_name, t.team_name,
       COUNT(*) AS fifties
FROM batting_stats b
JOIN players p ON b.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
WHERE b.runs >= 50
GROUP BY p.player_name, t.team_name
HAVING fifties >= 2
ORDER BY fifties DESC;

-- Q14 — Team Win % at Each Venue
SELECT t.team_name, m.venue,
       COUNT(*) AS total_matches,
       SUM(CASE WHEN m.match_winner_id = t.team_id THEN 1 ELSE 0 END) AS wins,
       ROUND(
           SUM(CASE WHEN m.match_winner_id = t.team_id THEN 1 ELSE 0 END) 
           / COUNT(*) * 100, 2
       ) AS win_percentage
FROM matches m
JOIN teams t ON t.team_id = m.team1_id OR t.team_id = m.team2_id
GROUP BY t.team_name, m.venue
HAVING total_matches > 1
ORDER BY win_percentage DESC;

-- Q15 — Head-to-Head Record Between Two Teams
SELECT 
    t_winner.team_name AS winner,
    COUNT(*) AS wins
FROM matches m
JOIN teams t1 ON m.team1_id = t1.team_id
JOIN teams t2 ON m.team2_id = t2.team_id
JOIN teams t_winner ON m.match_winner_id = t_winner.team_id
WHERE 
    (t1.team_name = 'Mumbai Indians' AND t2.team_name = 'Chennai Super Kings')
    OR
    (t1.team_name = 'Chennai Super Kings' AND t2.team_name = 'Mumbai Indians')
GROUP BY t_winner.team_name;

-- Q16 — Most Consistent Batsman (Highest Average Runs)
SELECT p.player_name, t.team_name,
       COUNT(b.stat_id) AS innings,
       SUM(b.runs) AS total_runs,
       ROUND(AVG(b.runs), 2) AS average_runs,
       MAX(b.runs) AS highest_score,
       MIN(b.runs) AS lowest_score
FROM batting_stats b
JOIN players p ON b.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
GROUP BY p.player_name, t.team_name
HAVING innings >= 2
ORDER BY average_runs DESC;

-- Q17 — All-Rounder Index (Batting + Bowling combined)
SELECT p.player_name, t.team_name,
       ROUND(AVG(b.runs), 2) AS avg_runs,
       ROUND(SUM(bw.wickets) / SUM(bw.overs), 2) AS wickets_per_over,
       ROUND(AVG(b.runs) + (SUM(bw.wickets) * 10), 2) AS allrounder_index
FROM players p
JOIN teams t ON p.team_id = t.team_id
JOIN batting_stats b ON p.player_id = b.player_id
JOIN bowling_stats bw ON p.player_id = bw.player_id
GROUP BY p.player_name, t.team_name
ORDER BY allrounder_index DESC;

-- Q18 — Matches Where Chasing Team Won
SELECT m.match_id, m.season, m.venue,
       t1.team_name AS batting_first,
       t2.team_name AS chasing_team,
       t_winner.team_name AS winner,
       m.win_by_wickets
FROM matches m
JOIN teams t1 ON m.team1_id = t1.team_id
JOIN teams t2 ON m.team2_id = t2.team_id
JOIN teams t_winner ON m.match_winner_id = t_winner.team_id
WHERE m.win_by_wickets > 0
ORDER BY m.win_by_wickets DESC;


-- Q19 — Season-wise Performance Trend of a Player
SELECT m.season,
       p.player_name,
       COUNT(b.stat_id) AS matches_played,
       SUM(b.runs) AS total_runs,
       ROUND(AVG(b.runs), 2) AS avg_runs,
       MAX(b.runs) AS best_score,
       SUM(b.sixes) AS total_sixes
FROM batting_stats b
JOIN players p ON b.player_id = p.player_id
JOIN matches m ON b.match_id = m.match_id
WHERE p.player_name = 'Virat Kohli'
GROUP BY m.season, p.player_name
ORDER BY m.season;

-- Q20 — Top Performer in Each Match (Man of the Match style)
SELECT match_id, player_name, team_name, runs, strike_rate
FROM (
    SELECT b.match_id, p.player_name, t.team_name,
           b.runs,
           ROUND((b.runs / b.balls_faced) * 100, 2) AS strike_rate,
           RANK() OVER (PARTITION BY b.match_id 
                        ORDER BY b.runs DESC) AS rnk
    FROM batting_stats b
    JOIN players p ON b.player_id = p.player_id
    JOIN teams t ON p.team_id = t.team_id
    WHERE b.balls_faced > 0
) ranked
WHERE rnk = 1
ORDER BY match_id;
