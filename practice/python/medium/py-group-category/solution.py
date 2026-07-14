# Xom Data · Group products by category
# Problem: https://xomdata.com/practice/py-group-category
# Solved: 2026-07-14

def group_by_category(items):
    res = {}
    for value, key in items:
        if key not in res: res[key] = [value]
        else: res[key].append(value)
    return res
    pass
