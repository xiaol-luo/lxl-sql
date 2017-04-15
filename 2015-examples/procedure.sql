
drop procedure if exists `test_cursor`;
drop table if exists role;

create table role 
(
	role_id int(64) not null auto_increment,
	name varchar(128) not null default '',
	primary key (role_id)
);

insert into role (name) values ("a");
insert into role (name) values ("b");
insert into role (name) values ("c");
insert into role (name) values ("d");
insert into role (name) values ("e");

delimiter //

CREATE PROCEDURE `test_cursor`()
begin 
	declare role_id int default 0;
	declare name varchar(128) default '';
	declare done int default 0;
	declare role_cursor cursor for select * from role;
	declare continue handler for not found set done=1;

	open role_cursor;

	fetch role_cursor into role_id, name;
	while done=0 do 
		select role_id, name;
		fetch role_cursor into role_id, name;
	end while;

	close role_cursor;
end //

delimiter ;

call test_cursor;
