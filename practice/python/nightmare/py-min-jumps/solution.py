# Xom Data · Jump game II
# Problem: https://xomdata.com/practice/py-min-jumps
# Solved: 2026-08-28

def min_jumps(numbers):
    n = len(numbers)
    if n == 1:
        return 0
    if numbers[0] == 0:
        return -1
    m, cur, jump = 0, 0, 0
    for i in range(n):
        m = max(m, i + numbers[i])
        if m >= n - 1:
            return jump + 1
        if i == cur:
            if i == m:
                return -1
            jump += 1
            cur = m
    return -1
