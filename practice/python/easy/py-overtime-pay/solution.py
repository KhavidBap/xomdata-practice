# Xom Data · Weekly pay with overtime hours
# Problem: https://xomdata.com/practice/py-overtime-pay
# Solved: 2026-08-17

def overtime_pay(hours, rate):
    if hours <= 40: total = hours * rate
    else: total = 40 * rate + (hours - 40) * rate * 1.5
    return round(float(total), 2)
    pass
