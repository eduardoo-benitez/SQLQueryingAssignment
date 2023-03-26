USE university;

#Part 1
SELECT first_name, last_name FROM student;

#Part 2
SELECT tenured FROM instructor;

#Part 3
SELECT student.first_name "Student First Name", student.last_name "Student Last Name", instructor.first_name "Instructor First Name", instructor.last_name "Instructor Last Name" FROM student  
INNER JOIN instructor ON student.advisor_id = instructor.instructor_id
WHERE advisor_id IS NOT NULL;

#Part 4 
SELECT instructor.instructor_id, instructor.first_name, instructor.last_name FROM instructor
LEFT JOIN student ON instructor.instructor_id = student.advisor_id
WHERE student.advisor_id IS NULL;

#Part 5
SELECT first_name, last_name, SUM(num_credits) FROM instructor 
INNER JOIN course ON instructor.instructor_id = course.instructor_id
GROUP BY instructor.instructor_id, first_name, last_name;

#Part 6
SELECT course_code, course_name FROM course
WHERE course_code LIKE '%3___';

#Part 7
SELECT course_code, first_name, last_name, SUM(num_credits) FROM course, student_schedule, instructor
WHERE course.course_id = student_schedule.course_id AND course.instructor_id = instructor.instructor_id AND student_id = 1
GROUP BY course_code, first_name, last_name;