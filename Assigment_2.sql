-- Age between 18 and 20
select *
from students
where age between 18 and 20;

-- Names that contain 'ch' or end in 'nd'
select *
from students
where student_name like '%ch%'
OR student_name like '%nd';

-- Name that have 'ae' or 'ph' and not 19 years old
select *
from students
where (student_name like '%ae%' or student_name like '%ph%')
and age != 19;

-- Sorted by age from largest to smallest
select student_name
from students
order by age desc
limit 4;

-- Not older than age 20 if student_no between 3 and 5 or student_no is 7
-- Also, older than 20 but student_no at least 4
select *
from students
where (age <= 20 and (student_no between 3 and 5 or student_no = 7))
or (age > 20 and student_no >=4);