# Xom Data · How many days a given month has
# Problem: https://xomdata.com/practice/py-days-in-month
# Solved: 2026-08-28

import calendar
def days_in_month(year, month):
    return calendar.monthrange(year, month)[1]
    pass
