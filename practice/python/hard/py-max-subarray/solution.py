# Xom Data · Maximum subarray sum
# Problem: https://xomdata.com/practice/py-max-subarray
# Solved: 2026-08-27

def max_subarray(numbers):
    cur, m = numbers[0], numbers[0]
    for num in numbers[1:]:
        cur = max(num, cur + num)
        m = max(m, cur)
    return m
