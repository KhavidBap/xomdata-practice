# Xom Data · Normalize phone numbers
# Problem: https://xomdata.com/practice/py-normalize-phone
# Solved: 2026-07-14

def normalize(phone):
    res = ''
    for c in phone:
        if c.isdigit(): res = res + c
    return res
    pass
