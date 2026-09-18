# Xom Data · Order queue by priority and value
# Problem: https://xomdata.com/practice/py-sort-two-keys
# Solved: 2026-09-18

def sort_orders(orders):
    return [order['id'] for order in sorted(orders, key=lambda order: (order['priority'], -order['amount']))]
    pass
