USE sen307_12007;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;
SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello','m.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Dr Ahmadu Bello','a.bello@vua.edu.ng', 2),
('VUA/ST/104', 'Mr Tyouwa Tartor','t.tartor@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Hauwa Ibrahim','h.ibrahim@vua.edu.ng', 3),
('VUA/ST/106', 'Dr Chidi Njokkwu','c.njokwu@vua.edu.ng',   3),
('VUA/ST/107', 'Mrs Fashima Haaza','f.haaza@vua.edu.ng',   4),
('VUA/ST/108', 'Dr Yusuf Danjuma','y.danjuma@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Ife Balogun','i.balogun@vua.edu.ng', 5),
('VUA/ST/110', 'Mr Enyinnaya Onuoha','e.onuoha@vua.edu.ng', 5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('12007', 'James Jude','M', '2005-06-28', 1),
('11234', 'John Musa','M', '2004-11-02', 2),
('12130', 'Zainab Yakubu','F', '2005-01-20', 3),
('12909', 'Chinedu Oruche',     'M', '2006-08-09', 4),
('12134', 'Blessing Abundance', 'F', '2006-03-27', 5),
('12567', 'James Jude',         'M', '2003-05-11', 1),
('12087', 'Ihioma David',       'M', '2007-05-18', 1),
('11784', 'Jonathan Mutala',    'M', '2005-05-16', 2),
('12456', 'Isioma Goodluck',    'M', '2004-11-19', 4),
('11934', 'Bola Ahmed',         'M', '2007-07-17', 5),
('12476', 'James Dani',         'M', '2005-03-11', 1),
('12009', 'Amina Adoja',        'F', '2005-07-28', 1),
('11909', 'Jota Bola',          'M', '2004-12-07', 3),
('12356', 'Joy Ebah',           'F', '2007-11-20', 3),
('12017', 'Chisom Ifioma',      'F', '2006-07-19', 4),
('11154', 'Biola Afani',        'F', '2006-12-11', 5),
('12653', 'Daniel Ahange',      'M', '2005-06-21', 1),
('11456', 'Atese Micheal',      'M', '2007-05-18', 1),
('11980', 'Josephine Apase',    'F', '2005-11-12', 2),
('12223', 'Fashima Jonathan',   'F', '2006-03-10', 3);

SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;
INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1), (1, 2), (1, 3),(5, 1),
(2, 1), (2, 3), (2, 4), (5, 10),
(3, 1), (3, 5), (3, 6),(6, 1),
(4, 1), (4, 8), (4, 9), (6, 2),
(7, 1), (7, 4), (8, 2), (8, 3),
(9, 3), (9, 5), (10, 4), (10, 6),
(11, 5), (11, 7),(12, 6), (12, 7),
(13, 7), (13, 8),(14, 8), (14, 9),
(15, 9), (15, 10),(17, 5), (17, 9),
(16, 10), (16, 2),(18, 4), (18, 10);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 2),(2, 2),
(3, 3),(4, 4),(5, 5),
(6, 6),(7, 10),(8, 7),
(9, 8),(10, 9);

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '12007';
UPDATE Student SET dept_id = 2 WHERE matric_no = '12007';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '12007';

INSERT INTO Department (dept_name) 
VALUES ('Library and Information Science');
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('13114', 'Transfer Student',
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));

UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE matric_no = '13114';

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;