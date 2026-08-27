# Xom Data · Longest substring without repeating characters
# Problem: https://xomdata.com/practice/py-longest-unique-substring
# Solved: 2026-08-27

def longest_unique(s):
    if len(s) == 0 or len(s) == 1: return len(s)
    res = 0
    v = [False] * 26
    l, r = 0, 0
    while r < len(s):
        while v[ord(s[r]) - ord('a')] == True:
            v[ord(s[l]) - ord('a')] = False
            l += 1
        v[ord(s[r]) - ord('a')] = True
        res = max(res, (r - l + 1))
        r += 1
    return res
    pass
