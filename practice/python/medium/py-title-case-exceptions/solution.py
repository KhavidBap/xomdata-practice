# Xom Data · Capitalise a book title the publisher's way
# Problem: https://xomdata.com/practice/py-title-case-exceptions
# Solved: 2026-08-19

def book_title(text):
    lst = list(text.split())
    cap = [(word.capitalize() if word not in ['of', 'and', 'the', 'in', 'on'] else word) for word in lst]
    res = [(cap[i].capitalize() if i == 0 else cap[i]) for i in range(len(cap))]
    return ' '.join(res)
    pass
