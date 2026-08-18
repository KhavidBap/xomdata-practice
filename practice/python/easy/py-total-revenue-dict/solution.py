# Xom Data · Total revenue across the network
# Problem: https://xomdata.com/practice/py-total-revenue-dict
# Solved: 2026-08-18

def total_revenue(branches):
    res = 0
    for key in branches: res += branches[key]
    return res
    pass
