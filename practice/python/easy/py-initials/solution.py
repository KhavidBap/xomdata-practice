# Xom Data · Generate initials
# Problem: https://xomdata.com/practice/py-initials
# Solved: 2026-07-10

def get_initials(full_name):
    names = list(full_name.split())
    res = ''
    for name in names:
        res = res + name[0]
    return res.upper()
    pass
