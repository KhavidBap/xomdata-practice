-- Xom Data · Minimum vertex cover
-- Problem: https://xomdata.com/practice/nightmare-vc-001
-- Solved: 2026-10-06

with nodes AS (
    select u as node from edges
    UNION
    select v as node from edges
), ranked as (
    select node, (row_number() over (order by node) - 1)::int as idx
    from nodes
), node_count as (
    select count(*)::int as n from ranked
), edge_idx AS (
    select ru.idx as u_idx, rv.idx as v_idx
    from edges e
    join ranked ru on ru.node = e.u
    join ranked rv on rv.node = e.v
), masks as (
    select s.mask from node_count nc, generate_series(0, (1 << nc.n) - 1) as s(mask)
), valid_covers AS (
    select m.mask from masks m
    where not exists (select 1 from edge_idx ei where ((m.mask >> ei.u_idx) & 1) = 0 and ((m.mask >> ei.v_idx) & 1) = 0)
)

select min((select count(*) from ranked r where ((vc.mask >> r.idx) & 1) = 1)) as min_cover_size
from valid_covers vc
