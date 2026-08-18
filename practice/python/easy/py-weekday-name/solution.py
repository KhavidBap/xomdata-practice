# Xom Data · Weekday name from its number
# Problem: https://xomdata.com/practice/py-weekday-name
# Solved: 2026-08-18

def weekday_name(n):
    if n < 1 or n > 7: return None
    else:
        days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        return days[n - 1]
    pass
