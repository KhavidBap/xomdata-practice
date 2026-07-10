# Xom Data · Count in-stock products
# Problem: https://xomdata.com/practice/py-in-stock
# Solved: 2026-07-10

def count_in_stock(quantities):
    res = 0
    for num in quantities:
        if num > 0: res += 1
    return res
    pass
