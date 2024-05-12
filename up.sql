select * from jobs
where min_salary>10000;

select first_name, hire_date,job_id
from employees
where job_id='SA_MAN' or job_id='IT_PROG';

select * from employees
where employee_id='150' or employee_id='160';

select job_title,max_salary-min_salary as Count_Salary
from jobs
where max_salary>=10000 and min_salary<=20000;


select * from jobs 
where min_salary>10000;

select first_name, last_name
from employees
where job_id='SA_MAN' or job_id='IT_PROG';

select * from employees
where employee_id = '150' or employee_id='160';


select job_title, max_salary-min_salary as dsdi
from jobs
where max_salary>=10000 and min_salary<=20000;

