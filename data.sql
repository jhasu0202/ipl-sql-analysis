INSERT INTO teams VALUES
(1, 'Mumbai Indians', 'Mumbai'),
(2, 'Chennai Super Kings', 'Chennai'),
(3, 'Royal Challengers Bangalore', 'Bangalore'),
(4, 'Kolkata Knight Riders', 'Kolkata'),
(5, 'Delhi Capitals', 'Delhi');

INSERT INTO players VALUES
(1, 'Rohit Sharma', 1, 'Batsman', 'Indian'),
(2, 'Virat Kohli', 3, 'Batsman', 'Indian'),
(3, 'MS Dhoni', 2, 'Batsman', 'Indian'),
(4, 'Jasprit Bumrah', 1, 'Bowler', 'Indian'),
(5, 'Ravindra Jadeja', 2, 'All-rounder', 'Indian'),
(6, 'KL Rahul', 5, 'Batsman', 'Indian'),
(7, 'Andre Russell', 4, 'All-rounder', 'West Indian'),
(8, 'Pat Cummins', 4, 'Bowler', 'Australian'),
(9, 'Faf du Plessis', 3, 'Batsman', 'South African'),
(10, 'Hardik Pandya', 1, 'All-rounder', 'Indian');

INSERT INTO matches VALUES
(1, 2023, '2023-04-01', 1, 2, 'Wankhede Stadium', 1, 1, 15, 0),
(2, 2023, '2023-04-03', 3, 4, 'Chinnaswamy Stadium', 3, 4, 0, 5),
(3, 2023, '2023-04-05', 2, 5, 'Chepauk Stadium', 2, 2, 20, 0),
(4, 2023, '2023-04-07', 1, 3, 'Wankhede Stadium', 1, 3, 0, 3),
(5, 2023, '2023-04-09', 4, 5, 'Eden Gardens', 5, 5, 0, 6),
(6, 2022, '2022-04-02', 1, 4, 'Wankhede Stadium', 4, 1, 10, 0),
(7, 2022, '2022-04-04', 2, 3, 'Chepauk Stadium', 2, 2, 25, 0),
(8, 2022, '2022-04-06', 5, 3, 'Kotla Stadium', 3, 3, 0, 4),
(9, 2022, '2022-04-08', 1, 2, 'Wankhede Stadium', 1, 2, 0, 2),
(10, 2022, '2022-04-10', 4, 3, 'Eden Gardens', 4, 4, 8, 0);

INSERT INTO batting_stats VALUES
(1, 1, 1, 83, 54, 8, 4, true),
(2, 1, 3, 45, 38, 3, 2, false),
(3, 2, 2, 72, 48, 6, 3, true),
(4, 2, 7, 65, 28, 4, 6, true),
(5, 3, 5, 38, 30, 2, 1, false),
(6, 4, 2, 91, 55, 7, 5, true),
(7, 4, 1, 55, 42, 4, 2, true),
(8, 5, 6, 48, 36, 3, 2, true),
(9, 6, 1, 67, 44, 5, 3, true),
(10, 7, 3, 70, 50, 6, 2, false),
(11, 8, 9, 58, 40, 4, 3, true),
(12, 9, 10, 40, 25, 2, 3, true),
(13, 10, 7, 80, 35, 5, 7, true),
(14, 3, 6, 55, 45, 4, 1, true),
(15, 6, 9, 44, 33, 3, 2, false);

INSERT INTO bowling_stats VALUES
(1, 1, 4, 4.0, 28, 3, 0, 1),
(2, 2, 8, 3.0, 22, 2, 1, 0),
(3, 3, 5, 4.0, 31, 1, 0, 2),
(4, 4, 4, 4.0, 19, 2, 0, 0),
(5, 5, 8, 3.0, 35, 0, 2, 1),
(6, 6, 4, 4.0, 24, 3, 0, 0),
(7, 7, 5, 4.0, 27, 2, 1, 1),
(8, 8, 4, 3.0, 18, 2, 0, 0),
(9, 9, 8, 4.0, 33, 1, 0, 2),
(10, 10, 5, 4.0, 29, 3, 0, 1);
