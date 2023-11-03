SELECT sub.name
FROM students s
JOIN scores sc ON s.id = sc.student_id
JOIN subjects sub ON sc.subject_id = sub.id
WHERE s.name = 'Dustin Martin';