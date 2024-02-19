-- nature join
select s.sname, c.cname
from stu as s, class as c
where s.class_id = c.id

-- inner join
select * from stu as s inner join class as c on s.class_id = c.id;

select * from stu as s inner join stu_info as si on s.id = si.stu_id;

-- 小学的学生
select * from stu as s inner join class as c on s.class_id = c.id where c.cname = '小学';

select c.id, count(*) from stu as s inner join class as c on s.class_id = c.id inner join article as a on s.id = a.stu_id group by c.id;

-- 大学班级 女生发表的文章
select a.title, s.sname, s.sex, c.cname from stu as s inner join class as c inner join article as a on s.class_id = c.id and s.id = a.stu_id where s.sex = '女' and c.cname = '大学'

-- 班级发布文章大于等于2篇
select c.id, c.cname, count(*) times from stu as s inner join class as c on s.class_id = c.id inner join article as a on s.id = a.stu_id group by c.id having times >= 2;

-- 每个班级的文章平均点击数与总点击数
select c.id, c.cname, SUM(click), AVG(click) from stu as s inner join class as c on s.class_id = c.id inner join article as a on s.id = a.stu_id group by c.id;

-- left/right join
--#not bind qq students
select s.id, s.sname, si.qq from stu as s left join stu_info as si on s.id = si.stu_id where si.qq is null;

--#not publish article students
select s.id, s.sname, a.id, a.title from stu as s left join article as a on s.id = a.stu_id where a.id is null;

--#not student's class
select c.cname from stu as s right join class as c on s.class_id = c.id where s.id is null;

--#class name null -> 无
select s.sname, if(c.id, c.cname, '无') from stu as s left join class as c on s.class_id = c.id;

--self join
select sname from stu where class_id = (select class_id from stu where sname = '后盾人') and sname <> '后盾人';

select s2.sname from stu as s1 join stu as s2 on s1.class_id = s2.class_id where s1.sname = '后盾人' and s2.sname <> '后盾人';

select s2.sname from stu as s1 join stu as s2 on YEAR(s1.birthday) = YEAR(s2.birthday) where s1.sname = '后盾人' and s2.sname <> '后盾人';

select s2.sname from stu as s1 join stu as s2 on YEAR(s1.birthday) > YEAR(s2.birthday) where s1.sname = '后盾人';

-- m:n 多对多
select s.sname, l.name from stu as s inner join stu_lesson as sl inner join lesson as l on s.id = sl.stu_id and l.id = sl.lesson_id where s.sname = '后盾人';

select s.sname, sl.lesson_id from stu as s inner join stu_lesson as sl on s.id = sl.stu_id  where s.sname = '后盾人';

--#哪个班最喜欢PHP
select class_id, count(*) times from stu as s inner join stu_lesson as sl inner join lesson as l on s.id = sl.stu_id and l.id = sl.lesson_id where l.name = 'PHP' group by s.class_id order by times desc limit 1;

-- union
(select sname from stu limit 3) union all (select cname from class limit 3) order by rand() limit 2;

--#年龄最大和年龄最小的学生
(select * from stu where birthday is not null order by birthday asc limit 1) union all (select * from stu where birthday is not null order by birthday desc limit 1);

--#最新发布的文章和学生学习的课程组合网站的最新动态
(select concat(s.sname, '发表了: ', a.title) from article as a join stu as s on s.id = a.stu_id order by a.id desc limit 3) union all (select concat(s.sname, '正在学习: ', l.name) from stu as s inner join stu_lesson as sl inner join lesson as l on s.id = sl.stu_id and l.id = sl.lesson_id limit 3) order by rand();
