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
