# Xom Data · Boxes needed to pack the goods
# Problem: https://xomdata.com/practice/py-boxes-needed
# Solved: 2026-08-17

def boxes_needed(items, capacity):
    return (items // capacity if items % capacity == 0 else (items // capacity) + 1)
    pass
