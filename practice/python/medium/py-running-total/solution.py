# Xom Data · Cumulative total by day
# Problem: https://xomdata.com/practice/py-running-total
# Solved: 2026-07-20

def running_total(numbers):
    if numbers == []: return []
    else:
        res = [numbers[0]]
        for i in range(1, len(numbers)): res.append(numbers[i] + res[-1])
        return res
    pass
