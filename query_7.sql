SELECT s.name, sc.score
FROM students s
JOIN scores sc ON s.id = sc.student_id
JOIN groups g ON s.group_id = g.id
WHERE g.name = 'serious' AND sc.subject_id = (SELECT id FROM subjects WHERE name = 'check');