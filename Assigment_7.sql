-- Tables for the assigment
select * from students; /* Michael gets repeated twice*/
select * from courses;
select * from student_enrollment;
select * from professors;
select * from teach;
select * from employees;
select * from departments;

-- Tables student_enrollment and professors are not directly related

-- Student's name, courses the student is taking and professors that teach that course
select student_name, course_title, last_name as prof_last_name
from students s1 inner join student_enrollment s2 on s1.student_no = s2.student_no
inner join courses s3 on s3.course_no = s2.course_no
inner join teach s4 on s4.course_no = s3.course_no
order by student_name, course_title, prof_last_name;

-- Eliminate redundancy (same student multiple times)
select student_name, course_title, last_name as prof_last_name
from students s1 inner join student_enrollment s2 on s1.student_no = s2.student_no
inner join courses s3 on s3.course_no = s2.course_no
inner join (select course_no, min(last_name) as last_name from teach
group by course_no) s4 on s4.course_no = s3.course_no
order by student_name, course_title, prof_last_name;

-- Employees whose salary is above average of given department
select first_name, last_name, department, salary from employees e1
where salary > (select avg(salary) from employees e2
			   where e1.department = e2.department);

-- All students and all courses that the may or may not be taking
select student_name, s3.course_no, course_title
from students s1 full outer join student_enrollment s2 on s1.student_no = s2.student_no
full outer join courses s3 on s3.course_no = s2.course_no;