select first_name, last_name, salary
from employees
--Join query
where city='oxford';

---Join Query
select first_name, department_name, last_name, hire_date
from employees e
join departments d on d.department_id=e.department_id
join jobs j on e.job_id=j.job_id
join job_history h on e.employee_id=h.employee_id
where to_char(h.start_date, 'YYYY') between 2000 and 2005
order by 4;


-- left, right or full outer join
select e.last_name, e.department_id, d.department_name
from employees e 
left outer join departments d
on e.department_id = d.department_id;

--Cartesian Products






















select e.first_name, d.department_name, l.postal_code, l.street_address, e.manager_id, d.location_id as departmentLocationName
from employees e
join departments d on employee_id = d.department_id
join locations l on d.location_id = l.location_id
where e.first_name='Steven'
;




---Subquries
select first_name, hire_date, salary
from employees
where hire_date>(select hire_date from employees where last_name='Davies' fetch first 1 row only);



select * from employees
where hire_date> (select hire_date from employees where first_name ='Curtis');   


--Multiple subquries only
select last_name, job_id, salary
from employees 
where job_id =  (select job_id 
                    from employees 
                    where last_name ='Taylor' 
                    fetch first 1 row only)
and salary > (select salary 
                from employees
                where last_name = 'Taylor' 
                fetch first 1 row only);
                

--Single subquries only            
select department_id, min(salary)
from employees
group by department_id
having min(salary)>
                    (select min(salary)
                    from employees
                    where department_id = 30);




















