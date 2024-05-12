select * from employees;

select * from departments;

select * from jobs;

select * from locations;

select * from regions;

select employees.first_name, departments.department_name
from employees 
natural join departments;


select employee_id, first_name, location_id, city,country_id
from employees
natural join departments
natural join locations;


select first_name, department_name, job_title, city, country_name
from employees
natural join departments
natural join jobs
natural join locations
natural join regions
natural join countries;

select employee_id, last_name, location_id, department_id
from employees join departments
using (department_id);

select l.city, d.department_name
from locations l join departments d
using (location_id)
where location_id = 1400;

SELECT DATEADD(year, 1, '2017/08/25') AS DateAdd;


