# Xom Data · Split a list into batches
# Problem: https://xomdata.com/practice/py-chunk-list
# Solved: 2026-09-15

def chunk(items, size):
    if not items: return []
    res, cur = [], []
    for item in items:
        if len(cur) < size: cur.append(item)
        else:
            res.append(cur)
            cur = [item]
    if cur: res.append(cur)
    return res
    pass
