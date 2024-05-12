select count(commission_pct) as "Commission PCT" from employees;

select avg(nvl(commission_pct,0)) from employees
where commission_pct is null;

select job_id, department_id, avg(salary) 
from employees 
group by job_id, department_id;

select department_id, job_id, commission_pct, avg(salary)
from employees
--where commission_pct is not null
group by department_id, job_id, commission_pct
order by 1,4;

select job_id, sum(salary) as PAYROLL
from employees
--where job_id not like '%REP%'
group by job_id
Having sum(salary) >13000
order by sum(salary);




























Select first_name, job_id, hire_date
from employees
where hire_date like '%'
group by first_name, job_id, hire_date;

select department_id, commission_pct
from employees
where commission_pct is not null;

----select job_id, avg(salary) ,
----from employees
----group by job_id
----having sum(salary)>1000
--;


select to_char(hire_date, 'YYYY') from employees
group by to_char(hire_date, 'yyyy')
having count(employee_id) >10;


select department_id from employees
where commission_pct is not null
having count(commission_pct)>5;











