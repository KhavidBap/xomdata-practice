# Xom Data · Sort colors
# Problem: https://xomdata.com/practice/py-sort-colors
# Solved: 2026-08-27

def sort_colors(numbers):
    a, b, c = 0, 0, 0
    for num in numbers:
        if num == 0: a += 1
        if num == 1: b += 1
        if num == 2: c += 1
    return ([0] * a + [1] * b + [2] * c)
    pass
