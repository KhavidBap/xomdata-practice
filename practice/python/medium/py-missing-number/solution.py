# Xom Data · Missing number
# Problem: https://xomdata.com/practice/py-missing-number
# Solved: 2026-07-12

def missing_number(numbers):
    s = (len(numbers) + 1) * (len(numbers) + 2) // 2
    return s - sum(numbers)
    pass
