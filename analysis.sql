#analysis_queries

#Matches per season
SELECT YEAR(date) AS season, COUNT(*) AS total_matches
FROM matches
GROUP BY season
ORDER BY season;

#Most successful teams
SELECT winner, COUNT(*) AS total_wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY total_wins DESC;

#Top run scorers
SELECT batsman, SUM(batsman_runs) AS runs
FROM deliveries
GROUP BY batsman
ORDER BY runs DESC
LIMIT 10;

#Top wicket takers
SELECT bowler, COUNT(*) AS wickets
FROM deliveries
WHERE is_wicket = 1 
AND dismissal_kind NOT IN ('run out', 'retired hurt', 'obstructing the field')
GROUP BY bowler
ORDER BY wickets DESC
LIMIT 10;

#Man of the match leaders
SELECT player_of_match, COUNT(*) AS awards
FROM matches
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 10;

#Toss impact analysis
SELECT 
  COUNT(*) AS total_matches,
  SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) AS matches_won_after_toss,
  ROUND(SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS win_percentage
FROM matches;

#Match impact batsmen
SELECT batsman, SUM(batsman_runs) AS pressure_runs
FROM deliveries d
JOIN matches m ON d.id = m.id
WHERE inning = 2 AND m.result = 'runs'
GROUP BY batsman
ORDER BY pressure_runs DESC
LIMIT 10;

#Bowler consistency
SELECT bowler, COUNT(DISTINCT id) AS matches_with_wickets
FROM deliveries
WHERE is_wicket = 1
AND dismissal_kind NOT IN ('run out', 'retired hurt', 'obstructing the field')
GROUP BY bowler
ORDER BY matches_with_wickets DESC
LIMIT 10;

#Venue match count
SELECT venue, COUNT(*) AS matches_played, 
       MAX(winner) AS most_common_winner
FROM matches
GROUP BY venue
ORDER BY matches_played DESC;
