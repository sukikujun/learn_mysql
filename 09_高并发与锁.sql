-- row lock
--transaction1
begin;
update stu set sname = 'houdunren' where id = 2;
commit;
--transaction2
begin;
-- t1 未提交的时候，t2 update 将会阻塞，等 t1 commit 后，即可执行成功
update stu set sname = 'hdcms' where id = 2;
commit;

-- transaction1
set autocommit = 0;
--#字段没有索引的时候，锁住整个表
update stu set sname = 'houdunren' where sname = '刘玉';
-- rollback;

-- transaction2
begin;
-- lock
update stu set sname = 'houdunren' where sname = '刘玉';
-- 执行成功
update stu set sname = 'houdunren5' where sname = '李月';
commit;

-- 查询范围对锁的影响
set autocommit = 0;
update goods set num = 500 where id >= 1;
-- id=1 不影响
update goods set num = 500 where id > 1 and id < 5;
commit;

-- 悲观锁 for update
--transaction1
set autocommit = 0;
select * from goods where id = 1 for update;
update goods set num = 0 where id = 1;
commit;

--transaction2
set autocommit = 0;
select * from goods where id = 1 for update;
commit;

-- 乐观锁
--transaction1
set autocommit = 0;
select version from goods where id = 1;
update goods set num = num-100, version = version+1 where version = 0 and id = 1;
commit;

--transaction2
set autocommit = 0;
--阻塞，t1提交后，version不符合
update goods set num = num-100, version = version+1 where version = 0 and id = 1;

-- Lock Read/Write
--t1
lock table goods read;
select * from goods;
insert into goods(name, num) values('pixel', 100);
unlock tables;

lock table goods write;
select * from goods;
unlock tables;

--t2
-- t1 unlock之前将被挂起，释放锁之后才执行
insert into goods(name, num) values('pixel', 200);