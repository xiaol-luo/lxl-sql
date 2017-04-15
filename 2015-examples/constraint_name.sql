drop table persons;
drop table orders;

create table persons
(
    person_id int(64) not null auto_increment,
    person_name varbinary(32) not null default '',
    identify int(64) not null default 0,

    constraint pk_persons primary key (person_id),
    constraint unique_persons_identify unique (identify),
);

create table orders
(
    order_id int(64) not null auto_increment,
    order_detail varbinary(128) not null default '',
    person_id int(64) not null default 0,

    constraint pk_orders primary key (order_id),
    constraint fk_person_id__orders_persons foreign key (person_id) references persons(person_id)
);

desc persons;
desc orders;

alter table orders drop key fk_person_id__orders_persons;

alter table persons drop index unique_persons_identify;

alter table persons change person_id person_id int(64) not null;
alter table persons drop primary key;

desc persons;
desc orders;

