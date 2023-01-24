-- Tables for last assigment
select * from students;
select * from student_enrollment;
select * from courses;
select * from professors;
select * from teach;

-- Students who do not take CS180
select *
from students s1 left join student_enrollment s2 on s1.student_no = s2.student_no
where s1.student_no in (select student_no 
						from (select *, 
							  (case when course_no = 'CS180' then 1 else 0 end) as ind
							  from student_enrollment) tab1 
						group by student_no
						having sum(ind) = 0);

-- Students who take CS110 or CS107 but not both
/* Overomplicated query just to try my knowledge*/
select student_name
from (select *,
	  sum(cnt) over(partition by student_no
					order by student_no rows between unbounded preceding
					and current row) as pos 
	  from
	  (select s1.student_no, student_name, 1 as cnt
	   from students s1 left join student_enrollment s2 on s1.student_no = s2.student_no
	   where s1.student_no in (select student_no
							   from (select *,
									 case when course_no in ('CS110','CS107') then 1 
									 else 0 end as ind
									 from student_enrollment) tab1
							   group by student_no
							   having sum(ind) = 1)
	  ) a1
	 ) a2
where pos = 1;

-- Students that take CS220 and no other courses
select s1.student_no, student_name, age, course_no
from student_enrollment s1 inner join students s2 on s1.student_no = s2.student_no
where s1.student_no in (select student_no
						from student_enrollment
						group by student_no
						having count(*) = 1)
and course_no = 'CS220';

-- Student who take at most 2 courses. Exclude students that don't take anything
select s1.student_name, s2.course_no
from students s1 inner join student_enrollment s2 on s1.student_no = s2.student_no
where s1.student_no in (select student_no from student_enrollment
						group by student_no
						having count(course_no) <= 2);
						
-- Students older than at most two other students
select student_no, student_name, age
from (select *, 
	  rank() over(order by age ) - 1 as age_dif
	  from students) tab1
where age_dif <= 2;