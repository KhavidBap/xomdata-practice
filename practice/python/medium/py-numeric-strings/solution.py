# Xom Data · Turn a text column into usable numbers
# Problem: https://xomdata.com/practice/py-numeric-strings
# Solved: 2026-09-13

def to_numbers(values):
    res = []
    for value in values:
        try:
            num = int(value.strip().replace(",", ""))
        except (ValueError, AttributeError):
            num = 0
        res.append(num)
    return res
