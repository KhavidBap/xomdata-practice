# Xom Data · Shorten a description by word count
# Problem: https://xomdata.com/practice/py-truncate-words
# Solved: 2026-08-19

def first_words(text, limit):
    lst = list(text.split())
    print(lst)
    if len(lst) <= limit: return ' '.join(lst)
    else: return ' '.join(lst[:limit]) + '...'
    pass
