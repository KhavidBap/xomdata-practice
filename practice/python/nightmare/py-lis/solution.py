# Xom Data · Longest increasing subsequence
# Problem: https://xomdata.com/practice/py-lis
# Solved: 2026-09-04

def lis_length(numbers):
    if not numbers: return 0
    n = len(numbers)
    lis = [1] * n
    for i in range(1, n):
        for prev in range(0, i):
            if numbers[i] > numbers[prev]: lis[i] = max(lis[i], lis[prev] + 1)
    return max(lis)
    pass
