truncate table persons;
truncate table orders;

insert into persons (person_name, identify) values ("xiaol_luo_1", 1001);
insert into persons (person_name, identify) values ("xiaol_luo_12", 1002);
insert into persons (person_name, identify) values ("aiaol_zuo_3", 1003);
insert into persons (person_name, identify) values ("biaol_xuo_4", 1004);

insert into orders (order_detail, person_id) values ("order_1_person_1", 1);
insert into orders (order_detail, person_id) values ("order_2_person_1", 1);
insert into orders (order_detail, person_id) values ("order_3_person_2", 2);
insert into orders (order_detail, person_id) values ("order_4_person_2", 2);
insert into orders (order_detail, person_id) values ("order_5_person_3", 3);
insert into orders (order_detail, person_id) values ("order_6_person_4", 4);
insert into orders (order_detail, person_id) values ("order_7_person_5", 5);
insert into orders (order_detail, person_id) values ("order_8_person_6", 6);

select * from persons;
select * from orders;

-- like
-- % one or more charactor
-- - one charactor
select person_name from persons where person_name like 'xiao%1';
select person_name from persons where person_name like 'xiao_%_1_';

-- rlike
-- regexp way to use 
select person_name from persons where person_name rlike '^[ab].*';
select person_name from persons where person_name rlike '.*1$';
select person_name from persons where person_name rlike '^[^b].*';

-- group by
select sum(order_id) from orders group by person_id;

-- min
select min(order_id) into @min_order_id from orders;
select * from orders where order_id = @min_order_id;

-- max
select max(order_id) into @max_order_id from orders;
select * from orders where order_id = @max_order_id;

-- top
select * from orders order by order_id asc limit 2;
select * from orders order by order_id desc limit 2;

-- in
select * from persons where person_id in (2, 3);

select min(person_id) into @min_person_id from persons;
select max(person_id) into @max_person_id from persons;
select * from persons where person_id in (@max_person_id, @min_person_id);


-- between
select * from persons where person_id between @min_person_id + 1 and @max_person_id;

-- alias
select p.person_id as pp_id, o.person_id as op_id, o.order_detail from \
persons as p, orders as o;


-- inner join 
select persons.person_id, orders.person_id as orders_person_id, orders.order_id, orders.order_detail from \
persons inner join orders on persons.person_id = orders.person_id;

-- left join
select persons.person_id, orders.person_id as orders_person_id, orders.order_id, orders.order_detail from \
persons left join orders on persons.person_id = orders.person_id;

-- right join
select persons.person_id, orders.person_id as orders_person_id, orders.order_id, orders.order_detail from \
persons right join orders on persons.person_id = orders.person_id;

-- my sql not support full join 

-- union  no allow dumplicate
select person_name from persons where person_id = 1 union \
select person_name from persons where person_id = 1;

-- union  allow dumplicate
select person_name from persons where person_id = 1 union all \
select person_name from persons where person_id = 1;

-- create view
create view view_person_order as 
select orders.person_id as op_id, persons.person_id, persons.person_name, orders.order_id, orders.order_detail from 
persons right join orders on persons.person_id = orders.person_id;

select * from view_person_order;
select * from view_person_order where op_id = 2;

-- null
select * from view_person_order where person_id is null;
select * from view_person_order where person_id is not null;


drop view view_person_order;


-- having
select person_id, sum(order_id) from orders 
where person_id >= 1
group by person_id; 

select person_id, sum(order_id) from orders 
where person_id >= 1
group by person_id 
having sum(order_id > 5);

-- distinct
select * from orders;
select distinct person_id from orders;

-- count 
select count(*) from orders;
select count(person_id) from orders;
select count(distinct person_id) from orders;
