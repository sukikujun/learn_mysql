-- 创建外键约束
drop table if exists stu2;
create table stu2 (
    id int primary key auto_increment,
    sname char(30) not null,
    class_id int default null,
    constraint stu2_class
    foreign key (class_id)
    references class(id)
    on delete cascade
) engine=InnoDB default charset=utf8mb4;
