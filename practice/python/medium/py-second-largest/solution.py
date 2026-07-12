# Xom Data · Second largest value
# Problem: https://xomdata.com/practice/py-second-largest
# Solved: 2026-07-12

def second_largest(numbers):
    lst = sorted(list(set(numbers)), reverse = True)
    return (None if len(lst) <= 1 else lst[1])
    pass
