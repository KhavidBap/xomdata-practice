# Xom Data · Longest mountain in array
# Problem: https://xomdata.com/practice/py-longest-mountain
# Solved: 2026-09-04

def longest_mountain(arr):
    n = len(arr)
    if n < 3: return 0
    ans = 0
    i = 1
    while i <= n - 2:
        if arr[i] > arr[i - 1] and arr[i] > arr[i + 1]:
            count = 0
            j = i 
            while j > 0 and arr[j] > arr[j - 1]:
                count += 1
                j -= 1
            while i <= n - 2 and arr[i] > arr[i + 1]:
                count += 1
                i += 1
            ans = max(ans, count)
        else: i += 1
    if ans > 0: return ans + 1
    return ans
    pass
