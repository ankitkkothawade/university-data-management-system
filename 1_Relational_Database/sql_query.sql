--1.	List the ID and name of all students

select student_id, name from student;

--2.	List the name of all courses together with their type. 

select course_name, course_type from course;

--3.	List the ID and name of all students together with the course name and course type that they study. 

select s.student_id,s.name,c.course_name,c.course_type
from student s join course c on c.course_id = s.course_id;

--4.	List the ID and name of all modules together with the name and ID of the member of staff who teaches this module. 

select m.module_id,m.module_name,e.employee_id,e.name
from module m join module_lecturer ml on m.module_id = ml.module_id
join employee e on e.employee_id = ml.academic_employee_id;

--5.	List the ID and name of all students together with the name of their supervisors if their supervisors has an admin role in addition to their academic role. 

select s.student_id,s.name as student_name,e.name as supervisor_name  
from student s join adminemployee ae on s.supervisor_id = ae.employee_id
join employee e on e.employee_id = s.supervisor_id
where ae.admin_role IS NOT NULL;
