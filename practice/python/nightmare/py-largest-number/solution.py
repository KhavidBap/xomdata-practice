# Xom Data · Largest number
# Problem: https://xomdata.com/practice/py-largest-number
# Solved: 2026-08-27

from itertools import permutations

def largest_number(numbers):
    res = int(max((''.join(i) for i in permutations(str(i) for i in numbers)), key = int))
    return str(res)
    pass
