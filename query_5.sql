SELECT DISTINCT sub.name
FROM subjects sub
WHERE sub.teacher_id = (SELECT id FROM teachers WHERE fullname = 'Michael Raymond');