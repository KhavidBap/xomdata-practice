# Xom Data · Merge intervals
# Problem: https://xomdata.com/practice/py-merge-intervals
# Solved: 2026-09-03

def merge_intervals(arr):
    n = len(arr)
    arr.sort()
    res = []
    for i in range(n):
        start = arr[i][0]
        end = arr[i][1]
        if res and res[-1][1] >= end:
            continue
        for j in range(i + 1, n):
            if arr[j][0] <= end:
                end = max(end, arr[j][1])
        res.append([start, end])
    return res
    pass
