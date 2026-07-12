# Xom Data · Convert minutes to hours and minutes
# Problem: https://xomdata.com/practice/py-time-format
# Solved: 2026-07-12

def format_duration(minutes):
    h = minutes // 60
    m = minutes % 60
    res = str(h) + ':'
    if m < 10: res = res + '0' + str(m)
    else: res = res + str(m)
    return res
    pass
