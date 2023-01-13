-- Query that outputs '_ works in the _ department'
select last_name||''||' works in the '||department|| ' department'
from professors;

-- Query that outputs 'It is T/F that professor _ is highly paid'
select 'It is '||(salary > 95000)||' that professor '||last_name||' is highly paid'
from professors;

-- Shorten department names to first three characters in upper case
select last_name, 
	upper(substring(department, 1, 3)) as department,
	salary,
	hire_date
from professors;

-- Highes and lowest salary from professors excluding Wilson
select max(salary) as highest_salary,
min(salary) as lowest_salary
from professors
where last_name != 'Wilson';

-- Hire date of the professor teching the longest
select min(hire_date) as earliest_date
from professors;