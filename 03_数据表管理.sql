--# alter & rename
alter table stu rename stus;
rename table stus to stu;

--create table stu_bak select * from stu;
alter table stu_bak charset gbk;
-- 一条一条删除数据
delete from stu_bak;
-- 直接删除所有数据
truncate stu_bak2;

drop table if exists stu_bak;

-- 
--create table stu2 select * from stu;
desc stu2;
-- change modify
alter table stu2 modify sname varchar(40) not null;
alter table stu2 change sname name char(30) not null;

-- after first
alter table stu2 add gender smallint default null;
alter table stu2 add email varchar(50) default  null after id;
alter table stu2 add uuid varchar(64) default  null first;
-- drop column
alter table stu2 drop gender;

-- drop pk
desc stu2;
alter table stu2 modify id int not null;
alter table stu2 drop primary key;
-- add pk
alter table stu2 modify id int not null auto_increment, add primary key(id);
