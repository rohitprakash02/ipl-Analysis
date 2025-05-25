show databases;
use ipl_analysis;

CREATE TABLE matches (
    id INT PRIMARY KEY,
    city VARCHAR(255),
    date DATE,
    player_of_match VARCHAR(255),
    venue VARCHAR(255),
    neutral_venue INT,
    team1 VARCHAR(255),
    team2 VARCHAR(255),
    toss_winner VARCHAR(255),
    toss_decision VARCHAR(50),
    winner VARCHAR(255),
    result VARCHAR(50),
    result_margin INT,
    eliminator VARCHAR(50),
    method VARCHAR(50),
    umpire1 VARCHAR(255),
    umpire2 VARCHAR(255)
);

CREATE TABLE deliveries (
    id INT,
    inning INT,
    `over` INT,
    ball INT,
    batsman VARCHAR(255),
    non_striker VARCHAR(255),
    bowler VARCHAR(255),
    batsman_runs INT,
    extra_runs INT,
    total_runs INT,
    is_wicket INT,
    dismissal_kind VARCHAR(255),
    player_dismissed VARCHAR(255),
    fielder VARCHAR(255),
    extras_type VARCHAR(255),
    batting_team VARCHAR(255),
    bowling_team VARCHAR(255),
    FOREIGN KEY (id) REFERENCES matches(id)
);

#import_data

LOAD DATA LOCAL INFILE '/home/rohit/ipl/matches.csv'
INTO TABLE matches
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/home/rohit/ipl/deliveries.csv'
INTO TABLE deliveries
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


