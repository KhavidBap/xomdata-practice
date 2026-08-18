# Xom Data · Raise a flag when any order runs late
# Problem: https://xomdata.com/practice/py-any-overdue
# Solved: 2026-08-18

def has_overdue(days_late):
    check = False
    for val in days_late:
        if val > 0: check = True
    return check
    pass
