show databases;

-- #Datetime 
alter table stu add birthday datetime default null;

-- date_format()
select sname, date_format(birthday, '%Y-%m-%d %h:%i:%s') from stu;
select sname, time_format(birthday, '%h:%i:%s') from stu;

-- timestamp
alter table stu add updated_at timestamp default current_timestamp;
update stu set updated_at = '2024-02-16 12:13:14';
