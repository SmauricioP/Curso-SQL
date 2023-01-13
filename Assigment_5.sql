-- Names of students taking Physics and US History

select student_name
from students
where student_no in(
	select student_no from student_enrollment
	where course_no in (select course_no
						from courses
						where course_title in ('Physics', 'US History')
					   )
	);

-- Name of the student that is taking the highest number of courses

select student_name
from students
where student_no in (select student_no
					from student_enrollment
					group by student_no
					order by count(student_no) desc
					limit 1
					);

-- Oldest student

select *
from students
where age in (select max(age)
			  from students);