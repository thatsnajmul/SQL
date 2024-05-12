select first_name, last_name, employee_id, salary
from employees
where salary > 5000
order by 4 desc;

select first_name, last_name, employee_id, department_id
from employees
natural join departments;

select d.department_name, e.first_name, e.hire_date
from employees e
join departments d on e.department_id=d.department_id;

