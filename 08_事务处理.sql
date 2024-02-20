-- engines
show engines;

alter table stu engine = 'InnoDB';

-- begin transaction
begin;
insert into stu(sname, class_id, sex) values('刘洁', 2, 2);
insert into class(cname) values ('研究生');
commit;

start transaction;
insert into stu(sname, class_id, sex) values('李海', 2, 2);
rollback;

-- global transaction
set autocommit = 0;
insert into stu(class_id, sname, sex) values(2,'李华',1);
commit;


insert into stu(class_id, sname, sex) values(2,'李华2',1);
insert into stu(class_id, sname, sex) values(2,'李华3',1);
commit;