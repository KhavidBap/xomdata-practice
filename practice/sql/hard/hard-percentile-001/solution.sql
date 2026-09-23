-- Xom Data · Median and percentile salary by department
-- Problem: https://xomdata.com/practice/hard-percentile-001
-- Solved: 2026-09-23

WITH ranked AS (
    SELECT department, salary,
        percent_rank() OVER (
            PARTITION BY department
            ORDER BY salary
        ) AS pr
    FROM employees
)
SELECT
    department,

    (
        SELECT salary
        FROM ranked r2
        WHERE r2.department = r.department
        ORDER BY ABS(pr - 0.25), salary
        LIMIT 1
    ) AS p25,

    (
        SELECT salary
        FROM ranked r2
        WHERE r2.department = r.department
        ORDER BY ABS(pr - 0.50), salary
        LIMIT 1
    ) AS p50,

    (
        SELECT salary
        FROM ranked r2
        WHERE r2.department = r.department
        ORDER BY ABS(pr - 0.75), salary
        LIMIT 1
    ) AS p75

FROM ranked r
GROUP BY department
ORDER BY department;
