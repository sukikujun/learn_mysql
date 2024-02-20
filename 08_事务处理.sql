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

-- php transaction
/*
<?php
$config = [
  'host' => 'host[:port]',
  'user' => 'root',
  'password' => 'password',
  'database' => 'database',
  'charset' => 'utf8'
];

$dns = sprintf("mysql:host=%s;dbname=%s;charset=%s", $config['host'],
  $config['database'], $config['charset']);

echo $dns.'<br />';

try {
  $pdo = new PDO($dns, $config['user'], $config['password']);
  echo 'connect success!<br />';
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  die($e->getMessage());
}

try {
  $pdo->beginTransaction();
  $pdo->exec("insert into stu(class_id, sname, sex) values(2, '蛻倡脂', 2);");
  if (true) {
    throw new Exception('not update role.');
  }
  $pdo->exec("update stu set sname = 'houdunren' wherer id = 12;");
  $pdo->commit();
} catch (Exception $e) {
  $pdo->rollBack();
  die($e->getMessage());
}
*/

-- isolation
set session transaction isolation level read committed;
select @@tx_isolation;

begin;
update stu set sname = 'houdunren' where id = 1;
rollback;
commit;

--#不可重复读
set session transaction isolation level read committed;
select @@tx_isolation;

begin;
update stu set sname = 'houdunren2' where id = 1;
-- rollback;
commit;
