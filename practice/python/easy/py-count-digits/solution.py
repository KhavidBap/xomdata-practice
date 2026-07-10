# Xom Data · Count digits in the password
# Problem: https://xomdata.com/practice/py-count-digits
# Solved: 2026-07-10

def count_digits(text):
    res = 0
    for c in text:
        if c.isdigit(): res += 1
    return res
    pass
