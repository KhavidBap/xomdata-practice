# Xom Data · Sliding window maximum
# Problem: https://xomdata.com/practice/py-max-sliding-window
# Solved: 2026-08-28

def max_sliding_window(numbers, k):
    res = []
    for i in range(len(numbers) - k + 1):
        res.append(max(numbers[i:i + k]))
    return res
    pass
