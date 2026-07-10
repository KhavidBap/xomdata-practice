# Xom Data · Count occurrences of a code
# Problem: https://xomdata.com/practice/py-count-value
# Solved: 2026-07-10

def count_value(items, target):
    res = 0
    for item in items:
        if item == target: res += 1
    return res
    pass
