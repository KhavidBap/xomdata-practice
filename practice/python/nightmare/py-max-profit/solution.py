# Xom Data · Best time to buy and sell stock
# Problem: https://xomdata.com/practice/py-max-profit
# Solved: 2026-09-06

def max_profit(prices):
    res = 0
    for i in range(1, len(prices)):
        if prices[i] > prices[i - 1]:
            res += prices[i] - prices[i - 1]
    return res
    pass
