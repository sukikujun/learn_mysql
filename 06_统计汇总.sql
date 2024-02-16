--DESC ASC
select * from stu order by gender desc;

select * from stu where gender = 2 order by id desc limit 1;

select * from stu order by gender desc, birthday desc;