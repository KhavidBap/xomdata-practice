# Xom Data · Two sum
# Problem: https://xomdata.com/practice/py-two-sum-indices
# Solved: 2026-08-27

def two_sum(numbers, target):
    res = []
    for i in range(0, len(numbers) - 1):
        for j in range(i + 1, len(numbers)):
            if numbers[i] + numbers[j] == target:
                res.append(i)
                res.append(j)
    return res
    pass
