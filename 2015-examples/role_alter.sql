alter table role drop column role_attr;
desc role;

alter table role add column role_attr int not null default 0 ;
desc role;

alter table role modify role_attr varchar(1024) not null default '';
desc role;

alter table role change column role_attr role_attr2 varchar(768) not null default '';
desc role;

alter table role change column role_attr2 role_attr varchar(512) not null default '';
desc role;
