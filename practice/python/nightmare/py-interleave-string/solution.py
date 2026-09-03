# Xom Data · Interleaving string
# Problem: https://xomdata.com/practice/py-interleave-string
# Solved: 2026-09-03

def isInleave(s1, s2, s3, i, j):
    k = i + j
    if i == len(s1) and j == len(s2) and k == len(s3):
        return True
    a = (i < len(s1)) and (s3[k] == s1[i]) and isInleave(s1, s2, s3, i + 1, j)
    b = (j < len(s2)) and (s3[k] == s2[j]) and isInleave(s1, s2, s3, i, j + 1)
    return a or b

def is_interleave(s1, s2, s3):
    if len(s1) + len(s2) != len(s3): return False
    return isInleave(s1, s2, s3, 0, 0)
    pass
