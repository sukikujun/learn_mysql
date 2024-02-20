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



