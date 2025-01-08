SELECT * FROM sys.sys_config;
create database prathap;
use prathap;
show tables;
select * from customer;
create table orders (oid int primary key,product varchar(25),cid int, foreign key (cid) references customer (cid),total int);
CREATE TABLE orderlogs (
    olid INT PRIMARY KEY auto_increment, 
    oid INT, 
    cid INT, 
    date DATE, 
    FOREIGN KEY (oid) REFERENCES orders(oid),
    FOREIGN KEY (cid) REFERENCES orders(cid)
);
drop table orderlogs;

delimiter $$
use prathap $$
create trigger after_insert_orders1
after insert on orders
for each row
begin
insert into orderlogs(oid,cid,date) values (new.oid,new.cid,now());
end;
&&
delimiter ;

show triggers;

drop trigger after_insert_orders1;

select * from orderlogs;
alter table orders add auto_increment(olid);

delimiter $$
use prathap $$
create trigger after_insert
after insert on orders
for each row 
begin 
insert into orderslogs(oid,cid,date) values(new.oid,new.cid,now());
end;
$$
delimiter ;

drop trigger before__update;

insert into orders (oid,product,cid,total) values(6,'gun',102,800);

