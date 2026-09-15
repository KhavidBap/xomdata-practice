# Xom Data · Total and order count per region
# Problem: https://xomdata.com/practice/py-aggregate-two-fields
# Solved: 2026-09-15

def summarize(orders):
    res = {}
    for order in orders:
        if order['region'] not in res:
            res[order['region']] = {
                'total': order['amount'],
                'count': 1
            }
        else:
            res[order['region']]['total'] += order['amount']
            res[order['region']]['count'] += 1
    return res
    pass
