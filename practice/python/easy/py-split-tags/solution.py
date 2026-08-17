# Xom Data · Split a tag list out of one input box
# Problem: https://xomdata.com/practice/py-split-tags
# Solved: 2026-08-17

def split_tags(text):
    x = text.replace(',', ' ')
    return list(x.split())
