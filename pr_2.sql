SELECT * FROM employees;


--pr
select  first_name, job_id, salary as "Heighest Salary Basis", salary*12 as "Yarly Salary"
from employees where salary not in 9000 order by salary desc;

-- For String and dta we can use not in is equal <>
-- For order by table as number like 1,2,3


--fetch
Select first_name, job_id, salary, salary*12 as "Yarly Slary"
from employees where salary <> 9000
order by salary desc 
offset 5 rows fetch next 5 rows only --fetch first 5 rows only
;

-- fetch for showing smallest data only ;
-- offset 5 fetch first 10/5 rows only ;
-- for show using promt =  "&employee_name" (show all input value);
-- for show using promt <>(not equal)not in 9000 &salary (show except input value);
-- shorting smallest is automitically but we can short by largest to smallest using DESC ;
-- we can use as and string sign "" for changing table name ;

--&
select first_name, job_id
from
employees
where first_name = '&Employee_name';

--&
select first_name, job_id, salary, salary*12 as "Yarly Salary"
from
employees
where salary <> &Salary;


--Like
select first_name
from employees
where first_name like '%&first_name%'
order by first_name desc
;

--Initcap
 select first_name, last_name, salary
 from employees
 where first_name = INITCAP('Payam');
 
--lower
select first_name, last_name, salary
 from employees
 where lower(first_name) = 'payam';
 
 --Initcap
 
 
 select first_name, last_name, salary,
 concat(first_name, last_name) as "Full Name", substr(first_name,3,3) as "Substring"
 from employees
 where first_name = initcap('payam'); --initcap find a specific data where
 
 --Substring
 select first_name , substr(first_name,1,3) as "SubStr S"
 from employees;
 
 
 --length
 select first_name, last_name, salary,
 concat(first_name, last_name) as "Full Name", substr(first_name,3,3) as "Substring", length(first_name)
 from employees;
 
 --Instr
 
select first_name, last_name, salary,
 concat(first_name, last_name) as "Full Name", substr(first_name,3,3) as "Substring", instr(first_name, 'l')
 from employees;
 
 select first_name,last_name, instr(first_name, 'a')
 from employees;
 
select first_name,last_name, instr(lower(first_name), 'a')
from employees;

--Lpad
select first_name,last_name, lpad(first_name, '10', '-')
from employees;

--Rpad
select first_name,last_name, rpad(first_name, '10', '-')
from employees;


select concat(concat(last_name, '''s job category is '), job_id)
"Job" from employees
where substr(job_id, 4) = 'REP';





select first_name, last_name, job_id
from employees
where substr(job_id, 1,2) =  'IT';
 

--Er
select first_name, last_name, job_id,
concat(substr(first_name, 2,2),lower(substr(job_id, 1,2)))
from employees;




















































 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 




