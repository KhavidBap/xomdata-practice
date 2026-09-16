-- Xom Data · Students above the subject average
-- Problem: https://xomdata.com/practice/medium-subquery-028
-- Solved: 2026-09-16

with avg_score as (
    select subject_id, subject_name, round(avg(final_score), 2) as subject_avg
    from subjects
    join grades on subject_id = subjects.id
    group by subject_name
)

select full_name, subject_name, final_score, subject_avg,
    final_score - subject_avg as diff_from_avg
from grades
join avg_score on grades.subject_id = avg_score.subject_id
join students on student_id = students.id
where final_score > subject_avg
order by diff_from_avg desc, subject_name, full_name
