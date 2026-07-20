# Xom Data · Total revenue by month
# Problem: https://xomdata.com/practice/py-revenue-month
# Solved: 2026-07-20

def revenue_by_month(records):
    dict = {}
    for key, value in records:
        dict[key] = dict.get(key, 0) + value 
    return dict
    pass
