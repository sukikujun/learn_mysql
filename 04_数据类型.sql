--- string

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

select * from class;
