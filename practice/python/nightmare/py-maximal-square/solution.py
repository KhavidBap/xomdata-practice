# Xom Data · Maximal square
# Problem: https://xomdata.com/practice/py-maximal-square
# Solved: 2026-09-04

def maximal_square(mat):
    if not mat: return 0
    n, m = len(mat), len(mat[0])
    ans = 0
    dp = [[0] * (m + 1) for _ in range(n + 1)]
    for i in range(n - 1, -1, -1):
        for j in range(m - 1, -1, -1):
            if mat[i][j] == 0:
                dp[i][j] = 0
                continue
            dp[i][j] = 1 + min(dp[i][j + 1], dp[i + 1][j], dp[i + 1][j + 1])
            ans = max(ans, dp[i][j])
    return ans * ans
    pass
