CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('student', 'instructor', 'admin')) NOT NULL
);

CREATE INDEX idx_users_email
ON users(email);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    duration INTERVAL NOT NULL
);

CREATE INDEX idx_courses_title
ON courses(title);

CREATE TABLE course_instructors (
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    PRIMARY KEY (course_id, user_id)
);

CREATE TABLE enrollments (
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,
    status VARCHAR(20) CHECK (status IN ('enrolled', 'completed', 'dropped')) NOT NULL DEFAULT 'enrolled',
    enrolled_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, course_id)
);

CREATE INDEX idx_enrollments_status
ON enrollments(status);