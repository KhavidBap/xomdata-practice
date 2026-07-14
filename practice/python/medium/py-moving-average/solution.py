# Xom Data · Moving average over a window of k
# Problem: https://xomdata.com/practice/py-moving-average
# Solved: 2026-07-14

import math

def moving_average(numbers, k):
    res = []
    for i in range(len(numbers) - k + 1):
        res.append(round(sum(numbers[i:i + k]) / k, 2))
    return res
    pass
