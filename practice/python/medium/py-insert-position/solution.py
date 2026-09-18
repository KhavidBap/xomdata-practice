# Xom Data · Insertion point that keeps a list sorted
# Problem: https://xomdata.com/practice/py-insert-position
# Solved: 2026-09-18

def insert_position(values, target):
    l, r = 0, len(values)
    while l < r:
        m = (l + r) // 2
        if values[m] < target: l = m + 1
        else: r = m
    return l
    pass
