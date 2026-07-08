-- Xom Data · Books priced above a threshold
-- Problem: https://xomdata.com/practice/easy-where-012
-- Solved: 2026-07-08

-- Viết SQL của bạn ở đây
SELECT title, price
FROM books
WHERE price > 100000
ORDER BY price DESC
