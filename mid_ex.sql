--Question 1
Select first_name ||' '||last_name as EMPLOYEE_NAME , salary
    from employees
         where first_name like '%a' order by 1 fetch first 2 row only;
                                
        
--Question 2
select first_name, salary, salary+(salary*30/100) as BONUS
    from employees;
    
--question 3
select first_name,last_name, salary
   from employees
        where salary>2500;
   
--Question 4
select first_name||' '||last_name as EMPLOYEE_NAME , salary*12 as ANUAL_SALARY
       from employees order by 2 asc;
       
       
-- 3
select last_name, salary
from employees
where salary not between 5000 and 12000;


--5
select last_name, department_id,salary
from employees
where department_id in (20,50)
--department_id=20 or department_id=50
order by 1;

--6
select last_name as "Employee", salary "Monthly Salary"
from employees
where salary between 5000 and 12000 and department_id in (20,50);

--9
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by 2 desc, 3 desc;

--15
select last_name, salary, commission_pct
from employees
where commission_pct = 0.2;

---02
select employee_id,last_name, salary, round(salary+(salary*15.5/100)) as "New Salary"
from employees 
order by 4;

--5
select last_name, length(last_name)
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M.%'
--substr(last_name,1)in ('J', 'A', 'M')
order by last_name;

--7
select last_name, LPAD(salary,15,'$') as salary --RPAD
from employees;

--5

Select last_name||' earns '||
to_char(salary, 'fm$999999.00')||' monthly but wants '||
to_char(salary*3, 'fm$999999.00')
from employees;


select last_name, hire_date, 
to_char(next_day(add_months(hire_date,6), 'Monday'), 'fmDay, "the" Ddspth "of" Month, YYYY')
from employees;


-----------------------------
--Chapter--6
-----------------------------
select max(salary) as maximum, 
min(salary) as minimum,
round(avg(salary)) as avarage
from employees;


select job_id, 
min(salary) as minimum,
sum(salary) as minimum,
round(avg(salary)) as avarage
from employees
group by job_id;

select job_id, count(*)
from employees
group by job_id;

select count(distinct(manager_id)) as "Number of Managers"
from employees;

select max(salary)- min(salary)
from employees;

select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id 
having min(salary)>6000
order by 2 desc;

select count(*) as "Total",
sum(case when to_char(hire_date,'YYYY')=2005 then 1 else 0 end) as "2005",
sum(case when to_char(hire_date,'YYYY')=2006 then 1 else 0 end) as "2006",
sum(case when to_char(hire_date,'YYYY')=2007 then 1 else 0 end) as "2007",
sum(case when to_char(hire_date,'YYYY')=2008 then 1 else 0 end) as "2008"
        from employees;
        
        
select job_id as "Job",
sum(decode(department_id, 20, salary)) "Dept 20",
sum(decode(department_id, 50, salary)) "Dept 50",
sum(decode(department_id, 80, salary)) "Dept 80",
sum(decode(department_id, 90, salary)) "Dept 90"
from employees
group by job_id;



--========================
--Chapter 7
--========================
select location_id, street_address, city, state_province, country_name
from locations
natural join countries;


select last_name, department_id, department_name
from employees
natural join departments;

select e.last_name, d.department_id, d.department_name
from employees e
join departments d on d.department_id=e.department_id;

select e.last_name, e.job_id,e.department_id, d.department_name
from employees e
join departments d on d.department_id=e.department_id
join locations l on d.location_id=l.location_id
where l.city='Toronto';


select e.last_name as "Employee", e.employee_id as "Emp#", m.last_name as "Manager", m.employee_id as "Mgr#"
from employees e
join employees m on m.employee_id=e.manager_id;

select e.last_name as "Employee", e.employee_id as "Emp#", m.last_name as "Manager", m.employee_id as "Mgr#"
from employees e
join employees m on m.employee_id=e.manager_id
order by 2;

select e.department_id, e.last_name, e.last_name
from employees e
join employees es on e.department_id=es.department_id
where e.employee_id <> es.employee_id
order by 1;

--============================
--Job Grades Data insert start
--============================
CREATE TABLE job_grades (
grade 		CHAR(1),
lowest_sal 	NUMBER(8,2) NOT NULL,
highest_sal	NUMBER(8,2) NOT NULL
);

ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

COMMIT
--==========================
--Job Grade data insert end
--==========================

describe job_grades;

--Using normal join
select e.last_name, e.salary, d.department_name, j.grade
from employees e
join departments d on d.department_id=e.department_id
join job_grades j on e.salary between j.lowest_sal and j.highest_sal;

--Using natural join data compressed by matching employee_id and department_id
select e.last_name, e.salary, d.department_name, j.grade
from employees e
natural join departments d
join job_grades j on e.salary between j.lowest_sal and j.highest_sal;

select last_name, hire_date
from employees
where hire_date > (select hire_date from employees where last_name ='Davies');

--Same table but 1 primary_id another one is matching
select e.last_name, e.hire_date, m.last_name, m.hire_date
from employees e
join employees m on e.manager_id=m.employee_id
where e.hire_date <m.hire_date;

--Chapter 8
Select employee_id, last_name, salary
from employees
WHERE SALARY >(SELECT AVG(SALARY) FROM EMPLOYEES)
order by 3;

SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES 
WHERE DEPARTMENT_ID in (select department_id from employees where LAST_NAME LIKE '%u%');


select last_name,salary
from employees
where manager_id in (select manager_id from employees where last_name in 'King');


select department_id, last_name, job_id
from employees
where department_id in (select department_id from departments where department_name = 'Executive');

select last_name, salary
from employees 
where salary> any(select salary
                    from employees
                        where department_id=60);

                      
select employee_id, last_name, salary
from employees
where department_id in (select department_id
from employees
where last_name like '%u%')
and salary > (select avg(salary) from employees);


insert into departments (department_name,department_id,manager_id,location_id)
values('Demo',71,100,1700);
commit

insert into departments
values(72,100,null,null);
commit

select * from departments order by department_id;

insert into departments
values(73,'JEE',100,1700);
commit

select * from job_history order by job_id;

insert into job_history
values(104,to_date('Apr 15,2024','Mon DD, YYYY'),to_date('Apr 18,2024','Mon DD, YYYY'),'AC_ACCOUNT',110);
commit

insert into departments
values(&department_id,'&department_name',&)


--For finding all const
select * from all_CONSTRAINTS;
select * from user_constraints;


--Create basics
create table sales_reps(
id number(4) not null,
name varchar2(30),
salary number(8,2),
commission_pct number(2,2),
constraint const_sales_reps_id primary key(id)
);

--Insert Basics
insert into sales_reps(
id,
name,
salary,
commission_pct
)
select employee_id, last_name, salary, commission_pct
from employees
where job_id like '%REP%';
commit

select * from sales_reps;

--Update Basics
update sels_rep set col_name=value
where primary_key='';

--commit,roolback

update employees
set (job_id,salary) = (select job_id, salary
from employees
where employee_id=205)
where employee_id=103;
rollback

select * from employees where employee_id in (103,205);

update employees
set department_id = (select department_id from employees where employee_id =100)
where job_id = (select job_id from employees where employee_id =200);
rollback

select * from employees where employee_id in (100,200);

--Delete, truncate, drop
delete from sales_reps
where id=100;

--DDL
select * from departments;

update departments
set department_name = 'Stavenn'
where department_id='10';

--===============================
--Reverse again
--kubernetes~~Go
--Docker~~Go
--Scala~~Java
--ppc64le~~Machine
--s390x~~Machine
--Aws on Java~~Support another
--Azure on Java~~Support another
--==============================


--Create Squence synonyms, and Indexes

--68 Sequence (MIP)
Create sequence sales_reps_id
increment by 1
start with 101
maxvalue 99999
nocache
nocycle;

select sales_reps_id.nextval
from dual;


insert into sales_reps values(sales_reps_id.nextval, 'Demo',40000,0.02);

select * from sales_reps;


--==============================================================================
Create sequence student_id
increment by 1
start with 101
maxvalue 99999
nocache
nocycle;

create table student(
id number(5) default student_id.nextval constraint sys_student_id primary key,
name varchar2(30) not null,
email varchar2(60) not null constraint student_email_unique unique
);

insert into student(name,email)
values('demo1', 'demo1@gmail.com');
commit
select * from student;

describe user_sequences;
select * from user_sequences;
--==============================================================================

























--1. Display job id of jobs that were done by more than 3 employees for more than 100 days.

--using join
select j.job_id
from jobs j
join on job_id j = employees e
--where ;

select job_id
from jobs,employees;
--where hire_date <= 17-jun-03;
--where hire_date between '17-jun-03' and '17-jun-04;
--where hire_date to_date(,DD-MM-YY);

--2. Display departments where any manager is managing more than 5 employees.

select * from
departments
--where manager_id > 5;
where manager_id = 100;


--3. Display how many employees joined in each month of current year.
select * from
employees
--where hire_date in '17-JUN-03';

select * from employees;


--Views

create view view_emp_100_days
as
select distinct(job_id)
from employees
where current_date - hire_date >100
group by job_id
having count(employee_id) >3;

select * from view_emp_100_days;

describe view_emp_100_days ;


--DBA is tipically difficult
--Progranne is logically difficult
--Design is think


Create role manager;
grant 






  

