-- Xom Data · Rank hotels by room price within each destination
-- Problem: https://xomdata.com/practice/medium-join-155
-- Solved: 2026-09-16

with joined as (
    select hotel_rooms.id, destination_name, hotel_name, star_class, nightly_rate
    from hotel_rooms
    join hotels on hotels.id = hotel_rooms.hotel_id
    join destinations on destinations.id = hotels.destination_id
)

select hotel_name, star_class, destination_name,
    count(id) as room_count,
    min(nightly_rate) as min_price, max(nightly_rate) as max_price, avg(nightly_rate) as avg_price,
    max(nightly_rate) - min(nightly_rate) as price_spread,
    rank() over (partition by destination_name order by avg(nightly_rate) desc) as rank_in_destination
from joined
group by hotel_name
having room_count >= 2
