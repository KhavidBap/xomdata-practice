-- Xom Data · Treemap layout: split a 1000×1000 canvas by value ratio
-- Problem: https://xomdata.com/practice/nightmare-treemap-001
-- Solved: 2026-10-02

with recursive ordered as (
    select c.id, c.parent_id, c.name, c.value, p.value AS pvalue,
        sum(c.value) over (partition by c.parent_id order by c.value desc, c.id) - c.value as prev
    from categories c
    left join categories p on p.id = c.parent_id
), tree as (
    select id, name, 0 as depth, 0.0 as x, 0.0 as y, 1000.0 as w, 1000.0 as h
    from categories
    where parent_id is null

    union all

    select o.id, o.name, t.depth + 1,
        case when t.depth % 2 = 0 then t.x + coalesce(t.w * o.prev / nullif(o.pvalue, 0), 0) else t.x end,
        case when t.depth % 2 = 0 then t.y else t.y + coalesce(t.h * o.prev / nullif(o.pvalue, 0), 0) end,
        case when t.depth % 2 = 0 then coalesce(t.w * o.value / nullif(o.pvalue, 0), 0) else t.w end,
        case when t.depth % 2 = 0 then t.h else coalesce(t.h * o.value / nullif(o.pvalue, 0), 0) end
    from tree t
    join ordered o on o.parent_id = t.id
)

select id, name, round(x, 2) AS x, round(y, 2) AS y, round(w, 2) AS w, round(h, 2) AS h
from tree
order by id
