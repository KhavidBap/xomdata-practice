# Xom Data · Average score by class
# Problem: https://xomdata.com/practice/py-average-per-group
# Solved: 2026-08-18

def average_per_group(pairs):
    avg, sum, cnt = {}, {}, {}
    for key, val in pairs:
        sum[key] = sum.get(key, 0) + val
        cnt[key] = cnt.get(key, 0) + 1
    print(sum)
    print(cnt)
    for key in sum:
        avg[key] = round(sum[key] / cnt[key], 2)
    return avg
    pass
