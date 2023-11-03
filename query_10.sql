SELECT sub.name
FROM subjects sub
WHERE sub.teacher_id = (SELECT id FROM teachers WHERE fullname = 'Kayla Smith')
AND sub.id IN (SELECT subject_id FROM scores WHERE student_id = (SELECT id FROM students WHERE name = 'Jeffery Davis'));