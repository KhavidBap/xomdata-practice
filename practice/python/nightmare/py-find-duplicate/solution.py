# Xom Data · Find the duplicate number
# Problem: https://xomdata.com/practice/py-find-duplicate
# Solved: 2026-08-18

def find_duplicate(nums):
    for num in nums:
        idx = abs(num)
        if nums[idx] < 0:
            return idx
        nums[idx] = -nums[idx]
    return len(nums)
