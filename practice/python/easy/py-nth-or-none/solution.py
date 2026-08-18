# Xom Data · Take row n if it exists
# Problem: https://xomdata.com/practice/py-nth-or-none
# Solved: 2026-08-18

def nth_or_none(items, n):
    if items == [] or n >= len(items): return None
    else: return items[n]
    pass
