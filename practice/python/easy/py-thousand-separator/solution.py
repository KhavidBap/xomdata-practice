# Xom Data · Show a price in Vietnamese number format
# Problem: https://xomdata.com/practice/py-thousand-separator
# Solved: 2026-09-04

def format_price(amount):
    return f"{amount:,}".replace(",", ".")
    pass
