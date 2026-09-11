-- Xom Data · Consultation revenue by doctor
-- Problem: https://xomdata.com/practice/medium-join-141
-- Solved: 2026-09-11

with doctor_faculty as (
    select f.faculty_name, d.full_name as doctor_name, d.id
    from faculties f
    inner join doctors d on d.faculty_id = f.id
), grouped as (
    select d.faculty_name, d.doctor_name, m.visit_fee
    from doctor_faculty d
    inner join medical_visits m on m.doctor_id = d.id
), calculation as (
    select faculty_name, doctor_name, count(doctor_name) as visit_count,
    avg(visit_fee) as avg_exam_fee, sum(visit_fee) as total_exam_fee
    from grouped
    group by faculty_name, doctor_name
)

select *,
    rank() over (order by total_exam_fee desc) as overall_rank,
    dense_rank() over (partition by faculty_name order by total_exam_fee desc) as rank_in_faculty
from calculation
