# Xom Data · Age at a given date
# Problem: https://xomdata.com/practice/py-age-at-date
# Solved: 2026-09-15

def age_on(birth, on_date):
    byear, bmonth, bday = map(int, birth.split("-"))
    oyear, omonth, oday = map(int, on_date.split("-"))
    age = oyear - byear
    if (omonth, oday) < (bmonth, bday):
        age -= 1
    return age
