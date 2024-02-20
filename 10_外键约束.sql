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

-- 添加/删除 外键约束
alter table stu add constraint stu_class foreign key (class_id) references class(id) on delete cascade;

alter table stu drop foreign key stu_class;

-- cascade / set null / restrict | no action
alter table stu add constraint stu_class foreign key (class_id) references class(id) on delete set null;

insert into class(id, cname) values (10, 'kensyuu');
insert into stu (id, sname, class_id) values (20, 'zs', 10);

alter table stu add constraint stu_class foreign key (class_id) references class(id) on delete restrict;

delete from stu where id = 20;

alter table stu add constraint stu_class foreign key (class_id) references class(id) on delete no action;

-- cascade / set null / restrict | no action
alter table stu add constraint stu_class foreign key (class_id) references class(id) on delete cascade on update cascade;
