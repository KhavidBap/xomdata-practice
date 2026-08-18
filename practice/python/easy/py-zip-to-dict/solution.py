# Xom Data · Join two columns into a lookup table
# Problem: https://xomdata.com/practice/py-zip-to-dict
# Solved: 2026-08-18

def to_dict(keys, values):
    dict = {}
    for i in range(len(keys)):
        dict[keys[i]] = values[i]
    return dict
    pass
