# Xom Data · Flip a code-to-name lookup table
# Problem: https://xomdata.com/practice/py-invert-mapping
# Solved: 2026-08-18

def invert(mapping):
    dict = {}
    for key in mapping:
        k = mapping[key]
        dict[k] = key
    return dict
    pass
