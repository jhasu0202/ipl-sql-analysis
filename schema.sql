CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(50),
    team_id INT,
    role VARCHAR(20),
    nationality VARCHAR(20),
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    season INT,
    match_date DATE,
    team1_id INT,
    team2_id INT,
    venue VARCHAR(50),
    toss_winner_id INT,
    match_winner_id INT,
    win_by_runs INT,
    win_by_wickets INT
);

CREATE TABLE batting_stats (
    stat_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    runs INT,
    balls_faced INT,
    fours INT,
    sixes INT,
    dismissed BOOLEAN
);

CREATE TABLE bowling_stats (
    stat_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    overs DECIMAL(4,1),
    runs_given INT,
    wickets INT,
    no_balls INT,
    wides INT
);
