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
