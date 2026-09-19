# Xom Data · Top-selling employee per region
# Problem: https://xomdata.com/practice/py-top-seller-region
# Solved: 2026-09-19

def top_seller(records):
    sales = {}
    first_order = {}
    for region, employee, amount in records:
        if region not in sales:
            sales[region] = {}
            first_order[region] = []
        if employee not in sales[region]:
            sales[region][employee] = 0
            first_order[region].append(employee)
        sales[region][employee] += amount
    result = {}
    for region in sales:
        best_employee = first_order[region][0]
        for employee in first_order[region][1:]:
            if sales[region][employee] > sales[region][best_employee]: best_employee = employee
        result[region] = best_employee
    return result
