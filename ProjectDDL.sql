CREATE DATABASE  IF NOT EXISTS test;
use test;

drop table if exists url;
drop table if exists tagged;
drop table if exists mentioned;
drop table if exists tweets;
drop table if exists users;
  
create table users (
name varchar(50),
screen_name varchar(50),
followers int,
following int,
category varchar(25),
sub_category varchar(10),
location varchar(25),
state varchar(25),
primary key (screen_name)
);

CREATE TABLE tweets (
tid bigint NOT NULL,
textbody text,
retweet_count int DEFAULT NULL,
retweeted tinyint DEFAULT NULL,
day_posted int DEFAULT NULL,
month_posted int DEFAULT NULL,
year_posted int default NULL,
screen_name varchar(50),
PRIMARY KEY (tid),
foreign key (screen_name) references users(screen_name)
);

create table url (
urlid int not null auto_increment,
tid bigint NOT NULL,
url text,
primary key (urlid),
foreign key (tid) references tweets(tid)
);

create table tagged (
tagid int not null auto_increment,
tid bigint NOT NULL,
hashtagname text,
primary key (tagid),
foreign key (tid) references tweets(tid)
);

create table mentioned (
mentionid int not null auto_increment,
tid bigint NOT NULL,
screen_name varchar (50),
primary key (mentionid),
foreign key (tid) references tweets(tid),
foreign key (screen_name) references users(screen_name)
);