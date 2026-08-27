# Xom Data · 3Sum
# Problem: https://xomdata.com/practice/py-3sum-count
# Solved: 2026-08-27

def count_triplets(numbers):
    res = []
    n = len(numbers)
    for i in range(n - 2):
        for j in range(i + 1, n - 1):
            for k in range(j + 1, n):
                if numbers[i] + numbers[j] + numbers[k] == 0:
                    lst = sorted([numbers[i], numbers[j], numbers[k]])
                    if lst not in res: res.append(lst)
    return len(res)
    pass
