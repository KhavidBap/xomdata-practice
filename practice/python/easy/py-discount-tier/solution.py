# Xom Data · Discount tier by order value
# Problem: https://xomdata.com/practice/py-discount-tier
# Solved: 2026-08-17

def discount_percent(total):
    return (0 if total < 500000 else (5 if total < 2000000 else 10))
