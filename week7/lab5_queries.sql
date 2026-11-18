-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: ____________ Matric: ____________
-- ============================================
USE sen307_12007;
SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;

-- Explanation: Joins Student to Department using dept_id, keeps all the software engineering students that satisfy the WHERE condition and organises them from A-Z 
SELECT s.matric_no, s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

-- Explanation: Course and Lecturer are connected by CourseAllocation, so two INNER JOINs are needed. INNER JOIN returns only rows with a similarity in both tables. SEN307 appears twice because it has two lecturers.
SELECT c.course_code, c.course_title, l.full_name AS lecturer
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code, l.full_name;

-- Explanation: LEFT JOIN keeps every student from the left table, even those with no enrolment. students who dont have enrollment, course title returns null
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
-- adding WHERE c.course_title IS NULL, displays only students that do not have an enrollment
WHERE c.course_title IS NULL
ORDER BY s.full_name;

-- Explanation: Selects all female students from Software enginnering or AI born between 2004-01-01 and 2005-12-31
SELECT matric_no, full_name, gender, date_of_birth, dept_id
FROM Student WHERE gender = 'F' AND dept_id IN (1, 3) AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';

-- same ideaology but uses OR instead of AND as in sql, AND is usually evaluated before OR
SELECT matric_no, full_name, gender, date_of_birth, dept_id
FROM Student WHERE (dept_id = 1 OR dept_id = 3) AND gender = 'F' AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';

SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 0;
SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 10;

SELECT s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name;
