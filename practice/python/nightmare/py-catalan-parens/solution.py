# Xom Data · Number of valid parentheses combinations
# Problem: https://xomdata.com/practice/py-catalan-parens
# Solved: 2026-09-04

def count_parens(n):
    n *= 2
    if n % 2 == 1 or n == 0: return 1
    pairs = n // 2
    dp = [[0] * (pairs + 1) for _ in range(pairs + 1)]
    for close in range(pairs + 1): dp[0][close] = 1
    for open in range(1, pairs + 1):
        for close in range(open, pairs + 1):  
            dp[open][close] = dp[open - 1][close] + dp[open][close - 1]
    return dp[pairs][pairs]
    pass
