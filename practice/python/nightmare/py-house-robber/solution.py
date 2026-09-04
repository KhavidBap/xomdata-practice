# Xom Data · House robber
# Problem: https://xomdata.com/practice/py-house-robber
# Solved: 2026-09-04

def rob(arr):
    if not arr: return 0
    n = len(arr)
    dp = [0] * (n + 1)
    dp[0] = 0
    dp[1] = arr[0]
    for i in range(2, n + 1):
        dp[i] = max(arr[i - 1] + dp[i - 2], dp[i - 1])
    return dp[n]
    pass
