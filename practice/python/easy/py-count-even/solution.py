# Xom Data · Count products with an even code
# Problem: https://xomdata.com/practice/py-count-even
# Solved: 2026-07-10

def count_even(numbers):
    res = 0
    for num in numbers:
        if num % 2 == 0: res += 1
    return res
    pass
