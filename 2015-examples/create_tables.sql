drop table role;
drop table persons;
drop table orders;

Create table role
(
    role_id int(64) not null auto_increment ,
    role_name varchar(32) not null default '',
    role_attr varchar(1024) not null default '',
    primary key (role_id) 
);

create table persons
(
    person_id int(64) not null auto_increment,
    person_name varbinary(32) not null default '',
    identify int(64) not null default 0,

    primary key (person_id),
    unique (identify)
);

create table orders
(
    order_id int(64) not null auto_increment,
    order_detail varbinary(128) not null default '',
    person_id int(64) not null default 0,

    primary key (order_id),
    foreign key (person_id) references persons(person_id)
);

desc role;
desc persons;
desc orders;
