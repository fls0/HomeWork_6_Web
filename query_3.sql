SELECT g.name, AVG(sc.score) as avg_score
FROM groups g
JOIN students s ON g.id = s.group_id
JOIN scores sc ON s.id = sc.student_id
WHERE sc.subject_id = (SELECT id FROM subjects WHERE name = 'market')
GROUP BY g.name;