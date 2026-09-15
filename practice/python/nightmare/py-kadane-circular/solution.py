# Xom Data · Maximum circular subarray sum
# Problem: https://xomdata.com/practice/py-kadane-circular
# Solved: 2026-09-15

def max_circular(arr):
    n = len(arr)
    res = arr[0]
    for i in range(n):
        cur = 0
        for j in range(n):
            idx = (i + j) % n
            cur += arr[idx]            
            res = max(res, cur)
    return res
    pass
