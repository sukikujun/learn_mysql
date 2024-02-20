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

