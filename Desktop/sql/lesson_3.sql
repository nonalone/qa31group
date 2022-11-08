create table City( 
	id serial primary key,
	city_name varchar(40) unique not null
)

create table Person(
	id serial primary key,
	person_name varchar(40),
	city_id int not null
)

insert into City (city_name)
values  ('Kiyv'),
		('Lviv'),
		('Antalia'),
		('Moscow'),
		('Ivanovo'),
		('Berlin');
		
insert into Person(person_name, city_id)
values  ('Vadim', 2),
		('Gregoriy', 3),
		('Masha', 5),
		('Anna', 6);
		
insert into Person(person_name, city_id)
values  ('Nataly', 8),
		('Anatoly', 10);
	
--select * from City;
--select * from Person;

--это иннер джоин
select Person.person_name, City.city_name 
from Person join City
on Person.city_id = City.id

select Person.person_name, City.city_name 
from Person left join City
on Person.city_id = City.id

--select Person.person_name, City.city_name, City.id
--from Person right join City
--on Person.city_id = City.id

--select Person.person_name, City.city_name 
--from Person cross join City;


select Person.person_name, City.city_name 
from Person full outer join City
on Person.city_id = City.id




