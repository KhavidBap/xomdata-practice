# Xom Data · Best selling products board
# Problem: https://xomdata.com/practice/py-top-n-with-tie
# Solved: 2026-09-18

def top_products(sales, n):
    return [name for name, _ in sorted(sales.items(), key=lambda item: (-item[1], item[0]))[:n]]
    pass
