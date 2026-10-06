-- Xom Data · Detect and output the shortest cycle in a directed graph (DFS)
-- Problem: https://xomdata.com/practice/nightmare-dfs-cycle-001
-- Solved: 2026-10-06

WITH RECURSIVE paths AS (
    -- Neo: mỗi cạnh là một đường đi bắt đầu từ node u
    SELECT
        e.u                                          AS start_node,
        e.v                                          AS cur_node,
        CAST(e.u AS TEXT) || '->' || CAST(e.v AS TEXT) AS path
    FROM edges e

    UNION ALL

    -- Mở rộng: chỉ đi tiếp khi đường đi chưa khép vòng (cur_node <> start_node)
    SELECT
        p.start_node,
        e.v,
        p.path || '->' || CAST(e.v AS TEXT)
    FROM paths p
    JOIN edges e
      ON e.u = p.cur_node
    WHERE p.cur_node <> p.start_node              -- đã quay về điểm đầu thì dừng
      AND (
            e.v = p.start_node                    -- cho phép khép vòng
         OR ('->' || p.path || '->') NOT LIKE
            ('%->' || CAST(e.v AS TEXT) || '->%') -- không thăm lại node trong đường đi hiện tại
      )
),
cycles AS (
    -- Chu trình = đường đi kết thúc tại chính node bắt đầu (gồm cả self-loop như '1->1')
    SELECT path
    FROM paths
    WHERE cur_node = start_node
)
SELECT
    CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END AS has_cycle,
    -- Ngắn nhất theo số ký tự, đồng độ dài thì so sánh chuỗi; NULL nếu không có chu trình
    (SELECT path
     FROM cycles
     ORDER BY LENGTH(path), path
     LIMIT 1)                                     AS cycle_nodes
FROM cycles;
