select * from employees where first_name like 'A%';

select first_name, last_name, email
from
employees;

select first_name, last_name, email
from
employees ORDER BY first_name desc, email asc ;

select first_name, salary, manager_id from employees where salary<9000 order by salary desc;