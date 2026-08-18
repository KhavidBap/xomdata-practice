# Xom Data · Remove a code from the scan list
# Problem: https://xomdata.com/practice/py-drop-value
# Solved: 2026-08-18

def drop_value(items, target):
    res = []
    for val in items:
        if val != target: res.append(val)
    return res
    pass
