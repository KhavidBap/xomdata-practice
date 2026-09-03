# Xom Data · Maximum product subarray
# Problem: https://xomdata.com/practice/py-max-product-subarray
# Solved: 2026-09-03

def max_product(arr):
    n = len(arr)
    currMax, currMin = arr[0], arr[0]
    maxProd = arr[0]
    for i in range(1, n):
        temp = max(arr[i], arr[i] * currMax, arr[i] * currMin)
        currMin = min(arr[i], arr[i] * currMax, arr[i] * currMin)
        currMax = temp
        maxProd = max(maxProd, currMax)
    return maxProd
    pass
