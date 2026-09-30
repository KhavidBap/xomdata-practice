-- Xom Data · Three-level sales totals: detail, by region, company-wide
-- Problem: https://xomdata.com/practice/expert-final-mix-009
-- Solved: 2026-09-30

with region_room as (
    select region, room, sum(revenue) as total_sales
    from sales
    group by region, room
), region as (
    select region, NULL as room, sum(revenue) as total_sales
    from sales
    group by region
), all_region as (
    select NULL as region, NULL as room, sum(revenue) as total_sales
    from sales
)

select * from region_room
union
select * from region
union
select * from all_region
order by region, room
