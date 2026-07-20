# Xom Data · Count pairs with a target sum
# Problem: https://xomdata.com/practice/py-two-sum-count
# Solved: 2026-07-20

def count_pairs(numbers, target):
    res = 0
    for i in range(0, len(numbers) - 1):
        for j in range(i + 1, len(numbers)):
            if numbers[i] + numbers[j] == target: res += 1
    return res
    pass
