# Xom Data · Valid parentheses
# Problem: https://xomdata.com/practice/py-balanced-brackets
# Solved: 2026-07-10

def is_balanced(text):
    res = 0
    for c in text:
        if c == '(': res += 1
        elif c == ')': res -= 1
        if res < 0: return False
    return (True if res == 0 else False)
