# Xom Data · First unique character
# Problem: https://xomdata.com/practice/py-first-non-repeating
# Solved: 2026-09-03

def first_non_repeating(s):
    freq = [0] * 26
    for c in s:
        freq[ord(c) - ord('a')] += 1
    for i, c in enumerate(s):
        if freq[ord(c) - ord('a')] == 1:
            return i
    return -1
    pass
