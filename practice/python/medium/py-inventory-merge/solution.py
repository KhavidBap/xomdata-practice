# Xom Data · Consolidate inventory across warehouses
# Problem: https://xomdata.com/practice/py-inventory-merge
# Solved: 2026-07-12

def merge_inventory(warehouses):
    dic = {}
    for warehouse in warehouses:
        for item in warehouse:
            dic[item] = dic.get(item, 0) + warehouse[item]
    return dic
    pass
