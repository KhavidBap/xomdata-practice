# Xom Data · Candy distribution by rank
# Problem: https://xomdata.com/practice/py-candy
# Solved: 2026-09-04

def min_candies(arr):
    if not arr: return 0
    n = len(arr)
    total = n
    i = 1
    while i < n:
        if arr[i] == arr[i - 1]:
            i += 1
            continue
        peak = 0
        while i < n and arr[i] > arr[i - 1]:
            peak += 1
            total += peak
            i += 1
        if i == n: return total
        valley = 0
        while i < n and arr[i] < arr[i - 1]:
            valley += 1
            total += valley
            i += 1
        total -= min(peak, valley)
    return total
    pass
