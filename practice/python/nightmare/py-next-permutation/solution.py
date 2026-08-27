# Xom Data · Next permutation
# Problem: https://xomdata.com/practice/py-next-permutation
# Solved: 2026-08-27

def next_permutation(nums):
    n = len(nums)
    pivot = -1
    for i in range(n - 2, -1, -1):
        if nums[i] < nums[i + 1]:
            pivot = i
            break
    if pivot == -1:
        nums.reverse()
        return nums
    for i in range(n - 1, pivot, -1):
        if nums[i] > nums[pivot]:
            nums[i], nums[pivot] = nums[pivot], nums[i]
            break
    l, r = pivot + 1, n - 1
    while l < r:
        nums[l], nums[r] = nums[r], nums[l]
        l += 1
        r -= 1
    return nums
    pass
