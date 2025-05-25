#Create view: top scorers
CREATE VIEW top_scorers AS
SELECT batsman, SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batsman
ORDER BY total_runs DESC;

SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';SELECT * FROM top_scorers;