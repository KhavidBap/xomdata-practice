# Xom Data · Kth largest element
# Problem: https://xomdata.com/practice/py-kth-largest
# Solved: 2026-08-27

def kth_largest(numbers, k):
    numbers.sort(reverse=True)
    return numbers[k - 1]
    pass
