# Xom Data · Jump game
# Problem: https://xomdata.com/practice/py-jump-game
# Solved: 2026-09-04

import sys

def can_jump(arr):
    n = len(arr)
    dp = [sys.maxsize] * n
    dp[n - 1] = 0
    for i in range(n - 2, -1, -1):
        for j in range(i + 1, min(i + arr[i] + 1, n)):
            if dp[j] != sys.maxsize:
                dp[i] = min(dp[i], 1 + dp[j])
    return False if dp[0] == sys.maxsize else True
    pass
