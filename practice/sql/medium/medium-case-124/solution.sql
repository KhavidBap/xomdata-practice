-- Xom Data · Classify student academic performance
-- Problem: https://xomdata.com/practice/medium-case-124
-- Solved: 2026-07-13

WITH score AS (
    SELECT full_name, student_code, ROUND(AVG(final_score), 2) AS avg_score
    FROM students
    INNER JOIN scores ON students.id = scores.student_id
    GROUP BY full_name, student_code
)

SELECT full_name, student_code, avg_score,
    CASE WHEN avg_score >= 9 THEN 'Excellent'
        WHEN avg_score >= 8 THEN 'Good'
        WHEN avg_score >= 7 THEN 'Fair'
        WHEN avg_score >= 5 THEN 'Average'
        ELSE 'Poor' END AS grade,
    DENSE_RANK() OVER (ORDER BY avg_score DESC) AS class_rank
FROM score
ORDER BY class_rank
LIMIT 20
