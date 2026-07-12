# Xom Data · Most frequent character
# Problem: https://xomdata.com/practice/py-most-frequent
# Solved: 2026-07-12

def most_frequent(text):
    lst = list(text)
    res = 0
    for c in lst:
        x = lst.count(c)
        if x > res:
            char = c
            res = x
    return char
    pass
