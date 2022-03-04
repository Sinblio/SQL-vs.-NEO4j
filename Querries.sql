use test;

select retweet_count, textbody, screen_name, category, sub_category
from tweets join users using (screen_name)
where month_posted = 1 and year_posted = 2016
order by retweet_count desc
limit 5;

select hashtagname, count(*)
from	(select hashtagname, state, count(*)
		from tagged join tweets using (tid) join users using (screen_name)
		where state != "na" and state != "" and year_posted = 2016
		group by hashtagname, state) as innertable
group by hashtagname
order by count(*) desc
limit 5;

select distinct screen_name, state
from tagged join tweets using (tid) join users using (screen_name)
where hashtagname = 'HappyNewYear' or hashtagname = 'NewYear' or hashtagname = 'NewYears' or hashtagname = 'NewYearsDay'
order by followers desc
limit 12;

select screen_name, sub_category, followers
from users
where sub_category = 'GOP' or sub_category = 'Democrat'
order by followers desc
limit 5;

select hashtagname, group_concat(distinct state)
from tagged join tweets using (tid) join users using (screen_name)
where (state = 'Ohio' or state = 'Alaska' or state = 'Alabama') and year_posted = 2016 and month_posted = 1
group by hashtagname;

select textbody, hashtagname, screen_name, sub_category
from tagged join tweets using (tid) join users using (screen_name)
where sub_category in ('GOP', 'Democrat') and year_posted = 2016 and month_posted = 1 and hashtagname = 'Ohio'
limit 5;

select screen_name, state, group_concat(url, ",")
from url join tweets using (tid) join users using (screen_name)
where sub_category = 'GOP' and year_posted = 2016 and month_posted = 1
group by screen_name;

select mentioned_name,mentioned_location, group_concat(distinct screen_name)
from
(
	select screen_name as mentioned_name, state as mentioned_location, tid
	from mentioned join users using (screen_name)
) as mentioned_poeple join tweets using (tid) join users using (screen_name)
where sub_category = 'GOP' and year_posted = 2016 and month_posted = 1
group by mentioned_name
order by count(distinct screen_name) desc
limit 5;

select hashtagname, count(*)
from tagged join tweets using (tid) join users using (screen_name)
where sub_category = 'GOP' and year_posted = 2016 and month_posted in (1, 2, 3)
group by screen_name
order by count(*) desc
limit 5;