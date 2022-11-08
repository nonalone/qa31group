--create table emploees(
	id serial  primary key,
	employee_name varchar(50) not null
);

--insert into emploees(employee_name)
values  ('Andrei_41'),
		('Andrei_42'),
		('Andrei_43'),
		('Andrei_44'),
		('Andrei_45'),
		('Andrei_46'),
		('Andrei_47'),
		('Andrei_48'),
		('Andrei_49'),
		('Andrei_50'),
		('Andrei_51'),
		('Andrei_52'),
		('Andrei_53'),
		('Andrei_54'),
		('Andrei_55'),
		('Andrei_56'),
		('Andrei_57'),
		('Andrei_58'),
		('Andrei_59'),
		('Andrei_60'),
		('Andrei_61'),
		('Andrei_62'),
		('Andrei_63'),
		('Andrei_64'),
		('Andrei_65'),
		('Andrei_66'),
		('Andrei_67'),
		('Andrei_68'),
		('Andrei_69'),
		('Andrei_70');
		
	
select * from emploees;

--delete from emploees where id between 71 and 160

create table salary_hw(
	id serial  primary key,
	monthly_salary Int not null
);

select * from salary_hw;

insert into salary_hw(monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);

create table employee_salary(
	id serial  primary key,
	employee_id Int not null unique,
	salary_id Int not null
)

--drop table employee_salary;

insert into employee_salary(employee_id,salary_id)
values	(3,7),
		(1,4),
		(5,9),
		(40,13),
		(23,4),
		(11,2),
		(52,10),
		(15,13),
		(26,4),
		(16,1),
		(33,7),
		(2,15),
		(13,14),
		(81,16),
		(73,5),
		(71,4),
		(75,14),
		(99,15),
		(91,8),
		(78,4),
		(76,7),
		(88,9),
		(96,11),
		(95,13),
		(31,15),
		(51,9),
		(66,3),
		(44,7),
		(41,8),
		(21,12),
		(25,15),
		(30,14),
		(20,17),
		(10,7),
		(18,4),
		(19,6),
		(39,2),
		(49,14),
		(27,13),
		(48,1);
	
select * from employee_salary;
		
	
create table roles_HW(
	id serial  primary key,
	role_name int not null unique
);

select * from roles_HW;


alter table roles_HW 
alter column role_name type varchar(30);

insert into roles_HW(role_name)
values	('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
		

create table roles_employee(
	id serial  primary key,
	employee_id Int not null unique,
	role_id Int not null,
	foreign key (employee_id)
		references emploees(id),
	foreign key (role_id)
		references roles_HW(id)
);

--drop table roles_employee;

select * from roles_employee;

insert into roles_employee(employee_id, role_id)
values  (1,2),
		(2,5),
		(3,1),
		(4,5),
		(65,10),
		(6,20),
		(7,15),
		(8,9),
		(15,13),
		(10,16),
		(11,17),
		(55,13),
		(44,12),
		(35,10),
		(70,11),
		(66,3),
		(22,4),
		(21,7),
		(19,6),
		(5,8),
		(9,9),
		(18,12),
		(16,14),
		(23,13),
		(43,16),
		(34,17),
		(39,20),
		(27,7),
		(42,6),
		(49,8),
		(48,19),
		(67,18),
		(68,20),
		(69,16),
		(33,9),
		(38,7),
		(57,6),
		(52,11),
		(30,12),
		(54,14);

	
	
	
	
-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from emploees
join employee_salary
on emploees.id = employee_salary.employee_id 
join salary_hw
on employee_salary.salary_id = salary_hw.id
where employee_salary is not null
order by emploees.id;
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select * from emploees
join employee_salary
on emploees.id = employee_salary.employee_id
join salary_hw
on employee_salary.salary_id = salary_hw.id 
where salary_hw.monthly_salary < 2000
order by emploees.id;
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary_id from employee_salary
left join emploees
on emploees.id = employee_salary.employee_id
where emploees.id is null;
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary_id, monthly_salary from employee_salary
left join emploees
on emploees.id = employee_salary.employee_id
left join salary_hw
on employee_salary.salary_id = salary_hw.id
where emploees.id is null and salary_hw.monthly_salary < 2000;
-- 5. Найти всех работников кому не начислена ЗП.
select * from emploees
left join employee_salary
on emploees.id = employee_salary.employee_id 
where employee_salary is null;
-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id 
order by emploees.id;
-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%Java developer';
-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%Python%';
-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%QA%';
-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%Manual QA%';
-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%Automation QA%';
-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name,role_name, monthly_salary from emploees
join employee_salary
on emploees.id = employee_salary.employee_id
join salary_hw
on employee_salary.salary_id = salary_hw.id
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%Junior%';
-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name,role_name, monthly_salary from emploees
join employee_salary
on emploees.id = employee_salary.employee_id
join salary_hw
on employee_salary.salary_id = salary_hw.id
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%Middle%';
-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name,role_name, monthly_salary from emploees
join employee_salary
on emploees.id = employee_salary.employee_id
join salary_hw
on employee_salary.salary_id = salary_hw.id
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%Senior%';
-- 15. Вывести зарплаты Java разработчиков
select employee_name, role_name, monthly_salary from roles_hw
join salary_hw
on roles_hw.id = salary_hw.id 
join employee_salary
on salary_hw.id = employee_salary.salary_id
join emploees
on employee_salary.employee_id = emploees.id
where role_name like '%Java%';
-- 16. Вывести зарплаты Python разработчиков
select employee_name, role_name, monthly_salary from roles_hw
join salary_hw
on roles_hw.id = salary_hw.id 
join employee_salary
on salary_hw.id = employee_salary.salary_id
join emploees
on employee_salary.employee_id = emploees.id
where role_name like '%Python%';
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, role_name, monthly_salary from roles_hw
join salary_hw
on roles_hw.id = salary_hw.id 
join employee_salary
on salary_hw.id = employee_salary.salary_id
join emploees
on employee_salary.employee_id = emploees.id
where role_name like '%Junior Python%';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, role_name, monthly_salary from roles_hw
join salary_hw
on roles_hw.id = salary_hw.id 
join employee_salary
on salary_hw.id = employee_salary.salary_id
join emploees
on employee_salary.employee_id = emploees.id
where role_name like '%Middle JavaScript%';
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, role_name, monthly_salary from roles_hw
join salary_hw
on roles_hw.id = salary_hw.id 
join employee_salary
on salary_hw.id = employee_salary.salary_id
join emploees
on employee_salary.employee_id = emploees.id
where role_name like 'Senior Java developer';
-- 20. Вывести зарплаты Junior QA инженеров
select employee_name, role_name, monthly_salary from roles_hw
join salary_hw
on roles_hw.id = salary_hw.id 
join employee_salary
on salary_hw.id = employee_salary.salary_id
join emploees
on employee_salary.employee_id = emploees.id
where role_name like '%Junior%QA%';
-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) from emploees
join employee_salary
on emploees.id = employee_salary.employee_id
join salary_hw
on employee_salary.salary_id = salary_hw.id
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%Junior%';
-- 22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from emploees
join employee_salary
on emploees.id = employee_salary.employee_id
join salary_hw
on employee_salary.salary_id = salary_hw.id
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%JavaScript%';
-- 23. Вывести минимальную ЗП QA инженеров
select role_name, min(monthly_salary)  from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
join employee_salary
on emploees.id = employee_salary.employee_id
join salary_hw
on employee_salary.salary_id = salary_hw.id
where role_name like '%QA%'
group by role_name
order by min;
-- 24. Вывести максимальную ЗП QA инженеров
select role_name, max(monthly_salary)  from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
join employee_salary
on emploees.id = employee_salary.employee_id
join salary_hw
on employee_salary.salary_id = salary_hw.id
where role_name like '%QA%'
group by role_name
order by max desc;
-- 25. Вывести количество QA инженеров
select count(role_name) from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%QA%';
-- 26. Вывести количество Middle специалистов.
select count(role_name) from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%Middle%';
-- 27. Вывести количество разработчиков
select count(role_name) from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where role_name like '%developer%';
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) from emploees
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id 
join employee_salary
on emploees.id = employee_salary.employee_id 
join salary_hw
on employee_salary.salary_id = salary_hw.id
where role_name like '%developer';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, monthly_salary, role_name  from emploees
join employee_salary
on emploees.id = employee_salary.employee_id 
join salary_hw
on employee_salary.salary_id = salary_hw.id
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id 
order by monthly_salary;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, monthly_salary, role_name  from emploees
join employee_salary
on emploees.id = employee_salary.employee_id 
join salary_hw
on employee_salary.salary_id = salary_hw.id
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where monthly_salary between 1700 and 2300
order by monthly_salary;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, monthly_salary, role_name  from emploees
join employee_salary
on emploees.id = employee_salary.employee_id 
join salary_hw
on employee_salary.salary_id = salary_hw.id
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where monthly_salary < 2300
order by monthly_salary;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, monthly_salary, role_name  from emploees
join employee_salary
on emploees.id = employee_salary.employee_id 
join salary_hw
on employee_salary.salary_id = salary_hw.id
join roles_employee
on emploees.id = roles_employee.employee_id
join roles_hw
on roles_employee.role_id = roles_hw.id
where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
order by monthly_salary;