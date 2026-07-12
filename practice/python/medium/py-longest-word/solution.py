# Xom Data · Longest word in a sentence
# Problem: https://xomdata.com/practice/py-longest-word
# Solved: 2026-07-12

def longest_word(sentence):
    words = list(sentence.split())
    res = 0
    for word in words:
        if len(word) > res:
            res = len(word)
            result = word
    return result
    pass
