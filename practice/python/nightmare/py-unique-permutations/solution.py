# Xom Data · Number of distinct permutations
# Problem: https://xomdata.com/practice/py-unique-permutations
# Solved: 2026-08-27

from collections import Counter
from math import factorial

def count_permutations(numbers):
    result = factorial(len(numbers))
    for count in Counter(numbers).values():
        result //= factorial(count)
    return result
