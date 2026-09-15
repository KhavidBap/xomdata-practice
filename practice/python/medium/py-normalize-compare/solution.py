# Xom Data · Match product names despite small differences
# Problem: https://xomdata.com/practice/py-normalize-compare
# Solved: 2026-09-15

def same_product(a, b):
    A = ' '.join(a.replace('.', ' ').replace(',', ' ').replace('-', ' ').strip().lower().split())
    B = ' '.join(b.replace('.', ' ').replace(',', ' ').replace('-', ' ').strip().lower().split())
    return A == B
    pass
