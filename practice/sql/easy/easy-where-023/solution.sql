-- Xom Data · Multi-day tours
-- Problem: https://xomdata.com/practice/easy-where-023
-- Solved: 2026-07-08

-- Viết SQL của bạn ở đây
SELECT tour_name, days, adult_price
FROM tours
WHERE days >= 4
ORDER BY tour_name
