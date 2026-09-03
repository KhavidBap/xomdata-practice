# Xom Data · Subset sum exists
# Problem: https://xomdata.com/practice/py-subset-sum
# Solved: 2026-09-03

def can_sum(numbers, target):
    if target == 0: return True
    sum = {0}
    for num in numbers:
        new = {s + num for s in sum}
        sum.update(new)
        if target in sum: return True
    return False
    pass
