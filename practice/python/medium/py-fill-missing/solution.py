# Xom Data · Fill in a default for a missing field
# Problem: https://xomdata.com/practice/py-fill-missing
# Solved: 2026-09-18

def fill_missing(rows, field, default):
    res = []
    for row in rows:
        new = dict(row)
        if field not in new:
            new[field] = default
        res.append(new)
    return res
    pass
