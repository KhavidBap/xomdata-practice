# Xom Data · Count subarrays summing to k
# Problem: https://xomdata.com/practice/py-subarray-sum-k
# Solved: 2026-09-11

def count_subarrays(numbers, k):
    pref = {}
    res, cur = 0, 0
    for num in numbers:
        cur += num
        if cur == k: res += 1
        if cur - k in pref: res += pref[cur - k]
        pref[cur] = pref.get(cur, 0) + 1
    return res
    pass
