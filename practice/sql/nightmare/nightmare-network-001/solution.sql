-- Xom Data · Friends of friends within 2 hops
-- Problem: https://xomdata.com/practice/nightmare-network-001
-- Solved: 2026-10-08

with friends as (
    select user_a as person, user_b as friend from friendships where user_a <> user_b
    union
    select user_b as person, user_a as friend from friendships where user_b <> user_a
)

select f1.person as user_id, f2.friend as friend_of_friend,
    count(*) as n_mutual
from friends f1 join friends f2 on f2.person = f1.friend
where f2.friend <> f1.person and not exists (
    select 1 from friends d
    where d.person = f1.person and d.friend = f2.friend
)
group by f1.person, f2.friend
order by user_id, n_mutual desc, friend_of_friend
