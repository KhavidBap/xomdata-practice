# Xom Data · Count word occurrences
# Problem: https://xomdata.com/practice/py-count-occurrences-word
# Solved: 2026-07-15

def count_word(text, target):
    words = text.lower().split()
    target = target.lower()
    return words.count(target)
