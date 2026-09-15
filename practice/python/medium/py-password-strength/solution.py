# Xom Data · Check strong password
# Problem: https://xomdata.com/practice/py-password-strength
# Solved: 2026-09-15

def is_strong(password):
    word = list(password)
    print(word)
    l, u, n = False, False, False
    for char in word:
        if char.isalpha():
            if char.islower(): l = True
            if char.isupper(): u = True
        if char.isdigit(): n = True
    return len(word) >= 8 and l and u and n
    pass
