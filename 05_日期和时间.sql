
-- #Datetime 
alter table stu add birthday datetime default null;

-- date_format()
select sname, date_format(birthday, '%Y-%m-%d %h:%i:%s') from stu;
select sname, time_format(birthday, '%h:%i:%s') from stu;

-- timestamp
alter table stu add updated_at timestamp default current_timestamp;
update stu set updated_at = '2024-02-16 12:13:14';

-- YEAR() MONTH() DAY() HOUR() MINUTE() SECOND() 
select YEAR(birthday), MONTH(birthday), DAY(birthday), HOUR(birthday), MINUTE(birthday), SECOND(birthday) from stu;
-- NOW() CURRENT_DATE() CURRENT_TIME()
select NOW(), CURRENT_DATE(), CURRENT_TIME();
-- DAYOFWEEK() [1,7] WEEKDAY() [0,6]
select DAYOFWEEK(NOW()), WEEKDAY(NOW());

select * from article where status = 0 and publish_time < NOW();
update article set status = 1 where status = 0 and publish_time < NOW();

-- time diff
set @time = time(now());
select @time;
select time_to_sec(@time), sec_to_time(time_to_sec(@time));

select to_days(now()), from_days(to_days(now()));

select datediff(now(), birthday) from stu;
select timediff(time(now()), time(birthday)) from stu;

select timestampdiff(YEAR, birthday, now()) from stu;

