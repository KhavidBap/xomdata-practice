# Xom Data · Reverse words in a string
# Problem: https://xomdata.com/practice/py-reverse-words
# Solved: 2026-07-12

def reverse_words(sentence):
    lst = list(sentence.split())
    lst = lst[::-1]
    return ' '.join(lst)
    pass
