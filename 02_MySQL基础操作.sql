-- 创建数据库
create database shop charset utf8;

-- 查看数据库
show databases;

-- 删除数据库
drop database if exists shop;

-- 显示数据库创建命令
show create database shop;

-- 导入 sql 
source 1.sql

-- 创建表
create table class(
    id int primary key AUTO_INCREMENT,
    cname varchar(30) not null,
    description varchar(100) null
) charset utf8;

-- 查看表结构
desc class;

-- 删除表
drop table if exists class; 

-- 插入数据
insert into class set cname = 'php', description = 'learn php';
insert into class(cname, description) values('linux', '服务器知识'),('MySQL', '数据库学习'),('JS', null);

-- 复制表结构
create table class_bak like class;
desc class_bak;

-- 复制表数据
insert into class_bak select * from class;
insert into class_bak(cname) select cname from class;

--select * from class_bak;

-- 复制表结构及数据
create table class_by_create select * from class;
--select * from class_by_create;

create table cb1(id int primary key auto_increment, cname varchar(30)) select cname from class;
--select * from cb1;

-- column different as 
create table cb2(id int primary key auto_increment, name varchar(30)) select cname as name from class;
-- select * from cb2;

--#Select
-- as 别名
select id, cname as `name` from class; 

--where
select * from class where description not like '%p%' and id > 2;

create table stu(id int primary key auto_increment, sname char(10), class_id int default null, age smallint not null);
insert into stu(sname, class_id, age) values ('Tom', 1, 20),('Jack', 2, 22),('Royal', 3, 23),('Farly', 2, 24),('Mikey', null, 19);

-- select * from stu;

select * from stu where class_id = 2 and sname like '%F%';

select distinct class_id from stu;

--# between end
select * from stu where age >= 20 and age <= 22;
select * from stu where age not between 20 and 22;

--# IN
select * from stu where class_id = 2 or class_id = 3;
select * from stu where class_id not in (2, 3);

--# NULL
select * from stu where class_id is null;
select sname, if(class_id, class_id, '未分配') from stu;
select sname, ifnull(class_id, '未分配') from stu;

--asc desc
select * from stu order by age asc;
select * from stu order by class_id asc, age desc;

--limit
select * from stu order by id asc limit 1, 2;
-- 只能查出一条
select * from stu where class_id = 2 and age is not null order by age asc limit 1;
select * from stu where age = (select age from stu where class_id = 2 and age is not null order by age asc limit 1);

--# Update
update stu set class_id = 2 where class_id is null;

update stu set class_id = 1 where age < 20;

update stu set age = age+10 where class_id = 1 and age < 20;
--select * from stu;

--# Delete
delete from stu where age > 25 and class_id is null;
delete from stu order by id desc limit 2;