/*
- 1st column: Departments
- 2nd column: First name of each employee 
- 3rd column: Salary that each employee makes
- 4th column: Shows whether the salary is highest or lowest

For every department, show the name and salary of the employee
that has the highest or lowest salary. Also, a last column
indicating if the salary is highest or lowest.
*/

select *
from employees;

select department, first_name, salary,
(case when salary = (select max(salary)
					 from employees e2
					 where e1.department = e2.department) then 'Highest salary'
when salary = (select min(salary)
			   from employees e2
			   where e1.department = e2.department) then 'Lowest salary' 
end) as salary_in_dep
from employees e1
where salary in ((select max(salary)
				from employees e2 
				where e1.department = e2.department),
				 (select min(salary)
				from employees e2 
				where e1.department = e2.department))
order by department, salary_in_dep