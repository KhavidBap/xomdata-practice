# Xom Data · Product of array except self
# Problem: https://xomdata.com/practice/py-product-except-self
# Solved: 2026-08-26

def product_except_self(numbers):
    n = len(numbers)
    result = [1] * n
    prefix = 1
    for i in range(n):
        result[i] = prefix
        prefix *= numbers[i]
    suffix = 1
    for i in range(n - 1, -1, -1):
        result[i] *= suffix
        suffix *= numbers[i]
    return result
