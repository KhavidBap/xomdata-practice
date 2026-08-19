# Xom Data · First day the balance goes negative
# Problem: https://xomdata.com/practice/py-first-negative-balance
# Solved: 2026-08-19

def first_negative_day(changes):
    if changes == []: return -1
    else:
        res = -1
        cnt = 0
        for i in range(len(changes)):
            cnt += changes[i]
            if cnt < 0:
                res = i
                break
        return res
    pass
