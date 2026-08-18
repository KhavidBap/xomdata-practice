# Xom Data · Pad an order id with leading zeros
# Problem: https://xomdata.com/practice/py-pad-order-id
# Solved: 2026-08-18

def pad_order_id(number):
    num = str(number)
    if len(num) >= 5: return num
    else:
        return '0' * (5 - len(num)) + num
    pass
