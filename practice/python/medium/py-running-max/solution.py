# Xom Data · Record sales up to each day
# Problem: https://xomdata.com/practice/py-running-max
# Solved: 2026-08-19

def running_max(values):
    if values == []: return []
    else:
        res = [values[0]]
        max = values[0]
        for i in range(1, len(values)):
            if values[i] > max: max = values[i]
            res.append(max)
        return res
    pass
