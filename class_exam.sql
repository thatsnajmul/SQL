SELECT first_name from employees order by first_name asc;

select * from employees order by 

select upper(first_name) from employees;

select * from employees where hire_date='1-jan-2008';

select * from employees where hire_date between '1-feb-2008' and '28-feb-2008';

select * from employees where mod(employee_id,2)=0;


--Time and date
select sysdate from dual;

select current_date from dual;

select current_timestamp from dual;

select sessiontimezone, current_date from dual;


--Date
select employee_id, hire_date, 
months_between (sysdate, hire_date) as tenure,
add_months (hire_date, 6)as review, 
next_day (hire_date, 'friday'), 
last_day (hire_date) 
from employees where 
months_between (sysdate, hire_date) <200;

<<<<<<< Updated upstream
 select to_char(sysdate, 'dy/mon') from dual;
  select to_char(sysdate , 'fmDDth MONTH') from dual;
=======
select to_char(sysdate, 'dy/mon') from dual;
>>>>>>> Stashed changes

----------?


select sysdate from dual;
select current_date from dual;
select current_timestamp from dual;
select sessiontimezone from dual;




--NVL, NVL2, COALESEC
select first_name, last_name, nvl(commission_pct, 0) from employees;

select last_name, salary, commission_pct, NVL2(commission_pct, 'sal+comm', 'sal')as incomes from employees;

select last_name, salary, commission_pct, coalesce((salary+(commission_pct*salary)), salary) as "New salary" from employees;







