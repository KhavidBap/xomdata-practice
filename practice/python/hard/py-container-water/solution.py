# Xom Data · Container with most water
# Problem: https://xomdata.com/practice/py-container-water
# Solved: 2026-09-03

def max_area(height):
    res = 0
    n = len(height)
    i = 0
    j = n - 1
    while i < j:
        width = j - i
        if height[i] < height[j]:
            res = max(res, width * height[i])
            i += 1
        elif height[j] < height[i]:
            res = max(res, width * height[j])
            j -= 1
        else:
            res = max(res, width * height[i])
            i += 1
            j -= 1
    return res
    pass
