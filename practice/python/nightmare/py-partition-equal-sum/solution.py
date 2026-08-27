# Xom Data · Partition equal subset sum
# Problem: https://xomdata.com/practice/py-partition-equal-sum
# Solved: 2026-08-27

def subset(n, numbers, sum):
    if sum == 0: return True
    if n == 0: return False
    if numbers[n - 1] > sum: return subset(n - 1, numbers, sum)
    return subset(n - 1, numbers, sum) or subset(n - 1, numbers, sum - numbers[n - 1])

def can_partition(numbers):
    sumNum = sum(numbers)
    if sumNum % 2 != 0: return False
    return subset(len(numbers), numbers, sumNum // 2)
    pass
