# Xom Data · Reverse integer
# Problem: https://xomdata.com/practice/py-reverse-integer
# Solved: 2026-08-19

def reverse_integer(x):
    neg = x < 0
    num = str(abs(x))[::-1]
    res = int(num)
    if neg: res = -res
    if res < -2 ** 31 or res > 2 ** 31 - 1: return 0
    return res
