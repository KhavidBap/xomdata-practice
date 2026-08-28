# Xom Data · Longest consecutive sequence
# Problem: https://xomdata.com/practice/py-longest-consecutive
# Solved: 2026-08-27

def longest_consecutive(numbers):
    st = set()
    res = 0
    for val in numbers: st.add(val)
    for val in numbers:
        if val in st and (val - 1) not in st:
            cur = val
            cnt = 0
            while cur in st:
                cur += 1
                cnt += 1
            res = max(res, cnt)
    return res
    pass
