-- Xom Data · Root path plus subtree sum per node
-- Problem: https://xomdata.com/practice/nightmare-tree-path-001
-- Solved: 2026-10-08

with recursive tree as (
    select n.id, n.name, 0 as depth, n.name as path
    from nodes n
    where n.parent_id is null
    union all
    select c.id, c.name, t.depth + 1, t.path || ' > ' || c.name
    from tree t
    join nodes c on c.parent_id = t.id
), descendants as (
    select n.id as ancestor_id, n.id as node_id, n.budget as budget
    from nodes n
    union all
    select d.ancestor_id, c.id, c.budget
    from descendants d 
    join nodes c on c.parent_id = d.node_id
), subtree_stats as (
    select d.ancestor_id, count(*) as subtree_size,
        coalesce(sum(d.budget), 0) as subtree_budget
    from descendants d
    group by d.ancestor_id
)

select t.id, t.name, t.depth, t.path, s.subtree_size, s.subtree_budget
from tree t
join subtree_stats s on s.ancestor_id = t.id
order by t.depth, t.id
