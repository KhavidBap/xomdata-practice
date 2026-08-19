-- Xom Data · Valedictorian, salutatorian, and the score gap
-- Problem: https://xomdata.com/practice/medium-topn-006
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
with ranked as (
    select class_name,
        row_number() over (partition by class_name order by score desc, student_name) as position,
        student_name, score,
        case when lag(score, 1) over (partition by class_name order by score desc, student_name) - score is null then 0 else lag(score, 1) over (partition by class_name order by score desc, student_name) - score end as behind_top
    from students
)

select * from ranked
where position <= 2
