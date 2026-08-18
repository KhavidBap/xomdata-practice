# Xom Data · Find names too long for the card
# Problem: https://xomdata.com/practice/py-filter-long-names
# Solved: 2026-08-18

def long_names(names, min_len):
    res = []
    for val in names:
        if len(val) > min_len: res.append(val)
    return res
    pass
