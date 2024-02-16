show databases;

-- #Datetime 
alter table stu add birthday datetime default null;

-- date_format()
select sname, date_format(birthday, '%Y-%m-%d %h:%i:%s') from stu;
select sname, time_format(birthday, '%h:%i:%s') from stu;