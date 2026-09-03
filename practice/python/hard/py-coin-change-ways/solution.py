# Xom Data · Coin change II
# Problem: https://xomdata.com/practice/py-coin-change-ways
# Solved: 2026-09-03

def count_ways(coins, amount):
    n = len(coins)
    dp = [[0] * (amount + 1) for _ in range(n + 1)]
    dp[0][0] = 1
    for i in range(1, n + 1):
        for j in range(amount + 1):
            dp[i][j] += dp[i - 1][j]
            if j - coins[i - 1] >= 0:
                dp[i][j] += dp[i][j - coins[i - 1]]
    return dp[n][amount]
    pass
