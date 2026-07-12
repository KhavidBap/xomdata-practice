# Xom Data · Remove duplicate names from the invite list
# Problem: https://xomdata.com/practice/py-unique-order
# Solved: 2026-07-12

def unique(items):
    res = []
    for item in items:
        if item not in res:
            res.append(item)
    return res
    pass
