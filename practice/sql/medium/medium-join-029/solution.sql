-- Xom Data · Instructor teaching load
-- Problem: https://xomdata.com/practice/medium-join-029
-- Solved: 2026-09-15

with joined as (
    select full_name, academic_degree,
        count(name) as subjects_taught, 
        rank() over (order by count(name) desc) as workload_rank
    from lecturers
    join subjects on subjects.lecturer_id = lecturers.id
    group by full_name
)

select *,
    sum(subjects_taught) over (order by workload_rank, full_name) as cumulative_subjects
from joined
