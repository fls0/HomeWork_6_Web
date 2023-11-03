 CREATE TABLE IF NOT EXISTS groups (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL
    );


CREATE TABLE IF NOT EXISTS teachers (
    id INTEGER PRIMARY KEY,
    fullname VARCHAR(50) NOT NULL
    );

CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    fullname VARCHAR(50) NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups(id)
        on delete cascade
    );

CREATE TABLE IF NOT EXISTS subjects (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
        on delete cascade
    );


CREATE TABLE IF NOT EXISTS scores (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    subject_id INTEGER,
    score INTEGER,
    date DATETIME,
    FOREIGN KEY (student_id) REFERENCES students (id),
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
    );