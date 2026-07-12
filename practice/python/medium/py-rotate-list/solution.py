# Xom Data · Rotate list to the right
# Problem: https://xomdata.com/practice/py-rotate-list
# Solved: 2026-07-12

def rotate(items, k):
    if not items: return []
    else:
        for _ in range(k):
            items = [items[-1]] + items[:-1]
        return items
    pass
