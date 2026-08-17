# Xom Data · Shipping fee by weight bracket
# Problem: https://xomdata.com/practice/py-shipping-fee
# Solved: 2026-08-17

def shipping_fee(weight):
    return (15000 if weight <= 1 else (30000 if weight <= 5 else 50000))
    pass
