--DESC ASC
select * from stu order by gender desc;

select * from stu where gender = 2 order by id desc limit 1;

select * from stu order by gender desc, birthday desc;

--rand()
select * from stu
order by rand() desc limit 1;

select sname, birthday, month(birthday) as m from stu order by m desc;

select sname, birthday, mid(birthday, 6, 2) as m from stu where birthday is not null order by m;

select * from stu where year(birthday) > 1990 order by birthday asc limit 1;

-- SUM() AVG()
select SUM(click) from article;
select AVG(click) from article;

select * from article where click < (select AVG(click) from article);

select round(avg(timestampdiff(year,birthday,now()))) as age from stu;

-- DISTINCT
select distinct class_id from stu where class_id is not null;

select count(distinct class_id, sname) from stu where class_id is not null;

-- group by
select count(class_id), class_id from stu where class_id is not null and gender = 1 group by class_id;

select MIN(birthday), class_id from stu group by class_id;

select * from stu where birthday in (select min(birthday) from stu group by class_id) and birthday is not null;

-- having 
select count(*), class_id, gender from stu group by class_id, gender;

select count(*), class_id, gender from stu where class_id is not null group by class_id, gender order by class_id desc;

select class_id, count(*) as c from stu group by class_id having c >= 2;