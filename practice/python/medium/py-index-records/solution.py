# Xom Data · Build a record lookup table by key
# Problem: https://xomdata.com/practice/py-index-records
# Solved: 2026-09-18

def index_by(rows, key):
    res = {}
    for row in rows:
        res[row[key]] = dict(row)
    return res
    pass
