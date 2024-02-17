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
-- filed()
select field('a', 'c', 'a', 'b'); -- a 的 索引
select sname,
    left(sname, 1) as s
from stu
order by FIELD(s, 'n', 'm') desc;

-- count()
select count(*) from stu;
select count(*), gender from stu where gender = 2;

select count(*) from stu where class_id is not null;
--不会统计NULL
select count(class_id) from stu;

-- MIN() MAX()
select class_id from stu
where class_id is not null
order by class_id desc
limit 1;

select MAX(class_id) from stu;
select MIN(class_id) from stu;

-- age least
select year(max(birthday)) from stu;

select min(click) from article;
select * from article where click = (
    select min(click) from article
);
