USE test;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dataCSV/user.csv'
INTO TABLE users
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(screen_name, name, sub_category, category, state, followers, following);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dataCSV/tweets.csv'
INTO TABLE tweets
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid, textbody, retweet_count, retweeted, @col5, screen_name)
set day_posted= day(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')),
month_posted= month(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')),
year_posted= year(str_to_date(@col5, '%Y-%m-%d %H:%i:%s'));

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dataCSV/urlused.csv'
INTO TABLE url
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid, url);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dataCSV/tagged.csv'
INTO TABLE tagged
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid, hashtagname);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dataCSV/mentioned.csv'
INTO TABLE mentioned
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid, screen_name);