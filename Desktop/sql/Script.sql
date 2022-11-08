create table salary(
	id serial primary key,
--	в mysql autoincrement
	monthly_salary int not null
);

insert into salary(monthly_salary)
values (500), 
	   (700),
	   (1000),
	   (1200),
	   (1400),
	   (1500);

update salary 
set monthly_salary = 750
where id = 1;

delete from salary 
where id = 8


create table roles (
	id serial primary key,
	role_title varchar (50) unique not null
);

insert  into roles (role_title)
values ('Junior_QA'),
		('Middle_QA'),
		('Senior_QA'),
		('Junior_JS_developer'),
		('Middle_JS_developer'),
		('Senior_JS_developer');


create table roles_salary(
	id serial primary key,
	id_role int not null,
	id_salary int not null,
	foreign key (id_role)
		references roles(id),
	foreign key (id_salary)
		references salary(id)
);


alter table roles
add column parking int;

alter table roles
rename column parking to taxi;

alter table roles 
drop column taxi;





insert into roles_salary(id_role, id_salary)
values (6, 11);

--select * from salary;
select * from roles ;
--select * from roles_salary;


