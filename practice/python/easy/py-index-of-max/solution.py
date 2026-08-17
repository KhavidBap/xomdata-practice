# Xom Data · Position of the priciest item in the table
# Problem: https://xomdata.com/practice/py-index-of-max
# Solved: 2026-08-17

def index_of_max(prices):
    return (-1 if len(prices) == 0 else prices.index(max(prices)))
    pass
