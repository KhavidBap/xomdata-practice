# Xom Data · Keep the branches that beat the target
# Problem: https://xomdata.com/practice/py-filter-dict-threshold
# Solved: 2026-08-17

def over_target(sales, target):
    lst = {}
    for key in sales:
        if sales[key] > target: lst[key] = sales[key]
    return lst
    pass
