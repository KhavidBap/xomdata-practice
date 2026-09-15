# Xom Data · Minimum path sum
# Problem: https://xomdata.com/practice/py-min-path-sum
# Solved: 2026-09-15

def min_path_sum(mat):
    if not mat or not mat[0]: return 0
    m, n = len(mat), len(mat[0])
    dp = [[0] * n for _ in range(m)]
    dp[0][0] = mat[0][0]
    for j in range(1, n): dp[0][j] = dp[0][j - 1] + mat[0][j]
    for i in range(1, m): dp[i][0] = dp[i - 1][0] + mat[i][0]
    for i in range(1, m):
        for j in range(1, n):
            dp[i][j] = mat[i][j] + min(dp[i - 1][j], dp[i][j - 1])
    return dp[m - 1][n - 1]
    pass
