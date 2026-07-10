# Xom Data · Count students above the benchmark
# Problem: https://xomdata.com/practice/py-above-threshold
# Solved: 2026-07-10

def count_above(numbers, threshold):
    res = 0
    for num in numbers:
        if num > threshold: res += 1
    return res
