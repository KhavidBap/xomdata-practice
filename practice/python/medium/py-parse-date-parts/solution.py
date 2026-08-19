# Xom Data · Split an ISO date string into parts
# Problem: https://xomdata.com/practice/py-parse-date-parts
# Solved: 2026-08-19

def date_parts(text):
    year, month, day = (int(x) for x in text.split('-'))
    return (year, month, day)
    pass
