# Xom Data · Perfect squares
# Problem: https://xomdata.com/practice/py-perfect-squares
# Solved: 2026-09-04

def num_squares(n):
    if n == 0: return 0
    dp = [0] * (n + 1)
    dp[0], dp[1] = 0, 1
    for i in range(2, n + 1):
        dp[i] = i
        for x in range(1, int(i**0.5) + 1): dp[i] = min(dp[i], 1 + dp[i - x * x])
    
    return dp[n]
    pass
