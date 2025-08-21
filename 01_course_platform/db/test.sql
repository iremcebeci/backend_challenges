INSERT INTO users (name, email, password_hash, role) VALUES
('İrem', 'irem@example.com', 'hashedpassword1', 'student'),
('Sena', 'sena@example.com', 'hashedpassword2', 'student'),
('Kerem', 'kerem@example.com', 'hashedpassword3', 'instructor'),
('Ruveyda', 'ruveyda@example.com', 'hashedpassword4', 'instructor');

INSERT INTO courses (title, description, start_date, duration) VALUES
('Node.js Bootcamp', 'Backend development course', '2025-09-01', '3 months'),
('React Mastery', 'Frontend course with React', '2025-09-15', '2 months');

INSERT INTO course_instructors (course_id, user_id) VALUES
(1, 3),
(2, 4);

INSERT INTO enrollments (user_id, course_id, status) VALUES
(1, 1, 'enrolled'),
(2, 2, 'enrolled');
