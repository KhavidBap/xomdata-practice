# Xom Data · Filter transactions inside a reporting period
# Problem: https://xomdata.com/practice/py-date-range-filter
# Solved: 2026-08-19

def within_dates(records, start, end):
    if records == []: return []
    else:
        res = []
        for key, val in records:
            if val >= start and val <= end: res.append(key)
        return res
    pass
