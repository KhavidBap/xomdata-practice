# Xom Data · Distinct values per group
# Problem: https://xomdata.com/practice/py-distinct-per-group
# Solved: 2026-07-20

def distinct_per_group(pairs):
    dic = {}
    for key, value in pairs:
        if key not in dic: dic[key] = [value]
        elif value not in dic[key]: dic[key].append(value)
    for key in dic: dic[key] = len(dic[key])
    return dic
    pass
