# Xom Data · Climbing stairs
# Problem: https://xomdata.com/practice/py-climb-stairs
# Solved: 2026-08-27

def climb_stairs(n):
    if n == 0 or n == 1: return 1
    return climb_stairs(n - 1) + climb_stairs(n - 2)
    pass
