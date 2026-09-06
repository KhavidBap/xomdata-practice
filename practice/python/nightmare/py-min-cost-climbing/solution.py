# Xom Data · Min cost climbing stairs
# Problem: https://xomdata.com/practice/py-min-cost-climbing
# Solved: 2026-09-06

def min_cost(cost):
    if len(cost) <= 1: return 0
    n = len(cost)
    if n == 1: return cost[0]
    dp = [0] * n
    dp[0] = cost[0]
    dp[1] = cost[1]
    for i in range(2, n): dp[i] = cost[i] + min(dp[i - 1], dp[i - 2])
    return min(dp[n - 1], dp[n - 2])
    pass
