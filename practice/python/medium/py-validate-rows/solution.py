# Xom Data · Per-row error table for a data entry screen
# Problem: https://xomdata.com/practice/py-validate-rows
# Solved: 2026-09-18

def row_errors(rows, required):
    res = {}
    for i, row in enumerate(rows):
        miss = [field for field in required if field not in row]
        if miss: res[i] = miss
    return res
    pass
