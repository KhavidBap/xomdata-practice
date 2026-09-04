# Xom Data · Happy number
# Problem: https://xomdata.com/practice/py-happy-number
# Solved: 2026-09-04

def sumDigitSquare(n) :
    sq = 0
    while (n) :
        digit = n % 10
        sq = sq + digit * digit
        n = n // 10
    return sq

def is_happy(n):
    while (1) :
        if n == 1: return True
        n = sumDigitSquare(n)
        if n == 4: return False
    return False
    pass
