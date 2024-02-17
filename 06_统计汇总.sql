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
