# Xom Data · Order regions by total sales
# Problem: https://xomdata.com/practice/py-group-then-sort
# Solved: 2026-09-15

def sorted_by_group_total(sales):
    dic = {}
    res = []
    for key, value in sales:
        dic[key] = dic.get(key, 0) + value
    print(dic)
    dic = {k: v for k, v in sorted(dic.items(), key=lambda item: (-item[1], item[0]))}
    for key in dic:
        res.append(key)
    return res
    pass
