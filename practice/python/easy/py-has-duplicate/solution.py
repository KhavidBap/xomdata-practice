# Xom Data · Spot a code entered twice
# Problem: https://xomdata.com/practice/py-has-duplicate
# Solved: 2026-08-17

def has_duplicate(items):
    return len(items) != len(set(items))
