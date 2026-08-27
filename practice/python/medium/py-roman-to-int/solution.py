# Xom Data · Roman to integer
# Problem: https://xomdata.com/practice/py-roman-to-int
# Solved: 2026-08-27

def roman_to_int(s):
    roman = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
    res, i = 0, 0
    while i < len(s):
        if i + 1 < len(s) and roman[s[i]] < roman[s[i + 1]]:
            res += roman[s[i + 1]] - roman[s[i]]
            i += 1
        else:
            res += roman[s[i]]
        i += 1
    return res
    pass
