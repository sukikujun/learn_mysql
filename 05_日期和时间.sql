
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

-- date 
select * from stu where birthday between '1990-01-01' and '1999-12-31';

select * from stu where birthday = (
    select birthday from stu order by birthday desc limit 1
);
select * from stu where class_id in (1, 2) and YEAR(birthday) = 1999;

select count(id) as total, class_id from stu 
where YEAR(birthday) >= 1990 and YEAR(birthday) <= 2000
group by class_id
order by total desc
limit 1;

select count(id) as total, class_id from stu
where timestampdiff(YEAR, birthday, now()) > 20 and gender = 2
group by class_id
order by total desc 
limit 1;

select timestampdiff(YEAR, birthday, NOW()) from stu;

-- #addtime() timestamp() date_add() date_sub()
select addtime(now(), '08:00:00');
select timestamp(now(), '08:00:00');

select date_add(now(), interval 10 year);

select date_add(now(), interval "10:22" HOUR_MINUTE);

select date_sub(now(), interval "3 12" DAY_HOUR);

-- last_day
select last_day(now());

select date_sub(now(), interval dayofmonth(now()) - 1 day);

-- 月初月末计算
select * from article
where publish_time <= last_day(now())
and publish_time >= date_sub(now(), interval dayofmonth(now())-1 day);

select * from article where publish_time >= date_sub(now(), interval 3 month);

select * from article where publish_time >= date_format(date_sub(now(), interval 3 month), '%Y-%m-01');

select last_day(date_sub(now(), interval 1 month));

select date_add(last_day(now()), interval 1 day);

-- week
select * from stu where birthday <= date_sub(now(), interval 20 year);

select date_add(now(), interval 1-dayofweek(now()) day);

select date_sub(date_add(now(), interval 1-weekday(now()) day), interval 21 day);

set @week = date_sub(now(), interval 1 week);
select @week;
select date_add(@week, interval 0-weekday(@week) day);

--attendance
create table attendance(
    id int not null primary key auto_increment,
    stu_id int not null,
    created_at datetime not null
) charset utf8mb4;

insert into attendance(stu_id, created_at) values(1, '2024-2-15 08:22:00'),(2, '2024-2-15 09:22:00'),(3, '2024-2-15 07:22:00'),(4, '2024-2-15 10:55:00'),(5, '2024-2-15 07:15:00'),(6, '2024-2-16 11:15:00'),(7, '2024-2-10 08:22:00'),(8, '2024-2-11 08:15:00');
select * from attendance;

select * from attendance where created_at >=  date_sub(now(), interval dayofmonth(now()) - 1 day);
select time(now()), now();

select stu_id, count(id) from attendance
where time(created_at) > '08:30:00'
and date(created_at) > date(date_sub(now(), interval dayofmonth(now())-1 day))
group by stu_id
having count(id) >= 2;

--week
select date_add(now(), interval 0-weekday(now()) day);

select * from attendance
where date(created_at) >= date(date_add(now(), interval 0-weekday(now()) day))
and time(created_at) >= '09:00:00';

set @week = date_sub(now(), interval 1 week);
select @week;

select * from attendance
where date(created_at) >= date(date_add(@week, interval 0-weekday(@week) day))
and date(created_at) <= date(date_add(@week, interval 4-weekday(@week) day))
and time(created_at) > '08:30:00';

select date(date_add(@week, interval 0-weekday(@week) day)), date(date_add(@week, interval 4-weekday(@week) day));
