# Xom Data · Count vowels in a name
# Problem: https://xomdata.com/practice/py-vowels
# Solved: 2026-07-12

def count_vowels(name):
    vowels = ['a', 'e', 'i', 'o', 'u']
    res = 0
    for c in name:
        if c.lower() in vowels:
            res += 1
    return res
    pass
