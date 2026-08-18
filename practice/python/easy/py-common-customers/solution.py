# Xom Data · Customers who bought at both branches
# Problem: https://xomdata.com/practice/py-common-customers
# Solved: 2026-08-18

def common(a, b):
    res = []
    for val in a:
        if val in b: res.append(val)
    return sorted(list(set(res)))
    pass
