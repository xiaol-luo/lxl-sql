drop table persons;
drop table orders;

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

desc persons;
desc orders;

show create table persons;
show create table orders;

alter table orders drop key person_id;

alter table persons drop index identify;

alter table persons change person_id person_id int(64) not null;
alter table persons drop primary key;

desc persons;
desc orders;



