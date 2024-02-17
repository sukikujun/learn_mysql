-- nature join
select s.sname, c.cname
from stu as s, class as c
where s.class_id = c.id
