-- Xom Data · Top 10 highest-paid employees and their leave days
-- Problem: https://xomdata.com/practice/medium-agg-127
-- Solved: 2026-09-18

WITH total_salary AS (
    SELECT
        employee_id,
        SUM(net_salary) AS total_received_salary
    FROM payroll
    GROUP BY employee_id
),
total_leaves AS (
    SELECT
        employee_id,
        COUNT(*) AS leave_count
    FROM leaves
    WHERE status = 'approved'
    GROUP BY employee_id
),
employee_salary AS (
    SELECT
        e.id,
        e.full_name,
        e.employee_code,
        d.department_name,
        ts.total_received_salary,
        COALESCE(tl.leave_count, 0) AS leave_count
    FROM employees e
    JOIN total_salary ts
        ON ts.employee_id = e.id
    JOIN departments d
        ON d.id = e.department_id
    LEFT JOIN total_leaves tl
        ON tl.employee_id = e.id
),
dept_avg AS (
    SELECT
        department_name,
        AVG(total_received_salary) AS avg_salary
    FROM employee_salary
    GROUP BY department_name
)

SELECT
    es.full_name,
    es.employee_code,
    es.department_name,
    es.total_received_salary,
    es.leave_count,
    ROUND(
        100.0 * (es.total_received_salary - da.avg_salary)
        / NULLIF(da.avg_salary, 0),
        2
    ) AS pct_above_dept_avg
FROM employee_salary es
JOIN dept_avg da
    ON da.department_name = es.department_name
ORDER BY
    es.total_received_salary DESC,
    es.employee_code ASC
LIMIT 10;
