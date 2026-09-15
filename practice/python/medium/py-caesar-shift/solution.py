# Xom Data · Scramble a promo code with a letter shift
# Problem: https://xomdata.com/practice/py-caesar-shift
# Solved: 2026-09-15

def shift_code(text, shift):
    res = []
    for ch in text:
        if 'a' <= ch <= 'z':
            new = chr((ord(ch) - ord('a') + shift) % 26 + ord('a'))
            res.append(new)
        else: res.append(ch)
    return ''.join(res)
