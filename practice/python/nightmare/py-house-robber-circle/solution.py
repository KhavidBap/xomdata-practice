# Xom Data · House robber II
# Problem: https://xomdata.com/practice/py-house-robber-circle
# Solved: 2026-09-15

def maxValRec(arr, i, j, memo):
    if i > j: return 0
    if i == j: return arr[i]
    if memo[j] != -1: return memo[j]
    pick = arr[j] + maxValRec(arr, i, j - 2, memo)
    notPick = maxValRec(arr, i, j - 1, memo)
    memo[j] = max(pick, notPick)
    return memo[j]

def rob_circle(arr):
    if not arr: return 0
    if len(arr) == 1: return sum(arr)
    n = len(arr)
    ans = 0
    memo = [-1] * n
    ans = max(ans, maxValRec(arr, 0, n - 2, memo))
    memo = [-1] * n
    ans = max(ans, maxValRec(arr, 1, n - 1, memo))
    return ans
    pass
