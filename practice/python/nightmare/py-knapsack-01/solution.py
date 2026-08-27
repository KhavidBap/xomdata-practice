# Xom Data · 0/1 Knapsack
# Problem: https://xomdata.com/practice/py-knapsack-01
# Solved: 2026-08-27

def rec(capacity, values, weights, n):
    if n == 0 or capacity == 0: return 0
    pick = 0
    if weights[n - 1] <= capacity:
        pick = values[n - 1] + rec(capacity - weights[n - 1], values, weights, n - 1)
    no = rec(capacity, values, weights, n - 1)
    return max(pick, no)

def knapsack(weights, values, capacity):
    n = len(values)
    return rec(capacity, values, weights, n) 
    pass
