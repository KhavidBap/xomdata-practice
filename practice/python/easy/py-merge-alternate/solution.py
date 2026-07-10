# Xom Data · Alternate-merge two lists
# Problem: https://xomdata.com/practice/py-merge-alternate
# Solved: 2026-07-10

def merge_alternate(list1, list2):
    res = []
    for i in range(max(len(list1), len(list2))):
        if i < len(list1): res.append(list1[i])
        if i < len(list2): res.append(list2[i])
    return res
    pass
