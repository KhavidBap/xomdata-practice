# Xom Data · Sentence segmentation with a dictionary
# Problem: https://xomdata.com/practice/py-word-break
# Solved: 2026-09-03

def wordBreak(i, s, words):
    if i == len(s):
        return True
    n = len(s)
    pre = ""
    for j in range(i, n):
        pre += s[j]
        if pre in words and wordBreak(j + 1, s, words) == 1:
            return True
    return False

def word_break(s, words):
    return wordBreak(0, s, words)
    pass
