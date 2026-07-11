# Xom Data · Total receipts
# Problem: https://xomdata.com/practice/py-sum-positive
# Solved: 2026-07-11

def sum_positive(numbers):
    res = 0
    for num in numbers:
        if num > 0: res += num
    return res
    pass
