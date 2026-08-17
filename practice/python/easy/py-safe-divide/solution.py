# Xom Data · Divide safely when the divisor can be zero
# Problem: https://xomdata.com/practice/py-safe-divide
# Solved: 2026-08-17

def safe_divide(a, b):
    return (round(a / b, 2) if b != 0 else None)
