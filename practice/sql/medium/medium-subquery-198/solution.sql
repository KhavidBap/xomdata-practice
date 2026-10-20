-- Xom Data · Top 10 most-borrowed books
-- Problem: https://xomdata.com/practice/medium-subquery-198
-- Solved: 2026-10-20

with loan_counts as (
    select book_id, count(id) as borrow_count
    from book_loans
    group by book_id
), reservation_counts as (
    select book_id, count(id) as pending_reservation
    from reservations
    where status = 'ready_pickup'
    group by book_id
), stats as (
    select title, full_name as authors, publisher_name, genre_name, genre_id, borrow_count,
        coalesce(pending_reservation, 0) as pending_reservation,
        borrow_count + coalesce(pending_reservation, 0) as engagement
    from books
    join loan_counts on loan_counts.book_id = books.id
    left join reservation_counts on reservation_counts.book_id = books.id
    left join authors on authors.id = author_id
    left join publishers on publishers.id = publisher_id
    left join genres on genres.id = genre_id
)

select title, authors, publisher_name, genre_name, borrow_count, pending_reservation, engagement,
    dense_rank() over (order by engagement desc) as overall_rank,
    rank() over (partition by genre_id order by engagement desc) as rank_in_genre
from stats
order by overall_rank, title
limit 10;
