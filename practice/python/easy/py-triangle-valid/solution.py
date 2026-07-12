# Xom Data · Check triangle sides
# Problem: https://xomdata.com/practice/py-triangle-valid
# Solved: 2026-07-12

def is_triangle(a, b, c):
    return (a + b) > c and (b + c) > a and (c + a) > b
    pass
