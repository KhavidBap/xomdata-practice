# Xom Data · Best k-day window by total
# Problem: https://xomdata.com/practice/py-window-max-sum
# Solved: 2026-08-28

def best_window(values, k):
    if k > len(values):
        return None
    window = sum(values[:k])
    res = window
    for i in range(k, len(values)):
        window += values[i] - values[i-k]
        res = max(res, window)
    return res
