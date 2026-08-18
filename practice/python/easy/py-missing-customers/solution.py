# Xom Data · Customers who only bought at the first branch
# Problem: https://xomdata.com/practice/py-missing-customers
# Solved: 2026-08-18

def only_in_first(a, b):
    lst = []
    for val in a:
        if val not in b: lst.append(val)
    return list(set(lst))
    pass
