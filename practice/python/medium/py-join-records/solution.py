# Xom Data · Join two record lists by id
# Problem: https://xomdata.com/practice/py-join-records
# Solved: 2026-09-15

def join_by_id(orders, customers):
    customer_map = {c['id']: c['name'] for c in customers}
    res = []
    for order in orders:
        cid = order['customer_id']
        if cid in customer_map:
            res.append({
                'name': customer_map[cid],
                'amount': order['amount']
            })
    return res
