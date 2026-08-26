-- Xom Data · Distance from the class average
-- Problem: https://xomdata.com/practice/medium-winagg-003
-- Solved: 2026-08-26

-- Viết SQL của bạn ở đây
select class_name, student_name, score, 
    round(1.0 * score - 1.0 * avg(score) over (partition by class_name), 2) as diff_from_avg
from scores
order by class_name, student_name
