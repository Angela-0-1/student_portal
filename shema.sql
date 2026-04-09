-- STUDENTS
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_no VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(60),
    year_of_study INT CHECK (year_of_study BETWEEN 1 AND 6),
    enrolled_on DATE DEFAULT CURRENT_DATE
);

-- UNITS
CREATE TABLE units (
    unit_id SERIAL PRIMARY KEY,
    unit_code VARCHAR(20) UNIQUE NOT NULL,
    unit_name VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3
);

-- GRADES
CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
    unit_id INT REFERENCES units(unit_id) ON DELETE CASCADE,
    score NUMERIC(5,2) CHECK (score BETWEEN 0 AND 100),
    grade_letter VARCHAR(2),
    semester VARCHAR(20),
    recorded_on DATE DEFAULT CURRENT_DATE
);

-- SAMPLE STUDENTS (10)
INSERT INTO students (student_no, full_name, email, department, year_of_study) VALUES
('KCA001','John Doe','john@example.com','IT',2),
('KCA002','Jane Smith','jane@example.com','Business',1),
('KCA003','Mike Brown','mike@example.com','IT',3),
('KCA004','Sarah Lee','sarah@example.com','Finance',2),
('KCA005','David Kim','david@example.com','IT',4),
('KCA006','Linda Ray','linda@example.com','HR',1),
('KCA007','Chris Paul','chris@example.com','IT',2),
('KCA008','Emma Stone','emma@example.com','Business',3),
('KCA009','Noah John','noah@example.com','IT',2),
('KCA010','Olivia King','olivia@example.com','Finance',1);

-- SAMPLE UNITS (10)
INSERT INTO units (unit_code, unit_name) VALUES
('IT101','Programming'),
('IT102','Databases'),
('IT103','Networking'),
('BUS101','Business Intro'),
('FIN101','Finance Basics'),
('HR101','Human Resource'),
('IT201','Algorithms'),
('IT202','Web Dev'),
('BUS201','Marketing'),
('FIN201','Accounting');

-- SAMPLE GRADES (20)
INSERT INTO grades (student_id, unit_id, score, grade_letter, semester) VALUES
(1,1,85,'A','Sem1'),
(1,2,78,'B','Sem1'),
(2,4,70,'B','Sem1'),
(3,1,90,'A','Sem1'),
(4,5,60,'C','Sem1'),
(5,2,88,'A','Sem1'),
(6,6,75,'B','Sem1'),
(7,3,69,'C','Sem1'),
(8,4,92,'A','Sem1'),
(9,1,55,'D','Sem1'),
(10,5,80,'A','Sem1'),
(2,5,66,'C','Sem2'),
(3,2,73,'B','Sem2'),
(4,1,81,'A','Sem2'),
(5,3,77,'B','Sem2'),
(6,2,68,'C','Sem2'),
(7,1,90,'A','Sem2'),
(8,5,85,'A','Sem2'),
(9,3,60,'C','Sem2'),
(10,2,79,'B','Sem2');