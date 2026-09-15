# Xom Data · Add up shift durations
# Problem: https://xomdata.com/practice/py-duration-sum
# Solved: 2026-09-15

def total_time(durations):
    if not durations: return '00:00'
    res = 0
    for time in durations:
        hour, minute = time.split(':')
        print(hour, minute)
        res += int(hour) * 60 + int(minute)
    print(res)
    return ''.join([('0' if res // 60 < 10 else ''), str(res // 60), ':', ('0' if res % 60 < 10 else ''), str(res % 60)])
    pass
