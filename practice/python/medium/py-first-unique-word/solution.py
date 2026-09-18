# Xom Data · First non-repeating word in a paragraph
# Problem: https://xomdata.com/practice/py-first-unique-word
# Solved: 2026-09-18

from collections import Counter

def first_unique(text):
    words = text.split()
    cnt = Counter(word.lower() for word in words)
    for word in words:
        if cnt[word.lower()] == 1:
            return word
    return None
    pass
