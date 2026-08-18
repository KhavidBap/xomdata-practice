# Xom Data · Flatten grouped results by one level
# Problem: https://xomdata.com/practice/py-flatten-one-level
# Solved: 2026-08-18

def flatten(groups):
    res = []
    for list in groups:
        for val in list: res.append(val)
    return res
    pass
