SELECT s.name, AVG(sc.score) as avg_score
FROM students s
JOIN scores sc ON s.id = sc.student_id
WHERE sc.subject_id = (SELECT id FROM subjects WHERE name = 'drop')
GROUP BY s.name
ORDER BY avg_score DESC
LIMIT 1;