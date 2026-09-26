-- Xom Data · Swap seats in pairs (1↔2, 3↔4, …)
-- Problem: https://xomdata.com/practice/nightmare-exchange-seats-001
-- Solved: 2026-09-26

SELECT
    s.id,
    CASE
        WHEN s.id % 2 = 1 AND s2.id IS NOT NULL THEN s2.student
        WHEN s.id % 2 = 0 THEN s1.student
        ELSE s.student
    END AS student
FROM Seats s
LEFT JOIN Seats s1
    ON s1.id = s.id - 1
LEFT JOIN Seats s2
    ON s2.id = s.id + 1
ORDER BY s.id;
