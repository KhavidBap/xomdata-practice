-- Xom Data · Showtime count and average ticket price per film
-- Problem: https://xomdata.com/practice/medium-join-076
-- Solved: 2026-09-15

with joined as (
    select movie_name, genres,
        count(showtimes.id) as showtime_count,
        avg(ticket_price) as avg_ticket_price
    from movies
    join showtimes on showtimes.movie_id = movies.id
    group by movie_name
), ranked as (
    select *,
        dense_rank() over (partition by genres order by avg_ticket_price desc) as rank_in_genre
    from joined
), top_genre as (
    select movie_name, genres
    from ranked
    where rank_in_genre = 1
)

select ranked.movie_name, ranked.genres, showtime_count, avg_ticket_price, rank_in_genre,
    top_genre.movie_name as top_movie_in_genre
from ranked
join top_genre on ranked.genres = top_genre.genres
