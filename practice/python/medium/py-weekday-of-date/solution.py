# Xom Data · Weekday of a specific date
# Problem: https://xomdata.com/practice/py-weekday-of-date
# Solved: 2026-08-19

import calendar, datetime

def weekday_of(text):
    year, month, day = (int(x) for x in text.split('-'))
    my_date = datetime.date(year, month, day)
    return calendar.day_name[my_date.weekday()]
