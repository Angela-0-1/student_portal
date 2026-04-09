-- UNITS TABLE
-- =========================
CREATE TABLE units (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20) UNIQUE NOT NULL
);

-- =========================
-- GRADES TABLE
-- =========================
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
    unit_id INTEGER REFERENCES units(id) ON DELETE CASCADE,
    score INTEGER CHECK (score >= 0 AND score <= 100)
);

-- =========================
-- INSERT STUDENTS (10)
-- =========================
INSERT INTO students (name, email) VALUES
('John Doe', 'john@example.com'),
('Jane Smith', 'jane@example.com'),
('Alice Brown', 'alice@example.com'),
('Bob Johnson', 'bob@example.com'),
('Charlie Davis', 'charlie@example.com'),
('David Wilson', 'david@example.com'),
('Eve White', 'eve@example.com'),
('Frank Harris', 'frank@example.com'),
('Grace Lee', 'grace@example.com'),
('Henry King', 'henry@example.com');

-- =========================
-- INSERT UNITS (5)
-- =========================
INSERT INTO units (name, code) VALUES
('Mathematics', 'MATH101'),
('Computer Science', 'CS102'),
('Physics', 'PHY103'),
('Database Systems', 'DB104'),
('Web Development', 'WD105');

-- =========================
-- INSERT GRADES (20)
-- =========================
INSERT INTO grades (student_id, unit_id, score) VALUES
(1, 1, 85),
(1, 2, 78),
(2, 1, 90),
(2, 3, 88),
(3, 2, 76),
(3, 4, 80),
(4, 1, 65),
(4, 5, 70),
(5, 3, 88),
(5, 2, 92),
(6, 4, 75),
(6, 1, 68),
(7, 5, 95),
(7, 2, 89),
(8, 3, 72),
(8, 4, 85),
(9, 1, 91),
(9, 5, 87),
(10, 2, 77),
(10, 3, 69);
