# Xom Data · Drop duplicates, keep the newest record
# Problem: https://xomdata.com/practice/py-dedupe-records
# Solved: 2026-09-18

def dedupe(rows, key):
    order = []
    last = {}
    for row in rows:
        k = row[key]
        if k not in last: order.append(k)
        last[k] = dict(row)
    return [last[k] for k in order]
    pass
