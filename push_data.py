import sqlite3
import random

from psycopg2 import DatabaseError
from faker import Faker

fake = Faker()

conn = sqlite3.connect('sqlite.db')
cursor = conn.cursor()

groups = [fake.word() for _ in range(3)]
cursor.executemany('INSERT INTO groups (name) VALUES (?)', [(group,) for group in groups])

teachers = [fake.name() for _ in range(5)]
cursor.executemany('INSERT INTO teachers (fullname) VALUES (?)', [(teacher,) for teacher in teachers])

students = [(fake.name(), random.choice(range(1, 4))) for _ in range(50)]
cursor.executemany('INSERT INTO students (name, group_id) VALUES (?, ?)', students)

subjects = [(fake.word(), random.choice(range(1, 6))) for _ in range(8)]
cursor.executemany('INSERT INTO subjects (name, teacher_id) VALUES (?, ?)', subjects)

scores = [(random.choice(range(1, 51)), random.choice(range(1, 9)), random.randint(60, 100), fake.date_time_this_decade()) for _ in range(20)]
cursor.executemany('INSERT INTO scores (student_id, subject_id, score, date) VALUES (?, ?, ?, ?)', scores)

try:
    conn.commit()
except DatabaseError as e:
    conn.rollback()
finally:
    cursor.close()
    conn.close()