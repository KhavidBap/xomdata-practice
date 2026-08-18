# Xom Data · Look a price up by product code
# Problem: https://xomdata.com/practice/py-price-lookup
# Solved: 2026-08-18

def price_of(prices, code):
    return prices.get(code, 0)
    pass
