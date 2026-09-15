# Xom Data · Order the support ticket queue
# Problem: https://xomdata.com/practice/py-priority-order
# Solved: 2026-09-15

def sort_by_priority(tickets):
    if not tickets: return []
    dic = {}
    for key, value in tickets:
        if value == 'low': dic[key] = 1
        if value == 'medium': dic[key] = 2
        if value == 'high': dic[key] = 3
    dic = {k: v for k, v in sorted(dic.items(), key=lambda item: (-item[1]))}
    res = [key for key in dic]
    return res
    pass
