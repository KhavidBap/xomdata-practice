-- Xom Data · PDF documents in the attachment store
-- Problem: https://xomdata.com/practice/easy-like-004
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select file_name, uploaded_by
from attachments
where substr(file_name, -3) = 'pdf'
