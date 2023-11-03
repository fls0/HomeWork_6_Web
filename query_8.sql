SELECT t.fullname, AVG(sc.score) as avg_score
FROM teachers t
JOIN subjects sub ON t.id = sub.teacher_id
JOIN scores sc ON sub.id = sc.subject_id
GROUP BY t.fullname;