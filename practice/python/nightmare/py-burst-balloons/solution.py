# Xom Data · Burst balloons for maximum coins
# Problem: https://xomdata.com/practice/py-burst-balloons
# Solved: 2026-09-12

def max_coins(nums):
    nums = [1] + nums + [1]
    n = len(nums)
    dp = [[0] * n for _ in range(n)]
    for length in range(2, n):
        for left in range(n - length):
            right = left + length
            for k in range(left + 1, right):
                coins = dp[left][k] + dp[k][right] + nums[left] * nums[k] * nums[right]
                dp[left][right] = max(dp[left][right], coins)
    return dp[0][n - 1]
    pass
