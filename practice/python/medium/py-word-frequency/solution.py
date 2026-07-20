# Xom Data · Word frequency count in text
# Problem: https://xomdata.com/practice/py-word-frequency
# Solved: 2026-07-20

def word_frequency(text):
    lst = text.split()
    dict = {}
    for word in lst:
        dict[word] = dict.get(word, 0) + 1
    return dict
    pass
