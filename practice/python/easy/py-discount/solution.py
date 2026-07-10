# Xom Data · Compute price after discount
# Problem: https://xomdata.com/practice/py-discount
# Solved: 2026-07-10

def final_price(price, percent):
    return round(price * (100 - percent) / 100, 2)
    pass
