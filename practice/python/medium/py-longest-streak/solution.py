# Xom Data · Longest run of days hitting the target
# Problem: https://xomdata.com/practice/py-longest-streak
# Solved: 2026-09-15

def longest_streak(sales, target):
    res = 0
    cnt = 0
    for num in sales:
        if num >= target: cnt += 1
        else:
            res = max(res, cnt)
            cnt = 0
    res = max(res, cnt)
    return res
    pass
