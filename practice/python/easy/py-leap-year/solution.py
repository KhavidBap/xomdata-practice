# Xom Data · Check leap year
# Problem: https://xomdata.com/practice/py-leap-year
# Solved: 2026-07-10

def is_leap_year(nam):
    return nam % 4 == 0 and (nam % 100 != 0 or nam % 400 == 0)
    pass
