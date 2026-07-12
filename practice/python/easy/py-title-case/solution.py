# Xom Data · Normalize customer names
# Problem: https://xomdata.com/practice/py-title-case
# Solved: 2026-07-12

def capitalize_words(text):
    lst = list(text.split())
    res = []
    for word in lst:
        w = word.capitalize()
        res.append(w)
    return ' '.join(res)
    pass
