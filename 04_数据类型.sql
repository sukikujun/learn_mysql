--- string function

show charset;
select left(cname, 2), right(cname, 2), mid(cname, 2, 1) from class;
--insert into class(cname) values('aliyun.com/1.mp4'),('aliyun.com/2.mp4');
desc class;
--alter table class modify cname varchar(100) not null;
update class set cname = concat('https://www.yahoo.com', mid(cname, 10)) where id >= 5;

select substring(cname, 2) from class;
select char_length(cname) from class;
select concat('No:', id) as id, concat('class:', cname) from class;

select if(char_length(cname) > 8, concat(left(cname, 8), '...'), cname) as cname from class;

-- regexp
select * from class where cname regexp '^.h';
select * from class where description regexp 'php|mysql';

update class set cname = replace(cname, cname, concat('LX:', cname)) where description regexp 'php|mysql';

select * from class where cname like '_t%';

select * from class;

alter table class add status tinyint;
desc class;
-- Out of range value for column 'status' at row 1
update class set status = 200 where id = 6;
-- 无符号整数
alter table class add stat tinyint unsigned;
update class set stat = 200 where id = 6;

-- #zerofill
alter table class add status int(5) zerofill;
update class set status = 123 where id = 6;
-- 00123, GUI不显示，通过 mysql> 可以查验
select * from class;

-- #float & decimal
alter table class add a float(10, 2);
update class set a = 992345.99 where id = 6;
alter table class add b decimal(10, 2);
update class set b = 992345.99 where id = 6;

-- #enum
create table stu(
    id int not null primary key auto_increment,
    sname varchar(100) not null,
    class_id int null,
    birthday datetime null,
    updated_at timestamp not null,
    gender tinyint
);

desc stu;
update stu set gender = null;
alter table stu modify gender ENUM('male', 'female') default NULL;

insert into stu(sname, class_id, gender) values('sahiro', 2, 'Female');
insert into stu(sname, class_id, gender) values('mememori', 2, 2);


select *, if(gender=1, '男同学', '女同学') from stu where id <= 12;
