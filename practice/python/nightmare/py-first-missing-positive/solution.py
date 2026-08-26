# Xom Data · First missing positive
# Problem: https://xomdata.com/practice/py-first-missing-positive
# Solved: 2026-08-26

def first_missing(nums):
    res = 1
    while res in nums: res += 1
    return res
    pass
