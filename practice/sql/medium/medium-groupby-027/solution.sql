-- Xom Data · Average score per subject
-- Problem: https://xomdata.com/practice/medium-groupby-027
-- Solved: 2026-09-17

select subject_name, credits,
    count(grades.id) as student_count,
    round(avg(final_score), 2) as avg_score,
    round(1.0 * sum(case when final_score >= 5 then 1 else 0 end) / count(grades.id) * 100, 2) as pass_rate,
    rank() over (order by avg(final_score) desc) as rank_by_avg,
    ntile(4) over (order by avg(final_score) desc, subject_name) as difficulty_quartile
from grades
join subjects on subject_id = subjects.id
group by subject_name
order by rank_by_avg, subject_name
