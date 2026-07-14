# Xom Data · Longest continuous increasing subsequence
# Problem: https://xomdata.com/practice/py-longest-run
# Solved: 2026-07-14

def longest_increasing_run(numbers):
    res, cur = 1, 1
    for i in range(1, len(numbers)):
        if numbers[i] > numbers[i - 1]: cur += 1
        else:
            if cur > res: res = cur
            cur = 1
    if cur > res: res = cur
    return 0 if numbers == [] else res
    pass
