# Xom Data · Daily temperatures
# Problem: https://xomdata.com/practice/py-daily-temperatures
# Solved: 2026-09-04

def daily_temperatures(T):
    n = len(T)
    daysOfWait = [0] * n
    s = []
    for i in range(n):
        while(len(s) != 0 and T[s[-1]] < T[i]):
            daysOfWait[s[-1]] = i - s[-1]
            s.pop(-1)
        s.append(i)
    return daysOfWait
    pass
