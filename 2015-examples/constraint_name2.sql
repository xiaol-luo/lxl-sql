drop table persons;
drop table orders;

create table persons
(
    person_id int(64) not null,
    person_name varbinary(32) not null default '',
    identify int(64) not null default 0
);

create table orders
(
    order_id int(64) not null,
    order_detail varbinary(128) not null default '',
    person_id int(64) not null default 0
);

alter table persons add primary key (person_id);
alter table persons change person_id person_id int(64) not null auto_increment;

alter table persons add unique unique_persons_identify(identify);
alter table orders add foreign key fk_person_id__orders_persons(person_id) references persons(person_id);

desc persons;
desc orders;

alter table orders drop key fk_person_id__orders_persons;

alter table persons drop index unique_persons_identify;

alter table persons change person_id person_id int(64) not null;
alter table persons drop primary key; 

desc persons;
desc orders;

